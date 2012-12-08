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
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            erroru.Visible = false;
            errorp.Visible = false;
        }
        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            erroru.Text = "";
            errorp.Text = "";
            erroru.Visible = false;
            errorp.Visible = false;
            clsResponsible resp = CResponsible.SelectByUsername(txtUser.Text);
            if (resp != null)
            {
                if (resp.SPassword == txtPass.Text)
                {
                    Response.Redirect("main.htm");
                    Session["usuario"] = "Autenticado";
                    Session["rol"] = "Administrador";
                }
                else
                {
                    errorp.Text = "Verifique su Contraseña";
                    errorp.Visible = true;
                    txtPass.Text = "";
                }
            }
            else
            {
                erroru.Visible = true;
                erroru.Text = "usuario no encontrado";
            }
        }
    }
}