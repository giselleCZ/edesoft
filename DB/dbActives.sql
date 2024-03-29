USE [master]
GO
/****** Object:  Database [dbActives]    Script Date: 10/13/2012 07:10:44 ******/
CREATE DATABASE [dbActives] ON  PRIMARY 
( NAME = N'dbActives', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\dbActives.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbActives_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\dbActives.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbActives] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbActives].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbActives] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [dbActives] SET ANSI_NULLS OFF
GO
ALTER DATABASE [dbActives] SET ANSI_PADDING OFF
GO
ALTER DATABASE [dbActives] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [dbActives] SET ARITHABORT OFF
GO
ALTER DATABASE [dbActives] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [dbActives] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [dbActives] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [dbActives] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [dbActives] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [dbActives] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [dbActives] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [dbActives] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [dbActives] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [dbActives] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [dbActives] SET  DISABLE_BROKER
GO
ALTER DATABASE [dbActives] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [dbActives] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [dbActives] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [dbActives] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [dbActives] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [dbActives] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [dbActives] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [dbActives] SET  READ_WRITE
GO
ALTER DATABASE [dbActives] SET RECOVERY SIMPLE
GO
ALTER DATABASE [dbActives] SET  MULTI_USER
GO
ALTER DATABASE [dbActives] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [dbActives] SET DB_CHAINING OFF
GO
USE [dbActives]
GO
/****** Object:  UserDefinedDataType [dbo].[sex]    Script Date: 10/13/2012 07:10:44 ******/
CREATE TYPE [dbo].[sex] FROM [char](10) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[description]    Script Date: 10/13/2012 07:10:44 ******/
CREATE TYPE [dbo].[description] FROM [varchar](150) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[IntKey]    Script Date: 10/13/2012 07:10:44 ******/
CREATE TYPE [dbo].[IntKey] FROM [smallint] NOT NULL
GO
/****** Object:  Table [dbo].[tblSubFamilies]    Script Date: 10/13/2012 07:10:46 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblSubFamilies_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubFamilies_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:55:00 p.m.
-- Description:	This stored procedure is intended for updating tblSubFamilies table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubFamilies_Update]
	@iSubFamily_id smallint,
	@sSubFamily_desc varchar(150),
	@sSubFamily_name char(18),
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
/****** Object:  StoredProcedure [dbo].[sp_tblSubFamilies_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblSubFamilies_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblSubFamilies_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubFamilies_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:55:00 p.m.
-- Description:	This stored procedure is intended for inserting values to tblSubFamilies table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubFamilies_Insert]
	@iSubFamily_id smallint,
	@sSubFamily_desc varchar(150) = NULL,
	@sSubFamily_name char(18) = NULL,
	@iFamily_id smallint
As
Begin
	Insert Into tblSubFamilies
		([iSubFamily_id],[sSubFamily_desc],[sSubFamily_name],[iFamily_id])
	Values
		(@iSubFamily_id,@sSubFamily_desc,@sSubFamily_name,@iFamily_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubFamilies_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubFamilies_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:55:00 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblSubFamilies table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubFamilies_DeleteRow]
	@iSubFamily_id smallint
As
Begin
	Delete tblSubFamilies
	Where
		[iSubFamily_id] = @iSubFamily_id

End
GO
/****** Object:  UserDefinedDataType [dbo].[fla]    Script Date: 10/13/2012 07:10:57 ******/
CREATE TYPE [dbo].[fla] FROM [bit] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[name]    Script Date: 10/13/2012 07:10:57 ******/
CREATE TYPE [dbo].[name] FROM [varchar](50) NOT NULL
GO
/****** Object:  Table [dbo].[tblSubAreas]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubAreas](
	[iSubArea_id] [dbo].[IntKey] NOT NULL,
	[sSubArea_name] [dbo].[name] NOT NULL,
	[sSubArea_desc] [dbo].[description] NULL,
	[bStatus] [dbo].[fla] NULL,
	[iArea_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblSubAreas] PRIMARY KEY CLUSTERED 
(
	[iSubArea_id] ASC,
	[iArea_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_Update]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubAreas_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:57 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblSubAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubAreas_SelectRow]
	@iSubArea_id smallint,
	@iArea_id smallint
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
		and [iArea_id] = @iArea_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubAreas_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:57 p.m.
-- Description:	This stored procedure is intended for inserting values to tblSubAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubAreas_Insert]
	@iSubArea_id smallint,
	@sSubArea_name varchar(50),
	@sSubArea_desc varchar(150) = NULL,
	@bStatus bit = NULL,
	@iArea_id smallint
As
Begin
	Insert Into tblSubAreas
		([iSubArea_id],[sSubArea_name],[sSubArea_desc],[bStatus],[iArea_id])
	Values
		(@iSubArea_id,@sSubArea_name,@sSubArea_desc,@bStatus,@iArea_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblSubAreas_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblSubAreas_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:57 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblSubAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblSubAreas_DeleteRow]
	@iSubArea_id smallint,
	@iArea_id smallint
As
Begin
	Delete tblSubAreas
	Where
		[iSubArea_id] = @iSubArea_id
		and [iArea_id] = @iArea_id

End
GO
/****** Object:  Table [dbo].[tblRols]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRols](
	[iRol_id] [dbo].[IntKey] NOT NULL,
	[sRol_name] [dbo].[name] NOT NULL,
	[bStatus] [dbo].[fla] NULL,
 CONSTRAINT [XPKtblRols] PRIMARY KEY CLUSTERED 
(
	[iRol_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRols_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRols_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:54 p.m.
-- Description:	This stored procedure is intended for updating tblRols table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRols_Update]
	@iRol_id smallint,
	@sRol_name varchar(50),
	@bStatus bit
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
/****** Object:  StoredProcedure [dbo].[sp_tblRols_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRols_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:54 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblRols table
-- ==========================================================================================
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
/****** Object:  StoredProcedure [dbo].[sp_tblRols_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRols_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:54 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblRols table
-- ==========================================================================================
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
/****** Object:  StoredProcedure [dbo].[sp_tblRols_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRols_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:54 p.m.
-- Description:	This stored procedure is intended for inserting values to tblRols table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRols_Insert]
	@iRol_id smallint,
	@sRol_name varchar(50),
	@bStatus bit = NULL
As
Begin
	Insert Into tblRols
		([iRol_id],[sRol_name],[bStatus])
	Values
		(@iRol_id,@sRol_name,@bStatus)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRols_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRols_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:54 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblRols table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRols_DeleteRow]
	@iRol_id smallint
As
Begin
	Delete tblRols
	Where
		[iRol_id] = @iRol_id

End
GO
/****** Object:  UserDefinedDataType [dbo].[dateNormal]    Script Date: 10/13/2012 07:10:57 ******/
CREATE TYPE [dbo].[dateNormal] FROM [datetime] NULL
GO
/****** Object:  UserDefinedDataType [dbo].[state]    Script Date: 10/13/2012 07:10:57 ******/
CREATE TYPE [dbo].[state] FROM [char](20) NULL
GO
/****** Object:  Table [dbo].[tblRevalues]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRevalues](
	[sRevalue_desc] [dbo].[description] NULL,
	[iRevalue_id] [dbo].[IntKey] NOT NULL,
	[dtRevalue_time] [dbo].[dateNormal] NULL,
	[sUsername] [dbo].[name] NOT NULL,
	[iRevalue_price] [float] NOT NULL,
	[sStatus] [dbo].[state] NULL,
	[iActive_id] [smallint] NOT NULL,
 CONSTRAINT [XPKtblRevalues] PRIMARY KEY CLUSTERED 
(
	[iRevalue_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRevalues_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRevalues_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:52 p.m.
-- Description:	This stored procedure is intended for updating tblRevalues table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRevalues_Update]
	@sRevalue_desc varchar(150),
	@iRevalue_id smallint,
	@dtRevalue_time datetime,
	@sUsername varchar(50),
	@iRevalue_price float,
	@sStatus char(20),
	@iActive_id smallint
As
Begin
	Update tblRevalues
	Set
		[sRevalue_desc] = @sRevalue_desc,
		[dtRevalue_time] = @dtRevalue_time,
		[sUsername] = @sUsername,
		[iRevalue_price] = @iRevalue_price,
		[sStatus] = @sStatus,
		[iActive_id] = @iActive_id
	Where		
		[iRevalue_id] = @iRevalue_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRevalues_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRevalues_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:52 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblRevalues table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRevalues_SelectRow]
	@iRevalue_id smallint
As
Begin
	Select 
		[sRevalue_desc],
		[iRevalue_id],
		[dtRevalue_time],
		[sUsername],
		[iRevalue_price],
		[sStatus],
		[iActive_id]
	From tblRevalues
	Where
		[iRevalue_id] = @iRevalue_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRevalues_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRevalues_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:52 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblRevalues table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRevalues_SelectAll]
As
Begin
	Select 
		[sRevalue_desc],
		[iRevalue_id],
		[dtRevalue_time],
		[sUsername],
		[iRevalue_price],
		[sStatus],
		[iActive_id]
	From tblRevalues
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRevalues_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRevalues_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:52 p.m.
-- Description:	This stored procedure is intended for inserting values to tblRevalues table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRevalues_Insert]
	@sRevalue_desc varchar(150) = NULL,
	@iRevalue_id smallint,
	@dtRevalue_time datetime = NULL,
	@sUsername varchar(50),
	@iRevalue_price float,
	@sStatus char(20) = NULL,
	@iActive_id smallint
As
Begin
	Insert Into tblRevalues
		([sRevalue_desc],[iRevalue_id],[dtRevalue_time],[sUsername],[iRevalue_price],[sStatus],[iActive_id])
	Values
		(@sRevalue_desc,@iRevalue_id,@dtRevalue_time,@sUsername,@iRevalue_price,@sStatus,@iActive_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblRevalues_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblRevalues_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:52 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblRevalues table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblRevalues_DeleteRow]
	@iRevalue_id smallint
As
Begin
	Delete tblRevalues
	Where
		[iRevalue_id] = @iRevalue_id

End
GO
/****** Object:  UserDefinedDataType [dbo].[phone]    Script Date: 10/13/2012 07:10:57 ******/
CREATE TYPE [dbo].[phone] FROM [varchar](15) NULL
GO
/****** Object:  Table [dbo].[tblResponsibles]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblResponsibles](
	[iPerson_id] [dbo].[IntKey] NOT NULL,
	[sPerson_name] [dbo].[name] NOT NULL,
	[sPerson_lname] [dbo].[name] NOT NULL,
	[sPerson_dni] [dbo].[name] NOT NULL,
	[sPerson_phone] [dbo].[phone] NULL,
	[sPerson_email] [varchar](50) NULL,
	[sUsername] [varchar](20) NULL,
	[sPassword] [varchar](50) NULL,
	[iRol_id] [dbo].[IntKey] NOT NULL,
	[dtStart_time] [dbo].[dateNormal] NULL,
	[dtEnd_time] [dbo].[dateNormal] NULL,
 CONSTRAINT [XPKtblResponsibles] PRIMARY KEY CLUSTERED 
(
	[iPerson_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblResponsibles_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblResponsibles_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:49 p.m.
-- Description:	This stored procedure is intended for updating tblResponsibles table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblResponsibles_Update]
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
	@dtEnd_time datetime
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
		[dtEnd_time] = @dtEnd_time
	Where		
		[iPerson_id] = @iPerson_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblResponsibles_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblResponsibles_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:49 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblResponsibles table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblResponsibles_SelectRow]
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
		[dtEnd_time]
	From tblResponsibles
	Where
		[iPerson_id] = @iPerson_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblResponsibles_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblResponsibles_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:49 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblResponsibles table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblResponsibles_SelectAll]
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
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblResponsibles_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblResponsibles_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:49 p.m.
-- Description:	This stored procedure is intended for inserting values to tblResponsibles table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblResponsibles_Insert]
	@iPerson_id smallint,
	@sPerson_name varchar(50),
	@sPerson_lname varchar(50),
	@sPerson_dni varchar(50),
	@sPerson_phone varchar(15) = NULL,
	@sPerson_email varchar(50) = NULL,
	@sUsername varchar(20) = NULL,
	@sPassword varchar(50) = NULL,
	@iRol_id smallint,
	@dtStart_time datetime = NULL,
	@dtEnd_time datetime = NULL
As
Begin
	Insert Into tblResponsibles
		([iPerson_id],[sPerson_name],[sPerson_lname],[sPerson_dni],[sPerson_phone],[sPerson_email],[sUsername],[sPassword],[iRol_id],[dtStart_time],[dtEnd_time])
	Values
		(@iPerson_id,@sPerson_name,@sPerson_lname,@sPerson_dni,@sPerson_phone,@sPerson_email,@sUsername,@sPassword,@iRol_id,@dtStart_time,@dtEnd_time)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblResponsibles_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblResponsibles_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:49 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblResponsibles table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblResponsibles_DeleteRow]
	@iPerson_id smallint
As
Begin
	Delete tblResponsibles
	Where
		[iPerson_id] = @iPerson_id

End
GO
/****** Object:  Table [dbo].[tblProvidersType]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProvidersType](
	[iProviderType_id] [dbo].[IntKey] NOT NULL,
	[sProvider_type] [dbo].[name] NOT NULL,
 CONSTRAINT [XPKtblProvidersType] PRIMARY KEY CLUSTERED 
(
	[iProviderType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProvidersType_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProvidersType_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:46 p.m.
-- Description:	This stored procedure is intended for updating tblProvidersType table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProvidersType_Update]
	@iProviderType_id smallint,
	@sProvider_type varchar(50)
As
Begin
	Update tblProvidersType
	Set
		[sProvider_type] = @sProvider_type
	Where		
		[iProviderType_id] = @iProviderType_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProvidersType_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProvidersType_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:46 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblProvidersType table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProvidersType_SelectRow]
	@iProviderType_id smallint
As
Begin
	Select 
		[iProviderType_id],
		[sProvider_type]
	From tblProvidersType
	Where
		[iProviderType_id] = @iProviderType_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProvidersType_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProvidersType_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:46 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblProvidersType table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProvidersType_SelectAll]
As
Begin
	Select 
		[iProviderType_id],
		[sProvider_type]
	From tblProvidersType
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProvidersType_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProvidersType_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:46 p.m.
-- Description:	This stored procedure is intended for inserting values to tblProvidersType table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProvidersType_Insert]
	@iProviderType_id smallint,
	@sProvider_type varchar(50)
As
Begin
	Insert Into tblProvidersType
		([iProviderType_id],[sProvider_type])
	Values
		(@iProviderType_id,@sProvider_type)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProvidersType_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProvidersType_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:46 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblProvidersType table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProvidersType_DeleteRow]
	@iProviderType_id smallint
As
Begin
	Delete tblProvidersType
	Where
		[iProviderType_id] = @iProviderType_id

End
GO
/****** Object:  UserDefinedDataType [dbo].[address]    Script Date: 10/13/2012 07:10:57 ******/
CREATE TYPE [dbo].[address] FROM [varchar](30) NULL
GO
/****** Object:  Table [dbo].[tblProviders]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProviders](
	[iProvider_id] [dbo].[IntKey] NOT NULL,
	[sProvider_name] [dbo].[name] NOT NULL,
	[sProvider_lname] [dbo].[name] NOT NULL,
	[sProvider_rs] [char](18) NULL,
	[sProvider_phone] [dbo].[phone] NULL,
	[sProvider_email] [varchar](50) NULL,
	[sProvider_desc] [dbo].[description] NULL,
	[sProvider_address] [dbo].[address] NULL,
	[iProviderType_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblProviders] PRIMARY KEY CLUSTERED 
(
	[iProvider_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblProviders_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:44 p.m.
-- Description:	This stored procedure is intended for updating tblProviders table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblProviders_Update]
	@iProvider_id smallint,
	@sProvider_name varchar(50),
	@sProvider_lname varchar(50),
	@sProvider_rs char(18),
	@sProvider_phone varchar(15),
	@sProvider_email varchar(50),
	@sProvider_desc varchar(150),
	@sProvider_address varchar(30),
	@iProviderType_id smallint
As
Begin
	Update tblProviders
	Set
		[sProvider_name] = @sProvider_name,
		[sProvider_lname] = @sProvider_lname,
		[sProvider_rs] = @sProvider_rs,
		[sProvider_phone] = @sProvider_phone,
		[sProvider_email] = @sProvider_email,
		[sProvider_desc] = @sProvider_desc,
		[sProvider_address] = @sProvider_address,
		[iProviderType_id] = @iProviderType_id
	Where		
		[iProvider_id] = @iProvider_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
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
Create Procedure [dbo].[sp_tblProviders_SelectRow]
	@iProvider_id smallint
As
Begin
	Select 
		[iProvider_id],
		[sProvider_name],
		[sProvider_lname],
		[sProvider_rs],
		[sProvider_phone],
		[sProvider_email],
		[sProvider_desc],
		[sProvider_address],
		[iProviderType_id]
	From tblProviders
	Where
		[iProvider_id] = @iProvider_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
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
Create Procedure [dbo].[sp_tblProviders_SelectAll]
As
Begin
	Select 
		[iProvider_id],
		[sProvider_name],
		[sProvider_lname],
		[sProvider_rs],
		[sProvider_phone],
		[sProvider_email],
		[sProvider_desc],
		[sProvider_address],
		[iProviderType_id]
	From tblProviders
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_Insert]    Script Date: 10/13/2012 07:10:57 ******/
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
Create Procedure [dbo].[sp_tblProviders_Insert]
	@iProvider_id smallint,
	@sProvider_name varchar(50),
	@sProvider_lname varchar(50),
	@sProvider_rs char(18) = NULL,
	@sProvider_phone varchar(15) = NULL,
	@sProvider_email varchar(50) = NULL,
	@sProvider_desc varchar(150) = NULL,
	@sProvider_address varchar(30) = NULL,
	@iProviderType_id smallint
As
Begin
	Insert Into tblProviders
		([iProvider_id],[sProvider_name],[sProvider_lname],[sProvider_rs],[sProvider_phone],[sProvider_email],[sProvider_desc],[sProvider_address],[iProviderType_id])
	Values
		(@iProvider_id,@sProvider_name,@sProvider_lname,@sProvider_rs,@sProvider_phone,@sProvider_email,@sProvider_desc,@sProvider_address,@iProviderType_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
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
Create Procedure [dbo].[sp_tblProviders_DeleteRow]
	@iProvider_id smallint
As
Begin
	Delete tblProviders
	Where
		[iProvider_id] = @iProvider_id

End
GO
/****** Object:  UserDefinedDataType [dbo].[iStatus]    Script Date: 10/13/2012 07:10:57 ******/
CREATE TYPE [dbo].[iStatus] FROM [smallint] NULL
GO
/****** Object:  Table [dbo].[tblPrograms]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPrograms](
	[iProgram_id] [dbo].[IntKey] NOT NULL,
	[sProgram_desc] [dbo].[description] NULL,
	[sProgram_name] [dbo].[name] NOT NULL,
	[iStatus] [dbo].[iStatus] NULL,
 CONSTRAINT [XPKtblPrograms] PRIMARY KEY CLUSTERED 
(
	[iProgram_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrograms_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrograms_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:41 p.m.
-- Description:	This stored procedure is intended for updating tblPrograms table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrograms_Update]
	@iProgram_id smallint,
	@sProgram_desc varchar(150),
	@sProgram_name varchar(50),
	@iStatus smallint
As
Begin
	Update tblPrograms
	Set
		[sProgram_desc] = @sProgram_desc,
		[sProgram_name] = @sProgram_name,
		[iStatus] = @iStatus
	Where		
		[iProgram_id] = @iProgram_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrograms_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrograms_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:41 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblPrograms table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrograms_SelectRow]
	@iProgram_id smallint
As
Begin
	Select 
		[iProgram_id],
		[sProgram_desc],
		[sProgram_name],
		[iStatus]
	From tblPrograms
	Where
		[iProgram_id] = @iProgram_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrograms_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrograms_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:41 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblPrograms table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrograms_SelectAll]
As
Begin
	Select 
		[iProgram_id],
		[sProgram_desc],
		[sProgram_name],
		[iStatus]
	From tblPrograms
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrograms_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrograms_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:41 p.m.
-- Description:	This stored procedure is intended for inserting values to tblPrograms table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrograms_Insert]
	@iProgram_id smallint,
	@sProgram_desc varchar(150) = NULL,
	@sProgram_name varchar(50),
	@iStatus smallint = NULL
As
Begin
	Insert Into tblPrograms
		([iProgram_id],[sProgram_desc],[sProgram_name],[iStatus])
	Values
		(@iProgram_id,@sProgram_desc,@sProgram_name,@iStatus)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrograms_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrograms_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:41 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblPrograms table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrograms_DeleteRow]
	@iProgram_id smallint
As
Begin
	Delete tblPrograms
	Where
		[iProgram_id] = @iProgram_id

End
GO
/****** Object:  Table [dbo].[tblPrivileges]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrivileges](
	[iProgram_id] [dbo].[IntKey] NOT NULL,
	[bStatus] [dbo].[fla] NULL,
	[iRol_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblPrivileges] PRIMARY KEY CLUSTERED 
(
	[iProgram_id] ASC,
	[iRol_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrivileges_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrivileges_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:38 p.m.
-- Description:	This stored procedure is intended for updating tblPrivileges table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrivileges_Update]
	@iProgram_id smallint,
	@bStatus bit,
	@iRol_id smallint
As
Begin
	Update tblPrivileges
	Set
		[bStatus] = @bStatus
	Where		
		[iProgram_id] = @iProgram_id
		and [iRol_id] = @iRol_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrivileges_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrivileges_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:38 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblPrivileges table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrivileges_SelectRow]
	@iProgram_id smallint,
	@iRol_id smallint
As
Begin
	Select 
		[iProgram_id],
		[bStatus],
		[iRol_id]
	From tblPrivileges
	Where
		[iProgram_id] = @iProgram_id
		and [iRol_id] = @iRol_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrivileges_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrivileges_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:38 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblPrivileges table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrivileges_SelectAll]
As
Begin
	Select 
		[iProgram_id],
		[bStatus],
		[iRol_id]
	From tblPrivileges
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrivileges_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrivileges_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:38 p.m.
-- Description:	This stored procedure is intended for inserting values to tblPrivileges table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrivileges_Insert]
	@iProgram_id smallint,
	@bStatus bit = NULL,
	@iRol_id smallint
As
Begin
	Insert Into tblPrivileges
		([iProgram_id],[bStatus],[iRol_id])
	Values
		(@iProgram_id,@bStatus,@iRol_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPrivileges_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPrivileges_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:38 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblPrivileges table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPrivileges_DeleteRow]
	@iProgram_id smallint,
	@iRol_id smallint
As
Begin
	Delete tblPrivileges
	Where
		[iProgram_id] = @iProgram_id
		and [iRol_id] = @iRol_id

End
GO
/****** Object:  Table [dbo].[tblPoints]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPoints](
	[iPoint_id] [dbo].[IntKey] NOT NULL,
	[sPoint_code] [varchar](20) NULL,
	[sPoint_desc] [dbo].[description] NULL,
	[bStatus] [dbo].[fla] NULL,
	[sPoint_name] [dbo].[name] NOT NULL,
	[iLocation_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblPoints] PRIMARY KEY CLUSTERED 
(
	[iPoint_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPoints_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPoints_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:36 p.m.
-- Description:	This stored procedure is intended for updating tblPoints table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPoints_Update]
	@iPoint_id smallint,
	@sPoint_code varchar(20),
	@sPoint_desc varchar(150),
	@bStatus bit,
	@sPoint_name varchar(50),
	@iLocation_id smallint
As
Begin
	Update tblPoints
	Set
		[sPoint_code] = @sPoint_code,
		[sPoint_desc] = @sPoint_desc,
		[bStatus] = @bStatus,
		[sPoint_name] = @sPoint_name,
		[iLocation_id] = @iLocation_id
	Where		
		[iPoint_id] = @iPoint_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPoints_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPoints_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:36 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblPoints table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPoints_SelectRow]
	@iPoint_id smallint
As
Begin
	Select 
		[iPoint_id],
		[sPoint_code],
		[sPoint_desc],
		[bStatus],
		[sPoint_name],
		[iLocation_id]
	From tblPoints
	Where
		[iPoint_id] = @iPoint_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPoints_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPoints_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:35 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblPoints table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPoints_SelectAll]
As
Begin
	Select 
		[iPoint_id],
		[sPoint_code],
		[sPoint_desc],
		[bStatus],
		[sPoint_name],
		[iLocation_id]
	From tblPoints
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPoints_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPoints_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:36 p.m.
-- Description:	This stored procedure is intended for inserting values to tblPoints table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPoints_Insert]
	@iPoint_id smallint,
	@sPoint_code varchar(20) = NULL,
	@sPoint_desc varchar(150) = NULL,
	@bStatus bit = NULL,
	@sPoint_name varchar(50),
	@iLocation_id smallint
As
Begin
	Insert Into tblPoints
		([iPoint_id],[sPoint_code],[sPoint_desc],[bStatus],[sPoint_name],[iLocation_id])
	Values
		(@iPoint_id,@sPoint_code,@sPoint_desc,@bStatus,@sPoint_name,@iLocation_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPoints_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPoints_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:36 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblPoints table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPoints_DeleteRow]
	@iPoint_id smallint
As
Begin
	Delete tblPoints
	Where
		[iPoint_id] = @iPoint_id

End
GO
/****** Object:  Table [dbo].[tblPeopleCostCenters]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPeopleCostCenters](
	[iPercent] [smallint] NOT NULL,
	[iCostCenter_id] [dbo].[IntKey] NOT NULL,
	[dtAsign_time] [dbo].[dateNormal] NULL,
	[iPerson_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblPeopleCostCenters] PRIMARY KEY CLUSTERED 
(
	[iPerson_id] ASC,
	[iCostCenter_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPeopleCostCenters_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPeopleCostCenters_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:32 p.m.
-- Description:	This stored procedure is intended for updating tblPeopleCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPeopleCostCenters_Update]
	@iPercent smallint,
	@iCostCenter_id smallint,
	@dtAsign_time datetime,
	@iPerson_id smallint
As
Begin
	Update tblPeopleCostCenters
	Set
		[iPercent] = @iPercent,
		[dtAsign_time] = @dtAsign_time
	Where		
		[iCostCenter_id] = @iCostCenter_id
		and [iPerson_id] = @iPerson_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPeopleCostCenters_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPeopleCostCenters_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:32 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblPeopleCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPeopleCostCenters_SelectRow]
	@iCostCenter_id smallint,
	@iPerson_id smallint
As
Begin
	Select 
		[iPercent],
		[iCostCenter_id],
		[dtAsign_time],
		[iPerson_id]
	From tblPeopleCostCenters
	Where
		[iCostCenter_id] = @iCostCenter_id
		and [iPerson_id] = @iPerson_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPeopleCostCenters_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPeopleCostCenters_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:32 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblPeopleCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPeopleCostCenters_SelectAll]
As
Begin
	Select 
		[iPercent],
		[iCostCenter_id],
		[dtAsign_time],
		[iPerson_id]
	From tblPeopleCostCenters
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPeopleCostCenters_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPeopleCostCenters_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:32 p.m.
-- Description:	This stored procedure is intended for inserting values to tblPeopleCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPeopleCostCenters_Insert]
	@iPercent smallint,
	@iCostCenter_id smallint,
	@dtAsign_time datetime = NULL,
	@iPerson_id smallint
As
Begin
	Insert Into tblPeopleCostCenters
		([iPercent],[iCostCenter_id],[dtAsign_time],[iPerson_id])
	Values
		(@iPercent,@iCostCenter_id,@dtAsign_time,@iPerson_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblPeopleCostCenters_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblPeopleCostCenters_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:32 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblPeopleCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblPeopleCostCenters_DeleteRow]
	@iCostCenter_id smallint,
	@iPerson_id smallint
As
Begin
	Delete tblPeopleCostCenters
	Where
		[iCostCenter_id] = @iCostCenter_id
		and [iPerson_id] = @iPerson_id

End
GO
/****** Object:  Table [dbo].[tblLocations]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLocations](
	[iLocation_id] [dbo].[IntKey] NOT NULL,
	[sLocation_name] [dbo].[name] NOT NULL,
	[sLocation_desc] [dbo].[description] NULL,
	[iStatus] [dbo].[state] NULL,
	[iSubArea_id] [dbo].[IntKey] NOT NULL,
	[iArea_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblLocations] PRIMARY KEY CLUSTERED 
(
	[iLocation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblLocations_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:30 p.m.
-- Description:	This stored procedure is intended for updating tblLocations table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblLocations_Update]
	@iLocation_id smallint,
	@sLocation_name varchar(50),
	@sLocation_desc varchar(150),
	@iStatus char(20),
	@iSubArea_id smallint,
	@iArea_id smallint
As
Begin
	Update tblLocations
	Set
		[sLocation_name] = @sLocation_name,
		[sLocation_desc] = @sLocation_desc,
		[iStatus] = @iStatus,
		[iSubArea_id] = @iSubArea_id,
		[iArea_id] = @iArea_id
	Where		
		[iLocation_id] = @iLocation_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblLocations_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:29 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblLocations table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblLocations_SelectRow]
	@iLocation_id smallint
As
Begin
	Select 
		[iLocation_id],
		[sLocation_name],
		[sLocation_desc],
		[iStatus],
		[iSubArea_id],
		[iArea_id]
	From tblLocations
	Where
		[iLocation_id] = @iLocation_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblLocations_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:29 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblLocations table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblLocations_SelectAll]
As
Begin
	Select 
		[iLocation_id],
		[sLocation_name],
		[sLocation_desc],
		[iStatus],
		[iSubArea_id],
		[iArea_id]
	From tblLocations
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblLocations_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:29 p.m.
-- Description:	This stored procedure is intended for inserting values to tblLocations table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblLocations_Insert]
	@iLocation_id smallint,
	@sLocation_name varchar(50),
	@sLocation_desc varchar(150) = NULL,
	@iStatus char(20) = NULL,
	@iSubArea_id smallint,
	@iArea_id smallint
As
Begin
	Insert Into tblLocations
		([iLocation_id],[sLocation_name],[sLocation_desc],[iStatus],[iSubArea_id],[iArea_id])
	Values
		(@iLocation_id,@sLocation_name,@sLocation_desc,@iStatus,@iSubArea_id,@iArea_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblLocations_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  Table [dbo].[tblInsurance]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInsurance](
	[iInsurance_id] [dbo].[IntKey] NOT NULL,
	[sInsurance_name] [dbo].[name] NOT NULL,
	[sInsurance_desc] [dbo].[description] NULL,
	[dtInsurance_start] [dbo].[dateNormal] NULL,
	[dtInsurance_end] [dbo].[dateNormal] NULL,
	[sInsurance_code] [dbo].[name] NOT NULL,
	[iActive_id] [smallint] NOT NULL,
 CONSTRAINT [XPKtblInsurance] PRIMARY KEY CLUSTERED 
(
	[iInsurance_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblInsurance_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblInsurance_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:26 p.m.
-- Description:	This stored procedure is intended for updating tblInsurance table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblInsurance_Update]
	@iInsurance_id smallint,
	@sInsurance_name varchar(50),
	@sInsurance_desc varchar(150),
	@dtInsurance_start datetime,
	@dtInsurance_end datetime,
	@sInsurance_code varchar(50),
	@iActive_id smallint
As
Begin
	Update tblInsurance
	Set
		[sInsurance_name] = @sInsurance_name,
		[sInsurance_desc] = @sInsurance_desc,
		[dtInsurance_start] = @dtInsurance_start,
		[dtInsurance_end] = @dtInsurance_end,
		[sInsurance_code] = @sInsurance_code,
		[iActive_id] = @iActive_id
	Where		
		[iInsurance_id] = @iInsurance_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblInsurance_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblInsurance_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:26 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblInsurance table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblInsurance_SelectRow]
	@iInsurance_id smallint
As
Begin
	Select 
		[iInsurance_id],
		[sInsurance_name],
		[sInsurance_desc],
		[dtInsurance_start],
		[dtInsurance_end],
		[sInsurance_code],
		[iActive_id]
	From tblInsurance
	Where
		[iInsurance_id] = @iInsurance_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblInsurance_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblInsurance_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:26 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblInsurance table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblInsurance_SelectAll]
As
Begin
	Select 
		[iInsurance_id],
		[sInsurance_name],
		[sInsurance_desc],
		[dtInsurance_start],
		[dtInsurance_end],
		[sInsurance_code],
		[iActive_id]
	From tblInsurance
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblInsurance_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblInsurance_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:26 p.m.
-- Description:	This stored procedure is intended for inserting values to tblInsurance table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblInsurance_Insert]
	@iInsurance_id smallint,
	@sInsurance_name varchar(50),
	@sInsurance_desc varchar(150) = NULL,
	@dtInsurance_start datetime = NULL,
	@dtInsurance_end datetime = NULL,
	@sInsurance_code varchar(50),
	@iActive_id smallint
As
Begin
	Insert Into tblInsurance
		([iInsurance_id],[sInsurance_name],[sInsurance_desc],[dtInsurance_start],[dtInsurance_end],[sInsurance_code],[iActive_id])
	Values
		(@iInsurance_id,@sInsurance_name,@sInsurance_desc,@dtInsurance_start,@dtInsurance_end,@sInsurance_code,@iActive_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblInsurance_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblInsurance_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:26 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblInsurance table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblInsurance_DeleteRow]
	@iInsurance_id smallint
As
Begin
	Delete tblInsurance
	Where
		[iInsurance_id] = @iInsurance_id

End
GO
/****** Object:  Table [dbo].[tblFamilies]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblFamilies_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblFamilies_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:19 p.m.
-- Description:	This stored procedure is intended for updating tblFamilies table
-- ==========================================================================================
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
/****** Object:  StoredProcedure [dbo].[sp_tblFamilies_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblFamilies_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:19 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblFamilies table
-- ==========================================================================================
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
/****** Object:  StoredProcedure [dbo].[sp_tblFamilies_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblFamilies_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblFamilies_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:19 p.m.
-- Description:	This stored procedure is intended for inserting values to tblFamilies table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblFamilies_Insert]
	@iFamily_id smallint,
	@sFamily_desc varchar(150) = NULL,
	@sFamily_name varchar(50),
	@iDepreciation_time int = NULL
As
Begin
	Insert Into tblFamilies
		([iFamily_id],[sFamily_desc],[sFamily_name],[iDepreciation_time])
	Values
		(@iFamily_id,@sFamily_desc,@sFamily_name,@iDepreciation_time)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblFamilies_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblFamilies_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:19 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblFamilies table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblFamilies_DeleteRow]
	@iFamily_id smallint
As
Begin
	Delete tblFamilies
	Where
		[iFamily_id] = @iFamily_id

End
GO
/****** Object:  Table [dbo].[tblDeclines]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDeclines](
	[sDecline_des] [dbo].[description] NULL,
	[iDecline_id] [dbo].[IntKey] NOT NULL,
	[dtDecline_time] [dbo].[dateNormal] NULL,
	[sDecline_type] [dbo].[state] NULL,
	[sUsername] [dbo].[name] NOT NULL,
	[iActive_id] [smallint] NOT NULL,
 CONSTRAINT [XPKtblDeclines] PRIMARY KEY CLUSTERED 
(
	[iDecline_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblDeclines_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblDeclines_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:16 p.m.
-- Description:	This stored procedure is intended for updating tblDeclines table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblDeclines_Update]
	@sDecline_des varchar(150),
	@iDecline_id smallint,
	@dtDecline_time datetime,
	@sDecline_type char(20),
	@sUsername varchar(50),
	@iActive_id smallint
As
Begin
	Update tblDeclines
	Set
		[sDecline_des] = @sDecline_des,
		[dtDecline_time] = @dtDecline_time,
		[sDecline_type] = @sDecline_type,
		[sUsername] = @sUsername,
		[iActive_id] = @iActive_id
	Where		
		[iDecline_id] = @iDecline_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblDeclines_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblDeclines_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:16 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblDeclines table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblDeclines_SelectRow]
	@iDecline_id smallint
As
Begin
	Select 
		[sDecline_des],
		[iDecline_id],
		[dtDecline_time],
		[sDecline_type],
		[sUsername],
		[iActive_id]
	From tblDeclines
	Where
		[iDecline_id] = @iDecline_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblDeclines_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblDeclines_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:16 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblDeclines table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblDeclines_SelectAll]
As
Begin
	Select 
		[sDecline_des],
		[iDecline_id],
		[dtDecline_time],
		[sDecline_type],
		[sUsername],
		[iActive_id]
	From tblDeclines
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblDeclines_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblDeclines_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:16 p.m.
-- Description:	This stored procedure is intended for inserting values to tblDeclines table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblDeclines_Insert]
	@sDecline_des varchar(150) = NULL,
	@iDecline_id smallint,
	@dtDecline_time datetime = NULL,
	@sDecline_type char(20) = NULL,
	@sUsername varchar(50),
	@iActive_id smallint
As
Begin
	Insert Into tblDeclines
		([sDecline_des],[iDecline_id],[dtDecline_time],[sDecline_type],[sUsername],[iActive_id])
	Values
		(@sDecline_des,@iDecline_id,@dtDecline_time,@sDecline_type,@sUsername,@iActive_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblDeclines_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblDeclines_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:16 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblDeclines table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblDeclines_DeleteRow]
	@iDecline_id smallint
As
Begin
	Delete tblDeclines
	Where
		[iDecline_id] = @iDecline_id

End
GO
/****** Object:  Table [dbo].[tblCostCenters]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCostCenters](
	[iCostCenter_id] [dbo].[IntKey] NOT NULL,
	[sCostCenter_desc] [char](18) NULL,
	[iCostCenter_gestion] [smallint] NULL,
	[sCostCenter_name] [dbo].[name] NOT NULL,
 CONSTRAINT [XPKtblCostCenters] PRIMARY KEY CLUSTERED 
(
	[iCostCenter_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblCostCenters_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblCostCenters_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:13 p.m.
-- Description:	This stored procedure is intended for updating tblCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblCostCenters_Update]
	@iCostCenter_id smallint,
	@sCostCenter_desc char(18),
	@iCostCenter_gestion smallint,
	@sCostCenter_name varchar(50)
As
Begin
	Update tblCostCenters
	Set
		[sCostCenter_desc] = @sCostCenter_desc,
		[iCostCenter_gestion] = @iCostCenter_gestion,
		[sCostCenter_name] = @sCostCenter_name
	Where		
		[iCostCenter_id] = @iCostCenter_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblCostCenters_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblCostCenters_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:13 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblCostCenters_SelectRow]
	@iCostCenter_id smallint
As
Begin
	Select 
		[iCostCenter_id],
		[sCostCenter_desc],
		[iCostCenter_gestion],
		[sCostCenter_name]
	From tblCostCenters
	Where
		[iCostCenter_id] = @iCostCenter_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblCostCenters_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblCostCenters_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:13 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblCostCenters_SelectAll]
As
Begin
	Select 
		[iCostCenter_id],
		[sCostCenter_desc],
		[iCostCenter_gestion],
		[sCostCenter_name]
	From tblCostCenters
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblCostCenters_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblCostCenters_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:13 p.m.
-- Description:	This stored procedure is intended for inserting values to tblCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblCostCenters_Insert]
	@iCostCenter_id smallint,
	@sCostCenter_desc char(18) = NULL,
	@iCostCenter_gestion smallint = NULL,
	@sCostCenter_name varchar(50)
As
Begin
	Insert Into tblCostCenters
		([iCostCenter_id],[sCostCenter_desc],[iCostCenter_gestion],[sCostCenter_name])
	Values
		(@iCostCenter_id,@sCostCenter_desc,@iCostCenter_gestion,@sCostCenter_name)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblCostCenters_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblCostCenters_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:13 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblCostCenters table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblCostCenters_DeleteRow]
	@iCostCenter_id smallint
As
Begin
	Delete tblCostCenters
	Where
		[iCostCenter_id] = @iCostCenter_id

End
GO
/****** Object:  Table [dbo].[tblAsigResponsibleActive]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAsigResponsibleActive](
	[dtAsign_date] [dbo].[dateNormal] NULL,
	[dtDevolution_date] [dbo].[dateNormal] NULL,
	[sAsign_desc] [dbo].[description] NULL,
	[bStatus] [dbo].[fla] NULL,
	[bConfirmed] [dbo].[fla] NULL,
	[sConfirmed_desc] [dbo].[description] NULL,
	[iPerson_id] [dbo].[IntKey] NOT NULL,
	[iActive_id] [smallint] NOT NULL,
 CONSTRAINT [XPKtblAsigResponsibleActive] PRIMARY KEY CLUSTERED 
(
	[iPerson_id] ASC,
	[iActive_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsigResponsibleActive_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsigResponsibleActive_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:10 p.m.
-- Description:	This stored procedure is intended for updating tblAsigResponsibleActive table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsigResponsibleActive_Update]
	@dtAsign_date datetime,
	@dtDevolution_date datetime,
	@sAsign_desc varchar(150),
	@bStatus bit,
	@bConfirmed bit,
	@sConfirmed_desc varchar(150),
	@iPerson_id smallint,
	@iActive_id smallint
As
Begin
	Update tblAsigResponsibleActive
	Set
		[dtAsign_date] = @dtAsign_date,
		[dtDevolution_date] = @dtDevolution_date,
		[sAsign_desc] = @sAsign_desc,
		[bStatus] = @bStatus,
		[bConfirmed] = @bConfirmed,
		[sConfirmed_desc] = @sConfirmed_desc
	Where		
		[iPerson_id] = @iPerson_id
		and [iActive_id] = @iActive_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsigResponsibleActive_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsigResponsibleActive_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:10 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblAsigResponsibleActive table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsigResponsibleActive_SelectRow]
	@iPerson_id smallint,
	@iActive_id smallint
As
Begin
	Select 
		[dtAsign_date],
		[dtDevolution_date],
		[sAsign_desc],
		[bStatus],
		[bConfirmed],
		[sConfirmed_desc],
		[iPerson_id],
		[iActive_id]
	From tblAsigResponsibleActive
	Where
		[iPerson_id] = @iPerson_id
		and [iActive_id] = @iActive_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsigResponsibleActive_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsigResponsibleActive_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:10 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblAsigResponsibleActive table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsigResponsibleActive_SelectAll]
As
Begin
	Select 
		[dtAsign_date],
		[dtDevolution_date],
		[sAsign_desc],
		[bStatus],
		[bConfirmed],
		[sConfirmed_desc],
		[iPerson_id],
		[iActive_id]
	From tblAsigResponsibleActive
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsigResponsibleActive_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsigResponsibleActive_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:10 p.m.
-- Description:	This stored procedure is intended for inserting values to tblAsigResponsibleActive table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsigResponsibleActive_Insert]
	@dtAsign_date datetime = NULL,
	@dtDevolution_date datetime = NULL,
	@sAsign_desc varchar(150) = NULL,
	@bStatus bit = NULL,
	@bConfirmed bit = NULL,
	@sConfirmed_desc varchar(150) = NULL,
	@iPerson_id smallint,
	@iActive_id smallint
As
Begin
	Insert Into tblAsigResponsibleActive
		([dtAsign_date],[dtDevolution_date],[sAsign_desc],[bStatus],[bConfirmed],[sConfirmed_desc],[iPerson_id],[iActive_id])
	Values
		(@dtAsign_date,@dtDevolution_date,@sAsign_desc,@bStatus,@bConfirmed,@sConfirmed_desc,@iPerson_id,@iActive_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsigResponsibleActive_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsigResponsibleActive_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:10 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblAsigResponsibleActive table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsigResponsibleActive_DeleteRow]
	@iPerson_id smallint,
	@iActive_id smallint
As
Begin
	Delete tblAsigResponsibleActive
	Where
		[iPerson_id] = @iPerson_id
		and [iActive_id] = @iActive_id

End
GO
/****** Object:  Table [dbo].[tblAsignPointsActives]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAsignPointsActives](
	[dtAsign_date] [dbo].[dateNormal] NULL,
	[sAsign_desc] [dbo].[description] NULL,
	[iActive_id] [smallint] NOT NULL,
	[iPoint_id] [dbo].[IntKey] NOT NULL,
 CONSTRAINT [XPKtblAsignPointsActives] PRIMARY KEY CLUSTERED 
(
	[iActive_id] ASC,
	[iPoint_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsignPointsActives_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsignPointsActives_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:08 p.m.
-- Description:	This stored procedure is intended for updating tblAsignPointsActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsignPointsActives_Update]
	@dtAsign_date datetime,
	@sAsign_desc varchar(150),
	@iActive_id smallint,
	@iPoint_id smallint
As
Begin
	Update tblAsignPointsActives
	Set
		[dtAsign_date] = @dtAsign_date,
		[sAsign_desc] = @sAsign_desc
	Where		
		[iActive_id] = @iActive_id
		and [iPoint_id] = @iPoint_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsignPointsActives_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsignPointsActives_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:08 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblAsignPointsActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsignPointsActives_SelectRow]
	@iActive_id smallint,
	@iPoint_id smallint
As
Begin
	Select 
		[dtAsign_date],
		[sAsign_desc],
		[iActive_id],
		[iPoint_id]
	From tblAsignPointsActives
	Where
		[iActive_id] = @iActive_id
		and [iPoint_id] = @iPoint_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsignPointsActives_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsignPointsActives_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:08 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblAsignPointsActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsignPointsActives_SelectAll]
As
Begin
	Select 
		[dtAsign_date],
		[sAsign_desc],
		[iActive_id],
		[iPoint_id]
	From tblAsignPointsActives
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsignPointsActives_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsignPointsActives_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:08 p.m.
-- Description:	This stored procedure is intended for inserting values to tblAsignPointsActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsignPointsActives_Insert]
	@dtAsign_date datetime = NULL,
	@sAsign_desc varchar(150) = NULL,
	@iActive_id smallint,
	@iPoint_id smallint
As
Begin
	Insert Into tblAsignPointsActives
		([dtAsign_date],[sAsign_desc],[iActive_id],[iPoint_id])
	Values
		(@dtAsign_date,@sAsign_desc,@iActive_id,@iPoint_id)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAsignPointsActives_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAsignPointsActives_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:08 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblAsignPointsActives table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAsignPointsActives_DeleteRow]
	@iActive_id smallint,
	@iPoint_id smallint
As
Begin
	Delete tblAsignPointsActives
	Where
		[iActive_id] = @iActive_id
		and [iPoint_id] = @iPoint_id

End
GO
/****** Object:  Table [dbo].[tblAreas]    Script Date: 10/13/2012 07:10:57 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblAreas_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAreas_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:05 p.m.
-- Description:	This stored procedure is intended for updating tblAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAreas_Update]
	@iArea_id smallint,
	@sArea_desc varchar(150),
	@sArea_name varchar(50)
As
Begin
	Update tblAreas
	Set
		[sArea_desc] = @sArea_desc,
		[sArea_name] = @sArea_name
	Where		
		[iArea_id] = @iArea_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAreas_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAreas_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:05 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAreas_SelectRow]
	@iArea_id smallint
As
Begin
	Select 
		[iArea_id],
		[sArea_desc],
		[sArea_name]
	From tblAreas
	Where
		[iArea_id] = @iArea_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAreas_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAreas_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:05 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAreas_SelectAll]
As
Begin
	Select 
		[iArea_id],
		[sArea_desc],
		[sArea_name]
	From tblAreas
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAreas_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAreas_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:05 p.m.
-- Description:	This stored procedure is intended for inserting values to tblAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAreas_Insert]
	@iArea_id smallint,
	@sArea_desc varchar(150) = NULL,
	@sArea_name varchar(50)
As
Begin
	Insert Into tblAreas
		([iArea_id],[sArea_desc],[sArea_name])
	Values
		(@iArea_id,@sArea_desc,@sArea_name)

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblAreas_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblAreas_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:54:05 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblAreas table
-- ==========================================================================================
Create Procedure [dbo].[sp_tblAreas_DeleteRow]
	@iArea_id smallint
As
Begin
	Delete tblAreas
	Where
		[iArea_id] = @iArea_id

End
GO
/****** Object:  Table [dbo].[tblActive]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblActive](
	[iActive_id] [smallint] NOT NULL,
	[sActive_name] [varchar](50) NULL,
	[iSubFamily_id] [dbo].[IntKey] NOT NULL,
	[iProvider_id] [dbo].[IntKey] NOT NULL,
	[sBarcode] [varchar](30) NOT NULL,
	[dRegister_time] [dbo].[dateNormal] NULL,
	[iUtilTime] [int] NULL,
	[sBrand] [dbo].[name] NOT NULL,
	[sModel] [dbo].[name] NOT NULL,
	[sForm] [dbo].[name] NOT NULL,
	[sSerialNumber] [dbo].[name] NOT NULL,
	[sColor] [dbo].[name] NOT NULL,
	[sCapacity] [dbo].[name] NOT NULL,
	[sMaterial] [char](18) NULL,
	[iHeihgt] [real] NULL,
	[iWidth] [real] NULL,
	[iWide] [real] NULL,
	[iDiameter] [real] NULL,
	[sUnit] [dbo].[name] NOT NULL,
	[iDivNumber] [int] NULL,
	[sAsign_type] [dbo].[state] NULL,
	[sAcquisition_type] [dbo].[state] NULL,
	[dtBuy_time] [dbo].[dateNormal] NULL,
	[iBuy_price] [real] NULL,
	[bInActive] [dbo].[fla] NULL,
	[sStatus] [varchar](20) NULL,
 CONSTRAINT [XPKtblActive] PRIMARY KEY CLUSTERED 
(
	[iActive_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActive_Update]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActive_Update
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:53:56 p.m.
-- Description:	This stored procedure is intended for updating tblActive table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblActive_Update]
	@iActive_id smallint,
	@sActive_name varchar(50),
	@iSubFamily_id smallint,
	@iProvider_id smallint,
	@sBarcode varchar(30),
	@dRegister_time datetime,
	@iUtilTime int,
	@sBrand varchar(50),
	@sModel varchar(50),
	@sForm varchar(50),
	@sSerialNumber varchar(50),
	@sColor varchar(50),
	@sCapacity varchar(50),
	@sMaterial char(18),
	@iHeihgt real,
	@iWidth real,
	@iWide real,
	@iDiameter real,
	@sUnit varchar(50),
	@iDivNumber int,
	@sAsign_type char(20),
	@sAcquisition_type char(20),
	@dtBuy_time datetime,
	@iBuy_price real,
	@bInActive bit,
	@sStatus varchar(20)
As
Begin
	Update tblActive
	Set
		[sActive_name] = @sActive_name,
		[iSubFamily_id] = @iSubFamily_id,
		[iProvider_id] = @iProvider_id,
		[sBarcode] = @sBarcode,
		[dRegister_time] = @dRegister_time,
		[iUtilTime] = @iUtilTime,
		[sBrand] = @sBrand,
		[sModel] = @sModel,
		[sForm] = @sForm,
		[sSerialNumber] = @sSerialNumber,
		[sColor] = @sColor,
		[sCapacity] = @sCapacity,
		[sMaterial] = @sMaterial,
		[iHeihgt] = @iHeihgt,
		[iWidth] = @iWidth,
		[iWide] = @iWide,
		[iDiameter] = @iDiameter,
		[sUnit] = @sUnit,
		[iDivNumber] = @iDivNumber,
		[sAsign_type] = @sAsign_type,
		[sAcquisition_type] = @sAcquisition_type,
		[dtBuy_time] = @dtBuy_time,
		[iBuy_price] = @iBuy_price,
		[bInActive] = @bInActive,
		[sStatus] = @sStatus
	Where		
		[iActive_id] = @iActive_id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActive_SelectRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActive_SelectRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:53:56 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblActive table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblActive_SelectRow]
	@iActive_id smallint
As
Begin
	Select 
		[iActive_id],
		[sActive_name],
		[iSubFamily_id],
		[iProvider_id],
		[sBarcode],
		[dRegister_time],
		[iUtilTime],
		[sBrand],
		[sModel],
		[sForm],
		[sSerialNumber],
		[sColor],
		[sCapacity],
		[sMaterial],
		[iHeihgt],
		[iWidth],
		[iWide],
		[iDiameter],
		[sUnit],
		[iDivNumber],
		[sAsign_type],
		[sAcquisition_type],
		[dtBuy_time],
		[iBuy_price],
		[bInActive],
		[sStatus]
	From tblActive
	Where
		[iActive_id] = @iActive_id
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActive_SelectAll]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActive_SelectAll
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:53:56 p.m.
-- Description:	This stored procedure is intended for selecting all rows from tblActive table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblActive_SelectAll]
As
Begin
	Select 
		[iActive_id],
		[sStatus],
		[sActive_name],
		[iSubFamily_id],
		[iProvider_id],
		[sBarcode],
		[dRegister_time],
		[iUtilTime],
		[sBrand],
		[sModel],
		[sForm],
		[sSerialNumber],
		[sColor],
		[sCapacity],
		[sMaterial],
		[iHeihgt],
		[iWidth],
		[iWide],
		[iDiameter],
		[sUnit],
		[iDivNumber],
		[sAsign_type],
		[sAcquisition_type],
		[dtBuy_time],
		[iBuy_price],
		[bInActive]
	From tblActive
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActive_Insert]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActive_Insert
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:53:56 p.m.
-- Description:	This stored procedure is intended for inserting values to tblActive table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblActive_Insert]
	@sActive_name varchar(50) = NULL,
	@sStatus varchar(20) = NULL,
	@iSubFamily_id smallint,
	@iProvider_id smallint,
	@sBarcode varchar(30),
	@dRegister_time datetime = NULL,
	@iUtilTime int = NULL,
	@sBrand varchar(50),
	@sModel varchar(50),
	@sForm varchar(50),
	@sSerialNumber varchar(50),
	@sColor varchar(50),
	@sCapacity varchar(50),
	@sMaterial char(18) = NULL,
	@iHeihgt real = NULL,
	@iWidth real = NULL,
	@iWide real = NULL,
	@iDiameter real = NULL,
	@sUnit varchar(50),
	@iDivNumber int = NULL,
	@sAsign_type char(20) = NULL,
	@sAcquisition_type char(20) = NULL,
	@dtBuy_time datetime = NULL,
	@iBuy_price real = NULL,
	@bInActive bit = NULL,
	@id int out
As
Begin
	Insert Into tblActive
		([sActive_name],[sStatus],[iSubFamily_id],[iProvider_id],[sBarcode],[dRegister_time],[iUtilTime],[sBrand],[sModel],[sForm],[sSerialNumber],[sColor],[sCapacity],[sMaterial],[iHeihgt],[iWidth],[iWide],[iDiameter],[sUnit],[iDivNumber],[sAsign_type],[sAcquisition_type],[dtBuy_time],[iBuy_price],[bInActive])
	Values
		(@sActive_name,@sStatus,@iSubFamily_id,@iProvider_id,@sBarcode,@dRegister_time,@iUtilTime,@sBrand,@sModel,@sForm,@sSerialNumber,@sColor,@sCapacity,@sMaterial,@iHeihgt,@iWidth,@iWide,@iDiameter,@sUnit,@iDivNumber,@sAsign_type,@sAcquisition_type,@dtBuy_time,@iBuy_price,@bInActive)
		SET @id = SCOPE_IDENTITY()
End
GO
/****** Object:  StoredProcedure [dbo].[sp_tblActive_DeleteRow]    Script Date: 10/13/2012 07:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_tblActive_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	12/10/2012 05:53:56 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblActive table
-- ==========================================================================================
CREATE Procedure [dbo].[sp_tblActive_DeleteRow]
	@iActive_id smallint
As
Begin
	Update tblActive
	Set [bInActive]='1'
	Where
		[iActive_id] = @iActive_id

End
GO
/****** Object:  ForeignKey [R_16]    Script Date: 10/13/2012 07:10:46 ******/
ALTER TABLE [dbo].[tblSubFamilies]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([iFamily_id])
REFERENCES [dbo].[tblFamilies] ([iFamily_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSubFamilies] CHECK CONSTRAINT [R_16]
GO
/****** Object:  ForeignKey [R_4]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblSubAreas]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([iArea_id])
REFERENCES [dbo].[tblAreas] ([iArea_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSubAreas] CHECK CONSTRAINT [R_4]
GO
/****** Object:  ForeignKey [R_19]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblRevalues]  WITH CHECK ADD  CONSTRAINT [R_19] FOREIGN KEY([iActive_id])
REFERENCES [dbo].[tblActive] ([iActive_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblRevalues] CHECK CONSTRAINT [R_19]
GO
/****** Object:  ForeignKey [R_5]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblResponsibles]  WITH CHECK ADD  CONSTRAINT [R_5] FOREIGN KEY([iRol_id])
REFERENCES [dbo].[tblRols] ([iRol_id])
GO
ALTER TABLE [dbo].[tblResponsibles] CHECK CONSTRAINT [R_5]
GO
/****** Object:  ForeignKey [R_23]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblProviders]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([iProviderType_id])
REFERENCES [dbo].[tblProvidersType] ([iProviderType_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProviders] CHECK CONSTRAINT [R_23]
GO
/****** Object:  ForeignKey [R_31]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblPrivileges]  WITH CHECK ADD  CONSTRAINT [R_31] FOREIGN KEY([iRol_id])
REFERENCES [dbo].[tblRols] ([iRol_id])
GO
ALTER TABLE [dbo].[tblPrivileges] CHECK CONSTRAINT [R_31]
GO
/****** Object:  ForeignKey [R_8]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblPrivileges]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([iProgram_id])
REFERENCES [dbo].[tblPrograms] ([iProgram_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPrivileges] CHECK CONSTRAINT [R_8]
GO
/****** Object:  ForeignKey [R_1]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblPoints]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([iLocation_id])
REFERENCES [dbo].[tblLocations] ([iLocation_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPoints] CHECK CONSTRAINT [R_1]
GO
/****** Object:  ForeignKey [R_11]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblPeopleCostCenters]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([iCostCenter_id])
REFERENCES [dbo].[tblCostCenters] ([iCostCenter_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPeopleCostCenters] CHECK CONSTRAINT [R_11]
GO
/****** Object:  ForeignKey [R_27]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblPeopleCostCenters]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([iPerson_id])
REFERENCES [dbo].[tblResponsibles] ([iPerson_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPeopleCostCenters] CHECK CONSTRAINT [R_27]
GO
/****** Object:  ForeignKey [R_2]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblLocations]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([iSubArea_id], [iArea_id])
REFERENCES [dbo].[tblSubAreas] ([iSubArea_id], [iArea_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLocations] CHECK CONSTRAINT [R_2]
GO
/****** Object:  ForeignKey [R_25]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblInsurance]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([iActive_id])
REFERENCES [dbo].[tblActive] ([iActive_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblInsurance] CHECK CONSTRAINT [R_25]
GO
/****** Object:  ForeignKey [R_22]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblDeclines]  WITH CHECK ADD  CONSTRAINT [R_22] FOREIGN KEY([iActive_id])
REFERENCES [dbo].[tblActive] ([iActive_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblDeclines] CHECK CONSTRAINT [R_22]
GO
/****** Object:  ForeignKey [R_10]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblAsigResponsibleActive]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([iPerson_id])
REFERENCES [dbo].[tblResponsibles] ([iPerson_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAsigResponsibleActive] CHECK CONSTRAINT [R_10]
GO
/****** Object:  ForeignKey [R_14]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblAsigResponsibleActive]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([iActive_id])
REFERENCES [dbo].[tblActive] ([iActive_id])
GO
ALTER TABLE [dbo].[tblAsigResponsibleActive] CHECK CONSTRAINT [R_14]
GO
/****** Object:  ForeignKey [R_20]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblAsignPointsActives]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([iActive_id])
REFERENCES [dbo].[tblActive] ([iActive_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAsignPointsActives] CHECK CONSTRAINT [R_20]
GO
/****** Object:  ForeignKey [R_21]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblAsignPointsActives]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([iPoint_id])
REFERENCES [dbo].[tblPoints] ([iPoint_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAsignPointsActives] CHECK CONSTRAINT [R_21]
GO
/****** Object:  ForeignKey [R_17]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblActive]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([iSubFamily_id])
REFERENCES [dbo].[tblSubFamilies] ([iSubFamily_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblActive] CHECK CONSTRAINT [R_17]
GO
/****** Object:  ForeignKey [R_24]    Script Date: 10/13/2012 07:10:57 ******/
ALTER TABLE [dbo].[tblActive]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([iProvider_id])
REFERENCES [dbo].[tblProviders] ([iProvider_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblActive] CHECK CONSTRAINT [R_24]
GO
