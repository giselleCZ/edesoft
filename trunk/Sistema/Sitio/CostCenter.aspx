<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostCenter.aspx.cs" Inherits="Sitio.CostCenter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Registro de Centro de Costos</strong></div>
    <asp:Panel ID="Panel1" runat="server" Height="226px">
        <asp:Button ID="btNuevo" runat="server" Text="Nuevo" />
        <asp:Button ID="btModificar" runat="server" Text="Modificar" />
        <asp:Button ID="btEliminar" runat="server" Text="Eliminar" />
        <br />
        <br />
        <asp:Label ID="lbNombre" runat="server" Text="Nombre"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbDesc" runat="server" Text="Descripcion"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtdesc" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbResponsable" runat="server" Text="Responsable"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btguardar" runat="server" Text="Guardar" />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="156px">
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </asp:Panel>
    </form>
</body>
</html>
