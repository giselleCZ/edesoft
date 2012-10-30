USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[ActCostCenter]    Script Date: 10/30/2012 00:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[ActCostCenter]
	@iCostCenter_id smallint,
	@sCostCenter_name varchar(50),
	@sCostCenter_desc char(18),
	@iCostCenter_gestion smallint
	
As
Begin
	Update tblCostCenters
	Set
		[sCostCenter_name] = @sCostCenter_name,
		[sCostCenter_desc] = @sCostCenter_desc,
		[iCostCenter_gestion] = @iCostCenter_gestion
		
	Where		
		[iCostCenter_id] = @iCostCenter_id

End