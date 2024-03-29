USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_Insert]    Script Date: 10/28/2012 23:23:42 ******/
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
ALTER Procedure [dbo].[sp_tblProviders_Insert]
	@iProvider_id int OUTPUT,
	@sProvider_name varchar(50),
	@sProvider_rs char(18) = NULL,
	@sProvider_phone varchar(15) = NULL,
	@sProvider_email varchar(50) = NULL,
	@sProvider_desc varchar(150) = NULL,
	@sProvider_address varchar(30) = NULL
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

