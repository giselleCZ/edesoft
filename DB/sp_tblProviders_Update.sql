USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_Update]    Script Date: 10/28/2012 23:28:09 ******/
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
ALTER Procedure [dbo].[sp_tblProviders_Update]
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

