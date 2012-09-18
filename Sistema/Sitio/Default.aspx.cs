using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Threading;
using System.Globalization;
using Instrumentacion;

namespace Sitio
{
    public partial class _Default : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            string strLenguaje = this.Session["strIdioma"].ToString();
            Thread.CurrentThread.CurrentCulture = new CultureInfo(strLenguaje);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
            base.InitializeCulture();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblUsuario.Text = User.Identity.Name;
                PanelLectura(true);
                GetDatos();
            }
            if (hdnEfectuado.Value == "1")
            {
                hdnEfectuado.Value = "0";
                ObtenerDatos();
            }
        }
        protected void btnEmpleado_B_Click(object sender, EventArgs e)
        {
            ObtenerDatos();
        }
        protected void btnDML_Click(object sender, EventArgs e)
        {
            //Thread.Sleep(3000);
            PanelLectura(false);
        }
        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            PanelLectura(true);
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
        //    TextLogs log = new Instrumentacion.TextLogs();
        //    try
        //    {
        //        RN.Entidades.Empleado objEmpleado = new RN.Entidades.Empleado();
        //        objEmpleado.Nombre = txtNombre.Text;
        //        if (RN.Componentes.CEmpleado.InsertarEmpleado(objEmpleado))
        //        {
        //            log.WriteInfo(string.Format(this.GetLocalResourceObject("logOk").ToString(), txtNombre.Text));
        //            Limpiar();
        //            PanelLectura(true);
        //            ObtenerDatos();
        //            lblInfo.Text = this.GetGlobalResourceObject("Mensajes", "msnOK").ToString();
        //        }
        //    }
        //    catch (Exception x)
        //    {
        //        log.WriteError(string.Format(this.GetLocalResourceObject("logError").ToString(), txtNombre.Text), x);
        //        lblInfo.Text = string.Format(this.GetLocalResourceObject("logError").ToString(), txtNombre.Text);
        //    }
        }
        protected void grdDatos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.grdDatos.PageIndex = e.NewPageIndex;
            ObtenerDatos();
        }
        protected void grdDatos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                RN.Componentes.CEmpleado.EliminarEmpleado(Convert.ToInt32(e.CommandArgument));
                ObtenerDatos();
            }
        }

        private void Limpiar()
        {
            hdnCodigoEmpleado.Value = string.Empty;
            hdnEfectuado.Value = "0";
            txtNombre.Text = string.Empty;
            lblInfo.Text = string.Empty;
        }
        private void ObtenerDatos()
        {
            int id = 0;
            if (string.IsNullOrEmpty(txtEmpleado_B.Text.Trim()))
            {
                hdnCodigoEmpleado.Value = "0";
                GetDatos();
            }
            else
            {
                Int32.TryParse(hdnCodigoEmpleado.Value, out id);
                GetDatos(id);
            }
        }
        private void GetDatos()
        {
            localhost.Consulta srvProxy = new Sitio.localhost.Consulta();
            grdDatos.DataSource = srvProxy.TraerEmpleados();
            grdDatos.DataBind();
        }
        private void GetDatos(int codigo)
        {
            localhost.Consulta srvProxy = new Sitio.localhost.Consulta();
            grdDatos.DataSource = srvProxy.TraerEmpleadoXId(codigo);
            grdDatos.DataBind();
        }
        public string GetNombre(object source)
        {
            return "Empleado " + DataBinder.Eval(source, "Nombre").ToString();
        }
        public bool BotonVisible(object source)
        {
            if (DataBinder.Eval(source, "Nombre").ToString().StartsWith("D"))
                return true;
            return false;
        }
        private void PanelLectura(bool estado)
        {
            pnlConsulta.Visible = estado;
            pnlDML.Visible = !estado;
        }
    }
}
