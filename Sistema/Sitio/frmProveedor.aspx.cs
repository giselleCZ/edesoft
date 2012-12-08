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
    public partial class Proveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.Session["usuario"] == null)
            //    Response.Redirect("frmLogin.aspx");

            if (!IsPostBack)
            {
                CargarProveedor();
                Validate();
            }            
        }
        public void CargarProveedor()
        {
            List<RN.Entidades.Proveedor> obj = CProveedor.Traer();
            GridView2.DataSource = obj;
            GridView2.DataBind();
        }

        public string getProveedor(int iProveedor_id)
        {
            RN.Entidades.Proveedor prov = CProveedor.TraerXId(iProveedor_id);
            return prov.SProvider_name;
        }
        protected void btNuevo_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Visible = true;
           // lbMensajes.Text = "hola";
            pnlDatos.Visible = false;
            GridView2.Visible = false;
           // activacampo();
            limpiar();
        }

        protected void btGuardar_Click(object sender, EventArgs e)
        {

            RN.Entidades.Proveedor p = new RN.Entidades.Proveedor();

            p.SProvider_name = txtnombre.Text;
            p.SProvider_rs = txtrs.Text;
            p.SProvider_phone = txttelefono.Text;
            p.SProvider_email = txtmail.Text;
            p.SProvider_address = txtdireccion.Text;
            p.SProvider_desc = txtdesc.Text;

            if (string.IsNullOrEmpty(txtcodigo.Text))
            {
                int codigo = CProveedor.Insertar(p);
                txtcodigo.Text = codigo.ToString();
                lbMensajes.Text = "Proveedor guardado exitosamente";
                CargarProveedor();
               // this.GridView2.Enabled = true;
                //this.pnlDatos.Enabled = true;
            }
            else
            {
                p.IProvider_id = Convert.ToInt32(txtcodigo.Text);
                CProveedor.Actualizar(p);
                lbMensajes.Text = "Se actualizo Proveedor ";
                CargarProveedor();
                pnlDatos.Visible = false;
                pnlPrincipal.Visible = true;

            }
            limpiar();
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                RN.Entidades.Proveedor p = CProveedor.TraerXId(id);
                txtcodigo.Text = (p.IProvider_id)+"";
                txtnombre.Text = p.SProvider_name;
                txtrs.Text = p.SProvider_rs;
                txtmail.Text = p.SProvider_email;
                txttelefono.Text = p.SProvider_phone; 
                txtdireccion.Text = p.SProvider_address;
                txtdesc.Text = p.SProvider_desc;
                lbMensajes.Text = "EDICION";
                CargarProveedor();
                pnlDatos.Visible = false;
                pnlPrincipal.Visible = true;
                this.GridView2.Visible = false;
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CProveedor.EliminarProveedor(id);
                    //lbMensajes.Text = "ELIMINAR";
                    CargarProveedor();
                }
            }
        } 

        protected void btbuscar_Click(object sender, EventArgs e)
        {
            pnlDatos.Visible = true;
            GridView2.Visible = true;
            pnlPrincipal.Visible =false;
        }

        protected void btEliminar_Click(object sender, EventArgs e)
        {


        }

        protected void btCancelar_Click(object sender, EventArgs e)
        {
             limpiar();
             deshabilitarcampo();
        }

        protected void limpiar()
        {
            txtcodigo.Text = "";
            txtnombre.Text = "";
            txtrs.Text = "";
            txtmail.Text = "";
            txttelefono.Text = "";
            txtdireccion.Text = "";
            txtdesc.Text = "";
        }

        protected void activobotones()
        {
            btNuevo.Enabled = true;
            btbuscar.Enabled = false;
            limpiar();
        }

        protected void activacampo()
        {
            txtnombre.Enabled = true;
            txtrs.Enabled = true;
            txtmail.Enabled = true;
            txttelefono.Enabled = true;
            txtdireccion.Enabled = true;
            txtdesc.Enabled = true;
        }

        protected void deshabilitarcampo()
        {
            txtnombre.Enabled = false;
            txtrs.Enabled = false;
            txtmail.Enabled = false;
            txttelefono.Enabled = false;
            txtdireccion.Enabled = false;
            txtdesc.Enabled = false;
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void eliminar()
        //{
        //    object g = GridView2.SelectedRow;

        //}



    }
}