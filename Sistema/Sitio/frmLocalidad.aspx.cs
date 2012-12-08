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
            //if (this.Session["usuario"] == null)
            //    Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {
                this.Panel1.Visible = false;
                CargarSubArea();
                cargarLocalidad();
                CargarEstado();
                Validate();
               
            }
        }

        protected void cargarLocalidad()
        { 
            List<RN.Entidades.Localidad> obj = CLocalidad.Traer();
            gridloc.DataSource = obj;
            gridloc.DataBind();
        }


        protected void CargarEstado()
        {
            List<RN.Entidades.clsEstado> obj = RN.Componentes.CEstado.Traer();
            ddlestado.DataSource = obj;
            ddlestado.DataTextField = "SEstado";
            ddlestado.DataValueField = "IEstado";
            ddlestado.DataBind();
            //  this.ddProveedor.Items.Insert(0, new ListItem("Elija Proveedor", "0"));
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

        protected void CargarSubArea()
        {
            List<RN.Entidades.SubArea> obj = RN.Componentes.CSubArea.SelectAll();
            ddlsubarea.DataSource = obj;
            ddlsubarea.DataTextField = "SSubArea_name";
            ddlsubarea.DataValueField = "ISubArea_id";
            ddlsubarea.DataBind();
            //  this.ddProveedor.Items.Insert(0, new ListItem("Elija Proveedor", "0"));
        }

        public void CargarSubarea(int suba)
        {
            List<RN.Entidades.SubArea> obj = RN.Componentes.CSubArea.SelectAll();
            ddlsubarea.DataSource = obj;
            ddlsubarea.DataTextField = "SSubArea_name";
            ddlsubarea.DataValueField = "ISubArea_id";
            SetDDLs(ddlsubarea, getSub(suba));
            ddlsubarea.DataBind();
          //  this.ddlsubarea.Items.Insert(0, new ListItem("Elija Sub-Area", "0"));
        }

        public string getSub(object objsub)
        {
            int isub = Convert.ToInt32(DataBinder.Eval(objsub, "Ilocacion_id"));
            RN.Entidades.Localidad subl = CLocalidad.TraerXId(isub);
            int isuba = subl.Isubarea;
            RN.Entidades.SubArea sub = CSubArea.SelectRow(isuba);
            return sub.SSubArea_name;
        }

        public string getSub(int ISubArea_id)
        {
            RN.Entidades.SubArea sub = CSubArea.SelectRow(ISubArea_id);
            return sub.SSubArea_name;
        }

        public string getestado(object objsub)
        {
            int isub = Convert.ToInt32(DataBinder.Eval(objsub, "Ilocacion_id"));
            RN.Entidades.Localidad loc = CLocalidad.TraerXId(isub);
            int isuba = Convert.ToInt32(loc.Sstado);
            RN.Entidades.clsEstado sub = CEstado.SelectRow(isuba);
            return sub.SEstado;
        }

        public string getestado(int iEstado)
        {
            RN.Entidades.clsEstado sub = CEstado.SelectRow(iEstado);
            return sub.SEstado;
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
           /// Boolean b = (cbestado.SelectedIndex.ToString()).Equals("1");
          ///  lo.Sstado = b;

            if (string.IsNullOrEmpty(txtcodigo.Text))
            {
                int codigo = CLocalidad.Insertar(lo);
                txtcodigo.Text = codigo.ToString();
                string s = ddlsubarea.SelectedItem.Value;
                cargarLocalidad();

            }
            else
            {
                lo.Ilocacion_id = Convert.ToInt32(txtcodigo.Text);
                CLocalidad.Actualizar(lo);
                //lblmensaje.Text = "DATOS ACTUALIZADOS";
                cargarLocalidad();
            }
            limpiar();
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
           // lblmensaje.Text = id.ToString();

            if (e.CommandName == "Editar")
            {
                RN.Entidades.Localidad lo = CLocalidad.TraerXId(id);  
                this.txtcodigo.Text = Convert.ToString(lo.Ilocacion_id);
                this.txtnombre.Text = Convert.ToString(lo.Slocacion_nm);
                this.txtdesc.Text = Convert.ToString(lo.Slocacion_desc);
                this.ddlsubarea.SelectedValue = Convert.ToString(lo.Isubarea);
                this.ddlestado.SelectedValue = Convert.ToString(Convert.ToInt32(lo.Sstado));

                pnlPrincipal.Visible = true;
                this.Panel1.Visible = false;
             //   gridloc.Enabled = false;
                cargarLocalidad();

            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CLocalidad.EliminarLocalidad(id);
                    cargarLocalidad();

                    //lblmensaje.Text = "DATOS ELIMINADOS";
                }
            }
        } 

        protected void btCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
            deshabilitarcampo();
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            Panel1.Dispose();
            Panel1.Visible = true;
            pnlPrincipal.Visible = false;
          //  lblmensaje.Text = "MOSTRARRRRRR";
        }

        protected void activarcampo()
        {
            //txtcodigo.Enabled = true;
            txtnombre.Enabled = true;
            txtdesc.Enabled = true;
          ///  cbestado.Enabled = true;
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
          /// cbestado.Enabled = false;
        }


    }
}