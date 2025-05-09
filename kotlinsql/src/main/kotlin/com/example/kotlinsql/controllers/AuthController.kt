package com.example.kotlinsql.controllers

import com.example.kotlinsql.dto.LoginRequest
import com.example.kotlinsql.dto.LoginResponse
import com.example.kotlinsql.security.JwtUtil
import org.springframework.http.ResponseEntity
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.media.Content
import io.swagger.v3.oas.annotations.media.ExampleObject
import io.swagger.v3.oas.annotations.media.Schema
import io.swagger.v3.oas.annotations.responses.ApiResponse
import io.swagger.v3.oas.annotations.responses.ApiResponses
import org.springframework.dao.EmptyResultDataAccessException
import org.springframework.security.crypto.password.PasswordEncoder


@RestController
@RequestMapping("/auth")
class AuthController(
    val jwtUtil: JwtUtil,
    val jdbcTemplate: JdbcTemplate,
    val passwordEncoder: PasswordEncoder
) {

    @Operation(summary = "Login de usuario", description = "Retorna un token JWT si las credenciales son válidas.")
    @ApiResponses(
        value = [
            ApiResponse(
                responseCode = "200",
                description = "Autenticación exitosa",
                content = [Content(
                    mediaType = "application/json",
                    schema = Schema(implementation = LoginResponse::class),
                    examples = [ExampleObject(value = """{"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."}""")]
                )]
            ),
            ApiResponse(
                responseCode = "401",
                description = "Credenciales inválidas",
                content = [Content(
                    mediaType = "text/plain",
                    examples = [ExampleObject(value = "Contraseña incorrecta")]
                )]
            )
        ]
    )
    @PostMapping("/login")
    fun login(@RequestBody loginRequest: LoginRequest): ResponseEntity<Any> {
        val correo = loginRequest.correo
        val password = loginRequest.password

        val usuario = try {
            jdbcTemplate.queryForMap("SELECT * FROM usuario WHERE correo = ?", correo)
        } catch (e: EmptyResultDataAccessException) {
            return ResponseEntity.status(404).body(mapOf("error" to "Usuario no encontrado"))
        }

        val passwordHashed = usuario["password"] as String
        val passwordValido = passwordEncoder.matches(password, passwordHashed)

        if (!passwordValido) {
            return ResponseEntity.status(401).body(mapOf("error" to "Contraseña incorrecta"))
        }

        val roles = jdbcTemplate.queryForList(
            "SELECT rol FROM usuario_rol WHERE usuario_numero_documento = ?",
            usuario["numero_documento"]
        ).map {
            val rol = it["rol"] as String
            "ROLE_${rol.uppercase()}"
        }

        val token = jwtUtil.generateToken(usuario["numero_documento"].toString(), roles)
        return ResponseEntity.ok(LoginResponse(token))
    }

}
