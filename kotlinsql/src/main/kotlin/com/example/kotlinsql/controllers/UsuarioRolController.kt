package com.example.kotlinsql.controllers

import com.example.kotlinsql.dto.UsuarioRolCreateRequest
import com.example.kotlinsql.model.UsuarioRol
import com.example.kotlinsql.services.UsuarioRolService
import jakarta.validation.Valid
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.media.Content
import io.swagger.v3.oas.annotations.media.ExampleObject
import io.swagger.v3.oas.annotations.media.Schema
import io.swagger.v3.oas.annotations.responses.ApiResponse
import io.swagger.v3.oas.annotations.responses.ApiResponses

@RestController
@RequestMapping("/roles")
class UsuarioRolController {

    @Autowired
    lateinit var usuarioRolService: UsuarioRolService

    @Operation(summary = "Obtener todos los roles asignados", description = "Devuelve una lista de todos los registros de roles asignados a usuarios.")
    @ApiResponse(
        responseCode = "200",
        description = "Lista de roles",
        content = [Content(mediaType = "application/json", schema = Schema(implementation = UsuarioRol::class))]
    )
    @GetMapping
    fun obtenerTodos(): List<UsuarioRol> =  usuarioRolService.obtenerTodos()


    @Operation(summary = "Obtener roles por número de documento", description = "Devuelve los roles asociados a un usuario específico.")
    @ApiResponses(
        value = [
            ApiResponse(
                responseCode = "200",
                description = "Lista de roles del usuario",
                content = [Content(mediaType = "application/json", schema = Schema(implementation = UsuarioRol::class))]
            )
        ]
    )
    @GetMapping("/{documento}")
    fun obtenerPorDocumento(@PathVariable documento: String): List<UsuarioRol> {
        return usuarioRolService.obtenerPorDocumento(documento)
    }

    @Operation(summary = "Asignar rol a usuario", description = "Asigna un nuevo rol a un usuario existente.")
    @ApiResponses(
        value = [
            ApiResponse(
                responseCode = "200",
                description = "Rol asignado correctamente",
                content = [Content(mediaType = "application/json", examples = [ExampleObject(value = "Rol asignado correctamente")])]
            ),
            ApiResponse(
                responseCode = "400",
                description = "Datos inválidos",
                content = [Content(mediaType = "application/json", examples = [ExampleObject(value = "No se pudo asignar el rol")])]
            )
        ]
    )
    @PostMapping
    fun crear(@Valid @RequestBody request: UsuarioRolCreateRequest): UsuarioRol? {
        return usuarioRolService.crear(request)
    }

    @Operation(summary = "Eliminar rol de usuario", description = "Elimina un rol específico de un usuario.")
    @ApiResponses(
        value = [
            ApiResponse(
                responseCode = "200",
                description = "Rol eliminado correctamente",
                content = [Content(mediaType = "application/json", examples = [ExampleObject(value = "Rol eliminado correctamente")])]
            ),
            ApiResponse(
                responseCode = "404",
                description = "Rol no encontrado",
                content = [Content(mediaType = "application/json", examples = [ExampleObject(value = "No se encontró el rol para eliminar")])]
            )
        ]
    )
    @DeleteMapping("/{documento}/{rol}")
    fun eliminar(
        @PathVariable documento: String,
        @PathVariable rol: String): String {
        val resultado = usuarioRolService.eliminar(documento, rol)
        return if (resultado > 0) "Rol eliminado correctamente" else "No se encontró el rol para eliminar"
    }

}

