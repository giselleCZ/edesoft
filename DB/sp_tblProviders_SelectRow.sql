USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectRow]    Script Date: 10/28/2012 23:27:52 ******/
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
ALTER Procedure [dbo].[sp_tblProviders_SelectRow]
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

