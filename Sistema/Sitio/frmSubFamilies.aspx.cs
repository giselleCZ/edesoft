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
    public partial class frmSubFamilies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["usuario"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {

                pnlBuscar.Visible = false;
                loadFamilies();
                LoadSubFamilies();
            }
        }
        public void LoadSubFamilies()
        {
            List<clsSubFamilies> obj = CSubFamilies.SelectAll();
            grdSubFamilies.DataSource = obj;
            grdSubFamilies.DataBind();
        }
        public void loadFamilies()
        {
            List<clsFamilies> objFamily = CFamilies.SelectAll();
            ddlFamily.DataSource = objFamily;
            ddlFamily.DataTextField = "SFamily_name";
            ddlFamily.DataValueField = "IFamily_id";
            ddlFamily.DataBind();
        }
        public void loadFamily(int iFamily_id)
        {
            List<clsFamilies> objFamily = CFamilies.SelectAll();
            ddlFamily.DataSource = objFamily;
            ddlFamily.DataTextField = "SFamily_name";
            ddlFamily.DataValueField = "IFamily_id";
            SetDDLs(ddlFamily, getFamily(iFamily_id));
            //ddlFamily.SelectedValue = getSelectedFamily(iFamily_id);
            ddlFamily.DataBind();
        }

        private void SetDDLs(DropDownList d, string val)
        {
            ListItem li;
            for (int i = 0; i < d.Items.Count; i++)
            {
                li = d.Items[i];
                if (li.Value == val)
                {
                    d.SelectedIndex = i;
                    break;
                }
            }
        }
        public string getSelectedFamily(int iFamily)
        {
            RN.Entidades.clsFamilies Family = CFamilies.SelectRow(iFamily);
            return Family.SFamily_name;

        }

        public string getFamily(object objFamily)
        {
            int ifam= Convert.ToInt32(DataBinder.Eval(objFamily,"iSubFamily_id"));
            clsSubFamilies fam= CSubFamilies.SelectRow(ifam);
            int iFamily = fam.IFamily_id.IFamily_id;
            RN.Entidades.clsFamilies Family = CFamilies.SelectRow(iFamily);
            return Family.SFamily_name;
        }
        public string getFamily(int iFamily)
        {
            RN.Entidades.clsFamilies Family = CFamilies.SelectRow(iFamily);
            return Family.SFamily_name;
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int iSubFamily_id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                clsSubFamilies Family = CSubFamilies.SelectRow(iSubFamily_id);
                txtCodigo.Text = Family.ISubFamily_id.ToString();
                txtSubfamily_name.Text = Family.SSubFamily_name;
                txtSubfamily_desc.Text = Family.SSubFamily_desc;
                
                loadFamily(Family.IFamily_id.IFamily_id);

                pnlNuevo.Visible = true;
                grdSubFamilies.Enabled = false;
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CSubFamilies.Delete(iSubFamily_id);
                    LoadSubFamilies();
                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
            
            txtCodigo.Text ="";
            txtSubfamily_name.Text = "";
            txtSubfamily_desc.Text = "";
            loadFamilies();
            pnlNuevo.Visible = true;
            grdSubFamilies.Enabled = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }

        protected void btnGuardarSFamily_Click(object sender, EventArgs e)
        {
            clsSubFamilies SubFamily = new clsSubFamilies();
            SubFamily.SSubFamily_name = txtSubfamily_name.Text;
            SubFamily.SSubFamily_desc = txtSubfamily_desc.Text;
            
            clsFamilies Family = CFamilies.SelectRow(Convert.ToInt32(ddlFamily.SelectedValue));
            //SubFamily.IFamily_id.IFamily_id = c.IFamily_id;
            SubFamily.IFamily_id = Family;

            if (string.IsNullOrEmpty(txtCodigo.Text))
            {
                int iSubFamily_id = CSubFamilies.Insert(SubFamily);
                txtCodigo.Text = iSubFamily_id.ToString();
                pnlBuscar.Visible = true;
                LoadSubFamilies();
                grdSubFamilies.Enabled = true;

            }
            else
            {
                SubFamily.ISubFamily_id = Convert.ToInt32(txtCodigo.Text);
                CSubFamilies.Update(SubFamily);
                LoadSubFamilies();
            }
        }
    }
}