<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLocalidad.aspx.cs" Inherits="Sitio.Localidad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Registro Localidades</title>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/Validacion.js" type="text/javascript"></script>
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


<script>
    function isNumberKey(e) {
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
        especiales = [8, 37, 39, 46];

        tecla_especial = false
        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                break;
            }
        }

        if (letras.indexOf(tecla) == -1 && !tecla_especial)
            return false;
    }

    function limpia() {
        var val = document.getElementById("this").value;
        var tam = val.length;
        for (i = 0; i < tam; i++) {
            if (!isNaN(val[i])) document.getElementById("this").value = '';
        }
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
        <asp:Button ID="btNuevo" runat="server" onclick="btNuevo_Click" Text="Nuevo" 
            Width="70px" />
        <asp:Button ID="btBuscar" runat="server" onclick="btBuscar_Click" Text="Buscar" 
            Width="70px" />
        <br />
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
                       <asp:TextBox ID="txtnombre" onkeypress="return isNumberKey(event)" onblur="limpia()" runat="server" Width="210px" MaxLength="50"></asp:TextBox> 
            
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" Text="Descripción" Width="92px"></asp:Label>
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtdesc" runat="server" onkeypress="return isNumberKey(event)" onblur="limpia()" Width="206px" MaxLength="150"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label4" runat="server" Text="Estado"></asp:Label>
                    </td>
                    <td>
                        
                    <asp:DropDownList ID="ddlestado" runat="server" Height="16px" Width="198px">
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
                        <asp:Button ID="btGuardarlocalidad" runat="server" onclick="btGuardar_Click" 
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
                            <asp:ImageButton CommandName="Editar" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ilocacion_id") %>' runat="server" ID="Edit" ImageUrl='Images/edit.png' />
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:BoundField DataField="slocacion_nm" HeaderText="Locacion" />
                    <asp:BoundField DataField="slocacion_desc" HeaderText="Descripcion" />
                    <%--<asp:BoundField DataField="sstado" HeaderText="Estado" />--%>

                    <asp:TemplateField HeaderText="Estado">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label  Text='<%# getestado(Container.DataItem) %>' runat="server" ID="lbliestado"> </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>


                  <asp:TemplateField HeaderText="Sub-Area">            
			            <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                            <asp:Label  Text='<%# getSub(Container.DataItem) %>' runat="server" ID="lblisubarea_id"> </asp:Label>
			            </ItemTemplate>
		            </asp:TemplateField>
                    
                </Columns>

            </asp:GridView>
        </asp:Panel>
        <br />
     </div>
    </form>
</body>
</html>
