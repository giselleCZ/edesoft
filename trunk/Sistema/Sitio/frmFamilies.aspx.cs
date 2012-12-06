using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RN.Componentes;
using RN.Entidades;

namespace Sitio
{
    public partial class frmFamilies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["usuario"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {

                pnlBuscar.Visible = false;
                LoadFamilies();
            }
        }
        public void LoadFamilies()
        {
            List<clsFamilies> obj = CFamilies.SelectAll();
            grdFamilies.DataSource = obj;
            grdFamilies.DataBind();
        }

        public string getFamily(int iFamily)
        {
            RN.Entidades.clsFamilies Family = CFamilies.SelectRow(iFamily);
            return Family.SFamily_name;
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int iFamily_id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                clsFamilies Family = CFamilies.SelectRow(iFamily_id);
                txtCodigo.Text = Family.IFamily_id.ToString();
                txtFamily_name.Text = Family.SFamily_name;
                txtFamily_desc.Text = Family.SFamily_desc;
                txtDepreciation.Text = Family.IDepreciation_time.ToString();

                LoadFamilies();

                pnlNuevo.Visible = true;
                pnlBuscar.Visible = false;
                grdFamilies.Enabled = false;
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CFamilies.Delete(iFamily_id);
                    LoadFamilies();
                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
            
            txtCodigo.Text ="";
            txtFamily_desc.Text = "";
            txtFamily_name.Text = "";
            txtDepreciation.Text = "";
            
            pnlNuevo.Visible = true;
            grdFamilies.Enabled = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }
        protected bool compareFamily(string name)
        {
            clsFamilies f = CFamilies.SelectByName(name);
            if(f!=null)
            return (f.SFamily_name== name);
            return false;
        }
        protected void btnGuardarFamilies_Click(object sender, EventArgs e)
        {
            clsFamilies Family = new clsFamilies();
            Family.SFamily_name = txtFamily_name.Text;
            Family.SFamily_desc = txtFamily_desc.Text;
            Family.IDepreciation_time = Convert.ToInt32(txtDepreciation.Text);

            if (string.IsNullOrEmpty(txtCodigo.Text))
            {
                int iFamily_id = CFamilies.Insert(Family);
                txtCodigo.Text = iFamily_id.ToString();
                pnlBuscar.Visible = true;
                LoadFamilies();
                grdFamilies.Enabled = true;

            }
            else
            {
                Family.IFamily_id = Convert.ToInt32(txtCodigo.Text);
                CFamilies.Update(Family);
                LoadFamilies();
                pnlNuevo.Visible = false;
                grdFamilies.Enabled = true;
            }
        }
    }
}