<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAsignRespCostCenter.aspx.cs" Inherits="Sitio.frmAsignRespCostCenter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <script type="text/javascript">
        $("#txtEnddate").datepicker({
			inline: true
		});
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong>Administración de Asignaciones de Centros de Costos</strong> <br />
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" 
            onclick="btnNuevo_Click" />
&nbsp;&nbsp;
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                onclick="btnBuscar_Click" />
            <asp:Panel ID="pnlNuevo" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="style3">
                        Responsable:</td>
                    <td>
                        <asp:DropDownList ID="ddlResponsible" runat="server" Height="16px" Width="250px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Centro de Costo:</td>
                    <td>
                        <asp:DropDownList ID="ddlCostCenter" runat="server" Height="16px" Width="250px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Porcentaje:</td>
                    <td>
                        <asp:TextBox ID="txtFName" runat="server" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Fecha Conclusion:</td>
                    <td>
                        <asp:TextBox ID="txtAsignationDate" runat="server" Width="100px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnGuardarRespCostCenter" runat="server" onclick="btnGuardarRespCostCenter_Click" 
                            Text="Guardar" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        </div>
        <asp:Panel ID="pnlBuscar" runat="server">
            <strong><span class="style2">Resultados<br /> </span>
            <asp:GridView ID="grdRespCostCenter" runat="server" AutoGenerateColumns="false" onrowcommand="ResultGrid_RowCommand">
                 <EmptyDataTemplate>
                    No se encontraron resultados para la busqueda.
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Eliminar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iResponsible_id") %>' runat="server" ID="Delete" ImageUrl='Images/delete.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iResponsible_id") %>' runat="server" ID="Edit" ImageUrl='Images/edit.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Responsable">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label  Text='<%# getResponsible(Container.DataItem) %>' runat="server" ID="lbliResponsible_id">
                            </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Centro de Costo">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label  Text='<%# getCostCenter(Container.DataItem) %>' runat="server" ID="lbliCostCenter_id">
                            </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </strong><br />
        </asp:Panel>
        <asp:Panel ID="pnlEditar" runat="server">
            <strong><span class="style2">Dependientes<br /> </span>
            <asp:GridView ID="gvCostCenter" runat="server" AutoGenerateColumns="false" onrowcommand="ResultGrid_RowCommand">
                 <EmptyDataTemplate>
                    No hay Centros de costo.
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Eliminar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iCostCenter_id") %>' runat="server" ID="Delete" ImageUrl='Images/delete.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iCostCenter_id") %>' runat="server" ID="Edit" ImageUrl='Images/edit.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:BoundField DataField="iPercent" HeaderText="Porcentaje" />
                    <asp:BoundField DataField="dtAsign_time" HeaderText="Asignacion" />
                </Columns>
            </asp:GridView>
            </strong><br />
        </asp:Panel>
    </form>
</body>
</html>
