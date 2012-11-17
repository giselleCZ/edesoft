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
    public partial class frmCostsCenter : System.Web.UI.Page
    {
        // private clsCostCenter oCostCenter;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGrid();
            }
        }
        public void CargarGrid()
        {
            List<clsCostCenter> obj = CCostCenter.Traer();
            grdCostCenter.DataSource = obj;
            grdCostCenter.DataBind();
            lblMensaje0.Text = "";
            txtNombre.Text = "";
            txtDesc.Text = "";
            txtGestion.Text = "";

        }
        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            lblMensaje0.Text = "";
            lblMensaje.Text = "";
            if (e.CommandName == "Editar")
            {
                this.pnlNuevo.Visible = true;
                this.pnlBuscar.Visible = false;

                clsCostCenter c = CCostCenter.TraerXId(id);
                txtNombre.Text = c.SCostCente_name;
                txtCodigo.Text = c.ICostCenter_id + "";
                txtDesc.Text = c.SCostCenter_desc;
                txtGestion.Text = c.DGestion_time + "";

            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    if (CCostCenter.Eliminar(id))
                    {
                        lblMensaje.Text = "Se Elimino Correctamente";
                        CargarGrid();
                    }
                    else
                    {
                        lblMensaje0.Text = "Error al Eliminar";
                    }
                }
            }
        }

        protected void btguardar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            if (this.txtCodigo.Text.Equals(""))
            {
                if (string.IsNullOrEmpty(txtNombre.Text))
                    lblMensaje0.Text = "Ingrese Centro de costos";
                else
                {
                    if (string.IsNullOrEmpty(txtDesc.Text))
                        lblMensaje0.Text = "Inserte Descripcion";
                    else
                    {
                        if (string.IsNullOrEmpty(txtGestion.Text))

                            lblMensaje0.Text = "Inserte gestion";

                        else
                        {
                            clsCostCenter c = new clsCostCenter();
                            c.SCostCente_name = txtNombre.Text;
                            c.SCostCenter_desc = txtDesc.Text;
                            c.DGestion_time = Convert.ToInt16(txtGestion.Text);
                            int codigo = CCostCenter.Insert(c);
                            lblMensaje.Text = "Datos Guardados Correctamente";
                            CargarGrid();
                            this.pnlBuscar.Visible = true;

                        }
                    }
                }
            }
            else
            {
                clsCostCenter c = new clsCostCenter();
                c.SCostCente_name = txtNombre.Text;
                c.SCostCenter_desc = txtDesc.Text;
                c.DGestion_time = Convert.ToInt16(txtGestion.Text);
                c.ICostCenter_id = Convert.ToInt32(txtCodigo.Text);
                bool codigo = CCostCenter.Update(c);
                txtNombre.Text = codigo.ToString();
                lblMensaje.Text = "Datos Guardados Correctamente";
                CargarGrid();
                this.pnlBuscar.Visible = true;
            }


        }

        protected void dgvCostCenter_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*   GridViewRow row = grdCostCenter.SelectedRow;

               clsCostCenter c= new clsCostCenter();
               c.ICostCenter_id = Convert.ToInt32(row.Cells[1].Text);
               c.ConsultarCostCenterXID();
               txtCodigo.Text = c.oDatos.Tables[0].Rows[0][0].ToString();
               txtNombre.Text = c.oDatos.Tables[0].Rows[0][1].ToString();
               txtDesc.Text = c.oDatos.Tables[0].Rows[0][2].ToString();
               txtGestion.Text = c.oDatos.Tables[0].Rows[0][3].ToString();*/
        }

        protected void btNuevo_Click1(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
            lblMensaje.Text = "";
            txtCodigo.Text = "";
            txtNombre.Text = "";
            txtDesc.Text = "";
            txtGestion.Text = "";
        }


        protected void btBuscar_Click1(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }
    }
}