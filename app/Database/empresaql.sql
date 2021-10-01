CREATE TABLE [conf_Empresas] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(20) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [nit] numeric(11)  NULL,
  [digito_verificacion] numeric(1)  NULL,
  [tipo sociedad] varchar(6) COLLATE Modern_Spanish_CI_AS  NULL,
  [tipo_plan_cuentas] varchar(65) COLLATE Modern_Spanish_CI_AS  NULL,
  [direccion] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [ciudad] varchar(60) COLLATE Modern_Spanish_CI_AS  NULL,
  [departamento] varchar(60) COLLATE Modern_Spanish_CI_AS  NULL,
  [pais] varchar(75) COLLATE Modern_Spanish_CI_AS  NULL,
  [telefono] numeric(11)  NULL,
  [celular] varchar(13) COLLATE Modern_Spanish_CI_AS  NULL,
  [representante_legal] varchar(75) COLLATE Modern_Spanish_CI_AS  NULL,
  [firma_representante] varchar(255) COLLATE Modern_Spanish_CI_AS  NULL,
  [created_at] datetime2(0) DEFAULT getdate() NULL,
  [updated_at] datetime2(0)  NULL,
  CONSTRAINT [PK__conf_Emp__3214EC07DD5C5894] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [conf_Empresas] SET (LOCK_ESCALATION = TABLE)
GO

CREATE TABLE [sysdiagrams] (
  [name] sysname  NOT NULL,
  [principal_id] int  NOT NULL,
  [diagram_id] int  IDENTITY(1,1) NOT NULL,
  [version] int  NULL,
  [definition] varbinary(max)  NULL,
  CONSTRAINT [PK__sysdiagr__C2B05B611B8F86C5] PRIMARY KEY CLUSTERED ([diagram_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED ([principal_id] ASC, [name] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [sysdiagrams] SET (LOCK_ESCALATION = TABLE)
GO

