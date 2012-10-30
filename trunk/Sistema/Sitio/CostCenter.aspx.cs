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
    public partial class CostCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
        }

        protected void btBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }

        protected void btguardar_Click(object sender, EventArgs e)
        {
           
        }
    }
}