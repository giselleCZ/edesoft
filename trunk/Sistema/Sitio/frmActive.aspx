<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmActive.aspx.cs" Inherits="Sitio.frmActive" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Registro de Activos</title>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/funciones.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/menunew.css" />
    <style type="text/css">
        .style2
        {
            width: 330px;
        }
        .style3
        {
            width: 134px;
        }
        </style>

    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong>Administración Activos</strong> <br/>

            <%--<asp:Button ID="btnNuevo" runat="server" Text="Nuevo" onclick="btnNuevo_Click" />--%><%-- <asp:Button ID="btnBuscar" runat="server" Text="Buscar" onclick="btnBuscar_Click" />--%>

           <asp:Button ID="btnNuevo" runat="server" Text="Nuevo"  onclick="btnNuevo_Click" />
           <asp:Button ID="btnBuscar" runat="server" Text="Buscar" onclick="btnBuscar_Click"/>

            <asp:Label ID="Label1" runat="server" Text="Label" Width="110px"></asp:Label>

            <asp:Panel ID="pnlNuevo" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="style3">
                        Código:</td>
                    <td>
                        <asp:TextBox ID="txtCodigo" runat="server" Enabled="False" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Nombre:</td>
                    <td>
                        <asp:TextBox ID="txtsActive_name" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Descripcion:</td>
                    <td>
                        <asp:TextBox ID="txtsActive_desc" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">Proveedor:</td>
                    <td>
                        <asp:DropDownList ID="ddlProveedor" runat="server" Height="25px" Width="250px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td class="style3">
                        Familia:</td>
                    
                    <td>
                        <asp:DropDownList ID="ddSubFamilia" runat="server" Height="25px" Width="250px">
                        </asp:DropDownList>
                   
                        </td>
                </tr>
                <tr>
                    <td class="style3">
                        Codigo Barras:</td>
                    <td>
                        <asp:TextBox ID="txtsBarcode" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Fecha Registro</td>
                    <td>
                        <asp:TextBox ID="txtdRegister_time" runat="server" Width="250px" 
                            Enabled="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td class="style3">
                        Vida Util</td>
                    <td>
                        <asp:TextBox ID="txtiUtilTime" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                                <tr>
                    <td class="style3">
                        Marca</td>
                    <td>
                        <asp:TextBox ID="txtsBrand" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Modelo:</td>
                    <td>
                        <asp:TextBox ID="txtsModel" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Forma:</td>
                    <td>
                        <asp:TextBox ID="txtsForm" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Numero Serie:</td>
                    <td>
                        <asp:TextBox ID="txtsSerialNumber" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Color:</td>
                    <td>
                        <asp:TextBox ID="txtsColor" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Capacidad:</td>
                    <td>
                        <asp:TextBox ID="txtsCapacity" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Material:</td>
                    <td>
                        <asp:TextBox ID="txtsMaterial" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Alto:</td>
                    <td>
                        <asp:TextBox ID="txtiHeihgt" runat="server" Width="250px" MaxLength="5"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Ancho:</td>
                    <td>
                        <asp:TextBox ID="txtiWidth" runat="server" Width="250px" MaxLength="5"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Largo:</td>
                    <td>
                        <asp:TextBox ID="txtiWide" runat="server" Width="250px" MaxLength="5"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Diametro:</td>
                    <td>
                        <asp:TextBox ID="txtiDiameter" runat="server" Width="250px" MaxLength="5"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Unidad:</td>
                    <td>
                        <asp:TextBox ID="txtsUnit" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Número de división:</td>
                    <td>
                        <asp:TextBox ID="txtiDivNumber" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Tipo de Asignación:</td>
                    <td>
                        <asp:TextBox ID="txtsAsign_type" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Tipo de Adquisición:</td>
                    <td>
                        <asp:TextBox ID="txtsAdquisition_type" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Tiempo Compra:</td>
                    <td>
                        <asp:TextBox ID="txtdtBuy_time" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Precio Compra:</td>
                    <td>
                        <asp:TextBox ID="txtiBuy_price" runat="server" Width="250px" MaxLength="8"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Estado:</td>
                    <td>
                        <asp:DropDownList ID="ddlEstado" runat="server" Height="21px" Width="250px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                        <td>
                        <asp:Button ID="btnGuardarActive" runat="server" Text="Guardar"  onclick="btGuardar_Click"/>
                    </td>
                <%--    <td>
                        <asp:Button ID="btnGuardarActive" runat="server" 
                            onclick="btnGuardarActive_Click" Text="Guardar" />
                    </td>--%>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        </div>
        <asp:Panel ID="pnlBuscar" runat="server">
            <strong><span class="style2">Resultados<br /> </span>


            <asp:GridView ID="grdActives" runat="server" AutoGenerateColumns="false" onrowcommand="ResultGrid_RowCommand">
                 <EmptyDataTemplate>
                    No se encontraron resultados para la busqueda.
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="iActive_id" HeaderText="Id" Visible="false" />

                    <asp:TemplateField HeaderText="Eliminar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iActive_id") %>' runat="server" ID="Delete" ImageUrl='Images/delete.png' />
			            </ItemTemplate>
		            </asp:TemplateField>

                    <asp:TemplateField HeaderText="Editar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iActive_id") %>' runat="server" ID="Edit" ImageUrl='Images/edit.png' />
			            </ItemTemplate>
		            </asp:TemplateField>



                    <asp:BoundField DataField="sActive_name" HeaderText="Nombre" />
                    


                 <%--   <asp:BoundField DataField="iSubFamily_id" HeaderText="SubFamilia" />--%>

                   <asp:TemplateField HeaderText="SubFamilia">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label  Text='<%# getSubFamily(Container.DataItem) %>' runat="server" ID="lblisubFamily_id">
                            </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>


                  <%--   <asp:BoundField DataField="iProvider_id" HeaderText="Proveedor" />
                    --%>
                    <asp:TemplateField HeaderText="Proveedor">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label  Text='<%# getProveedor(Container.DataItem) %>' runat="server" ID="lbliProveedor_id" >
                            </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>


                    <asp:BoundField DataField="sActive_desc" HeaderText="Descripcion" />
                    <asp:BoundField DataField="sBarcode" HeaderText="Codigo Barras" />
                    <asp:BoundField DataField="dRegister_time" HeaderText="Fecha Registro" />
                    <asp:BoundField DataField="iUtilTime" HeaderText="Util Regsitro" />
                    <asp:BoundField DataField="sBrand" HeaderText="Marca" />
                    <asp:BoundField DataField="sModel" HeaderText="Modelo" />
                    <asp:BoundField DataField="sForm" HeaderText="Forma" />
                    <asp:BoundField DataField="sSerialNumber" HeaderText="Numero Serial" />
                    <asp:BoundField DataField="sColor" HeaderText="Color" />
                    <asp:BoundField DataField="sCapacity" HeaderText="Capacidad" />
                    <asp:BoundField DataField="sMaterial" HeaderText="Material" />
                    <asp:BoundField DataField="iHeihgt" HeaderText="Alto" />
                    <asp:BoundField DataField="iWidth" HeaderText="Ancho" />
                    <asp:BoundField DataField="iWide" HeaderText="Largo" />
                    <asp:BoundField DataField="iDiameter" HeaderText="Diametro" />
                    <asp:BoundField DataField="sUnit" HeaderText="Unidad" />
                    <asp:BoundField DataField="iDivNumber" HeaderText="Numero de division" />
                    <asp:BoundField DataField="sAsign_type" HeaderText="Tiempo Asignacion" />
                    <asp:BoundField DataField="sAquisition_type" HeaderText="Tipo Adquisición" />
                    <asp:BoundField DataField="dtBuy_time" HeaderText="Fecha Compra" />
                    <asp:BoundField DataField="iBuy_price" HeaderText="Precio Compra" />
                    
                    

                    <asp:BoundField DataField="sStatus" HeaderText="Estado" />



                </Columns>
            </asp:GridView>
            </strong><br />
        </asp:Panel>
    </form>
</body>
</html>

