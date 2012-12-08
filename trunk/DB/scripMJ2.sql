USE [dbActives]
/****** Object:  Table [dbo].[tblCostCenters]    Script Date: 11/14/2012 19:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCostCenters](
	[iCostCenter_id] [dbo].[IntKey] IDENTITY(1,1) NOT NULL,
	[sCostCenter_name] [dbo].[name] NOT NULL,
	[sCostCenter_desc] [char](18) NULL,
	[iCostCenter_gestion] [smallint] NULL,
 CONSTRAINT [XPKtblCostCenters] PRIMARY KEY CLUSTERED 
(
	[iCostCenter_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[TraerCostCenterXId]    Script Date: 11/14/2012 19:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TraerCostCenterXId]
    @iCostCenter_id int = Null   OUTPUT,
    @sCostCenter_name varchar(50) = Null,
    @sCostCenter_desc char(18) = Null,
    @iCostCenter_gestion smallint = Null,
    @iEvento int = null

AS
if @iEvento = 1 --Insertar
    begin
        insert into tblCostCenters(sCostCenter_name ,sCostCenter_desc,iCostCenter_gestion)
         VALUES(@sCostCenter_name,@sCostCenter_desc,@iCostCenter_gestion);
 
        SET   @iCostCenter_id = @@IDENTITY;
    End
Else
    if @iEvento=2 --Modificar
        update tblCostCenters set
           
            sCostCenter_name = @sCostCenter_name,
            sCostCenter_desc= @sCostCenter_desc,
            iCostCenter_gestion = @iCostCenter_gestion
        Where iCostCenter_id = @iCostCenter_id
    Else
        if @iEvento = 3 -- Eliminar
            delete from tblCostCenters
            Where iCostCenter_id = @iCostCenter_id 
        Else
            if @iEvento = 4 -- Seleccionar todo
                select iCostCenter_id,sCostCenter_name,sCostCenter_desc,iCostCenter_gestion
                from tblCostCenters;
            Else
                if @iEvento = 5 -- Seleccionar uno
                    select iCostCenter_id,sCostCenter_name,sCostCenter_desc,iCostCenter_gestion
                    from tblCostCenters
                    Where iCostCenter_id = @iCostCenter_id 
                Else
                    if @iEvento = 6 -- Buscar
                        select iCostCenter_id,sCostCenter_name,sCostCenter_desc,iCostCenter_gestion
                        from tblCostCenters
                        where iCostCenter_id like '%' + @iCostCenter_id + '%';
                    Else
                    if @iEvento = 7 -- Buscar NOMBRE
                        select iCostCenter_id,sCostCenter_name,sCostCenter_desc,iCostCenter_gestion
                        from tblCostCenters
                        where sCostCenter_name like '%' + @sCostCenter_name + '%';
GO
/****** Object:  StoredProcedure [dbo].[SelCostCenter]    Script Date: 11/14/2012 19:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SelCostCenter]
As
Begin
	Select 
		
		[iCostCenter_id],
		[sCostCenter_name],
		[sCostCenter_desc],
		[iCostCenter_gestion]
		
	From tblCostCenters
End
GO
/****** Object:  StoredProcedure [dbo].[ExistCostCenter]    Script Date: 11/14/2012 19:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ExistCostCenter](
@sCostCenter varchar(50),
@@iExiste bit output)
AS
BEGIN
	if(exists(Select iCostCenter_id from tblCostCenters where sCostCenter_name=@sCostCenter ))
	select @@iExiste =1
  else
	select @@iExiste =0
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCostCenter]    Script Date: 11/14/2012 19:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[DeleteCostCenter]
	@iCostCenter_id smallint
As
Begin
	Delete tblCostCenters
	Where
		[iCostCenter_id] = @iCostCenter_id

End
GO
/****** Object:  StoredProcedure [dbo].[ActCostCenter]    Script Date: 11/14/2012 19:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ActCostCenter]
	@iCostCenter_id smallint OUTPUT,
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
GO
/****** Object:  StoredProcedure [dbo].[InsCostCenter]    Script Date: 11/14/2012 19:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsCostCenter](
	@sCostCenter_name varchar(50),
	@sCostCenter_desc char(18) = NULL,
	@iCostCenter_gestion smallint = NULL,
	@iCostCenter_id int OUT
	
)
AS
BEGIN
declare @@boolexiste bit
  exec ExistCostCenter @sCostCenter_name,@@boolexiste output
  if (@@boolexiste=0)
   Insert Into tblCostCenters(sCostCenter_name,sCostCenter_desc,iCostCenter_gestion) values(@sCostCenter_name,@sCostCenter_desc,@iCostCenter_gestion)
   SET @iCostCenter_id = SCOPE_IDENTITY()

END
GO
