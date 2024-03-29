USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[sp_tblProviders_DeleteRow]    Script Date: 10/28/2012 23:27:14 ******/
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
ALTER Procedure [dbo].[sp_tblProviders_DeleteRow]
	@iProvider_id smallint
As
Begin
	Delete tblProviders
	Where
		[iProvider_id] = @iProvider_id

End

