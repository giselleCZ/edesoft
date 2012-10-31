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
    public partial class frmRols : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                pnlBuscar.Visible = false;
                LoadRoles();
            }
        }
        public void LoadRoles()
        {
            List<clsRol> obj = CRol.SelectAll();
            grdRols.DataSource = obj;
            grdRols.DataBind();
        }

        public string getRol(int iRol)
        {
            RN.Entidades.clsRol rol = CRol.SelectRow(iRol);
            return rol.SRol_name;
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int iRol_id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                clsRol Rol = CRol.SelectRow(iRol_id);
                txtCodigo.Text = Rol.IRol_id.ToString();
                txtRol.Text = Rol.SRol_name;

                LoadRoles();

                pnlNuevo.Visible = true;
                pnlBuscar.Visible = false;
                grdRols.Enabled = false;
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CRol.Delete(iRol_id);
                    LoadRoles();
                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
            
            txtCodigo.Text ="";
            txtRol.Text = "";
            
            pnlNuevo.Visible = true;
            grdRols.Enabled = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            clsRol rol = new clsRol();
            rol.SRol_name = txtRol.Text;

            if (string.IsNullOrEmpty(txtCodigo.Text))
            {
                int iRol_id = CRol.Insert(rol);
                txtCodigo.Text = iRol_id.ToString();
                pnlBuscar.Visible = true;
                LoadRoles();
                grdRols.Enabled = true;

            }
            else
            {
                rol.IRol_id = Convert.ToInt32(txtCodigo.Text);
                rol.sStatus = 0;
                CRol.Update(rol);
                LoadRoles();

                pnlNuevo.Visible = false;
                grdRols.Enabled = true;
            }
        }
    }
}