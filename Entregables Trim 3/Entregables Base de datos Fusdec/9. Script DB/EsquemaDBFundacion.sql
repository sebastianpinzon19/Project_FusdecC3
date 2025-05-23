USE [DB_Fundacion]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[IdRol] [int] NOT NULL,
	[IdAdministrador] [int] NOT NULL,
 CONSTRAINT [Administrador_PK] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC,
	[IdAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Administrador_PKv1] UNIQUE NONCLUSTERED 
(
	[IdAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrador_Colegio]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador_Colegio](
	[Administrador_IdRol] [int] NOT NULL,
	[colegio_IdColegio] [int] NOT NULL,
	[Administrador_IdAdministrador] [int] NOT NULL,
 CONSTRAINT [Administrador_Colegio_PK] PRIMARY KEY CLUSTERED 
(
	[Administrador_IdRol] ASC,
	[colegio_IdColegio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignacionReporteIn]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionReporteIn](
	[Inasistencia_IdInasistencia] [int] NOT NULL,
	[colegio_IdColegio] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignacionRol]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionRol](
	[Usuario_IdUsuario] [int] NOT NULL,
	[Rol_IdRol] [int] NOT NULL,
 CONSTRAINT [AsignacionRol_PK] PRIMARY KEY CLUSTERED 
(
	[Rol_IdRol] ASC,
	[Usuario_IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignarCalificacion]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignarCalificacion](
	[Calificacion_IdCalificacion] [int] NOT NULL,
	[Registro_IdRegistro] [int] NOT NULL,
 CONSTRAINT [AsignarCalificacion_PK] PRIMARY KEY CLUSTERED 
(
	[Calificacion_IdCalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditoria]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditoria](
	[IdAuditoria] [int] NOT NULL,
	[FechaAuditoria] [date] NOT NULL,
	[NombreQuienExpidio] [nvarchar](256) NOT NULL,
	[Certificado_IdCertificado] [int] NOT NULL,
 CONSTRAINT [Auditoria_PK] PRIMARY KEY CLUSTERED 
(
	[IdAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brigada]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brigada](
	[IdBrigada] [int] NOT NULL,
	[NombreBrigada] [nvarchar](256) NOT NULL,
	[Comando_IdComando] [int] NOT NULL,
	[UbicacionBrigada] [nvarchar](256) NOT NULL,
	[EstadoBrigada] [bit] NOT NULL,
 CONSTRAINT [brigada_PK] PRIMARY KEY CLUSTERED 
(
	[IdBrigada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[IdReporte] [int] NOT NULL,
	[IdCalificacion] [int] NOT NULL,
	[NotaCalificacion] [bit] NOT NULL,
	[Administrador_IdAdministrador] [int] NOT NULL,
 CONSTRAINT [Calificacion_PK] PRIMARY KEY CLUSTERED 
(
	[IdReporte] ASC,
	[IdCalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Calificacion_PKv1] UNIQUE NONCLUSTERED 
(
	[IdCalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificado]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificado](
	[IdCertificado] [int] NOT NULL,
	[Nombres] [nvarchar](256) NOT NULL,
	[Apellidos] [nvarchar](256) NOT NULL,
	[CodigoVerificador] [nvarchar](256) NOT NULL,
	[QuienExpidio] [nvarchar](256) NOT NULL,
	[NumeroDocumentoUsuario] [nvarchar](256) NOT NULL,
	[persona_IdPersona] [int] NOT NULL,
	[Administrador_IdAdministrador] [int] NOT NULL,
	[Curso_IdCurso] [int] NOT NULL,
 CONSTRAINT [Certificado_PK] PRIMARY KEY CLUSTERED 
(
	[IdCertificado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colegio]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colegio](
	[IdColegio] [int] NOT NULL,
	[NombreCol] [nvarchar](256) NOT NULL,
	[CodigoCol] [nvarchar](256) NOT NULL,
	[CalleCol] [nvarchar](256) NOT NULL,
	[ZonaDistritoCol] [nvarchar](256) NOT NULL,
	[NumeroCol] [nvarchar](10) NOT NULL,
	[CiudadCol] [nvarchar](256) NOT NULL,
	[CorreoElectronicoCol] [nvarchar](256) NOT NULL,
	[fundacion_IdFundacion] [int] NOT NULL,
 CONSTRAINT [colegio_PK] PRIMARY KEY CLUSTERED 
(
	[IdColegio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comando]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comando](
	[IdComando] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[NombreComando] [nvarchar](256) NOT NULL,
	[UbicacionComando] [nvarchar](256) NOT NULL,
	[fundacion_IdFundacion] [int] NOT NULL,
 CONSTRAINT [Comando_PK] PRIMARY KEY CLUSTERED 
(
	[IdComando] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [int] NOT NULL,
	[NombreCurso] [nvarchar](256) NOT NULL,
	[DescripcionCurso] [ntext] NOT NULL,
	[IntensidadHorariaCurso] [nvarchar](256) NOT NULL,
	[fundacion_IdFundacion] [int] NOT NULL,
 CONSTRAINT [Curso_PK] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_Administrador]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_Administrador](
	[Curso_IdCurso] [int] NOT NULL,
	[Administrador_IdRol] [int] NOT NULL,
	[Administrador_IdAdministrador] [int] NOT NULL,
 CONSTRAINT [Curso_Administrador_PK] PRIMARY KEY CLUSTERED 
(
	[Curso_IdCurso] ASC,
	[Administrador_IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Edicion]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Edicion](
	[IdEdicion] [int] NOT NULL,
	[FechaInicioEdicion] [date] NOT NULL,
	[FechaFinEdicion] [date] NOT NULL,
	[Curso_IdCurso] [int] NOT NULL,
 CONSTRAINT [Edicion_PK] PRIMARY KEY CLUSTERED 
(
	[IdEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcion]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcion](
	[IdFunciones] [int] NOT NULL,
	[NombreFuncion] [nvarchar](256) NOT NULL,
	[DescripcionFuncion] [ntext] NOT NULL,
	[SuperAdministrador_IdSA] [int] NOT NULL,
 CONSTRAINT [Funcion_PK] PRIMARY KEY CLUSTERED 
(
	[IdFunciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funciones_Rol]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funciones_Rol](
	[Funcion_IdFunciones] [int] NOT NULL,
	[Rol_IdRol] [int] NOT NULL,
 CONSTRAINT [Funciones_Rol_PK] PRIMARY KEY CLUSTERED 
(
	[Funcion_IdFunciones] ASC,
	[Rol_IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fundacion]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fundacion](
	[IdFundacion] [int] NOT NULL,
	[NombreFundacion] [nvarchar](256) NOT NULL,
 CONSTRAINT [fundacion_PK] PRIMARY KEY CLUSTERED 
(
	[IdFundacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[IdHorario] [int] NOT NULL,
	[FechaInicioHorario] [datetime] NOT NULL,
	[FechaFinHorario] [datetime] NOT NULL,
 CONSTRAINT [Horario_PK] PRIMARY KEY CLUSTERED 
(
	[IdHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inasistencia]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inasistencia](
	[IdReporte] [int] NOT NULL,
	[IdInasistencia] [int] NOT NULL,
	[NombrePersona] [nvarchar](256) NOT NULL,
	[ApellidoPersona] [nvarchar](256) NOT NULL,
	[NombreColegio] [nvarchar](256) NOT NULL,
 CONSTRAINT [Inasistencia_PK] PRIMARY KEY CLUSTERED 
(
	[IdReporte] ASC,
	[IdInasistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Inasistencia_PKv1] UNIQUE NONCLUSTERED 
(
	[IdInasistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[IdRol] [int] NOT NULL,
	[IdInstructor] [int] NOT NULL,
 CONSTRAINT [Instructor_PK] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC,
	[IdInstructor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Instructor_PKv1] UNIQUE NONCLUSTERED 
(
	[IdInstructor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfil]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil](
	[IdPerfil] [int] NOT NULL,
	[Nombres] [nvarchar](256) NOT NULL,
	[Apellidos] [nvarchar](256) NOT NULL,
	[TipoDocumento] [nvarchar](256) NOT NULL,
	[NumeroDocumentoUsuario] [nvarchar](256) NOT NULL,
	[Usuario_IdUsuario] [int] NOT NULL,
 CONSTRAINT [perfil_PK] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[IdPersona] [int] NOT NULL,
	[nombrePer] [nvarchar](256) NOT NULL,
	[apellidosPer] [nvarchar](256) NOT NULL,
	[TipoDocumentoPer] [nvarchar](256) NOT NULL,
	[NumeroDocumentoPer] [nvarchar](256) NOT NULL,
	[CorreoElectronico] [nvarchar](256) NOT NULL,
	[GeneroPer] [nvarchar](256) NOT NULL,
	[FechaNacimientoPer] [date] NOT NULL,
	[colegio_IdColegio] [int] NOT NULL,
	[Unidad_IdUnidad] [int] NOT NULL,
 CONSTRAINT [persona_PK] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona_Calificacion]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona_Calificacion](
	[persona_IdPersona] [int] NOT NULL,
	[Calificacion_IdReporte] [int] NOT NULL,
	[Calificacion_IdCalificacion] [int] NOT NULL,
 CONSTRAINT [Persona_Calificacion_PK] PRIMARY KEY CLUSTERED 
(
	[persona_IdPersona] ASC,
	[Calificacion_IdReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona_Horario]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona_Horario](
	[persona_IdPersona] [int] NOT NULL,
	[Horario_IdHorario] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [Persona_Horario_PK] PRIMARY KEY CLUSTERED 
(
	[persona_IdPersona] ASC,
	[Horario_IdHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona_Inasistencia]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona_Inasistencia](
	[persona_IdPersona] [int] NOT NULL,
	[Inasistencia_IdReporte] [int] NOT NULL,
	[Inasistencia_IdInasistencia] [int] NOT NULL,
 CONSTRAINT [Persona_Inasistencia_PK] PRIMARY KEY CLUSTERED 
(
	[persona_IdPersona] ASC,
	[Inasistencia_IdReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro](
	[IdRegistro] [int] NOT NULL,
	[FechaRegistro] [date] NOT NULL,
	[persona_IdPersona] [int] NOT NULL,
	[Edicion_IdEdicion] [int] NOT NULL,
	[Administrador_IdAdministrador] [int] NOT NULL,
 CONSTRAINT [Registro_PK] PRIMARY KEY CLUSTERED 
(
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reporte]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reporte](
	[IdReporte] [int] NOT NULL,
	[NombreReporte] [nvarchar](256) NOT NULL,
	[Instructor_IdInstructor] [int] NOT NULL,
 CONSTRAINT [Reporte_PK] PRIMARY KEY CLUSTERED 
(
	[IdReporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] NOT NULL,
	[NombreRol] [nvarchar](256) NOT NULL,
 CONSTRAINT [Rol_PK] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuperAdministrador]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuperAdministrador](
	[IdSA] [int] NOT NULL,
	[NombreUsuario] [nvarchar](256) NOT NULL,
	[Contraseña] [nvarchar](256) NOT NULL,
 CONSTRAINT [SuperAdministrador_PK] PRIMARY KEY CLUSTERED 
(
	[IdSA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unidad]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad](
	[IdUnidad] [int] NOT NULL,
	[NombreUnidad] [nvarchar](256) NOT NULL,
	[EstadoUnidad] [bit] NOT NULL,
	[brigada_IdBrigada] [int] NOT NULL,
	[UbicacionUnidad] [nvarchar](256) NOT NULL,
 CONSTRAINT [Unidad_PK] PRIMARY KEY CLUSTERED 
(
	[IdUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/06/2024 12:09:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [nvarchar](256) NOT NULL,
	[contraseñaUsuario] [nvarchar](256) NOT NULL,
	[UltimaFechaDeAccesoU] [date] NOT NULL,
	[FechaDeCreacionU] [date] NOT NULL,
	[EstadoUsuario] [bit] NOT NULL,
	[SuperAdministrador_IdSA] [int] NOT NULL,
 CONSTRAINT [Usuario_PK] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [Administrador_Rol_FK] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [Administrador_Rol_FK]
GO
ALTER TABLE [dbo].[Administrador_Colegio]  WITH CHECK ADD  CONSTRAINT [Administrador_Colegio_Administrador_FK] FOREIGN KEY([Administrador_IdRol], [Administrador_IdAdministrador])
REFERENCES [dbo].[Administrador] ([IdRol], [IdAdministrador])
GO
ALTER TABLE [dbo].[Administrador_Colegio] CHECK CONSTRAINT [Administrador_Colegio_Administrador_FK]
GO
ALTER TABLE [dbo].[Administrador_Colegio]  WITH CHECK ADD  CONSTRAINT [Administrador_Colegio_colegio_FK] FOREIGN KEY([colegio_IdColegio])
REFERENCES [dbo].[colegio] ([IdColegio])
GO
ALTER TABLE [dbo].[Administrador_Colegio] CHECK CONSTRAINT [Administrador_Colegio_colegio_FK]
GO
ALTER TABLE [dbo].[AsignacionReporteIn]  WITH CHECK ADD  CONSTRAINT [AsignacionReporteIn_colegio_FK] FOREIGN KEY([colegio_IdColegio])
REFERENCES [dbo].[colegio] ([IdColegio])
GO
ALTER TABLE [dbo].[AsignacionReporteIn] CHECK CONSTRAINT [AsignacionReporteIn_colegio_FK]
GO
ALTER TABLE [dbo].[AsignacionReporteIn]  WITH CHECK ADD  CONSTRAINT [AsignacionReporteIn_Inasistencia_FK] FOREIGN KEY([Inasistencia_IdInasistencia])
REFERENCES [dbo].[Inasistencia] ([IdInasistencia])
GO
ALTER TABLE [dbo].[AsignacionReporteIn] CHECK CONSTRAINT [AsignacionReporteIn_Inasistencia_FK]
GO
ALTER TABLE [dbo].[AsignacionRol]  WITH CHECK ADD  CONSTRAINT [AsignacionRol_Rol_FK] FOREIGN KEY([Rol_IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[AsignacionRol] CHECK CONSTRAINT [AsignacionRol_Rol_FK]
GO
ALTER TABLE [dbo].[AsignacionRol]  WITH CHECK ADD  CONSTRAINT [AsignacionRol_Usuario_FK] FOREIGN KEY([Usuario_IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[AsignacionRol] CHECK CONSTRAINT [AsignacionRol_Usuario_FK]
GO
ALTER TABLE [dbo].[AsignarCalificacion]  WITH CHECK ADD  CONSTRAINT [AsignarCalificacion_Calificacion_FK] FOREIGN KEY([Calificacion_IdCalificacion])
REFERENCES [dbo].[Calificacion] ([IdCalificacion])
GO
ALTER TABLE [dbo].[AsignarCalificacion] CHECK CONSTRAINT [AsignarCalificacion_Calificacion_FK]
GO
ALTER TABLE [dbo].[AsignarCalificacion]  WITH CHECK ADD  CONSTRAINT [AsignarCalificacion_Registro_FK] FOREIGN KEY([Registro_IdRegistro])
REFERENCES [dbo].[Registro] ([IdRegistro])
GO
ALTER TABLE [dbo].[AsignarCalificacion] CHECK CONSTRAINT [AsignarCalificacion_Registro_FK]
GO
ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD  CONSTRAINT [Auditoria_Certificado_FK] FOREIGN KEY([Certificado_IdCertificado])
REFERENCES [dbo].[Certificado] ([IdCertificado])
GO
ALTER TABLE [dbo].[Auditoria] CHECK CONSTRAINT [Auditoria_Certificado_FK]
GO
ALTER TABLE [dbo].[brigada]  WITH CHECK ADD  CONSTRAINT [brigada_Comando_FK] FOREIGN KEY([Comando_IdComando])
REFERENCES [dbo].[Comando] ([IdComando])
GO
ALTER TABLE [dbo].[brigada] CHECK CONSTRAINT [brigada_Comando_FK]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [Calificacion_Administrador_FK] FOREIGN KEY([Administrador_IdAdministrador])
REFERENCES [dbo].[Administrador] ([IdAdministrador])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [Calificacion_Administrador_FK]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [Calificacion_Reporte_FK] FOREIGN KEY([IdReporte])
REFERENCES [dbo].[Reporte] ([IdReporte])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [Calificacion_Reporte_FK]
GO
ALTER TABLE [dbo].[Certificado]  WITH CHECK ADD  CONSTRAINT [Certificado_Administrador_FK] FOREIGN KEY([Administrador_IdAdministrador])
REFERENCES [dbo].[Administrador] ([IdAdministrador])
GO
ALTER TABLE [dbo].[Certificado] CHECK CONSTRAINT [Certificado_Administrador_FK]
GO
ALTER TABLE [dbo].[Certificado]  WITH CHECK ADD  CONSTRAINT [Certificado_Curso_FK] FOREIGN KEY([Curso_IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Certificado] CHECK CONSTRAINT [Certificado_Curso_FK]
GO
ALTER TABLE [dbo].[Certificado]  WITH CHECK ADD  CONSTRAINT [Certificado_persona_FK] FOREIGN KEY([persona_IdPersona])
REFERENCES [dbo].[persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Certificado] CHECK CONSTRAINT [Certificado_persona_FK]
GO
ALTER TABLE [dbo].[colegio]  WITH CHECK ADD  CONSTRAINT [colegio_fundacion_FK] FOREIGN KEY([fundacion_IdFundacion])
REFERENCES [dbo].[fundacion] ([IdFundacion])
GO
ALTER TABLE [dbo].[colegio] CHECK CONSTRAINT [colegio_fundacion_FK]
GO
ALTER TABLE [dbo].[Comando]  WITH CHECK ADD  CONSTRAINT [Comando_fundacion_FK] FOREIGN KEY([fundacion_IdFundacion])
REFERENCES [dbo].[fundacion] ([IdFundacion])
GO
ALTER TABLE [dbo].[Comando] CHECK CONSTRAINT [Comando_fundacion_FK]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [Curso_fundacion_FK] FOREIGN KEY([fundacion_IdFundacion])
REFERENCES [dbo].[fundacion] ([IdFundacion])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [Curso_fundacion_FK]
GO
ALTER TABLE [dbo].[Curso_Administrador]  WITH CHECK ADD  CONSTRAINT [Curso_Administrador_Administrador_FK] FOREIGN KEY([Administrador_IdRol], [Administrador_IdAdministrador])
REFERENCES [dbo].[Administrador] ([IdRol], [IdAdministrador])
GO
ALTER TABLE [dbo].[Curso_Administrador] CHECK CONSTRAINT [Curso_Administrador_Administrador_FK]
GO
ALTER TABLE [dbo].[Curso_Administrador]  WITH CHECK ADD  CONSTRAINT [Curso_Administrador_Curso_FK] FOREIGN KEY([Curso_IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Curso_Administrador] CHECK CONSTRAINT [Curso_Administrador_Curso_FK]
GO
ALTER TABLE [dbo].[Edicion]  WITH CHECK ADD  CONSTRAINT [Edicion_Curso_FK] FOREIGN KEY([Curso_IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Edicion] CHECK CONSTRAINT [Edicion_Curso_FK]
GO
ALTER TABLE [dbo].[Funcion]  WITH CHECK ADD  CONSTRAINT [Funcion_SuperAdministrador_FK] FOREIGN KEY([SuperAdministrador_IdSA])
REFERENCES [dbo].[SuperAdministrador] ([IdSA])
GO
ALTER TABLE [dbo].[Funcion] CHECK CONSTRAINT [Funcion_SuperAdministrador_FK]
GO
ALTER TABLE [dbo].[Funciones_Rol]  WITH CHECK ADD  CONSTRAINT [Funciones_Rol_Funcion_FK] FOREIGN KEY([Funcion_IdFunciones])
REFERENCES [dbo].[Funcion] ([IdFunciones])
GO
ALTER TABLE [dbo].[Funciones_Rol] CHECK CONSTRAINT [Funciones_Rol_Funcion_FK]
GO
ALTER TABLE [dbo].[Funciones_Rol]  WITH CHECK ADD  CONSTRAINT [Funciones_Rol_Rol_FK] FOREIGN KEY([Rol_IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Funciones_Rol] CHECK CONSTRAINT [Funciones_Rol_Rol_FK]
GO
ALTER TABLE [dbo].[Inasistencia]  WITH CHECK ADD  CONSTRAINT [Inasistencia_Reporte_FK] FOREIGN KEY([IdReporte])
REFERENCES [dbo].[Reporte] ([IdReporte])
GO
ALTER TABLE [dbo].[Inasistencia] CHECK CONSTRAINT [Inasistencia_Reporte_FK]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [Instructor_Rol_FK] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [Instructor_Rol_FK]
GO
ALTER TABLE [dbo].[perfil]  WITH CHECK ADD  CONSTRAINT [perfil_Usuario_FK] FOREIGN KEY([Usuario_IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[perfil] CHECK CONSTRAINT [perfil_Usuario_FK]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_colegio_FK] FOREIGN KEY([colegio_IdColegio])
REFERENCES [dbo].[colegio] ([IdColegio])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_colegio_FK]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [persona_Unidad_FK] FOREIGN KEY([Unidad_IdUnidad])
REFERENCES [dbo].[Unidad] ([IdUnidad])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona_Unidad_FK]
GO
ALTER TABLE [dbo].[Persona_Calificacion]  WITH CHECK ADD  CONSTRAINT [Persona_Calificacion_Calificacion_FK] FOREIGN KEY([Calificacion_IdReporte], [Calificacion_IdCalificacion])
REFERENCES [dbo].[Calificacion] ([IdReporte], [IdCalificacion])
GO
ALTER TABLE [dbo].[Persona_Calificacion] CHECK CONSTRAINT [Persona_Calificacion_Calificacion_FK]
GO
ALTER TABLE [dbo].[Persona_Calificacion]  WITH CHECK ADD  CONSTRAINT [Persona_Calificacion_persona_FK] FOREIGN KEY([persona_IdPersona])
REFERENCES [dbo].[persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Persona_Calificacion] CHECK CONSTRAINT [Persona_Calificacion_persona_FK]
GO
ALTER TABLE [dbo].[Persona_Horario]  WITH CHECK ADD  CONSTRAINT [Persona_Horario_Horario_FK] FOREIGN KEY([Horario_IdHorario])
REFERENCES [dbo].[Horario] ([IdHorario])
GO
ALTER TABLE [dbo].[Persona_Horario] CHECK CONSTRAINT [Persona_Horario_Horario_FK]
GO
ALTER TABLE [dbo].[Persona_Horario]  WITH CHECK ADD  CONSTRAINT [Persona_Horario_persona_FK] FOREIGN KEY([persona_IdPersona])
REFERENCES [dbo].[persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Persona_Horario] CHECK CONSTRAINT [Persona_Horario_persona_FK]
GO
ALTER TABLE [dbo].[Persona_Inasistencia]  WITH CHECK ADD  CONSTRAINT [Persona_Inasistencia_Inasistencia_FK] FOREIGN KEY([Inasistencia_IdReporte], [Inasistencia_IdInasistencia])
REFERENCES [dbo].[Inasistencia] ([IdReporte], [IdInasistencia])
GO
ALTER TABLE [dbo].[Persona_Inasistencia] CHECK CONSTRAINT [Persona_Inasistencia_Inasistencia_FK]
GO
ALTER TABLE [dbo].[Persona_Inasistencia]  WITH CHECK ADD  CONSTRAINT [Persona_Inasistencia_persona_FK] FOREIGN KEY([persona_IdPersona])
REFERENCES [dbo].[persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Persona_Inasistencia] CHECK CONSTRAINT [Persona_Inasistencia_persona_FK]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [Registro_Administrador_FK] FOREIGN KEY([Administrador_IdAdministrador])
REFERENCES [dbo].[Administrador] ([IdAdministrador])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [Registro_Administrador_FK]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [Registro_Edicion_FK] FOREIGN KEY([Edicion_IdEdicion])
REFERENCES [dbo].[Edicion] ([IdEdicion])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [Registro_Edicion_FK]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [Registro_persona_FK] FOREIGN KEY([persona_IdPersona])
REFERENCES [dbo].[persona] ([IdPersona])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [Registro_persona_FK]
GO
ALTER TABLE [dbo].[Reporte]  WITH CHECK ADD  CONSTRAINT [Reporte_Instructor_FK] FOREIGN KEY([Instructor_IdInstructor])
REFERENCES [dbo].[Instructor] ([IdInstructor])
GO
ALTER TABLE [dbo].[Reporte] CHECK CONSTRAINT [Reporte_Instructor_FK]
GO
ALTER TABLE [dbo].[Unidad]  WITH CHECK ADD  CONSTRAINT [Unidad_brigada_FK] FOREIGN KEY([brigada_IdBrigada])
REFERENCES [dbo].[brigada] ([IdBrigada])
GO
ALTER TABLE [dbo].[Unidad] CHECK CONSTRAINT [Unidad_brigada_FK]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [Usuario_SuperAdministrador_FK] FOREIGN KEY([SuperAdministrador_IdSA])
REFERENCES [dbo].[SuperAdministrador] ([IdSA])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [Usuario_SuperAdministrador_FK]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del rol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrador', @level2type=N'COLUMN',@level2name=N'IdRol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del  administrador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrador', @level2type=N'COLUMN',@level2name=N'IdAdministrador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el uid de la auditoria para cada certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditoria', @level2type=N'COLUMN',@level2name=N'IdAuditoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la fecha en que el certificado fue expedido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditoria', @level2type=N'COLUMN',@level2name=N'FechaAuditoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la persona que expidio el certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Auditoria', @level2type=N'COLUMN',@level2name=N'NombreQuienExpidio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la brigada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'brigada', @level2type=N'COLUMN',@level2name=N'IdBrigada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la brigada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'brigada', @level2type=N'COLUMN',@level2name=N'NombreBrigada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la ubicacion de la brigada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'brigada', @level2type=N'COLUMN',@level2name=N'UbicacionBrigada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el estado de la brigada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'brigada', @level2type=N'COLUMN',@level2name=N'EstadoBrigada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del reporte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Calificacion', @level2type=N'COLUMN',@level2name=N'IdReporte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la edicion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Calificacion', @level2type=N'COLUMN',@level2name=N'IdCalificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la calificacion (aprobado, no aprobado)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Calificacion', @level2type=N'COLUMN',@level2name=N'NotaCalificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el uid del certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Certificado', @level2type=N'COLUMN',@level2name=N'IdCertificado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene los nombres del usuario que obtuvo el certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Certificado', @level2type=N'COLUMN',@level2name=N'Nombres'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene los apellidos del usuario que obtuvo el certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Certificado', @level2type=N'COLUMN',@level2name=N'Apellidos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el codigo verificador del certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Certificado', @level2type=N'COLUMN',@level2name=N'CodigoVerificador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la persona que expidio el certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Certificado', @level2type=N'COLUMN',@level2name=N'QuienExpidio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el numero de cocumento del usuario que obtuvo el certificado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Certificado', @level2type=N'COLUMN',@level2name=N'NumeroDocumentoUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'IdColegio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'NombreCol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el codigo del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'CodigoCol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la calle del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'CalleCol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la zona del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'ZonaDistritoCol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el numero del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'NumeroCol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la ciudad del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'CiudadCol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el correo del colegio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colegio', @level2type=N'COLUMN',@level2name=N'CorreoElectronicoCol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del comando' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comando', @level2type=N'COLUMN',@level2name=N'IdComando'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el estado del comando' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comando', @level2type=N'COLUMN',@level2name=N'Estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre del comando' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comando', @level2type=N'COLUMN',@level2name=N'NombreComando'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la ubicacion del comando' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comando', @level2type=N'COLUMN',@level2name=N'UbicacionComando'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del curso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Curso', @level2type=N'COLUMN',@level2name=N'IdCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre del curso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Curso', @level2type=N'COLUMN',@level2name=N'NombreCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene una breve descripcion del curso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Curso', @level2type=N'COLUMN',@level2name=N'DescripcionCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la intensidad horaria del curso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Curso', @level2type=N'COLUMN',@level2name=N'IntensidadHorariaCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la edicion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Edicion', @level2type=N'COLUMN',@level2name=N'IdEdicion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la funcion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'IdFunciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la funcion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'NombreFuncion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene una explicacion de la funcion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Funcion', @level2type=N'COLUMN',@level2name=N'DescripcionFuncion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la fundcion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fundacion', @level2type=N'COLUMN',@level2name=N'IdFundacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la fundacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'fundacion', @level2type=N'COLUMN',@level2name=N'NombreFundacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del horario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Horario', @level2type=N'COLUMN',@level2name=N'IdHorario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene los dias a venir' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Horario', @level2type=N'COLUMN',@level2name=N'FechaInicioHorario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene los diferentes espacios para realziar las actividades' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Horario', @level2type=N'COLUMN',@level2name=N'FechaFinHorario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del reporte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inasistencia', @level2type=N'COLUMN',@level2name=N'IdReporte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la inasistencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inasistencia', @level2type=N'COLUMN',@level2name=N'IdInasistencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la persona relacionada al reporte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inasistencia', @level2type=N'COLUMN',@level2name=N'NombrePersona'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el apellido de la persona relacionada al reporte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inasistencia', @level2type=N'COLUMN',@level2name=N'ApellidoPersona'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre del colegio al que esta asociado la persona ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inasistencia', @level2type=N'COLUMN',@level2name=N'NombreColegio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del rol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Instructor', @level2type=N'COLUMN',@level2name=N'IdRol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del instrcutor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Instructor', @level2type=N'COLUMN',@level2name=N'IdInstructor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene el id del perfil ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'perfil', @level2type=N'COLUMN',@level2name=N'IdPerfil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene el telefono del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'perfil', @level2type=N'COLUMN',@level2name=N'Nombres'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene el estado del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'perfil', @level2type=N'COLUMN',@level2name=N'Apellidos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene el tipo de sangre del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'perfil', @level2type=N'COLUMN',@level2name=N'TipoDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'contiene la foto que ira en el perfil del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'perfil', @level2type=N'COLUMN',@level2name=N'NumeroDocumentoUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'IdPersona'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'nombrePer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el apellido de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'apellidosPer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el tipo de documento de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'TipoDocumentoPer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el numero de documento de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'NumeroDocumentoPer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el correo electronico de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'CorreoElectronico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el genero de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'GeneroPer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la fecha de nacimiento de la persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'persona', @level2type=N'COLUMN',@level2name=N'FechaNacimientoPer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Registro', @level2type=N'COLUMN',@level2name=N'IdRegistro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la fecha del registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Registro', @level2type=N'COLUMN',@level2name=N'FechaRegistro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del reporte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reporte', @level2type=N'COLUMN',@level2name=N'IdReporte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el contenido del reporte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reporte', @level2type=N'COLUMN',@level2name=N'NombreReporte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del rol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rol', @level2type=N'COLUMN',@level2name=N'IdRol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre del rol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rol', @level2type=N'COLUMN',@level2name=N'NombreRol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id del super administrador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SuperAdministrador', @level2type=N'COLUMN',@level2name=N'IdSA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre del super administrador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SuperAdministrador', @level2type=N'COLUMN',@level2name=N'NombreUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la contraseña del super administrador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SuperAdministrador', @level2type=N'COLUMN',@level2name=N'Contraseña'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el id de la unidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Unidad', @level2type=N'COLUMN',@level2name=N'IdUnidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre de la unidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Unidad', @level2type=N'COLUMN',@level2name=N'NombreUnidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el estado de la unidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Unidad', @level2type=N'COLUMN',@level2name=N'EstadoUnidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la ubicacion de la unidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Unidad', @level2type=N'COLUMN',@level2name=N'UbicacionUnidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la id del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'IdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el nombre del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'NombreUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la contraseña del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'contraseñaUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la ultima fecha de acceso del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'UltimaFechaDeAccesoU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene la fecha de creacion del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'FechaDeCreacionU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contiene el estado del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'EstadoUsuario'
GO
