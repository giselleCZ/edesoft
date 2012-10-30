USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCostCenter]    Script Date: 10/30/2012 00:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[DeleteCostCenter]
	@iCostCenter_id smallint
As
Begin
	Delete tblCostCenters
	Where
		[iCostCenter_id] = @iCostCenter_id

End