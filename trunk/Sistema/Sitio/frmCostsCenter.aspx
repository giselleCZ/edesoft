<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCostsCenter.aspx.cs" Inherits="Sitio.frmCostsCenter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong><span class="style1">
        <br />
        REGISTRO
        CENTRO DE COSTOS</span></strong><br />
        <br />
        <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" Font-Size="Larger" 
            ForeColor="Blue"></asp:Label>
        <br />
        <asp:Panel ID="pnlNuevo" runat="server">
            <asp:Button ID="btNuevo0" runat="server" onclick="btNuevo_Click1" 
                Text="Nuevo" />
            <br />
            &nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="lblCodigo" runat="server" style="font-size: large" 
                Text="Codigo:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="txtCodigo" runat="server" Enabled="False" Width="34px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lbNombre" runat="server" style="font-size: large" Text="Nombre:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtNombre" runat="server" Width="124px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lbDesc" runat="server" style="font-size: large" 
                Text="Descripcion:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDesc" runat="server" Width="124px"></asp:TextBox>
            &nbsp;
            <br />
            <br />
            <asp:Label ID="lblGestion" runat="server" style="font-size: large" 
                Text="Gestion"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtGestion" runat="server" Width="124px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtGestion" ErrorMessage="Ingrese solo numeros" 
                ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btguardar" runat="server" Text="Guardar" 
                onclick="btguardar_Click" />
            <br />
        </asp:Panel>
    
        <br />
        <br />
    
        <asp:Panel ID="pnlBuscar" runat="server">
             <asp:Label ID="lblMensaje0" runat="server" Font-Bold="True" Font-Size="Large" 
                 ForeColor="Red"></asp:Label>
             <strong><span class="style2">
             <br />
             <br />
             Resultados<br /> </span></strong>
                <asp:GridView ID="grdCostCenter" runat="server" AutoGenerateColumns="false" 
                                    onrowcommand="ResultGrid_RowCommand" 
                    onselectedindexchanged="dgvCostCenter_SelectedIndexChanged" Width="500px">
                    <EmptyDataTemplate>
                        No se encontraron resultados para la busqueda.
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Codigo" Visible="false" />
                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:BUTTON ID="Delete" runat="server" 
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ICostCenter_id") %>' 
                                    CommandName="Eliminar"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Editar">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                               <asp:BUTTON ID="Edit" runat="server" 
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ICostCenter_id") %>' 
                                    CommandName="Editar"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ICostCenter_id" HeaderText="CODIGO" />
                        <asp:BoundField DataField="SCostCente_name" HeaderText="NOMBRE" />
                        <asp:BoundField DataField="SCostCenter_desc" HeaderText="DESCRIPCION" />
                        <asp:BoundField DataField="DGestion_time" HeaderText="GESTION" />
                    </Columns>
                </asp:GridView>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
