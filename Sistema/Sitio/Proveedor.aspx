<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="Sitio.Proveedor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <title></title>

    <script language="javascript" type="text/javascript">
    function textboxMultilineMaxNumber(txt, maxLen) {
        try {
            if (txt.value.length > (maxLen - 1))
             return false;
        } 
        catch (e) {
        }
    }

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return true;

        return false;
    }

    function entero(e) {
        var caracter
        caracter = e.keyCode
        status = caracter

        if (caracter > 47 && caracter < 58) {
            return true
        }
        return false

    }

    </script>
    <style type="text/css">
        .style1
        {
            width: 106px;
        }
        .style2
        {
            width: 202px;
        }
        
        
        
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <asp:Button ID="btNuevo" runat="server" onclick="btNuevo_Click" Text="Nuevo" 
        Width="70px" />
    <asp:Button ID="btCancelar" runat="server" onclick="btCancelar_Click" 
        Text="Cancelar" Width="70px" />
    <asp:Button ID="btbuscar" runat="server" onclick="btbuscar_Click" 
        Text="Buscar" />
    <br />
    <asp:Label ID="lbMensajes" runat="server"></asp:Label>
    <br />
    <asp:Panel ID="pnlPrincipal" runat="server" Height="260px" Width="844px">
        <table style="width: 72%;">
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="Codigo"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtcodigo" runat="server" Width="76px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtnombre"  onkeypress="return isNumberKey(event)" runat="server" Width="198px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label9" runat="server" Text="RS"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtrs"  onkeypress="return isNumberKey(event)" runat="server" Width="198px" MaxLength="18"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label10" runat="server" Text="Teléfono"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txttelefono" onkeypress="return entero(event)" runat="server" Width="198px" MaxLength="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label11" runat="server" Text="E-mail"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtmail" runat="server" Width="198px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label8" runat="server" Text="Dirección"></asp:Label>
                </td>
                <td class="style2">
                   <asp:TextBox ID="txtdireccion" runat="server" Width="232px" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label7" runat="server" Text="Descripción"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtdesc" runat="server" Width="231px" MaxLength="30" 
                        TextMode="MultiLine" Height="48px" style="Z-INDEX: 104; LEFT: 136px; TOP: 336px"
onkeypress="return textboxMultilineMaxNumber(this,150)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <br />
                </td>
                <td class="style2">
                    <asp:Button ID="btGuardar" runat="server" onclick="btGuardar_Click" 
                        Text="Guardar" Width="70px" />
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="pnlDatos" runat="server" Visible="False" Height="285px" 
        style="margin-top: 27px">
         <strong><span class="style2">Resultados</span></strong><br />
        <asp:GridView ID="GridView2" 
            runat="server" 
            AutoGenerateColumns="False" 
            onrowcommand="ResultGrid_RowCommand">

            <EmptyDataTemplate>
                    No se encontraron resultados para la busqueda.
           </EmptyDataTemplate>

            <Columns>
                <asp:BoundField DataField="iProvider_id" HeaderText="Codigo" 
                    Visible="False" />

                <asp:TemplateField HeaderText="Eliminar">
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:ImageButton  
                            AlternateText='<%# DataBinder.Eval(Container.DataItem,"IProvider_id") %>' CommandName="Eliminar" 
                            CommandArgument='<%# DataBinder.Eval(Container.DataItem,"IProvider_id") %>' 
                             runat="server" ID="Delete" ImageUrl="Images/delete.png" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Editar"> 
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
			            <ItemTemplate>
                           <asp:ImageButton CommandName="Editar" 
                           CommandArgument='<%# DataBinder.Eval(Container.DataItem,"iProvider_id") %>' 
                           runat="server" ID="Edit" ImageUrl='Images/editar.png' />
			            </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="sProvider_name" HeaderText="Nombre" 
                    SortExpression="sProvider_name" />
                <asp:BoundField DataField="sProvider_rs" HeaderText="Razon Social" 
                    SortExpression="sProvider_rs" />
                <asp:BoundField DataField="sProvider_phone" HeaderText="Teléfono" 
                    SortExpression="sProvider_phone" />
                <asp:BoundField DataField="sProvider_email" HeaderText="Email" 
                    SortExpression="sProvider_email" />
                <asp:BoundField DataField="sProvider_desc" HeaderText="Descripción" 
                    SortExpression="sProvider_desc" Visible="False" />
                <asp:BoundField DataField="sProvider_address" HeaderText="Dirección" 
                    SortExpression="sProvider_address" Visible="False" />
            </Columns>
        </asp:GridView>
        
        <br />
        <br />
    </asp:Panel>
    <br />
    <br />
    <br />
    </form>
</body>
</html>
