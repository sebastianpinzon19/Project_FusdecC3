package com.example.fusdeckotlin.models.administrativo.unidad

data class Unidad(
    private val id: String,
    private var nombreUnidad: String,
    private var brigadaId: String,
    private var estadoUnidad: Boolean,
    private var usuarioId: String,
    private var comandos: List<String>,
    private var estudiantes: List<String>
) {
    fun getId() = id
    fun getNombreUnidad() = nombreUnidad
    fun getBrigadaId() = brigadaId
    fun getEstadoUnidad() = estadoUnidad
    fun getUsuarioId() = usuarioId
    fun getComandos() = comandos
    fun getEstudiantes() = estudiantes

    fun setNombreUnidad(nombre: String) {
        nombreUnidad = nombre
    }

    fun setBrigadaId(brigada: String) {
        brigadaId = brigada
    }

    fun setEstadoUnidad(estado: Boolean) {
        estadoUnidad = estado
    }

    fun setUsuarioId(usuario: String) {
        usuarioId = usuario
    }

    fun setComandos(comandos: List<String>) {
        this.comandos = comandos
    }

    fun setEstudiantes(estudiantes: List<String>) {
        this.estudiantes = estudiantes
    }

    companion object {
        val unidad1 = Unidad(
            id = "UNI01",
            nombreUnidad = "Unidad 1",
            brigadaId = "BRIG01",
            estadoUnidad = true,
            usuarioId = "USU01",
            comandos = listOf("COM01", "COM02"),
            estudiantes = listOf("andres", "ramiro")
        )

        val unidad2 = Unidad(
            id = "UNI02",
            nombreUnidad = "Unidad 2",
            brigadaId = "BRIG02",
            estadoUnidad = true,
            usuarioId = "USU02",
            comandos = listOf("COM03", "COM04"),
            estudiantes = listOf("andres", "ramiros")
        )
    }
}