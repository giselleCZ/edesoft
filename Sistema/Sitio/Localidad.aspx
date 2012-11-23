<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Localidad.aspx.cs" Inherits="Sitio.Localidad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script language="javascript" type="text/javascript">
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return true;

                return false;
            }
    </script>

    <style type="text/css">
        .style2
        {
            width: 147px;
            height: 24px;
        }
        .style3
        {
            height: 24px;
        }
        .style4
        {
            width: 147px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <asp:Button ID="btNuevo" runat="server" onclick="btNuevo_Click" Text="Nuevo" 
            Width="70px" />
        <asp:Button ID="btCancelar" runat="server" onclick="btCancelar_Click" 
            Text="Cancelar" Width="70px" />
        <asp:Button ID="btBuscar" runat="server" onclick="btBuscar_Click" Text="Buscar" 
            Width="70px" />
        <br />
        <asp:Label ID="lblmensaje" runat="server" Text="Label"></asp:Label>
        <asp:Panel ID="pnlPrincipal" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label1" runat="server" Text="Codigo:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtcodigo"  runat="server" Width="47px" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label2" runat="server" Text="Nombre Localidad"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtnombre" onkeypress="return isNumberKey(event)" runat="server" Width="210px" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" Text="Descripción" Width="92px"></asp:Label>
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtdesc" runat="server" onkeypress="return isNumberKey(event)" Width="206px" MaxLength="150"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label4" runat="server" Text="Estado"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cbestado" runat="server">
                            <asp:ListItem Value="0">Deshabilitado</asp:ListItem>
                            <asp:ListItem Value="1">Habilitado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label5" runat="server" Text="SubArea"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlsubarea" runat="server" Height="20px" Width="202px">
                        </asp:DropDownList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btGuardar" runat="server" onclick="btGuardar_Click" 
                            Text="Guardar" Width="70px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server"  Height="224px" Width="945px">
            <asp:GridView ID="gridloc" runat="server" AutoGenerateColumns="false" onrowcommand="ResultGrid_RowCommand">
                <EmptyDataTemplate>
                    No se encontraron resultados para la busqueda.
                </EmptyDataTemplate>

                  <Columns>
                    <asp:BoundField DataField="ilocacion_id" HeaderText="Id" Visible="false" />
                    <asp:TemplateField HeaderText="Eliminar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ilocacion_id") %>' runat="server" ID="Delete" ImageUrl='Images/delete.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ilocacion_id") %>' runat="server" ID="Edit" ImageUrl='Images/editar.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:BoundField DataField="slocacion_nm" HeaderText="Locacion" />
                    <asp:BoundField DataField="slocacion_desc" HeaderText="Descripcion" />
                    <asp:BoundField DataField="sstado" HeaderText="Estado" />
<%--                  <asp:TemplateField HeaderText="Sub-Area">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label  Text='<%# getSub(Container.DataItem) %>' runat="server" ID="xc">
                            </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>--%>
                    <asp:BoundField DataField="isubarea" HeaderText="idSub-Area" Visible="false" />   
                    <asp:BoundField DataField="subarea" HeaderText="Sub-Area"/>
                </Columns>

            </asp:GridView>
        </asp:Panel>
        <br />
     </div>
    </form>
</body>
</html>
