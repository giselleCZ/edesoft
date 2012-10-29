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
    public partial class frmResponsibles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadRoles();
            }
        }
        public void LoadResponsibles()
        {
            List<clsResponsible> obj = CResponsible.SelectAll();
            grdResponsibles.DataSource = obj;
            grdResponsibles.DataBind();
        }
        public void loadRoles()
        {
            List<clsRol> objRol = CRol.SelectAll();
            ddlRol.DataSource = objRol;
            ddlRol.DataTextField = "SRol_name";
            ddlRol.DataValueField = "IRol_id";
            ddlRol.DataBind();
        }
        public void loadRoles(int iRol_id)
        {
            List<clsRol> objRol = CRol.SelectAll();
            ddlRol.DataSource = objRol;
            ddlRol.DataTextField = "SRol_name";
            ddlRol.DataValueField = "IRol_id";
            ddlRol.SelectedValue = getRol(iRol_id);
            ddlRol.DataBind();
        }
        public string getRol(object objResponsible)
        {
            int iRol_id = Convert.ToInt32(DataBinder.Eval(objResponsible, "iRol_id"));
            RN.Entidades.clsRol rol = CRol.SelectRow(iRol_id);
            return rol.SRol_name;
        }

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int iResponsible_id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                clsResponsible Responsible = CResponsible.SelectRow(iResponsible_id);
                txtCi.Text = Responsible.SPerson_dni;
                txtFName.Text = Responsible.SPerson_name;
                txtLName.Text = Responsible.SPerson_lname;
                txtPhone.Text = Responsible.SPerson_phone;
                txtEmail.Text = Responsible.SPerson_email;
                txtUsername.Text = Responsible.SUsername;
                txtPassword.Text = Responsible.SPassword;
                txtStartdate.Text = Responsible.DStart_time.ToString();
                txtEnddate.Text = Responsible.DEnd_time.ToString();
                loadRoles(Responsible.IRol_id.IRol_id);
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CResponsible.Delete(iResponsible_id);
                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            clsResponsible Responsible = new clsResponsible();
            Responsible.SPerson_dni = txtCi.Text;
            Responsible.SPerson_name = txtFName.Text;
            Responsible.SPerson_lname = txtLName.Text;
            Responsible.SPerson_phone = txtPhone.Text;
            Responsible.SPerson_email = txtEmail.Text;
            Responsible.SUsername = txtUsername.Text;
            Responsible.SPassword = txtPassword.Text;
            //if (txtStartdate.Text != "")
            //    Responsible.DStart_time = Convert.ToDateTime(txtStartdate.Text);
            DateTime Start_time = new DateTime();
            Start_time = DateTime.ParseExact(txtStartdate.Text, "dd-MM-yyyy", null);
            Responsible.DStart_time = Start_time;
            //if(txtEnddate.Text!="")

            DateTime End_time = new DateTime();
            End_time = DateTime.ParseExact(txtEnddate.Text, "dd-MM-yyyy", null);
            Responsible.DEnd_time = End_time;
            clsRol rol = CRol.SelectRow(Convert.ToInt32(ddlRol.SelectedValue));
            //Responsible.IRol_id.IRol_id = c.IRol_id;
            Responsible.IRol_id = rol;

            if (string.IsNullOrEmpty(txtCodigo.Text))
            {
                int iResponsible_id = CResponsible.Insert(Responsible);
                txtCodigo.Text = iResponsible_id.ToString();

            }
            else
            {
                Responsible.IResponsible_id = Convert.ToInt32(txtCodigo.Text);
                CResponsible.Update(Responsible);
            }
        }
    }
}