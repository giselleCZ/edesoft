USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_SelectAll]    Script Date: 10/28/2012 23:27:33 ******/
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
ALTER Procedure [dbo].[sp_tblProviders_SelectAll]
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

