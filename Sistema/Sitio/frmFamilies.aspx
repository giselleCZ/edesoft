<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmFamilies.aspx.cs" Inherits="Sitio.frmFamilies" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro de Familias</title>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/funciones.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/menunew.css" />
    <style type="text/css">
        .style1
        {
            width: 358px;
        }
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
            <strong>Administración de Familias</strong> <br />
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" 
            onclick="btnNuevo_Click" />
&nbsp;&nbsp;
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                onclick="btnBuscar_Click" />
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
                        <asp:TextBox ID="txtFamily_name" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Descripcion:</td>
                    <td>
                        <asp:TextBox ID="txtFamily_desc" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Depreciacion:</td>
                    <td>
                        <asp:TextBox ID="txtDepreciation" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnGuardarFamilies" runat="server" onclick="btnGuardarFamilies_Click" 
                            Text="Guardar" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        </div>
        <asp:Panel ID="pnlBuscar" runat="server">
            <strong><span class="style2">Resultados<br /> </span>
            <asp:GridView ID="grdFamilies" runat="server" AutoGenerateColumns="false" onrowcommand="ResultGrid_RowCommand">
                 <EmptyDataTemplate>
                    No se encontraron resultados para la busqueda.
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="iFamily_id" HeaderText="Id" Visible="false" />
                    <asp:TemplateField HeaderText="Eliminar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iFamily_id") %>' runat="server" ID="Delete" ImageUrl='Images/delete.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iFamily_id") %>' runat="server" ID="Edit" ImageUrl='Images/edit.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:BoundField DataField="sFamily_name" HeaderText="Nombre" />
                    <asp:BoundField DataField="sFamily_desc" HeaderText="Descripcion" />
                    <asp:BoundField DataField="iDepreciation_time" HeaderText="Depreciacion" />
                </Columns>
            </asp:GridView>
            </strong><br />
        </asp:Panel>
    </form>
</body>
</html>
