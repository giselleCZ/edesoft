USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[ExistCostCenter]    Script Date: 10/30/2012 00:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ExistCostCenter](
@sCostCenter varchar(50),
@@iExiste bit output)
AS
BEGIN
	if(exists(Select iCostCenter_id from tblCostCenters where sCostCenter_name=@sCostCenter ))
	select @@iExiste =1
  else
	select @@iExiste =0
END
