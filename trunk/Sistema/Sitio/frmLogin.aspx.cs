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
            //if (!IsPostBack)
            //{
                
            //}
        }
        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            clsResponsible resp = CResponsible.SelectRow(Convert.ToInt32(txtUser.Text));
            if (resp != null)
            {
                if (resp.SPassword == txtPass.Text)
                {
                    Response.Redirect("main.htm");
                    Session["user"] = "Autenticado";
                    Session["rol"] = "Administrador";
					
                }
                else
                {
                    txtUser.Text = "Verifique su Contraseña";
                }
            }
            else
            {
                txtUser.Text = "usuario no encontrado";
            }
        }
    }
}
