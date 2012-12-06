<<<<<<< .mine
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Sitio.frmLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <titleRegistro de Roles</title>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/funciones.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/menunew.css" />
    <style type="text/css">
        
        .style3
        {
            width: 134px;
        }
    </style>

    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong>Autenticación de Usuarios</strong> <br />
            <asp:Panel ID="pnlNuevo" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="style3">
                        </td>
                    <td>
                        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Usuario:</td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server" Enabled="true" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Contraseña:</td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnEntrar" runat="server" onclick="btnEntrar_Click" 
                            Text="Guardar" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        </div>
    </form>
</body>
</html>
=======
<<<<<<< .mine
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Sitio.frmLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
                        Contrase�a:</td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnEntrar" runat="server" onclick="btnEntrar_Click" 
                            Text="Guardar" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        </div>
    </form>
</body>
>>>>>>> .r67
