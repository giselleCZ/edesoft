Create Procedure sp_tblActives_SelectAll
As
Begin
	Select 
		[iActive_id],
		[sActive_name],
		[iSubFamily_id],
		[iProvider_id],
		[sBarcode],
		[dRegister_time],
		[iUtilTime],
		[sBrand],
		[sModel],
		[sForm],
		[sSerialNumber],
		[sColor],
		[sCapacity],
		[sMaterial],
		[iHeihgt],
		[iWidth],
		[iWide],
		[iDiameter],
		[sUnit],
		[iDivNumber],
		[sAsign_type],
		[sAcquisition_type],
		[dtBuy_time],
		[iBuy_price],
		[sStatus]
	From tblActives
End

GO


--
-- Dropping stored procedure sp_tblActives_SelectRow : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblActives_SelectRow]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblActives_SelectRow]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_tblActives_SelectRow
-- Author:	Giselle N Choque
-- Create date:	25/11/2012 12:11:28 p.m.
-- Description:	This stored procedure is intended for selecting a specific row from tblActives table
-- ==========================================================================================
Create Procedure sp_tblActives_SelectRow
	@iActive_id smallint
As
Begin
	Select 
		[iActive_id],
		[sActive_name],
		[iSubFamily_id],
		[iProvider_id],
		[sBarcode],
		[dRegister_time],
		[iUtilTime],
		[sBrand],
		[sModel],
		[sForm],
		[sSerialNumber],
		[sColor],
		[sCapacity],
		[sMaterial],
		[iHeihgt],
		[iWidth],
		[iWide],
		[iDiameter],
		[sUnit],
		[iDivNumber],
		[sAsign_type],
		[sAcquisition_type],
		[dtBuy_time],
		[iBuy_price],
		[sStatus]
	From tblActives
	Where
		[iActive_id] = @iActive_id
End

GO


--
-- Dropping stored procedure sp_tblActives_Insert : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblActives_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblActives_Insert]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_tblActives_Insert
-- Author:	Giselle N Choque
-- Create date:	25/11/2012 12:11:28 p.m.
-- Description:	This stored procedure is intended for inserting values to tblActives table
-- ==========================================================================================
Create Procedure sp_tblActives_Insert
	@sActive_name varchar(50),
	@iSubFamily_id smallint,
	@iProvider_id smallint,
	@sBarcode varchar(50) = NULL,
	@dRegister_time datetime = NULL,
	@iUtilTime datetime = NULL,
	@sBrand varchar(50) = NULL,
	@sModel varchar(50) = NULL,
	@sForm varchar(50) = NULL,
	@sSerialNumber varchar(50) = NULL,
	@sColor varchar(50) = NULL,
	@sCapacity varchar(50) = NULL,
	@sMaterial varchar(50) = NULL,
	@iHeihgt decimal = NULL,
	@iWidth decimal = NULL,
	@iWide decimal = NULL,
	@iDiameter decimal = NULL,
	@sUnit varchar(30) = NULL,
	@iDivNumber decimal = NULL,
	@sAsign_type varchar(20),
	@sAcquisition_type varchar(50) = NULL,
	@dtBuy_time datetime = NULL,
	@iBuy_price decimal,
	@sStatus bit = NULL
As
Begin
	Insert Into tblActives
		([sActive_name],[iSubFamily_id],[iProvider_id],[sBarcode],[dRegister_time],[iUtilTime],[sBrand],[sModel],[sForm],[sSerialNumber],[sColor],[sCapacity],[sMaterial],[iHeihgt],[iWidth],[iWide],[iDiameter],[sUnit],[iDivNumber],[sAsign_type],[sAcquisition_type],[dtBuy_time],[iBuy_price],[sStatus])
	Values
		(@sActive_name,@iSubFamily_id,@iProvider_id,@sBarcode,@dRegister_time,@iUtilTime,@sBrand,@sModel,@sForm,@sSerialNumber,@sColor,@sCapacity,@sMaterial,@iHeihgt,@iWidth,@iWide,@iDiameter,@sUnit,@iDivNumber,@sAsign_type,@sAcquisition_type,@dtBuy_time,@iBuy_price,@sStatus)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End

GO


--
-- Dropping stored procedure sp_tblActives_Update : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblActives_Update]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblActives_Update]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_tblActives_Update
-- Author:	Giselle N Choque
-- Create date:	25/11/2012 12:11:28 p.m.
-- Description:	This stored procedure is intended for updating tblActives table
-- ==========================================================================================
Create Procedure sp_tblActives_Update
	@iActive_id smallint,
	@sActive_name varchar(50),
	@iSubFamily_id smallint,
	@iProvider_id smallint,
	@sBarcode varchar(50),
	@dRegister_time datetime,
	@iUtilTime datetime,
	@sBrand varchar(50),
	@sModel varchar(50),
	@sForm varchar(50),
	@sSerialNumber varchar(50),
	@sColor varchar(50),
	@sCapacity varchar(50),
	@sMaterial varchar(50),
	@iHeihgt decimal,
	@iWidth decimal,
	@iWide decimal,
	@iDiameter decimal,
	@sUnit varchar(30),
	@iDivNumber decimal,
	@sAsign_type varchar(20),
	@sAcquisition_type varchar(50),
	@dtBuy_time datetime,
	@iBuy_price decimal,
	@sStatus bit
As
Begin
	Update tblActives
	Set
		[sActive_name] = @sActive_name,
		[iSubFamily_id] = @iSubFamily_id,
		[iProvider_id] = @iProvider_id,
		[sBarcode] = @sBarcode,
		[dRegister_time] = @dRegister_time,
		[iUtilTime] = @iUtilTime,
		[sBrand] = @sBrand,
		[sModel] = @sModel,
		[sForm] = @sForm,
		[sSerialNumber] = @sSerialNumber,
		[sColor] = @sColor,
		[sCapacity] = @sCapacity,
		[sMaterial] = @sMaterial,
		[iHeihgt] = @iHeihgt,
		[iWidth] = @iWidth,
		[iWide] = @iWide,
		[iDiameter] = @iDiameter,
		[sUnit] = @sUnit,
		[iDivNumber] = @iDivNumber,
		[sAsign_type] = @sAsign_type,
		[sAcquisition_type] = @sAcquisition_type,
		[dtBuy_time] = @dtBuy_time,
		[iBuy_price] = @iBuy_price,
		[sStatus] = @sStatus
	Where		
		[iActive_id] = @iActive_id

End

GO


--
-- Dropping stored procedure sp_tblActives_DeleteRow : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_tblActives_DeleteRow]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_tblActives_DeleteRow]
  
GO

-- ==========================================================================================
-- Entity Name:	sp_tblActives_DeleteRow
-- Author:	Giselle N Choque
-- Create date:	25/11/2012 12:11:28 p.m.
-- Description:	This stored procedure is intended for deleting a specific row from tblActives table
-- ==========================================================================================
Create Procedure sp_tblActives_DeleteRow
	@iActive_id smallint
As
Begin
	Delete tblActives
	Where
		[iActive_id] = @iActive_id

End

GO
