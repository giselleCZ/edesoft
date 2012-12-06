<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmProveedor.aspx.cs" Inherits="Sitio.Proveedor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
   <head id="Head1" runat="server">
    <title>Registro de Proveedores</title>
     <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/Validacion.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/menunew.css" />
    <style type="text/css">
        .style2
        {
            width: 330px;
        }
        </style>


    <script language="javascript" type="text/javascript">
    function textboxMultilineMaxNumber(txt, maxLen) {
        try {
            if (txt.value.length > (maxLen - 1))
             return false;
        } 
        catch (e) {
        }
    }
    </script>
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
<script>
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
    <form id="frmProveedor" runat="server">

    <asp:Button ID="btNuevo" runat="server" onclick="btNuevo_Click" Text="Nuevo" 
        Width="70px" />
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
                    <asp:TextBox ID="txtnombre"  onkeypress="return isNumberKey(event)" onblur="limpia()" runat="server" Width="198px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label9" runat="server" Text="Razón Social"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtrs"  onkeypress="return isNumberKey(event)" onblur="limpia()" runat="server" Width="198px" MaxLength="18"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label10" runat="server" Text="Teléfono"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txttelefono" onkeypress="return entero(event)" onblur="limpia()" runat="server" Width="198px" MaxLength="8"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label11" runat="server" Text="E-mail"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtmail" runat="server" Width="198px" onblur="limpia()" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label8" runat="server" Text="Dirección"></asp:Label>
                </td>
                <td class="style2">
                   <asp:TextBox ID="txtdireccion" onblur="limpia()" runat="server" Width="232px" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label7" runat="server" Text="Descripción"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtdesc" runat="server" Width="231px" MaxLength="30" 
                        TextMode="MultiLine" Height="48px" style="Z-INDEX: 104; LEFT: 136px; TOP: 336px"
onkeypress="return textboxMultilineMaxNumber(this,150)" onblur="limpia()" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <br />
                </td>
                <td class="style2">
                    <asp:Button ID="btGuardarproveedor" runat="server" onclick="btGuardar_Click" 
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
                           runat="server" ID="Edit" ImageUrl='Images/edit.png' />
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
