CREATE TABLE [adm_citas] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [id_paciente] int  NOT NULL,
  [id_programa] int  NOT NULL,
  [id_cliente] int  NOT NULL,
  [id_estado_cita] int  NOT NULL,
  [id_servicio] int  NOT NULL,
  [id_tipo_cita] int  NOT NULL,
  [id_contrato] int  NOT NULL,
  [id_consultorio] int  NOT NULL,
  [id_gestion_especialista] int  NOT NULL,
  [fecha_atencio] date  NULL,
  [hora_atencion] time(7)  NULL,
  [observaciones] varchar(500) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [usuario_creacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [updated_at] datetime  NULL,
  [usuario_modificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [fecha_solicitada] date  NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  CONSTRAINT [PK_CITAS] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [adm_citas] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [adm_ingresos] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [id_paciente] int  NOT NULL,
  [id_programa] int  NOT NULL,
  [id_cliente] int  NOT NULL,
  [id_regimen] int  NOT NULL,
  [id_contarto] int  NOT NULL,
  [id_estado] int  NOT NULL,
  [observaciones] varchar(500) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [usuario_creacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [updated_at] datetime  NULL,
  [usuario_modificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  [activo] bit  NOT NULL,
  [id_sede] int  NULL,
  CONSTRAINT [PK_CITAS_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [adm_ingresos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [adm_movimiento_paciente] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [id_servicio] int  NOT NULL,
  [id_ingreso] int  NOT NULL,
  [id_cita] int  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuario_creacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuario_modificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [precio] int  NULL,
  [facturable] bit  NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  CONSTRAINT [PK_MEDICOS_ESPECIALIDADES_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [adm_movimiento_paciente] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [clientes] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(75) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [apellido] varchar(75) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [telefono] varchar(80) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [correo] varchar(85) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime2(0) DEFAULT getdate() NULL,
  [updated_at] datetime2(0)  NULL,
  CONSTRAINT [PK__cliente__3213E83F24FCAD91] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [clientes] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [comp_DetalleOrdenCompra] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [idOrden] int  NOT NULL,
  [idProducto] int  NOT NULL,
  [cantidad] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [subtotal] float(53)  NULL,
  [porcentajeDes] tinyint  NULL,
  [descuento] float(53)  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  [deleted_at] datetime  NULL,
  [estado] tinyint DEFAULT 0 NULL,
  CONSTRAINT [PK__comp_Det__3214EC071259B247] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [comp_DetalleOrdenCompra] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [comp_DetalleRequisicion] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [idRequisicion] int  NOT NULL,
  [idProducto] int  NOT NULL,
  [idOrden] int  NULL,
  [cantidad] varchar(10) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  [estado] tinyint DEFAULT 0 NULL,
  CONSTRAINT [PK__comp_Det__3214EC075B8282EA] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [comp_DetalleRequisicion] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [comp_Facturas] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [consecutivo] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [idOrden] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  [estado] tinyint DEFAULT 0 NULL,
  CONSTRAINT [PK__comp_Fac__3214EC07505538B1] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [comp_Facturas] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [comp_Observaciones] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [mensaje] varchar(max) COLLATE Modern_Spanish_CI_AS  NULL,
  [idOrden] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__comp_Obs__3214EC0783AB079A] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [comp_Observaciones] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [comp_OrdenCompra] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [numOrden] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [concepto] varchar(200) COLLATE Modern_Spanish_CI_AS  NULL,
  [total] float(53)  NULL,
  [idEmpleado] int  NOT NULL,
  [idRequisicion] int  NOT NULL,
  [idEnvio] int  NOT NULL,
  [idEstado] int  NOT NULL,
  [idProveedor] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  [delete_at] int  NULL,
  CONSTRAINT [PK__comp_Ord__3214EC075D4CB5D7] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [comp_OrdenCompra] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [comp_Requisiciones] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [numOrden] varchar(10) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [observacion] varchar(300) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [idTipoRequiscion] int  NULL,
  [idSede] int  NULL,
  [idEmpleado] int  NULL,
  [idEstado] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__comp_Req__3214EC0728B541E3] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [comp_Requisiciones] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Bodegas] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [codigo] varchar(10) COLLATE Modern_Spanish_CI_AS  NULL,
  [idSede] int  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Bod__3214EC072D4167F7] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Bodegas] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Cargos] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [sigla] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Car__3214EC072048A5DC] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Cargos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_CategoriaEstudios] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [sigla] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Cat__3214EC07DCE8977B] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_CategoriaEstudios] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_CategoriaProductos] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [sigla] varchar(10) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Cat__3214EC07B8F02C35] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_CategoriaProductos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_CentroCostos] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [codigo] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [sigla] varchar(10) COLLATE Modern_Spanish_CI_AS  NULL,
  [idEmpresa] int  NOT NULL,
  [valorPresupuesto] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Cen__3214EC072BA50A01] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_CentroCostos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_cita_estados] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_cita_estados] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de los estados de una cita '
GO

CREATE TABLE [conf_cita_tipos] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy2_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_cita_tipos] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametros que muestra LA descripcion de los Tipos de cita'
GO

CREATE TABLE [conf_consultorio] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [is_sede] int  NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy2_copy1_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_consultorio] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametros que muestra LA descripcion de los Tipos de cita'
GO

CREATE TABLE [conf_dias] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [abreviatura] varchar(3) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_dias] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de los dias'
GO

CREATE TABLE [conf_discapacidades] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [abreviatura] varchar(2) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuarioregistro] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_discapacidades] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de las discapacidades'
GO

CREATE TABLE [conf_Empleados] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [primer_nombre] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [segundo_nombre] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [apellido_paterno] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [apellido_materno] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [idtipoDocumento] int  NOT NULL,
  [identificacion] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [fecha_expedicion] date  NOT NULL,
  [fecha_nacimiento] date  NOT NULL,
  [CiudadNacimiento] int  NULL,
  [direccion] varchar(200) COLLATE Modern_Spanish_CI_AS  NULL,
  [email] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [id_sexo] int  NULL,
  [idEstadoCivil] int  NOT NULL,
  [idCargo] int  NOT NULL,
  [idCentroCosto] int  NOT NULL,
  [ruta_foto] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuario] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [contrasena] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [idRol] int  NOT NULL,
  [created_at] datetime2(7)  NULL,
  [updated_at] datetime2(7)  NULL,
  CONSTRAINT [PK__conf_Emp__3214EC0794D14E45] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Empleados] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Empresas] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Emp__3214EC07DD5C5894] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Empresas] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Envio] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [codigo] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [idCategoria] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Env__3214EC07CE59BC36] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Envio] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_especialidades] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuarioregistro] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuariomodificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  [codigo_cups] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  CONSTRAINT [pk_especialidades] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_especialidades] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de las especialidades y es una tabla importante para la creacion de especialistas y la asignacion de citas'
GO

CREATE TABLE [conf_estadocivil] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [abreviatura] varchar(2) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_estadocivil] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_EstadosOC] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [sigla] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Est__3214EC077DB37A4E] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_EstadosOC] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_EstadosReq] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [sigla] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Est__3214EC0741C32653] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_EstadosReq] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_gestion_especialista] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [id_especialista] int  NOT NULL,
  [id_especialidad] int  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuarioregistro] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuariomodificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  CONSTRAINT [pk_especialidades_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_gestion_especialista] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de las especialidades y es una tabla importante para la creacion de especialistas y la asignacion de citas'
GO

CREATE TABLE [conf_grupos_culturales] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy2_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_grupos_culturales] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_horarios] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [id_gestion_especialidades] int  NOT NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [created_at] datetime DEFAULT getdate() NOT NULL,
  [usuario_creacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [updated_at] datetime  NULL,
  [usuario_modificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  [hora_inicio] time(7)  NULL,
  [hora_fin] time(7)  NULL,
  [fecha_inicial] date  NULL,
  [fecha_final] date  NULL,
  [tiempo_atencion] time(7)  NULL,
  [cant_pac_dia] int  NULL,
  [id_consultorio] int  NULL,
  CONSTRAINT [pk_especialidades_copy3] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_horarios] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de las especialidades y es una tabla importante para la creacion de especialistas y la asignacion de citas'
GO

CREATE TABLE [conf_ingreso_estados] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy2_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_ingreso_estados] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_maestro_departamentos] (
  [id] int  NOT NULL,
  [codigo] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [descripcion] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  CONSTRAINT [PK__conf_ciu__3213E83F36920A3E_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_maestro_departamentos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_MenuProceso] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NULL,
  [idMenuPadre] int  NOT NULL,
  [activo] tinyint DEFAULT 0 NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Men__3214EC07FE658CA6] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_MenuProceso] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_meses] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [abreviatura] varchar(3) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy1_copy1_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_meses] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Modulos] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NULL,
  [estado] tinyint DEFAULT 0 NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Men__3214EC07604D2E43] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Modulos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_opciones] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [carpeta] varchar(20) COLLATE Modern_Spanish_CI_AS  NULL,
  [ruta] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [permitir] tinyint DEFAULT 0 NULL,
  [idMenuProceso] int  NOT NULL,
  [activo] tinyint DEFAULT 0 NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Men__3214EC07FE658CA6_copy_1] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_opciones] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Permisos] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [idMenuHijo] int  NOT NULL,
  [idRol] int  NOT NULL,
  [priv_crear] varchar(1) COLLATE Modern_Spanish_CI_AS  NULL,
  [priv_ver] varchar(1) COLLATE Modern_Spanish_CI_AS  NULL,
  [priv_actualizar] varchar(1) COLLATE Modern_Spanish_CI_AS  NULL,
  [priv_eliminar] varchar(1) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Per__3214EC072B078550] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Permisos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Productos] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [codigo] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [precio] float(53)  NULL,
  [idCategoria] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Pro__3214EC07D81972CF] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Productos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_programas] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuarioregistro] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuariomodificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  CONSTRAINT [pk_especialidades_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_programas] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_Proveedores] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [razonsocial] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [nit] varchar(20) COLLATE Modern_Spanish_CI_AS  NULL,
  [telefono] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [email] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [fax] varchar(20) COLLATE Modern_Spanish_CI_AS  NULL,
  [idProvincia] int  NOT NULL,
  [nombreRepresentante] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [idTipoPersona] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Pro__3214EC076D327A8D] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Proveedores] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_provincia] (
  [id] int  NOT NULL,
  [codigo] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [descripcion] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [iddepartamento] int  NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  CONSTRAINT [PK__conf_ciu__3213E83F36920A3E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_provincia] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_rolEmpleado] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [sigla] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_rol__3214EC0732392B31] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_rolEmpleado] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_servicios] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(255) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(500) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuarioregistro] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuariomodificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  [cod_cups] varchar(20) COLLATE Modern_Spanish_CI_AS  NULL,
  [cod_cups_interno] varchar(20) COLLATE Modern_Spanish_CI_AS  NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_servicios] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_sexos] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [abreviatura] varchar(2) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_sexos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_tipo_documentos] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [abreviatura] varchar(3) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy1_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_tipo_documentos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_TipoPersona] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(30) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [sigla] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Tip__3214EC07F6A6BA22] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_TipoPersona] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [conf_tipoRequisicion] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_tip__3214EC07DA4A1C0D] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_tipoRequisicion] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [contratos] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [id_cliente] int  NULL,
  [id_lista] int  NULL,
  [porcentaje_aplicado] int  NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy1_copy1_copy1_copy1_copy2] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [contratos] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [emp_Estudios] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [titulo] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Entidad] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [idEmpleado] int  NOT NULL,
  [idCategoria] int  NOT NULL,
  CONSTRAINT [PK__emp_Estu__3214EC07EF25DB17] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [emp_Estudios] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [lista_precio_servicio] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [id_servicio] int  NOT NULL,
  [id_lista] int  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [valor] int  NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy1_copy1_copy1_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [lista_precio_servicio] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [Listas_precio] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  CONSTRAINT [pk_especialidades_copy2_copy2_copy1_copy1_copy1_copy1_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [Listas_precio] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [mae_Sedes] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [direccion] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [telefono] varchar(15) COLLATE Modern_Spanish_CI_AS  NULL,
  [idCiudad] int  NULL,
  [idEmpresa] int  NOT NULL,
  [created_at] datetime  NULL,
  [updated_at] datetime  NULL,
  CONSTRAINT [PK__conf_Sed__3214EC075DE4CC62] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [mae_Sedes] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [maestro_clientes] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [documento] int  NULL,
  [nombre] varchar(25) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [nombre_comercial] varchar(25) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [nombre_reperesentante_legal] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [telefono_representante_legal] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [direccion_contacto] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [telefono_contacto] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [id_ciudad_contacto] int  NULL,
  [id_tipo_documento] int  NOT NULL,
  [direccion_radicacion] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [email_facturacion_electronica] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [email_comercial] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [email_facturacion] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [email_contabilidad] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [email_representante_legal] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuario_creacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuario_modificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  [fecha_facturacion] date  NULL,
  CONSTRAINT [pk_especialidades_copy4_copy1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT [UQ__maestro___A25B3E618EBD2736] UNIQUE NONCLUSTERED ([documento] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [maestro_clientes] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de las especialidades y es una tabla importante para la creacion de especialistas y la asignacion de citas'
GO

CREATE TABLE [maestro_especialista] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombres] varchar(25) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [apellidos] varchar(25) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [id_tipo_documento] int  NOT NULL,
  [direccion] varchar(100) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [email] nvarchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [telefono] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [id_sexo] int  NULL,
  [numerocolegiatura] varchar(10) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [fecha_nacimiento] date  NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [usuario_creacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuario_modificacion] varchar(25) COLLATE Modern_Spanish_CI_AS  NULL,
  [activo] bit DEFAULT 1 NOT NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  [id_ciudad] int  NULL,
  CONSTRAINT [pk_especialidades_copy4] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [maestro_especialista] SET (LOCK_ESCALATION = TABLE)
GO
EXEC sp_addextendedproperty
'MS_Description', N'Tabla parametro que muestra la descripcion de las especialidades y es una tabla importante para la creacion de especialistas y la asignacion de citas'
GO

CREATE TABLE [maestro_pacientes] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [created_at] datetime DEFAULT getdate() NULL,
  [updated_at] datetime  NULL,
  [deleted_at] datetime  NULL,
  [deleted] int  NULL,
  [documento] varchar(100) COLLATE Modern_Spanish_CI_AS  NULL,
  [primer_nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [segundo_nombre] varchar(50) COLLATE Modern_Spanish_CI_AS DEFAULT NULL NULL,
  [primer_apellido] varchar(70) COLLATE Modern_Spanish_CI_AS  NULL,
  [segundo_apellido] varchar(70) COLLATE Modern_Spanish_CI_AS  NULL,
  [fech_nac] date  NULL,
  [id_sexo] int DEFAULT NULL NOT NULL,
  [id_estado_civil] int  NULL,
  [id_discapacidad] int  NULL,
  [id_ciudad_nac] int  NOT NULL,
  [id_ciudad_rec] int  NOT NULL,
  [direccion] varchar(150) COLLATE Modern_Spanish_CI_AS  NULL,
  [telefono] varchar(40) COLLATE Modern_Spanish_CI_AS  NULL,
  [barrio] varchar(1) COLLATE Modern_Spanish_CI_AS  NULL,
  [nivel_educativo] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [ocupacion] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [id_grupo_cultural] int  NULL,
  [atencion_especial] varchar(1) COLLATE Modern_Spanish_CI_AS  NULL,
  [email] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [id_tipo_documento] int  NOT NULL,
  [id_ciudad_exp_docume] int  NOT NULL,
  [usuario_creacion] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [usuario_actualizacion] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  CONSTRAINT [pk_pacientes] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [maestro_pacientes] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [sysdiagrams] (
  [name] sysname  NOT NULL,
  [principal_id] int  NOT NULL,
  [diagram_id] int  IDENTITY(1,1) NOT NULL,
  [version] int  NULL,
  [definition] varbinary(max)  NULL,
  CONSTRAINT [PK__sysdiagr__C2B05B612611E16A] PRIMARY KEY CLUSTERED ([diagram_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED ([principal_id] ASC, [name] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [sysdiagrams] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_cita_cliente] FOREIGN KEY ([id_cliente]) REFERENCES [maestro_clientes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_cita_contratos] FOREIGN KEY ([id_contrato]) REFERENCES [contratos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_cita_consultorio] FOREIGN KEY ([id_gestion_especialista]) REFERENCES [conf_gestion_especialista] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_citas_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [conf_servicios] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_cita_programa] FOREIGN KEY ([id_programa]) REFERENCES [conf_programas] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_cita_estados] FOREIGN KEY ([id_estado_cita]) REFERENCES [conf_cita_estados] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_tipo_cita] FOREIGN KEY ([id_tipo_cita]) REFERENCES [conf_cita_tipos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_citas] ADD CONSTRAINT [fk_cita_paciente] FOREIGN KEY ([id_paciente]) REFERENCES [maestro_pacientes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_ingresos] ADD CONSTRAINT [fk_ingreso_cliente] FOREIGN KEY ([id_cliente]) REFERENCES [maestro_clientes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_ingresos] ADD CONSTRAINT [fk_ingreso_contratos] FOREIGN KEY ([id_contarto]) REFERENCES [contratos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_ingresos] ADD CONSTRAINT [fk_ingresos_programa] FOREIGN KEY ([id_programa]) REFERENCES [conf_programas] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_ingresos] ADD CONSTRAINT [fk_ingreso_estados] FOREIGN KEY ([id_estado]) REFERENCES [conf_ingreso_estados] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_ingresos] ADD CONSTRAINT [fk_ingreso_paciente] FOREIGN KEY ([id_paciente]) REFERENCES [maestro_pacientes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_movimiento_paciente] ADD CONSTRAINT [fk_mov_pac_ingreso] FOREIGN KEY ([id_ingreso]) REFERENCES [adm_ingresos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_movimiento_paciente] ADD CONSTRAINT [fk_mov_pac_cita] FOREIGN KEY ([id_cita]) REFERENCES [adm_citas] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [adm_movimiento_paciente] ADD CONSTRAINT [fk_mov_pac_servicios] FOREIGN KEY ([id_servicio]) REFERENCES [conf_servicios] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_DetalleOrdenCompra] ADD CONSTRAINT [FK_DetOCPro_idProducto] FOREIGN KEY ([idProducto]) REFERENCES [conf_Productos] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_DetalleOrdenCompra] ADD CONSTRAINT [FK_OCDet_idEmpleado] FOREIGN KEY ([idOrden]) REFERENCES [comp_OrdenCompra] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_DetalleRequisicion] ADD CONSTRAINT [FK_DetPro_idProducto] FOREIGN KEY ([idProducto]) REFERENCES [conf_Productos] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_DetalleRequisicion] ADD CONSTRAINT [FK_DetReq_idRequisicion] FOREIGN KEY ([idRequisicion]) REFERENCES [comp_Requisiciones] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_Facturas] ADD CONSTRAINT [FK_FactDet_idEmpleado] FOREIGN KEY ([idOrden]) REFERENCES [comp_OrdenCompra] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_Observaciones] ADD CONSTRAINT [FK_ObsOrd_idOrden] FOREIGN KEY ([idOrden]) REFERENCES [comp_OrdenCompra] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_OrdenCompra] ADD CONSTRAINT [FK_EmplOC_idEmpleado] FOREIGN KEY ([idEmpleado]) REFERENCES [conf_Empleados] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_OrdenCompra] ADD CONSTRAINT [FK_EnvOC_idEnvio] FOREIGN KEY ([idEnvio]) REFERENCES [conf_Envio] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_OrdenCompra] ADD CONSTRAINT [FK_EstOC_idEstado] FOREIGN KEY ([idEstado]) REFERENCES [conf_EstadosOC] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_OrdenCompra] ADD CONSTRAINT [FK_ProvOC_idEstado] FOREIGN KEY ([idProveedor]) REFERENCES [conf_Proveedores] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_OrdenCompra] ADD CONSTRAINT [FK_ReqlOC_idRequisicion] FOREIGN KEY ([idRequisicion]) REFERENCES [comp_Requisiciones] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_Requisiciones] ADD CONSTRAINT [FK_ReqEmpl_idEmpleado] FOREIGN KEY ([idEmpleado]) REFERENCES [conf_Empleados] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_Requisiciones] ADD CONSTRAINT [FK_ReqEst_idEstado] FOREIGN KEY ([idEstado]) REFERENCES [conf_EstadosReq] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_Requisiciones] ADD CONSTRAINT [FK_ReqSed_idSede] FOREIGN KEY ([idSede]) REFERENCES [mae_Sedes] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [comp_Requisiciones] ADD CONSTRAINT [FK_ReqTipoReq_idTipoRequiscion] FOREIGN KEY ([idTipoRequiscion]) REFERENCES [conf_tipoRequisicion] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Bodegas] ADD CONSTRAINT [FK_BodSedes] FOREIGN KEY ([idSede]) REFERENCES [mae_Sedes] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_consultorio] ADD CONSTRAINT [fk_consul_sede] FOREIGN KEY ([is_sede]) REFERENCES [mae_Sedes] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Empleados] ADD CONSTRAINT [fk_empleado_tipodoc] FOREIGN KEY ([idtipoDocumento]) REFERENCES [conf_tipo_documentos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Empleados] ADD CONSTRAINT [fk_empleado_stadocivil] FOREIGN KEY ([idEstadoCivil]) REFERENCES [conf_estadocivil] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Empleados] ADD CONSTRAINT [fk_empleado_sexo] FOREIGN KEY ([id_sexo]) REFERENCES [conf_sexos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Empleados] ADD CONSTRAINT [fk_empleado_idcargo] FOREIGN KEY ([idCargo]) REFERENCES [conf_Cargos] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Empleados] ADD CONSTRAINT [fk_empleado_centrocosto] FOREIGN KEY ([idCentroCosto]) REFERENCES [conf_CentroCostos] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Empleados] ADD CONSTRAINT [fk_empleado_rol] FOREIGN KEY ([idRol]) REFERENCES [conf_rolEmpleado] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Empleados] ADD CONSTRAINT [fk_empleado_provincia] FOREIGN KEY ([CiudadNacimiento]) REFERENCES [conf_provincia] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_gestion_especialista] ADD CONSTRAINT [fk_gestion_especialista] FOREIGN KEY ([id_especialista]) REFERENCES [maestro_especialista] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_gestion_especialista] ADD CONSTRAINT [fk_gestion_especialidades] FOREIGN KEY ([id_especialidad]) REFERENCES [conf_especialidades] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_horarios] ADD CONSTRAINT [fk_horario_consultorio] FOREIGN KEY ([id_consultorio]) REFERENCES [conf_consultorio] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_horarios] ADD CONSTRAINT [fk_horarios_gestios de especialista] FOREIGN KEY ([id_gestion_especialidades]) REFERENCES [conf_gestion_especialista] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_MenuProceso] ADD CONSTRAINT [FK_MenHMenuP_idMenuPadre] FOREIGN KEY ([idMenuPadre]) REFERENCES [conf_Modulos] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_opciones] ADD CONSTRAINT [FK_idProceso_idMenuOpciones] FOREIGN KEY ([idMenuProceso]) REFERENCES [conf_MenuProceso] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Permisos] ADD CONSTRAINT [FK_PrivMenuH_idMenuHijo] FOREIGN KEY ([idMenuHijo]) REFERENCES [conf_MenuProceso] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Permisos] ADD CONSTRAINT [FK_PrivRol_idRol] FOREIGN KEY ([idRol]) REFERENCES [conf_rolEmpleado] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Productos] ADD CONSTRAINT [FK_ProidCategoria] FOREIGN KEY ([idCategoria]) REFERENCES [conf_CategoriaProductos] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Proveedores] ADD CONSTRAINT [FK_ProvePro_idProvincia] FOREIGN KEY ([idProvincia]) REFERENCES [conf_provincia] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_Proveedores] ADD CONSTRAINT [FK_ProveTipo_idTipoPersona] FOREIGN KEY ([idTipoPersona]) REFERENCES [conf_TipoPersona] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [conf_provincia] ADD CONSTRAINT [fk_ciudades_departamentos] FOREIGN KEY ([iddepartamento]) REFERENCES [conf_maestro_departamentos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [contratos] ADD CONSTRAINT [fk_cliente_contrato] FOREIGN KEY ([id_cliente]) REFERENCES [maestro_clientes] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [contratos] ADD CONSTRAINT [fk_contrato_lista] FOREIGN KEY ([id_lista]) REFERENCES [Listas_precio] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [emp_Estudios] ADD CONSTRAINT [fk_estudios_categoriasestudios] FOREIGN KEY ([idCategoria]) REFERENCES [conf_CategoriaEstudios] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [emp_Estudios] ADD CONSTRAINT [fk_estudios_empleado_] FOREIGN KEY ([idEmpleado]) REFERENCES [conf_Empleados] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [lista_precio_servicio] ADD CONSTRAINT [fk_listaprecio_servicio2] FOREIGN KEY ([id_servicio]) REFERENCES [conf_servicios] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [lista_precio_servicio] ADD CONSTRAINT [fk_listaprecio_servicio] FOREIGN KEY ([id_lista]) REFERENCES [Listas_precio] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [mae_Sedes] ADD CONSTRAINT [FK_SedEmpresa_idEmpresa] FOREIGN KEY ([idEmpresa]) REFERENCES [conf_Empresas] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [mae_Sedes] ADD CONSTRAINT [FK_SedCiudad_idprovincia] FOREIGN KEY ([idCiudad]) REFERENCES [conf_provincia] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_clientes] ADD CONSTRAINT [fk_clientes_provincia] FOREIGN KEY ([id_ciudad_contacto]) REFERENCES [conf_provincia] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_especialista] ADD CONSTRAINT [fk_especialista_tipo doc] FOREIGN KEY ([id_tipo_documento]) REFERENCES [conf_tipo_documentos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_especialista] ADD CONSTRAINT [fk_especialista_ciudad] FOREIGN KEY ([id_ciudad]) REFERENCES [conf_provincia] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_especialista] ADD CONSTRAINT [fk_especialista_sexo] FOREIGN KEY ([id_sexo]) REFERENCES [conf_sexos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_pacientes] ADD CONSTRAINT [fk1_paciente_sexo] FOREIGN KEY ([id_sexo]) REFERENCES [conf_sexos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_pacientes] ADD CONSTRAINT [fk2_pacientes_tipodoc] FOREIGN KEY ([id_tipo_documento]) REFERENCES [conf_tipo_documentos] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_pacientes] ADD CONSTRAINT [fk3_paciente_grupocultural] FOREIGN KEY ([id_grupo_cultural]) REFERENCES [conf_grupos_culturales] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_pacientes] ADD CONSTRAINT [fk4_paciente_estadocivil] FOREIGN KEY ([id_estado_civil]) REFERENCES [conf_estadocivil] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_pacientes] ADD CONSTRAINT [fk5_paciente_discapacidad] FOREIGN KEY ([id_discapacidad]) REFERENCES [conf_discapacidades] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [maestro_pacientes] ADD CONSTRAINT [fk6_pacientes_ciudad_nac] FOREIGN KEY ([id_ciudad_nac]) REFERENCES [conf_provincia] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

