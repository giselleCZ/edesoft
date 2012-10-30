USE [dbActives]
GO
/****** Object:  StoredProcedure [dbo].[InsCostCenter]    Script Date: 10/30/2012 00:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[InsCostCenter](
	@sCostCenter varchar(50),
	@sCostCenter_desc char(18) = NULL,
	@iCostCenter_gestion smallint = NULL,
	@iPK int OUT
	
)
AS
BEGIN
declare @@boolexiste bit
  exec ExistCostCenter @sCostCenter,@@boolexiste output
  if (@@boolexiste=0)
   Insert Into tblCostCenters(sCostCenter_name,sCostCenter_desc,iCostCenter_gestion) values(@sCostCenter,@sCostCenter_desc,@iCostCenter_gestion)
   SET @iPK = SCOPE_IDENTITY()

END