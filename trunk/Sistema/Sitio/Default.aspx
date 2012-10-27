<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sitio._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="ctrLenguaje.ascx" tagname="ctrLenguaje" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Facturas</title>
</head>
<body>    
    <form id="frm" runat="server">    
    <script type="text/javascript">
        //  keeps track of the ok button
        var _source;
        // keep track of the popup div
        var _popup;
        
        function showConfirm(source){
            this._source = source;
            this._popup = $find('mdlPopup');
            
            //  find the confirm ModalPopup and show it    
            this._popup.show();
        }
        
        function okClick(){
            //  find the confirm ModalPopup and hide it    
            this._popup.hide();
            //  use the cached button as the postback source
            __doPostBack(this._source.name, '');
        }
        
        function cancelClick(){
            //  find the confirm ModalPopup and hide it 
            this._popup.hide();
            //  clear the event source
            this._source = null;
            this._popup = null;
        }
    function CompleteEmpleados( source, eventArgs ) 
    {
        var hdnCodigo = document.getElementById('<%= hdnCodigoEmpleado.ClientID %>')
        var hdnEfectuado = document.getElementById('<%= hdnEfectuado.ClientID %>')
        hdnCodigo.value = eventArgs.get_value()
        hdnEfectuado.value = "1"
        //document.forms['frm'].submit()
    }    
    </script>
    <asp:ToolkitScriptManager ID="scrManager" runat="server"></asp:ToolkitScriptManager>
    <input type="hidden" id="hdnCodigoEmpleado" runat="server" value="0" />
    <input type="hidden" id="hdnEfectuado" runat="server" value="0" />
    <div class="Top">
        <asp:Literal ID="lblUsuario" runat="server"></asp:Literal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label runat="server" ID="ejemplo" Text="Ejemplo"></asp:Label>
        <uc1:ctrLenguaje ID="ctrLenguaje" runat="server" />
    </div>
    <br />
    <asp:UpdatePanel ID="pnlUpdate" runat="server">
        <ContentTemplate>
            <div class="Botonera">
                <asp:Button ID="btnDML" runat="server" Text="Nuevo" onclick="btnDML_Click" />
                <asp:Button ID="btnConsultar" runat="server" Text="Consultar" onclick="btnConsultar_Click" />
                <asp:Literal ID="lblInfo" runat="server"></asp:Literal>
            </div>            
            <asp:Panel ID="pnlDML" runat="server">
                <table width="600px" cellpadding="3" cellspacing="0" border="0" class="Contenido">
                    <colgroup>
                        <col width="60px" />
                        <col width="180px" />
                        <col width="*" />
                    </colgroup>
                    <tr>
                        <td colspan="3"><strong style="font-size:18px"><asp:Literal runat="server" ID="lblTitulo" meta:resourcekey="lblTitulo"></asp:Literal>
                            fgfg</strong></td>
                    </tr>
                    <tr>
                        <td><asp:Literal runat="server" ID="lblNombre" meta:resourcekey="lblNombre"></asp:Literal></td>
                        <td><asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox></td>
                        <td align="left"><asp:RequiredFieldValidator ID="rqrNombre" meta:resourcekey="rqrNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:Button ID="btnGuardar" runat="server"  meta:resourcekey="btnGuardar"
                                ValidationGroup="Insert" onclick="btnGuardar_Click" />
                            <asp:ValidationSummary ID="Summary" runat="server" DisplayMode="SingleParagraph" HeaderText="Existen errores en el formulario" ValidationGroup="Insert" />
                            <asp:Label Font-Size="12px" CssClass="EstiloLabel" ID="Label1" runat="server" Text="Label"></asp:Label>
                            
                        </td>
                    </tr>
                </table>
                <%--<div runat="server" id="pnlPop" style="display:none;width:200px;padding:10px;background-color:#e8e8e8;border:black 1px solid;">
                    <center>Esta seguro que desea Guardar?
                    <div style="padding-top:10px;">
                    <asp:imagebutton runat="server" ID="OkButton" OnClick="BtnOk_Click" OnClientClick="showConfirm(this); return false;" />
                    <asp:imagebutton runat="server" ID="CancelButton" />
                    </div>
                    </center>
                </div>--%>
                <%--<asp:ModalPopupExtender ID="popUp" runat="server" BehaviorID="mdlPopup" PopupControlID="pnlPop"
                    TargetControlID="btnGuardar" 
                    OkControlID="OkButton" 
                    CancelControlID="CancelButton" 
                    OnOkScript="okClick()" 
                    OnCancelScript="cancelClick()">
                </asp:ModalPopupExtender>--%></asp:Panel>
            <asp:Panel ID="pnlConsulta" runat="server" DefaultButton="btnEmpleado_B">
                <br />
                <div class="Buscador">
                    <strong>Empleado: </strong>
                    <asp:TextBox ID="txtEmpleado_B" runat="server" Width="200px"></asp:TextBox>    
                    <asp:AutoCompleteExtender ID="aceEmpleado_B" runat="server" TargetControlID="txtEmpleado_B" CompletionSetCount="20" MinimumPrefixLength="1" OnClientItemSelected="CompleteEmpleados" ServiceMethod="GetEmpleadosXNombre" ServicePath="./Consultar.asmx">
                    </asp:AutoCompleteExtender>
                    <asp:Button ID="btnEmpleado_B" runat="server" Text="Buscar" 
                        onclick="btnEmpleado_B_Click" />
                    <center>
                        <asp:GridView ID="grdDatos" runat="server" GridLines="None" PageSize="5" AllowPaging="true" 
                            AllowSorting="true" AutoGenerateColumns="false" 
                            onpageindexchanging="grdDatos_PageIndexChanging" 
                            onrowcommand="grdDatos_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Codigo" ItemStyle-Width="100px">
                                    <ItemStyle HorizontalAlign="Center"/>
                                    <ItemTemplate>                   
                                        <asp:Literal runat="server" ID="lblCodigo_G" Text='<%# DataBinder.Eval(Container.DataItem, "Codigo")%>'></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="300px">
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>                    
                                        <asp:Literal runat="server" ID="lblNombre_G" Text='<%# GetNombre(Container.DataItem)%>'></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Eliminar" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="300px">
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>                    
                                        <asp:Button runat="server" ID="btnEliminar" Text="Eliminar"  CommandName="Eliminar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Codigo")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </center>
                </div>
            </asp:Panel>
        </ContentTemplate>        
    </asp:UpdatePanel>   
    
    <asp:UpdateProgress ID="updProgress" runat="server">
        <ProgressTemplate>
            <asp:Literal runat="server" ID="Loading" Text="Cargando..."></asp:Literal>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>
</body>
</html>
