package com.example.kotlinsql.config

import com.example.kotlinsql.security.JwtFilter
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.web.SecurityFilterChain
import org.springframework.security.config.http.SessionCreationPolicy
import org.springframework.web.cors.CorsConfiguration
import org.springframework.web.cors.CorsConfigurationSource
import org.springframework.web.cors.UrlBasedCorsConfigurationSource

@Configuration
class SecurityConfig {

    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder()
    }

    @Bean
    fun corsConfigurationSource(): CorsConfigurationSource {
        val configuration = CorsConfiguration()
        configuration.allowedOrigins = listOf("http://localhost:5173","http://10.0.2.2")
        configuration.allowedMethods = listOf("GET", "POST", "PUT", "DELETE", "OPTIONS")
        configuration.allowedHeaders = listOf("*")
        configuration.allowCredentials = true
        val source = UrlBasedCorsConfigurationSource()
        source.registerCorsConfiguration("/**", configuration)
        return source
    }

    @Bean
    fun securityFilterChain(http: HttpSecurity, jwtFilter: JwtFilter): SecurityFilterChain {
        http
            .cors { it.configurationSource(corsConfigurationSource()) }
            .csrf { it.disable() }
            .formLogin { it.disable() }
            .sessionManagement { it.sessionCreationPolicy(SessionCreationPolicy.STATELESS) }
            .authorizeHttpRequests {
                it
                    .requestMatchers("/auth/**").permitAll()
                    .requestMatchers(
                        "/v3/api-docs/**",
                        "/swagger-ui/**",
                        "/swagger-ui.html",
                        "/swagger-resources/**",
                        "/webjars/**"
                    ).permitAll()
                    .requestMatchers("/usuarios/**").hasAnyRole("ADMINISTRATIVO", "ROOT","SECRETARIO", "INSTRUCTOR")
                    .requestMatchers("/roles/**", "/usuario-roles/**").hasAnyRole("ADMINISTRATIVO", "ROOT","SECRETARIO", "INSTRUCTOR")
                    .requestMatchers("/estudiantes/**").hasAnyRole("ADMINISTRATIVO", "ROOT","SECRETARIO", "INSTRUCTOR")
                    .requestMatchers("/asistencias/**", "/asistencia-estudiantes/**").hasAnyRole("ADMINISTRATIVO", "ROOT","SECRETARIO", "INSTRUCTOR")
                    .requestMatchers("/calificaciones/**", "/calificacion-estudiantes/**").hasAnyRole("ADMINISTRATIVO", "ROOT","SECRETARIO", "INSTRUCTOR")
                    .requestMatchers("/certificados/**").hasAnyRole("ADMINISTRATIVO", "ROOT","SECRETARIO", "INSTRUCTOR")
                    .requestMatchers("/auditorias/**").hasAnyRole("ADMINISTRATIVO", "ROOT","SECRETARIO", "INSTRUCTOR")
                    .anyRequest().authenticated()
            }
            .addFilterBefore(jwtFilter, org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter::class.java)

        return http.build()
    }
}
