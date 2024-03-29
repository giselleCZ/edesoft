
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
/****** Object:  StoredProcedure [dbo].[sp_tblActives_Update]    Script Date: 12/07/2012 23:17:52 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblActives_SelectRow]    Script Date: 12/07/2012 23:17:52 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblActives_SelectAll]    Script Date: 12/07/2012 23:17:52 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblActives_Insert]    Script Date: 12/07/2012 23:17:52 ******/
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
		([sActive_name],[iSubFamily_id],[iProvider_id],[sBarcode],[sBrand],[sModel],[sForm],[sSerialNumber],[sColor],[sCapacity],[sMaterial],[sUnit],[sAsign_type],[sAcquisition_type],[sStatus],[sActive_desc],[dRegister_time],[iUtilTime],[dtBuy_time],[iHeihgt],[iWidth],[iWide],[iDiameter],[iBuy_price],[iDivNumber])
	Values
		(@sActive_name,@iSubFamily_id,@iProvider_id,@sBarcode,@sBrand,@sModel,@sForm,@sSerialNumber,@sColor,@sCapacity,@sMaterial,@sUnit,@sAsign_type,@sAcquisition_type,@sStatus,@sActive_desc,@dRegister_time,@iUtilTime,@dtBuy_time,@iHeihgt, @iWidth, @iWide, @iDiameter, @iBuy_price,@iDivNumber)
	SET @iActive_id =SCOPE_IDENTITY()
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActives_DeleteRow]    Script Date: 12/07/2012 23:17:52 ******/
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
GO
/****** Object:  UserDefinedDataType [dbo].[description]    Script Date: 12/07/2012 23:17:52 ******/
CREATE TYPE [dbo].[description] FROM [varchar](150) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[IntKey]    Script Date: 12/07/2012 23:17:52 ******/
CREATE TYPE [dbo].[IntKey] FROM [smallint] NOT NULL
GO
/****** Object:  Table [dbo].[tblSubFamilies]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubFamilies](
	[iSubFamily_id] [dbo].[IntKey] NOT NULL,
	[sSubFamily_desc] [dbo].[description] NULL,
	[sSubFamily_name] [char](18) NULL,
	[iFamily_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblSubFamilies] PRIMARY KEY CLUSTERED 
(
	[iSubFamily_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubFamilies_SelectRow]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubFamilies_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:55:00 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblSubFamilies table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubFamilies_SelectRow]
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
/****** Object:  StoredProcedure [dbo].[sp_tblSubFamilies_SelectAll]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubFamilies_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:55:00 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblSubFamilies table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubFamilies_SelectAll]
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
/****** Object:  Table [dbo].[tblSubAreas]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubAreas](
	[iSubArea_id] [smallint] IDENTITY(1,1) NOT NULL,
	[sSubArea_name] [varchar](50) NOT NULL,
	[sSubArea_desc] [varchar](150) NULL,
	[bStatus] [bit] NULL,
	[iArea_id] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[iSubArea_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_Update]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubAreas_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:57 p.m.
-- Description:	This stored procedure is intended for updating tblSubAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubAreas_Update]
	@iSubArea_id smallint,
	@sSubArea_name varchar(50),
	@sSubArea_desc varchar(150),
	@bStatus bit,
	@iArea_id smallint
As
Begin
	Update tblSubAreas
	Set
		[sSubArea_name] = @sSubArea_name,
		[sSubArea_desc] = @sSubArea_desc,
		[bStatus] = @bStatus
	Where		
		[iSubArea_id] = @iSubArea_id
		and [iArea_id] = @iArea_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_SelectRow]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_tblSubAreas_SelectRow]
	@iSubArea_id int
	
As
Begin
	Select 
		[iSubArea_id],
		[sSubArea_name],
		[sSubArea_desc],
		[bStatus],
		[iArea_id]
	From tblSubAreas
	Where
		[iSubArea_id] = @iSubArea_id
		
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_SelectAll]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubAreas_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:57 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblSubAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubAreas_SelectAll]
As
Begin
	Select 
		[iSubArea_id],
		[sSubArea_name],
		[sSubArea_desc],
		[bStatus],
		[iArea_id]
	From tblSubAreas
End
GO
/****** Object:  Table [dbo].[tblLocations]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_Update]    Script Date: 12/07/2012 23:17:52 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_SelectRow]    Script Date: 12/07/2012 23:17:52 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_SelectAll]    Script Date: 12/07/2012 23:17:52 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_Insert]    Script Date: 12/07/2012 23:17:52 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_DeleteRow]    Script Date: 12/07/2012 23:17:52 ******/
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
GO
/****** Object:  UserDefinedDataType [dbo].[name]    Script Date: 12/07/2012 23:17:52 ******/
CREATE TYPE [dbo].[name] FROM [varchar](50) NOT NULL
GO
/****** Object:  Table [dbo].[tblFamilies]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFamilies](
	[iFamily_id] [dbo].[IntKey] NOT NULL,
	[sFamily_desc] [dbo].[description] NULL,
	[sFamily_name] [dbo].[name] NOT NULL,
	[iDepreciation_time] [int] NULL,
 CONSTRAINT [XPKtblFamilies] PRIMARY KEY CLUSTERED 
(
	[iFamily_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblFamilies_SelectRow]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[sp_tblFamilies_SelectAll]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblFamilies_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:19 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblFamilies table
-- ==========================================================================================
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
/****** Object:  Table [dbo].[tblestado]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblestado](
	[estado_id] [int] NULL,
	[estado] [varchar](12) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProviders]    Script Date: 12/07/2012 23:17:52 ******/
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAreas]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAreas](
	[iArea_id] [dbo].[IntKey] NOT NULL,
	[sArea_desc] [dbo].[description] NULL,
	[sArea_name] [dbo].[name] NOT NULL,
 CONSTRAINT [XPKtblAreas] PRIMARY KEY CLUSTERED 
(
	[iArea_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_Update]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_Update
-- Author:	Giselle N Choque
-- Create date:	06/12/2012 10:38:56 p.m.
-- Description:	This stored procedure is intended for updating tblProviders table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProviders_Update]
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
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectRow]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_SelectRow
-- Author:	Giselle N Choque
-- Create date:	06/12/2012 10:38:55 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblProviders table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProviders_SelectRow]
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
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectAll]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_SelectAll
-- Author:	Giselle N Choque
-- Create date:	06/12/2012 10:38:55 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblProviders table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProviders_SelectAll]
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
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_Insert]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_Insert
-- Author:	Giselle N Choque
-- Create date:	06/12/2012 10:38:56 p.m.
-- Description:	This stored procedure is intended for inserting values to tblProviders table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblProviders_Insert]
	@iProvider_id smallint OUTPUT,
	@sProvider_name varchar(50) = NULL,
	@sProvider_rs char(18),
	@sProvider_phone varchar(15),
	@sProvider_email varchar(50),
	@sProvider_desc varchar(150) = NULL,
	@sProvider_address varchar(30) = NULL
As
Begin
	Insert Into tblProviders
		([sProvider_name],[sProvider_rs],[sProvider_phone],[sProvider_email],[sProvider_desc],[sProvider_address])
	Values
		(@sProvider_name,@sProvider_rs,@sProvider_phone,@sProvider_email,@sProvider_desc,@sProvider_address)

	SET @iProvider_id = SCOPE_IDENTITY()	

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_DeleteRow]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	06/12/2012 10:38:56 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblProviders table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProviders_DeleteRow]
	@iProvider_id smallint
As
Begin
	Delete tblProviders
	Where
		[iProvider_id] = @iProvider_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblestado_SelectRow]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[sp_tblestado_SelectAll]    Script Date: 12/07/2012 23:17:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_tblestado_SelectAll]
As
Begin
	Select 
		[estado_id],
		[estado]
		
	From tblestado
End
GO
/****** Object:  ForeignKey [fk_iProvider_id]    Script Date: 12/07/2012 23:17:49 ******/
ALTER TABLE [dbo].[tblActives]  WITH CHECK ADD  CONSTRAINT [fk_iProvider_id] FOREIGN KEY([iProvider_id])
REFERENCES [dbo].[tblProviders] ([iProvider_id])
GO
ALTER TABLE [dbo].[tblActives] CHECK CONSTRAINT [fk_iProvider_id]
GO
/****** Object:  ForeignKey [fk_iSubFamily_id]    Script Date: 12/07/2012 23:17:49 ******/
ALTER TABLE [dbo].[tblActives]  WITH CHECK ADD  CONSTRAINT [fk_iSubFamily_id] FOREIGN KEY([iSubFamily_id])
REFERENCES [dbo].[tblSubFamilies] ([iSubFamily_id])
GO
ALTER TABLE [dbo].[tblActives] CHECK CONSTRAINT [fk_iSubFamily_id]
GO
/****** Object:  ForeignKey [R_16]    Script Date: 12/07/2012 23:17:52 ******/
ALTER TABLE [dbo].[tblSubFamilies]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([iFamily_id])
REFERENCES [dbo].[tblFamilies] ([iFamily_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSubFamilies] CHECK CONSTRAINT [R_16]
GO
/****** Object:  ForeignKey [R_4]    Script Date: 12/07/2012 23:17:52 ******/
ALTER TABLE [dbo].[tblSubAreas]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([iArea_id])
REFERENCES [dbo].[tblAreas] ([iArea_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSubAreas] CHECK CONSTRAINT [R_4]
GO
/****** Object:  ForeignKey [FK_subarea]    Script Date: 12/07/2012 23:17:52 ******/
ALTER TABLE [dbo].[tblLocations]  WITH CHECK ADD  CONSTRAINT [FK_subarea] FOREIGN KEY([iSubArea_id])
REFERENCES [dbo].[tblSubAreas] ([iSubArea_id])
GO
ALTER TABLE [dbo].[tblLocations] CHECK CONSTRAINT [FK_subarea]
GO

  insert into tblestado(estado_id,estado) values(0,'Habilitad')
  insert into tblestado(estado_id,estado) values(1,'Deshabilitad')
  
  