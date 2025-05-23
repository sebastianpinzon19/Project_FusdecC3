package com.example.fusdeckotlin.models.secretario.curso

import com.example.fusdeckotlin.models.secretario.edicion.Edicion
import com.google.gson.annotations.SerializedName
import com.example.fusdeckotlin.models.root.fundacion.Fundacion
import java.time.LocalDate

class Curso(
    @SerializedName("_id") private val id: String,
    @SerializedName("nombreCurso") private var nombreCurso: String,
    @SerializedName("descripcionCurso") private var descripcionCurso: String,
    @SerializedName("intensidadHorariaCurso") private var intensidadHorariaCurso: String,
    @SerializedName("estadoCurso") private var estadoCurso: Boolean = true,
    @SerializedName("fundacionId") private var fundacionId: Any,
    @SerializedName("ediciones") private var ediciones: List<Any> = emptyList()
) {
    // Getters básicos
    fun getId(): String = id
    fun getNombreCurso(): String = nombreCurso
    fun getDescripcionCurso(): String = descripcionCurso
    fun getIntensidadHorariaCurso(): String = intensidadHorariaCurso
    fun getEstadoCurso(): Boolean = estadoCurso

    // Obtener solo el ID de la fundación
    fun getFundacionId(): String {
        return when(fundacionId) {
            is String -> fundacionId as String
            is Fundacion -> (fundacionId as Fundacion).getId()
            is Map<*, *> -> (fundacionId as Map<*, *>)["_id"] as? String ?: ""
            else -> ""
        }
    }

    // Obtener objeto Fundacion completo
    fun getFundacion(): Fundacion {
        return when(fundacionId) {
            is Fundacion -> fundacionId as Fundacion
            is String -> crearFundacionVacia(fundacionId as String)
            is Map<*, *> -> convertMapToFundacion(fundacionId as Map<*, *>)
            else -> crearFundacionVacia("")
        }
    }

    private fun crearFundacionVacia(id: String): Fundacion {
        return Fundacion(
            id = id,
            nombreFundacion = "",
            estadoFundacion = true,
        )
    }

    private fun convertMapToFundacion(map: Map<*, *>): Fundacion {
        return Fundacion(
            id = map["_id"] as? String ?: "",
            nombreFundacion = map["nombreFundacion"] as? String ?: "",
            estadoFundacion = map["estadoFundacion"] as? Boolean ?: true,
        )
    }


    fun getEdiciones(): List<Edicion> {
        return ediciones.mapNotNull {
            when (it) {
                is Edicion -> it
                is String -> Edicion(
                    id = it,
                    nombreEdicion = "",
                    fechaInicioString = LocalDate.now().toString(),
                    fechaFinString = LocalDate.now().toString(),
                    cursoId = this.id,
                    estadoEdicion = true,
                )
                is Map<*, *> -> convertMapToEdicion(it)
                else -> null
            }
        }
    }

    // Obtener solo los ID de las ediciones
    fun getEdicionesIds(): List<String> {
        return ediciones.map {
            when (it) {
                is Edicion -> it.getId()
                is String -> it
                is Map<*, *> -> it["_id"] as? String ?: ""
                else -> ""
            }
        }.filter { it.isNotEmpty() }
    }

    // Conversor de Map a objeto Edicion
    private fun convertMapToEdicion(map: Map<*, *>): Edicion {
        return Edicion(
            id = map["_id"] as? String ?: "",
            nombreEdicion = map["nombreEdicion"] as? String ?: "",
            fechaInicioString = (map["fechaInicio"] as? String)?.substring(0, 10) ?: LocalDate.now().toString(),
            fechaFinString = (map["fechaFin"] as? String)?.substring(0, 10) ?: LocalDate.now().toString(),
            cursoId = map["cursoId"] as? String ?: this.id,
            estadoEdicion = map["estadoEdicion"] as? Boolean ?: true,
        )
    }


    override fun toString(): String {
        return "Curso(id='$id', nombre='$nombreCurso', descripción='$descripcionCurso', " +
                "intensidad='$intensidadHorariaCurso', estado=$estadoCurso, " +
                "fundacionId='$fundacionId', ediciones=${getEdicionesIds().joinToString()})"
    }
}