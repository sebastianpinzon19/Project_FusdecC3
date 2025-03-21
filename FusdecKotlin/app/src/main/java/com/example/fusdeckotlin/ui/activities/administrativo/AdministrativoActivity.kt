package com.example.fusdeckotlin.ui.activities.administrativo

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.fusdeckotlin.MainActivity
import com.example.fusdeckotlin.R
import com.example.fusdeckotlin.ui.activities.administrativo.user.UserActivity

class AdministrativoActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_administrativo)


        val auditoriaButton: Button = findViewById(R.id.auditoriaButton)
        val brigadaButton: Button = findViewById(R.id.brigadaButton)
        val certificadoButton: Button = findViewById(R.id.certificadoButton)
        val colegioButton: Button = findViewById(R.id.colegioButton)
        val comandoButton: Button = findViewById(R.id.comandoButton)
        val unidadButton: Button = findViewById(R.id.unidadButton)
        val userButton: Button = findViewById(R.id.userButton)
        val volverButton: Button = findViewById(R.id.volverButton)


        auditoriaButton.setOnClickListener {

            Toast.makeText(this, "Módulo de Auditoría", Toast.LENGTH_SHORT).show()
        }

        brigadaButton.setOnClickListener {

            Toast.makeText(this, "Módulo de Brigada", Toast.LENGTH_SHORT).show()
        }

        userButton.setOnClickListener{
            val intent = Intent(this, UserActivity::class.java)
            startActivity(intent)
        }

        volverButton.setOnClickListener {
            val intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
            finish()
        }


    }
}