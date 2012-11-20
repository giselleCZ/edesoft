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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlBuscar.Visible = false;
                CargarGrid();
            }
        }
        public void CargarGrid()
        {
            List<clsCostCenter> obj = CCostCenter.Traer();
            grdCostCenter.DataSource = obj;
            grdCostCenter.DataBind();
            /* txtNombrecc.Text = "";
             txtDesccc.Text = "";
             txtGestioncc.Text = "";*/

        }
        public string getCostCenter(int ICostCenter_id)
        {
            RN.Entidades.clsCostCenter c = CCostCenter.TraerXId(ICostCenter_id);
            return c.SCostCente_name;
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                clsCostCenter c = CCostCenter.TraerXId(id);
                txtCodigocc.Text = c.ICostCenter_id.ToString();
                txtNombrecc.Text = c.SCostCente_name;
                txtDesccc.Text = c.SCostCenter_desc;
                txtGestioncc.Text = c.DGestion_time.ToString();

                /*   clsCostCenter c = CCostCenter.TraerXId(id);
                  txtNombrecc.Text = c.SCostCente_name;
                  txtCodigocc.Text = c.ICostCenter_id + "";
                  txtDesccc.Text = c.SCostCenter_desc;
                  txtGestioncc.Text = c.DGestion_time + "";*/

                CargarGrid();

                pnlNuevo.Visible = true;
                pnlBuscar.Visible = false;
                grdCostCenter.Enabled = false;
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CCostCenter.Eliminar(id);
                    CargarGrid();
                }
            }
        }

        protected void btguardar_Click(object sender, EventArgs e)
        {
            clsCostCenter cc = new clsCostCenter();
            cc.SCostCente_name = txtNombrecc.Text;
            cc.SCostCenter_desc = txtDesccc.Text;
            cc.DGestion_time = Convert.ToInt32(txtGestioncc.Text);

            if (string.IsNullOrEmpty(txtCodigocc.Text))
            {
                /*  int codigo = CCostCenter.Insert(cc);
                  txtCodigo.Text = codigo.ToString();
                  pnlBuscar.Visible = true;
                  CargarGrid();
                  grdCostCenter.Enabled = true;*/
                int codigo = CCostCenter.Insert(cc);

                CargarGrid();
                this.pnlBuscar.Visible = true;

            }
            else
            {

                cc.ICostCenter_id = Convert.ToInt32(txtCodigocc.Text);
                CCostCenter.Update(cc);
                CargarGrid();
                pnlNuevo.Visible = false;
                grdCostCenter.Enabled = true;

                /*  clsCostCenter c = new clsCostCenter();
                  c.SCostCente_name = txtNombrecc.Text;
                  c.SCostCenter_desc = txtDesccc.Text;
                  c.DGestion_time = Convert.ToInt16(txtGestioncc.Text);
                  c.ICostCenter_id = Convert.ToInt32(txtCodigocc.Text);
                  bool codigo = CCostCenter.Update(c);
                  txtNombrecc.Text = codigo.ToString();*/

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

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;

            txtCodigocc.Text = "";
            txtNombrecc.Text = "";
            txtDesccc.Text = "";
            txtGestioncc.Text = "";

            pnlNuevo.Visible = true;
            grdCostCenter.Enabled = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }
        }
    }