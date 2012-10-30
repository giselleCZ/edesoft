USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[SelCostCenter]    Script Date: 10/30/2012 00:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[SelCostCenter]
As
Begin
	Select 
		
		[iCostCenter_id],
		[sCostCenter_name],
		[sCostCenter_desc],
		[iCostCenter_gestion]
		
	From tblCostCenters
End
