-- =============================================
-- Autor:		Diego Zalles - Oliver Menacho
-- Fecha:		06/08/2012
-- Descripción:	Base de datos VIPCENTER
-- Versión:		1.0.0
-- =============================================

PRINT 'INICIANDO CREACION DE LA BASE DE DATOS: VIPCENTER'

USE master;
GO

--IF EXISTS(SELECT name FROM sys.databases WHERE name = 'VIPCENTER')
--	DROP DATABASE VIPCENTER
--GO

IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'VIPCENTER')
	CREATE DATABASE VIPCENTER;
GO

USE VIPCENTER
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'vip')
	Exec('CREATE SCHEMA vip')
GO

PRINT 'BASE DE DATOS CREADA'

PRINT 'INICIANDO CREACION DE TABLAS'

IF EXISTS(SELECT name FROM VIPCENTER..sysobjects WHERE name = N'Empresa' AND xtype='U')
	DROP TABLE [vip].[Empresa]
GO
	
CREATE TABLE [vip].[Empresa]
(
	id int identity(1,1) NOT NULL, 
	nombre varchar(100) NOT NULL,
	descripcion varchar(250),  
	nombrePersonaContacto varchar(100) NOT NULL,
	telefono varchar(10), 
	correo varchar(150) NOT NULL,
	direccion varchar(250) NOT NULL, 
	--  Fecha en la cual se comenzó a trabajar con la empresa
	fechaRegistro datetime, 
	/*  Indica si la empresa está activa o inactiva
		* 1 si está activa
		* 0 si no no está activa
	*/
	estado bit NOT NULL,
	-- INFORMACION DE LOGS
	usuarioId uniqueidentifier NOT NULL, 
	fecha datetime NOT NULL DEFAULT GETdate(), 
	CONSTRAINT fk_Empresa_Usuario FOREIGN KEY (usuarioId) REFERENCES [DBO].[aspnet_Users](UserId),
	CONSTRAINT un_Empresa_Nombre UNIQUE (nombre), 	
	CONSTRAINT pk_Empresa PRIMARY KEY (id)	
)

IF EXISTS(SELECT name FROM VIPCENTER..sysobjects WHERE name = N'Cliente' AND xtype='U')
	DROP TABLE [vip].[Cliente]
	
CREATE TABLE [vip].[Cliente] 
(
	-- Código del cliente secuencial
	id int identity(1,1) NOT NULL, 
	nombre varchar(50) NOT NULL, 
	apellidos varchar(100) NOT NULL, 
	direccion varchar(250) NOT NULL, 
	telefono varchar(10) NOT NULL, 
	celular varchar(10), 
	ci varchar(15), 
	correo varchar(150) NOT NULL, 
	ocupacion varchar(150), 
	lugarTrabajo varchar(250), 
	telefonoTrabajo varchar(10), 
	correoTrabajo varchar(150), 
	fechaNacimiento datetime NOT NULL,
	genero char(1) NOT NULL, 
	estadoCivil char(1) NOT NULL, 
	/*  Almacena si el cliente tiene hijos
		* 1 si tiene hijos 
		* 0 si no tiene hijos
	*/
	tieneHijos bit NOT NULL, 
	numeroHijos int NOT NULL, 
	fechaIngreso datetime NOT NULL, 
	/* Validar si el número de cliente se utilizará
		* Posible uso para correlación con su sistema contable o registro manual
	*/ 
	numeroCliente int NOT NULL, 
	-- Estado del cliente
	estado char(1) NOT NULL, 
	/* Indica si el cliente desea recibir notificaciones por correo
		* a Significa Activo		
		* v Significa Vencido: Los vencidos son los que su pago vencio más de 1 día
		* i Significa Inactivo: Son los clientes que se registraron dados de baja
	*/	
	recibirNotificaciones bit NOT NULL, 
	/* Indica si el cliente viene por alguna empresa
		* Si no tiene empresa este campo tiene valor NULO
	*/
	empresaId int, 
	-- INFORMACION DE LOGS
	usuarioId uniqueidentifier NOT NULL, 
	fecha datetime NOT NULL DEFAULT GETdate(), 
	CONSTRAINT fk_Cliente_Usuario FOREIGN KEY (usuarioId) REFERENCES [DBO].[aspnet_Users](UserId),
	CONSTRAINT ck_Cliente_Genero CHECK (genero IN ('m','f')), 
	CONSTRAINT ck_Cliente_EstadoCivil CHECK (estadoCivil IN ('s','c','d','v')), 
	CONSTRAINT ck_Cliente_NroHijos CHECK (numeroHijos >= 0), 	
	CONSTRAINT ck_Cliente_Estado CHECK (estado IN ('a','i','v')),
	CONSTRAINT pk_Cliente PRIMARY KEY (id), 
	CONSTRAINT fk_Cliente_Empresa FOREIGN KEY (empresaId) REFERENCES [VIP].[Empresa](id)
)

IF EXISTS(SELECT name FROM VIPCENTER..sysobjects WHERE name = N'Unidad' AND xtype='U')
	DROP TABLE [vip].[Unidad]
	
CREATE TABLE [vip].[Unidad]
(
	id int identity(1,1) NOT NULL, 
	nombre varchar(100) NOT NULL,
	estado bit NOT NULL,
	CONSTRAINT un_Unidad_Nombre UNIQUE (nombre), 
	CONSTRAINT pk_Unidad PRIMARY KEY (id)
)


PRINT 'FIN CREACION DE TABLAS'
/* 4. CONFIGURACION DE USUARIOS */

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'vip')
	CREATE LOGIN [vip] WITH PASSWORD = 'vip'
GO

CREATE USER [vip] FOR LOGIN [vip] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT CONNECT TO [vip]
GO

EXEC sp_addrolemember N'db_datareader', N'vip'
GO
EXEC sp_addrolemember N'db_datawriter', N'vip'
GO

GRANT EXECUTE ON SCHEMA:: DBO TO [vip]
GO 

GRANT EXECUTE ON SCHEMA:: VIP TO [vip]
GO

ALTER AUTHORIZATION ON DATABASE::VIPCENTER TO [sa];
GO

USE [VIPCENTER]
GO

BEGIN TRANSACTION

/* 2. CARGA DE DATOS BASE */

-- UNIDAD
INSERT INTO VIP.Unidad (nombre, estado) values('Mes',1)
INSERT INTO VIP.Unidad (nombre, estado) values('Semana',1)
INSERT INTO VIP.Unidad (nombre, estado) values('Sesión',1)

-- TIPO PAQUETE
SET IDENTITY_INSERT VIP.TipoPaquete ON
GO
INSERT INTO VIP.TipoPaquete (id, nombre, limiteServicios, estado) values(1,'Pase libre',NULL ,1)
INSERT INTO VIP.TipoPaquete (id, nombre, limiteServicios, estado) values(2,'1 Disciplina',1 ,1)
SET IDENTITY_INSERT VIP.TipoPaquete OFF
GO

COMMIT

USE VIPCENTER
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [SEC].[Privileges_TraerXRolName]
    
	@rolName		nvarchar(256)

	AS

	BEGIN
	SELECT p.id, p.nombre, p.descripcion  
	
		FROM [SEC].[RolesInPrivileges] rp 
		JOIN [SEC].[Privileges] p ON rp.privilegeId = p.id
	
		WHERE rp.roleName = @rolName;

END
GO


CREATE PROCEDURE [SEC].[Privileges_TraerXRolPrivilege]
    
	@rolName		varchar(256),  
    
	@privilegeName	varchar(100)
	
AS

	BEGIN
	
		SELECT p.id, p.nombre, p.descripcion  
	
		FROM [SEC].[RolesInPrivileges] rp 
		JOIN [SEC].[Privileges] p ON rp.privilegeId = p.id 
	
		WHERE p.nombre = @privilegeName  
	
		AND rp.RoleName = @rolName;

END

GO


CREATE PROCEDURE [SEC].[Privileges_TraerTodos]

AS

BEGIN
	
	SELECT p.id, p.nombre, p.descripcion  
	
	FROM [SEC].[Privileges] p;

	END

GO



CREATE PROCEDURE [SEC].[RolesInPrivileges_Insertar]
	
	@id int OUTPUT,
	
	@roleName nvarchar(256),
 
	@privilegeId	int 

AS

BEGIN
	INSERT INTO [SEC].[RolesInPrivileges](roleName, privilegeId) 
	
	VALUES (@roleName, @privilegeId)
	
	SET @Id = SCOPE_IDENTITY() 

END
GO


CREATE PROCEDURE [SEC].[RolesInPrivileges_EliminarXRolName]
	
	@roleName			nvarchar(256)

AS

BEGIN
	
	DECLARE @number int 	
	
	SET @number =(SELECT count(*)
		      FROM [SEC].[RolesInPrivileges] rp 

		      WHERE rp.roleName = @roleName
)

	
		      DELETE FROM [SEC].[RolesInPrivileges]
	
			     WHERE roleName = @roleName
	
		      RETURN @number

END
GO



CREATE PROCEDURE [vip].[Empresa_Insertar]
	
	@id				int OUTPUT,
	
	@nombre	varchar(100),
	@descripcion	varchar(250),
	@nombrePersonaContacto	varchar(100),
	@telefono	varchar(10),
	@correo	varchar(150),
	@direccion	varchar(250),
	@fechaRegistro	datetime,
	@estado	bit,
	@usuarioId	uniqueidentifier,
	@fecha	datetime

AS
BEGIN
	INSERT INTO [vip].[Empresa](nombre, descripcion, nombrePersonaContacto, telefono, correo, direccion, fechaRegistro, estado, usuarioId, fecha) 
	
VALUES (@nombre, @descripcion, @nombrePersonaContacto, @telefono, @correo, @direccion, @fechaRegistro, @estado, @usuarioId, @fecha) 
	SET @Id = SCOPE_IDENTITY() 
END
GO
