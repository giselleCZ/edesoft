<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmResponsibles.aspx.cs" Inherits="Sitio.frmResponsibles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <strong>Administración de Responsables</strong> <br />
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
                </tr><tr>
                    <td class="style3">
                        CI:</td>
                    <td>
                        <asp:TextBox ID="txtCi" runat="server" Width="120px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Nombre:</td>
                    <td>
                        <asp:TextBox ID="txtFName" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Apellidos:</td>
                    <td>
                        <asp:TextBox ID="txtLName" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Telefono:</td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Nombre de Usuario:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Contraseña:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Fecha de Inicio:</td>
                    <td>
                        <asp:TextBox ID="txtStartdate" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Fecha Conclusion:</td>
                    <td>
                        <asp:TextBox ID="txtEnddate" runat="server" Width="100px"></asp:TextBox>
                        <br />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Rol:</td>
                    <td>
                        <asp:DropDownList ID="ddlRol" runat="server" Height="16px" Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" 
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
            <asp:GridView ID="grdResponsibles" runat="server" AutoGenerateColumns="false" onrowcommand="ResultGrid_RowCommand">
                 <EmptyDataTemplate>
                    No se encontraron resultados para la busqueda.
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="iPerson_id" HeaderText="Id" Visible="false" />
                    <asp:TemplateField HeaderText="Eliminar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton AlternateText='<%# DataBinder.Eval(Container.DataItem,"iResponsible_id") %>' CommandName="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iResponsible_id") %>' runat="server" ID="Delete" ImageUrl='Images/delete.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:ImageButton CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iResponsible_id") %>' runat="server" ID="Edit" ImageUrl='Images/edit.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:BoundField DataField="sPerson_name" HeaderText="Nombre" />
                    <asp:BoundField DataField="sPerson_lname" HeaderText="Apellidos" />
                    <asp:BoundField DataField="sPerson_dni" HeaderText="CI" />
                    <asp:TemplateField HeaderText="Rol">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label CommandName="Rol" CommandArgument='<%# getRol(Container.DataItem) %>' runat="server" ID="iRol_id">
                            </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:BoundField DataField="sPerson_phone" HeaderText="Telefono"/>   
                    <asp:BoundField DataField="sPerson_email" HeaderText="Email"/>
                    <asp:BoundField DataField="sUsername" HeaderText="Usuario"/>
                    <asp:BoundField DataField="sPassword" HeaderText="Contraseña"/>
                    <asp:BoundField DataField="dtStart_time" HeaderText="F. Inicio"/>
                    <asp:BoundField DataField="dtEnd_time" HeaderText="F. Fin"/>
                </Columns>
            </asp:GridView>
            </strong><br />
        </asp:Panel>
    </form>
</body>
</html>
