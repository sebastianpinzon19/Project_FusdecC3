const mongoose = require("mongoose");
const { Schema } = mongoose;

const CursoSchema = new Schema({
  /*CursoId: {
    type: Schema.Types.ObjectId,
    default: () => new mongoose.Types.ObjectId(),
  },*/
  nombreCurso: {
    type: String,
    required: true,
  },
  descripcionCurso: {
    type: String,
  },
  intensidadHorariaCurso: {
    type: String,
    required: true,
  },
  estadoCurso: {
    type: Boolean,
    default: true,
  },
  fundacionId: {
    type: Schema.Types.ObjectId,
    ref: "Fundacion", // Referencia a la colección de Fundacion
    default: null, // permite que la fundacion en el curso sea opcional
  },
  ediciones: [
    {
      type: Schema.Types.ObjectId,
      ref: "Edicion", // Referencia a la colección de Edicion
    },
  ],
});

const Curso = mongoose.model("Curso", CursoSchema);
module.exports = Curso;

