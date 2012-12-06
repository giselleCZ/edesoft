USE [Activos]
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


CREATE TABLE [dbo].[tblestado](
	[estado_id] [int] NULL,
	[estado] [varchar](15) NULL
) ON [PRIMARY]

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
	[iActive_id] ASC)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


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




Create Procedure [dbo].[sp_tblestado_SelectAll]
As
Begin
	Select 
		[estado_id],
		[estado]
		
	From tblestado
End





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


  insert into tblestado(estado_id,estado) values(0,'Habilitad')
  insert into tblestado(estado_id,estado) values(1,'Deshabilitad')