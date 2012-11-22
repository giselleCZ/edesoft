<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="Sitio.frmLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autenticacion</title>
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
            <strong>Autenticacion</strong> <br />
&nbsp;&nbsp;
            <asp:Panel ID="pnlNuevo" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="style3">
                        Login:</td>
                    <td>
                        <asp:TextBox ID="txtLogin" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        Password:</td>
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
                        <asp:Button ID="btnLogin" runat="server" onclick="btnGuardarLogin_Click" 
                            Text="Aceptar" />
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


