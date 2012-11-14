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

                pnlBuscar.Visible = false;
                loadRoles();
                LoadResponsibles();
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
        public void loadRol(int iRol_id)
        {
            List<clsRol> objRol = CRol.SelectAll();
            ddlRol.DataSource = objRol;
            ddlRol.DataTextField = "SRol_name";
            ddlRol.DataValueField = "IRol_id";
            SetDDLs(ddlRol, getRol(iRol_id));
            //ddlRol.SelectedValue = getSelectedRol(iRol_id);
            ddlRol.DataBind();
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
        public string timeToString(DateTime d){
            string dia = d.Day.ToString();
            string mes = d.Month.ToString();
            string anio = d.Year.ToString();
            return dia + "-" + mes + "-" + anio;
        }
        public string getSelectedRol(int irol)
        {
            RN.Entidades.clsRol rol = CRol.SelectRow(irol);
            return rol.SRol_name;

        }
        public string getRol(object objResponsible)
        {
            int iResp= Convert.ToInt32(DataBinder.Eval(objResponsible,"iResponsible_id"));
            clsResponsible resp= CResponsible.SelectRow(iResp);
            int iRol = resp.IRol_id.IRol_id;
            RN.Entidades.clsRol rol = CRol.SelectRow(iRol);
            return rol.SRol_name;
        }
        public string getRol(int iRol)
        {
            RN.Entidades.clsRol rol = CRol.SelectRow(iRol);
            return rol.SRol_name;
        }
        /*public string getRol(clsRol objResponsible)    
        {
            int iRol = objResponsible.IRol_id;
            RN.Entidades.clsRol rol = CRol.SelectRow(iRol);
            return rol.SRol_name;
        }*/

        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int iResponsible_id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                clsResponsible Responsible = CResponsible.SelectRow(iResponsible_id);
                txtCodigo.Text = Responsible.IResponsible_id.ToString();
                txtCi.Text = Responsible.SPerson_dni;
                txtFName.Text = Responsible.SPerson_name;
                txtLName.Text = Responsible.SPerson_lname;
                txtPhone.Text = Responsible.SPerson_phone;
                txtEmail.Text = Responsible.SPerson_email;
                txtUsername.Text = Responsible.SUsername;
                txtPassword.Text = Responsible.SPassword;
                txtStartdate.Text = timeToString(Responsible.DStart_time);
                txtEnddate.Text = timeToString(Responsible.DEnd_time);
                loadRol(Responsible.IRol_id.IRol_id);

                pnlNuevo.Visible = true;
                grdResponsibles.Enabled = false;
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CResponsible.Delete(iResponsible_id);
                    LoadResponsibles();
                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
            
            txtCodigo.Text ="";
            txtCi.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtStartdate.Text = "";
            txtEnddate.Text = "";
            loadRoles();
            pnlNuevo.Visible = true;
            grdResponsibles.Enabled = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }

        protected void btnGuardarResponsibles_Click(object sender, EventArgs e)
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
                pnlBuscar.Visible = true;
                LoadResponsibles();
                grdResponsibles.Enabled = true;

            }
            else
            {
                Responsible.IResponsible_id = Convert.ToInt32(txtCodigo.Text);
                CResponsible.Update(Responsible);
                LoadResponsibles();
            }
        }
    }
}