using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RN.Entidades;
using RN.Componentes;

namespace Sitio
{
    public partial class Localidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarSubarea();
                cargarLocalidad();
                Validate();
            }
        }

        protected void cargarLocalidad()
        { 
            List<RN.Entidades.Localidad> obj = CLocalidad.Traer();
            gridloc.DataSource = obj;
            gridloc.DataBind();
        }

        protected void CargarSubarea()
        {
            List<SubArea> obj = RN.Componentes.CSubArea.SelectAll();
            ddlsubarea.DataSource = obj;
            ddlsubarea.DataTextField = "SSubArea_name";
            ddlsubarea.DataValueField = "ISubArea_id";
            ddlsubarea.DataBind();
            this.ddlsubarea.Items.Insert(0, new ListItem("Elija Sub-Area", "0"));
        }


        public string getSub(int ISubArea_id)
        {
            RN.Entidades.SubArea sub = CSubArea.SelectRow(ISubArea_id);
            return sub.SSubArea_name;
        }


        protected string getSelectSub(int ISubArea_id)
        {
            RN.Entidades.SubArea sub = CSubArea.SelectRow(ISubArea_id);
            return sub.SSubArea_name;
        }

        public string getSub(object objLocalidad)
        {
            int iResp = Convert.ToInt32(DataBinder.Eval(objLocalidad, "ilocacion_id"));
            RN.Entidades.Localidad resp = CLocalidad.TraerXId(iResp);
            int iRol = resp.Ilocacion_id;
            RN.Entidades.SubArea sub = CSubArea.SelectRow(iRol);
            return sub.SSubArea_name;
        }

        protected void btNuevo_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Visible = true;
            Panel1.Visible = false;
            activarcampo();
            limpiar();
                
        }

        protected void btGuardar_Click(object sender, EventArgs e)
        {
            RN.Entidades.Localidad lo = new RN.Entidades.Localidad();

            lo.Slocacion_nm = txtnombre.Text;
            lo.Slocacion_desc = txtdesc.Text;
            int x = Convert.ToInt32(ddlsubarea.SelectedItem.Value);
            lo.Isubarea = x;
            Boolean b = (cbestado.SelectedIndex.ToString()).Equals("1");
            lo.Sstado = b;

            if (string.IsNullOrEmpty(txtcodigo.Text))
            {
                int codigo = CLocalidad.Insertar(lo);
                txtcodigo.Text = codigo.ToString();
                string s = ddlsubarea.SelectedItem.Value;
            }
            else
            {
                lo.Ilocacion_id = Convert.ToInt32(txtcodigo.Text);
                CLocalidad.Actualizar(lo);
                lblmensaje.Text = "DATOS ACTUALIZADOS";
            }
            limpiar();
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            lblmensaje.Text = id.ToString();

            if (e.CommandName == "Editar")
            {
                RN.Entidades.Localidad lo = CLocalidad.TraerXId(id);  
                this.txtcodigo.Text = Convert.ToString(lo.Ilocacion_id);
                this.txtnombre.Text = Convert.ToString(lo.Slocacion_nm);
                this.txtdesc.Text = Convert.ToString(lo.Slocacion_desc);
                string x="";
                if (Convert.ToInt32(lo.Sstado) == 0)
                    x = "Deshabilitado";
                else
                    x = "Habilitado";

                this.cbestado.Text = x;
                
                //.SelectedIndex.Equals(Convert.ToInt32(lo.Sstado)).ToString();
                    //=  Convert.ToString(lo.Sstado);
                this.ddlsubarea.SelectedValue = Convert.ToString(lo.Isubarea);
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CLocalidad.EliminarLocalidad(id);
                    lblmensaje.Text = "DATOS ELIMINADOS";
                }
            }
        } 

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            //RN.Entidades.Localidad lo = new RN.Entidades.Localidad();
            //Boolean b = (cbestado.SelectedIndex.ToString()).Equals("1");
            //lo.Sstado = b;
            //lblmensaje.Text = Convert.ToString(b);
            ////cbsubarea.SelectedValue = (txtnombre.Text);
            //cbestado.SelectedIndex = Convert.ToInt32(txtnombre.Text);
            limpiar();
            deshabilitarcampo();
            //lblmensaje.Text = cbestado.SelectedIndex.ToString();
            ////lblmensaje.Text = cbsubarea.SelectedValue.ToString();
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            Panel1.Dispose();
            Panel1.Visible = true;
            pnlPrincipal.Visible = true;
            lblmensaje.Text = "MOSTRARRRRRR";
        }

        protected void activarcampo()
        {
            //txtcodigo.Enabled = true;
            txtnombre.Enabled = true;
            txtdesc.Enabled = true;
            cbestado.Enabled = true;
            // ddsubarea.Enabled = true;
        }

        protected void limpiar()
        {
            txtcodigo.Text = "";
            txtnombre.Text = "";
            txtdesc.Text = "";
        }

        protected void deshabilitarcampo()
        {
            txtnombre.Enabled = false;
            txtdesc.Enabled = false;
            cbestado.Enabled = false;
        }
    }
}