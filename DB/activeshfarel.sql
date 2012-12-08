USE [dbActives]

GO
/****** Object:  UserDefinedDataType [dbo].[sex]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[sex] FROM [char](10) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[phone]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[phone] FROM [varchar](15) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[name]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[name] FROM [varchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[iStatus]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[iStatus] FROM [smallint] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[IntKey]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[IntKey] FROM [smallint] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[fla]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[fla] FROM [int] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[description]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[description] FROM [varchar](150) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[dateNormal]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[dateNormal] FROM [datetime] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[address]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[address] FROM [varchar](30) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[state]    Script Date: 11/13/2012 23:28:10 ******/
CREATE TYPE [dbo].[state] FROM [char](20) NULL
GO
-- /******************* FAMILIES ******************************/

CREATE TABLE [dbo].[tblFamilies](
	[iFamily_id] [dbo].[IntKey] IDENTITY(1,1) NOT NULL,
	[sFamily_desc] [dbo].[description] NULL,
	[sFamily_name] [dbo].[name] UNIQUE NOT NULL,
	[iDepreciation_time] [int] NULL,
 CONSTRAINT [XPKtblFamilies] PRIMARY KEY CLUSTERED 
(
	[iFamily_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblFamilies] ON
INSERT [dbo].[tblFamilies] ([iFamily_id], [sFamily_desc], [sFamily_name], [iDepreciation_time]) VALUES (1, N'Familia de bienes inmuebles de la institucion', N'Edificio', 480)
SET IDENTITY_INSERT [dbo].[tblFamilies] OFF

go
Create Procedure [dbo].[sp_tblFamilies_Update]
	@iFamily_id smallint,
	@sFamily_desc varchar(150),
	@sFamily_name varchar(50),
	@iDepreciation_time int
As
Begin
	Update tblFamilies
	Set
		[sFamily_desc] = @sFamily_desc,
		[sFamily_name] = @sFamily_name,
		[iDepreciation_time] = @iDepreciation_time
	Where		
		[iFamily_id] = @iFamily_id

End

GO
Create Procedure [dbo].[sp_tblFamilies_SelectAll]
As
Begin
	Select 
		[iFamily_id],
		[sFamily_desc],
		[sFamily_name],
		[iDepreciation_time]
	From tblFamilies
End
GO

Create Procedure [dbo].[sp_tblFamilies_SelectRow]
	@iFamily_id smallint
As
Begin
	Select 
		[iFamily_id],
		[sFamily_desc],
		[sFamily_name],
		[iDepreciation_time]
	From tblFamilies
	Where
		[iFamily_id] = @iFamily_id
End
GO

Create Procedure [dbo].[sp_tblFamilies_Insert]
	@id smallint out,
	@sFamily_desc varchar(150) = NULL,
	@sFamily_name varchar(50),
	@iDepreciation_time int = NULL
As
Begin
	Insert Into tblFamilies
		([sFamily_desc],[sFamily_name],[iDepreciation_time])
	Values
		(@sFamily_desc,@sFamily_name,@iDepreciation_time)
		SET @id= SCOPE_IDENTITY()
End
GO

Create Procedure [dbo].[sp_tblFamilies_DeleteRow]
	@iFamily_id smallint
As
Begin
	Delete tblFamilies
	Where
		[iFamily_id] = @iFamily_id

End
GO

-- /******************* Sub Families ******************************/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubFamilies](
	[iSubFamily_id] [dbo].[IntKey] IDENTITY(1,1) NOT NULL,
	[sSubFamily_desc] [dbo].[description] NULL,
	[sSubFamily_name] [varchar](50) UNIQUE NULL,
	[iFamily_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblSubFamilies] PRIMARY KEY CLUSTERED 
(
	[iSubFamily_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubFamilies] ON
INSERT [dbo].[tblSubFamilies] ([iSubFamily_id], [sSubFamily_desc], [sSubFamily_name], [iFamily_id]) VALUES (1, N'', N'Escritorio de Madera', 1)
INSERT [dbo].[tblSubFamilies] ([iSubFamily_id], [sSubFamily_desc], [sSubFamily_name], [iFamily_id]) VALUES (2, N'', N'Escritorio de Metalico', 1)
SET IDENTITY_INSERT [dbo].[tblSubFamilies] OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_tblSubFamilies_DeleteRow]
	@iSubFamily_id smallint
As
Begin
	Delete tblSubFamilies
	Where
		[iSubFamily_id] = @iSubFamily_id

End

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_tblSubFamilies_Insert]
	@sSubFamily_desc varchar(150) = NULL,
	@sSubFamily_name varchar(50) = NULL,
	@iFamily_id smallint,
	@id smallint output
As
Begin
	Insert Into tblSubFamilies
		([sSubFamily_desc],[sSubFamily_name],[iFamily_id])
	Values
		(@sSubFamily_desc,@sSubFamily_name,@iFamily_id)
		set @id=scope_identity()
End


GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_tblSubFamilies_SelectAll]
As
Begin
	Select 
		[iSubFamily_id],
		[sSubFamily_desc],
		[sSubFamily_name],
		[iFamily_id]
	From tblSubFamilies
End

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_tblSubFamilies_SelectByName]
@sSubFamily_name varchar(50)
As
Begin
	Select 
		[iSubFamily_id],
		[sSubFamily_desc],
		[sSubFamily_name],
		[iFamily_id]
	From tblSubFamilies
	where [sSubFamily_name] like '%@sSubFamily_name%'
End

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_tblSubFamilies_SelectRow]
	@iSubFamily_id smallint
As
Begin
	Select 
		[iSubFamily_id],
		[sSubFamily_desc],
		[sSubFamily_name],
		[iFamily_id]
	From tblSubFamilies
	Where
		[iSubFamily_id] = @iSubFamily_id
End


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_tblSubFamilies_Update]
	@iSubFamily_id smallint,
	@sSubFamily_desc varchar(150),
	@sSubFamily_name varchar(50),
	@iFamily_id smallint
As
Begin
	Update tblSubFamilies
	Set
		[sSubFamily_desc] = @sSubFamily_desc,
		[sSubFamily_name] = @sSubFamily_name,
		[iFamily_id] = @iFamily_id
	Where		
		[iSubFamily_id] = @iSubFamily_id

End
GO

-- /******************* ROLS ******************************/
CREATE TABLE [dbo].[tblRols](
	[iRol_id] [dbo].[IntKey] IDENTITY(1,1) NOT NULL,
	[sRol_name] [dbo].[name] UNIQUE NOT NULL,
	[bStatus] [dbo].[fla] NULL,
 CONSTRAINT [XPKtblRols] PRIMARY KEY CLUSTERED 
(
	[iRol_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblRols] ON
INSERT [dbo].[tblRols] ([iRol_id], [sRol_name], [bStatus]) VALUES (1, N'Gerente', 1)
INSERT [dbo].[tblRols] ([iRol_id], [sRol_name], [bStatus]) VALUES (2, N'Contabilidad', 1)
INSERT [dbo].[tblRols] ([iRol_id], [sRol_name], [bStatus]) VALUES (3, N'Administrador', 1)
INSERT [dbo].[tblRols] ([iRol_id], [sRol_name], [bStatus]) VALUES (4, N'RRHH', 1)
SET IDENTITY_INSERT [dbo].[tblRols] OFF

go
CREATE Procedure [dbo].[sp_tblRols_Insert]
	@sRol_name varchar(50),
	@sStatus int = 0,
	@id int output
As
Begin
	Insert Into tblRols
		([sRol_name],[bStatus])
	Values
		(@sRol_name,0)
		SET @id= SCOPE_IDENTITY()
End
GO

create Procedure [dbo].[sp_tblRols_Update]
	@iRol_id smallint,
	@sRol_name varchar(50),
	@bStatus fla = null
As
Begin
	Update tblRols
	Set
		[sRol_name] = @sRol_name,
		[bStatus] = @bStatus
	Where		
		[iRol_id] = @iRol_id

End
GO

Create Procedure [dbo].[sp_tblRols_SelectAll]
As
Begin
	Select 
		[iRol_id],
		[sRol_name],
		[bStatus]
	From tblRols
End
GO

Create Procedure [dbo].[sp_tblRols_SelectRow]
	@iRol_id smallint
As
Begin
	Select 
		[iRol_id],
		[sRol_name],
		[bStatus]
	From tblRols
	Where
		[iRol_id] = @iRol_id
End
GO

Create Procedure [dbo].[sp_tblRols_DeleteRow]
	@iRol_id smallint
As
Begin
	Delete tblRols
	Where
		[iRol_id] = @iRol_id and
		[iRol_id]>4

End
GO

-- /******************* RESPONSIBLES ******************************/

GO
CREATE TABLE [dbo].[tblResponsibles](
	[iPerson_id] [dbo].[IntKey] IDENTITY(1,1) NOT NULL,
	[sPerson_name] [dbo].[name] NOT NULL,
	[sPerson_lname] [dbo].[name] NOT NULL,
	[sPerson_dni] [dbo].[name] NOT NULL UNIQUE,
	[sPerson_phone] [dbo].[phone] NULL,
	[sPerson_email] [varchar](50) NULL,
	[sUsername] [varchar](20) NOT NULL,
	[sPassword] [varchar](50) NULL,
	[iRol_id] [dbo].[IntKey] NOT NULL,
	[dtStart_time] [dbo].[dateNormal] NULL,
	[dtEnd_time] [dbo].[dateNormal] NULL,
	[sStatus] [dbo].[fla] NULL,
 CONSTRAINT [XPKtblResponsibles] PRIMARY KEY CLUSTERED 
(
	[iPerson_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tblResponsibles] ON
INSERT [dbo].[tblResponsibles] ([iPerson_id], [sPerson_name], [sPerson_lname], [sPerson_dni], [sPerson_phone], [sPerson_email], [sUsername], [sPassword], [iRol_id], [dtStart_time], [dtEnd_time], [sStatus]) VALUES (1, N'henrry Nelson', N'farel', N'588', N'', N'', N'hfarel', N'', 1, CAST(0x0000A0E600000000 AS DateTime), CAST(0x0000A12D00000000 AS DateTime), 0)
INSERT [dbo].[tblResponsibles] ([iPerson_id], [sPerson_name], [sPerson_lname], [sPerson_dni], [sPerson_phone], [sPerson_email], [sUsername], [sPassword], [iRol_id], [dtStart_time], [dtEnd_time], [sStatus]) VALUES (2, N'Nelson', N'farel', N'344', N'346', N'nfarel@hotmail.com', N'nfarel', N'1234', 1, CAST(0x0000A0FB00000000 AS DateTime), CAST(0x0000A29A00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblResponsibles] OFF
GO

CREATE Procedure [dbo].[sp_tblResponsibles_Insert]
	@sPerson_name varchar(50),
	@sPerson_lname varchar(50),
	@sPerson_dni varchar(50),
	@sPerson_phone varchar(15) = NULL,
	@sPerson_email varchar(50) = NULL,
	@sUsername varchar(20) = NULL,
	@sPassword varchar(50) = NULL,
	@iRol_id smallint,
	@dtStart_time datetime = NULL,
	@dtEnd_time datetime = NULL,
	@sStatus fla= NULL,
	@id smallint out
As
Begin
	Insert Into tblResponsibles
		([sPerson_name],[sPerson_lname],[sPerson_dni],[sPerson_phone],[sPerson_email],[sUsername],[sPassword],[iRol_id],[dtStart_time],[dtEnd_time],[sStatus])
	Values
		(@sPerson_name,@sPerson_lname,@sPerson_dni,@sPerson_phone,@sPerson_email,@sUsername,@sPassword,@iRol_id,@dtStart_time,@dtEnd_time,@sStatus)
		SET @id= SCOPE_IDENTITY()

End
GO

CREATE Procedure [dbo].[sp_tblResponsibles_SelectAll]
As
Begin
	Select 
		[iPerson_id],
		[sPerson_name],
		[sPerson_lname],
		[sPerson_dni],
		[sPerson_phone],
		[sPerson_email],
		[sUsername],
		[sPassword],
		[iRol_id],
		[dtStart_time],
		[dtEnd_time],
		[sStatus]
	From tblResponsibles
	where 
	[sStatus]=0
End
GO

CREATE Procedure [dbo].[sp_tblResponsibles_SelectRow]
	@iPerson_id smallint
As
Begin
	Select 
		[iPerson_id],
		[sPerson_name],
		[sPerson_lname],
		[sPerson_dni],
		[sPerson_phone],
		[sPerson_email],
		[sUsername],
		[sPassword],
		[iRol_id],
		[dtStart_time],
		[dtEnd_time],
		[sStatus]
	From tblResponsibles
	Where
		[iPerson_id] = @iPerson_id and
		[sStatus]=0
End
GO

CREATE Procedure [dbo].[sp_tblResponsibles_SelectByName]
	@sPerson_name varchar(20)
As
Begin
	Select 
		[iPerson_id],
		[sPerson_name],
		[sPerson_lname],
		[sPerson_dni],
		[sPerson_phone],
		[sPerson_email],
		[sUsername],
		[sPassword],
		[iRol_id],
		[dtStart_time],
		[dtEnd_time]
	From tblResponsibles
	Where
		[sPerson_name] like '%@sPerson_name%' and
		[sStatus]=0
End
GO

CREATE Procedure [dbo].[sp_tblResponsibles_SelectByLName]
	@sPerson_lname varchar(20)
As
Begin
	Select 
		[iPerson_id],
		[sPerson_name],
		[sPerson_lname],
		[sPerson_dni],
		[sPerson_phone],
		[sPerson_email],
		[sUsername],
		[sPassword],
		[iRol_id],
		[dtStart_time],
		[dtEnd_time]
	From tblResponsibles
	Where
		[sPerson_lname] like '%@sPerson_lname%' and
		[sStatus]=0
End
GO

CREATE Procedure [dbo].[sp_tblResponsibles_Update]
	@iPerson_id smallint,
	@sPerson_name varchar(50),
	@sPerson_lname varchar(50),
	@sPerson_dni varchar(50),
	@sPerson_phone varchar(15),
	@sPerson_email varchar(50),
	@sUsername varchar(20),
	@sPassword varchar(50),
	@iRol_id smallint,
	@dtStart_time datetime,
	@dtEnd_time datetime,
	@sStatus fla= NULL
As
Begin
	Update tblResponsibles
	Set
		[sPerson_name] = @sPerson_name,
		[sPerson_lname] = @sPerson_lname,
		[sPerson_dni] = @sPerson_dni,
		[sPerson_phone] = @sPerson_phone,
		[sPerson_email] = @sPerson_email,
		[sUsername] = @sUsername,
		[sPassword] = @sPassword,
		[iRol_id] = @iRol_id,
		[dtStart_time] = @dtStart_time,
		[dtEnd_time] = @dtEnd_time,
		[sStatus] = @sStatus
	Where		
		[iPerson_id] = @iPerson_id

End
GO

CREATE Procedure [dbo].[sp_tblResponsibles_DeleteRow]
	@iPerson_id smallint
As
Begin
	Update tblResponsibles
	Set 
	[sStatus] = '1'
	Where
		[iPerson_id] = @iPerson_id

End
GO


CREATE TABLE [dbo].[tblActives](
	[iActive_id] [smallint] IDENTITY(1,1) NOT NULL,
	[sActive_name] [varchar](50) NOT NULL,
	[iSubFamily_id] [smallint] NOT NULL,
	[iProvider_id] [smallint] NOT NULL,
	[sBarcode] [varchar](50) NULL,
	[sBrand] [varchar](50) NULL,
	[sModel] [varchar](50) NULL,
	[sForm] [varchar](50) NULL,
	[sSerialNumber] [varchar](50) NULL,
	[sColor] [varchar](50) NULL,
	[sCapacity] [varchar](50) NULL,
	[sMaterial] [varchar](50) NULL,
	[sUnit] [varchar](30) NULL,
	[sAcquisition_type] [varchar](50) NULL,
	[sStatus] [bit] NULL,
	[sActive_desc] [varchar](100) NULL,
	[dRegister_time] [datetime] NULL,
	[iUtilTime] [datetime] NULL,
	[dtBuy_time] [datetime] NULL,
	[iHeihgt] [decimal](5, 2) NULL,
	[iWidth] [decimal](5, 2) NULL,
	[iWide] [decimal](5, 2) NULL,
	[iDiameter] [decimal](5, 2) NULL,
	[iBuy_price] [decimal](8, 2) NULL,
	[iDivNumber] [smallint] NULL,
	[sAsign_type] [varchar](20) NULL,
 CONSTRAINT [pk_iActive_id] PRIMARY KEY CLUSTERED 
(
	[iActive_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActives_Update]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActives_Update
-- Author:	Giselle N Choque
-- Create date:	28/11/2012 11:03:50 a.m.
-- Description:	This stored procedure is intended for updating tblActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblActives_Update]
	@iActive_id smallint,
	@sActive_name varchar(50),
	@iSubFamily_id smallint,
	@iProvider_id smallint,
	@sBarcode varchar(50),
	@sBrand varchar(50),
	@sModel varchar(50),
	@sForm varchar(50),
	@sSerialNumber varchar(50),
	@sColor varchar(50),
	@sCapacity varchar(50),
	@sMaterial varchar(50),
	@sUnit varchar(30),
	@sAsign_type varchar(20),
	@sAcquisition_type varchar(50),
	@sStatus bit,
	@sActive_desc varchar(100),
	@dRegister_time datetime,
	@iUtilTime datetime,
	@dtBuy_time datetime,
	@iHeihgt numeric(5,2),
	@iWidth numeric(5,2),
	@iWide numeric(5,2),
	@iDiameter numeric(5,2),
	@iBuy_price numeric(8,2),
	@iDivNumber smallint
As
Begin
	Update tblActives
	Set
		[sActive_name] = @sActive_name,
		[iSubFamily_id] = @iSubFamily_id,
		[iProvider_id] = @iProvider_id,
		[sBarcode] = @sBarcode,
		[sBrand] = @sBrand,
		[sModel] = @sModel,
		[sForm] = @sForm,
		[sSerialNumber] = @sSerialNumber,
		[sColor] = @sColor,
		[sCapacity] = @sCapacity,
		[sMaterial] = @sMaterial,
		[sUnit] = @sUnit,
		[sAsign_type] = @sAsign_type,
		[sAcquisition_type] = @sAcquisition_type,
		[sStatus] = @sStatus,
		[sActive_desc] = @sActive_desc,
		[dRegister_time] = @dRegister_time,
		[iUtilTime] = @iUtilTime,
		[dtBuy_time] = @dtBuy_time,
		[iHeihgt] = @iHeihgt,
		[iWidth] = @iWidth,
		[iWide] = @iWide,
		[iDiameter] = @iDiameter,
		[iBuy_price] = @iBuy_price,
		[iDivNumber] = @iDivNumber
	Where		
		[iActive_id] = @iActive_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActives_SelectRow]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActives_SelectRow
-- Author:	Giselle N Choque
-- Create date:	28/11/2012 11:03:50 a.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblActives_SelectRow]
	@iActive_id smallint
As
Begin
	Select 
		[iActive_id],
		[sActive_name],
		[iSubFamily_id],
		[iProvider_id],
		[sBarcode],
		[sBrand],
		[sModel],
		[sForm],
		[sSerialNumber],
		[sColor],
		[sCapacity],
		[sMaterial],
		[sUnit],
		[sAsign_type],
		[sAcquisition_type],
		[sStatus],
		[sActive_desc],
		[dRegister_time],
		[iUtilTime],
		[dtBuy_time],
		[iHeihgt],
		[iWidth],
		[iWide],
		[iDiameter],
		[iBuy_price],
		[iDivNumber]
	From tblActives
	Where
		[iActive_id] = @iActive_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActives_SelectAll]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActives_SelectAll
-- Author:	Giselle N Choque
-- Create date:	28/11/2012 11:03:50 a.m.
-- Description:	This stored procedure is intended for selecting all rows from tblActives table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblActives_SelectAll]
As
Begin
	Select 
		[iActive_id],
		[sActive_name],
		[iSubFamily_id],
		[iProvider_id],
		[sBarcode],
		[sBrand],
		[sModel],
		[sForm],
		[sSerialNumber],
		[sColor],
		[sCapacity],
		[sMaterial],
		[sUnit],
		[sAsign_type],
		[sAcquisition_type],
		[sStatus],
		[sActive_desc],
		[dRegister_time],
		[iUtilTime],
		[dtBuy_time],
		[iHeihgt],
		[iWidth],
		[iWide],
		[iDiameter],
		[iBuy_price],
		[iDivNumber]
	From tblActives
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActives_Insert]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_tblActives_Insert]
@iActive_id int OUTPUT,
	@sActive_name varchar(50),
	@iSubFamily_id smallint,
	@iProvider_id smallint,
	@sBarcode varchar(50) = NULL,
	@sBrand varchar(50) = NULL,
	@sModel varchar(50) = NULL,
	@sForm varchar(50) = NULL,
	@sSerialNumber varchar(50) = NULL,
	@sColor varchar(50) = NULL,
	@sCapacity varchar(50) = NULL,
	@sMaterial varchar(50) = NULL,
	@sUnit varchar(30) = NULL,
	@sAsign_type varchar(20),
	@sAcquisition_type varchar(50) = NULL,
	@sStatus bit = NULL,
	@sActive_desc varchar(100) = NULL,
	@dRegister_time datetime = NULL,
	@iUtilTime datetime = NULL,
	@dtBuy_time datetime = NULL,
	@iHeihgt decimal(5,2) = NULL,
	@iWidth decimal(5,2) = NULL,
    @iWide decimal(5,2) = NULL,
    @iDiameter decimal(5,2) = NULL,
    @iBuy_price decimal(8,2) = NULL,
    @iDivNumber decimal(5,2) = NULL

As
Begin
	Insert Into tblActives
		([sActive_name],[iSubFamily_id],[iProvider_id],[sBarcode],[sBrand],[sModel],[sForm],[sSerialNumber],[sColor],[sCapacity],[sMaterial],[sUnit],
[sAsign_type],[sAcquisition_type],[sStatus],[sActive_desc],[dRegister_time],[iUtilTime],[dtBuy_time],[iHeihgt],[iWidth],[iWide],[iDiameter],[iBuy_price],
[iDivNumber])
	Values
		
(@sActive_name,@iSubFamily_id,@iProvider_id,@sBarcode,@sBrand,@sModel,@sForm,@sSerialNumber,@sColor,@sCapacity,@sMaterial,@sUnit,@sAsign_type,@sAcquisition_type
,@sStatus,@sActive_desc,@dRegister_time,@iUtilTime,@dtBuy_time,@iHeihgt, @iWidth, @iWide, @iDiameter, @iBuy_price,@iDivNumber)
	SET @iActive_id =SCOPE_IDENTITY()
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActives_DeleteRow]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActives_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	28/11/2012 11:03:50 a.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblActives_DeleteRow]
	@iActive_id smallint
As
Begin
	Delete tblActives
	Where
		[iActive_id] = @iActive_id

End


/*****LOCATIONS**/

CREATE TABLE [dbo].[tblLocations](
	[iLocation_id] [smallint] IDENTITY(1,1) NOT NULL,
	[sLocation_name] [varchar](50) NULL,
	[sLocation_desc] [varchar](150) NOT NULL,
	[sStatus] [bit] NOT NULL,
	[iSubArea_id] [smallint] NULL,
 CONSTRAINT [PK_tblLocations] PRIMARY KEY CLUSTERED 
(
	[iLocation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_Update]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_tblLocations_Update]
	@iLocation_id int,
	@sLocation_name varchar(50),
	@sLocation_desc varchar(150),
	@sStatus bit,
	@iSubArea_id smallint
As
Begin
	Update tblLocations
	Set
		[sLocation_name] = @sLocation_name,
		[sLocation_desc] = @sLocation_desc,
		[sStatus] = @sStatus,
		[iSubArea_id] = @iSubArea_id
	Where		
		[iLocation_id] = @iLocation_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_subareaSelectall]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_tblLocations_subareaSelectall]
As
Begin
	Select 
		lo.[iLocation_id],
		lo.[sLocation_name],
		lo.[sLocation_desc],
		lo.[sStatus],
		sa.sSubArea_name	
	From [dbActives].[dbo].[tblLocations] lo, [dbActives].[dbo].[tblSubAreas] sa
	where lo.iSubArea_id=sa.iSubArea_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_SelectRow]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_tblLocations_SelectRow]
	@iLocation_id smallint
As
Begin
	Select 
		[iLocation_id],
		[sLocation_name],
		[sLocation_desc],
		[sStatus],
		[iSubArea_id]
	From tblLocations
	Where
		[iLocation_id] = @iLocation_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_SelectAll]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_tblLocations_SelectAll]
As
Begin
	Select 
		l.iLocation_id,
		l.sLocation_name,
		l.sLocation_desc,
		l.sStatus,
		l.iSubArea_id,
		s.sSubArea_name
	
	From tblLocations l, tblSubAreas s
	where s.iSubArea_id=l.iSubArea_id
	
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_Insert]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_tblLocations_Insert]
	@iLocation_id int OUTPUT,
	@sLocation_name varchar(50) = NULL,
	@sLocation_desc varchar(150) = NULL,
	@sStatus bit =  NULL,
	@iSubArea_id smallint = NULL
As
Begin
	Insert Into tblLocations
		([sLocation_name],[sLocation_desc],[sStatus],[iSubArea_id])
	Values
		(@sLocation_name,@sLocation_desc,@sStatus,@iSubArea_id)


	SET @iLocation_id = SCOPE_IDENTITY()	


End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_DeleteRow]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblLocations_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:30 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblLocations table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblLocations_DeleteRow]
	@iLocation_id smallint
As
Begin
	Delete tblLocations
	Where
		[iLocation_id] = @iLocation_id

End

/****PROVEEDORES*****/


CREATE TABLE [dbo].[tblestado](
	[estado_id] [int] NULL,
	[estado] [varchar](15) NULL
) ON [PRIMARY]

CREATE Procedure [dbo].[sp_tblestado_SelectRow]
	@estado_id int
	
As
Begin
	Select 
		[estado_id]
      ,[estado]
	From tblestado
	Where
		[estado_id] = @estado_id
		
End

Create Procedure [dbo].[sp_tblestado_SelectAll]
As
Begin
	Select 
		[estado_id],
		[estado]
		
	From tblestado
End

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProviders]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProviders](
	[iProvider_id] [smallint] IDENTITY(1,1) NOT NULL,
	[sProvider_name] [varchar](50) NULL,
	[sProvider_rs] [char](18) NOT NULL,
	[sProvider_phone] [varchar](15) NOT NULL,
	[sProvider_email] [varchar](50) NOT NULL,
	[sProvider_desc] [varchar](150) NULL,
	[sProvider_address] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[iProvider_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE Procedure [dbo].[sp_tblProviders_Update]
	@iProvider_id smallint,
	@sProvider_name varchar(50),
	@sProvider_rs char(18),
	@sProvider_phone varchar(15),
	@sProvider_email varchar(50),
	@sProvider_desc varchar(150),
	@sProvider_address varchar(30)
As
Begin
	Update tblProviders
	Set
		[sProvider_name] = @sProvider_name,
		[sProvider_rs] = @sProvider_rs,
		[sProvider_phone] = @sProvider_phone,
		[sProvider_email] = @sProvider_email,
		[sProvider_desc] = @sProvider_desc,
		[sProvider_address] = @sProvider_address
	Where		
		[iProvider_id] = @iProvider_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectRow]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:44 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblProviders table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblProviders_SelectRow]
	@iProvider_id smallint
As
Begin
	Select 
		[iProvider_id],
		[sProvider_name],
		[sProvider_rs],
		[sProvider_phone],
		[sProvider_email],
		[sProvider_desc],
		[sProvider_address]
	From tblProviders
	Where
		[iProvider_id] = @iProvider_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectAll]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:44 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblProviders table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblProviders_SelectAll]
As
Begin
	Select 
		[iProvider_id],
		[sProvider_name],
		[sProvider_rs],
		[sProvider_phone],
		[sProvider_email],
		[sProvider_desc],
		[sProvider_address]
	From tblProviders
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_Insert]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:44 p.m.
-- Description:	This stored procedure is intended for inserting values to tblProviders table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblProviders_Insert]
	@iProvider_id int OUTPUT,
	@sProvider_name varchar(50),
	@sProvider_rs char(18) = NULL,
	@sProvider_phone varchar(15) = NULL,
	@sProvider_email varchar(50) = NULL,
	@sProvider_desc varchar(150) = NULL,
	@sProvider_address varchar(30)
As
Begin
	Insert Into tblProviders	
		([sProvider_name],
		[sProvider_rs],
		[sProvider_phone],
		[sProvider_email],
		[sProvider_desc],
		[sProvider_address])
	Values
		(@sProvider_name,
		 @sProvider_rs,
		 @sProvider_phone,
		 @sProvider_email,
		 @sProvider_desc,
		 @sProvider_address)
	
	SET @iProvider_id = SCOPE_IDENTITY()

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_DeleteRow]    Script Date: 12/05/2012 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:44 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblProviders table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblProviders_DeleteRow]
	@iProvider_id smallint
As
Begin
	Delete tblProviders
	Where
		[iProvider_id] = @iProvider_id

End
/**************



  insert into tblestado(estado_id,estado) values(0,'Habilitad')
  insert into tblestado(estado_id,estado) values(1,'Deshabilitad')

/****PROVEEDORES*****/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[sp_tblResponsibles_SelectByUsername]
	@sUsername varchar(20)
As
Begin
	Select 
		[iPerson_id],
		[sPerson_name],
		[sPerson_lname],
		[sPerson_dni],
		[sPerson_phone],
		[sPerson_email],
		[sUsername],
		[sPassword],
		[iRol_id],
		[dtStart_time],
		[dtEnd_time]
	From tblResponsibles
	Where
		[sUsername] LIKE @sUsername
End
