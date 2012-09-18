using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Threading;
using System.Globalization;

namespace Sitio
{
    public partial class ctrLenguaje : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lnkEspanol_Click(object sender, EventArgs e)
        {
            string strLenguaje = "es-mx";
            this.Session["strIdioma"] = strLenguaje;
        }

        protected void lnkIngles_Click(object sender, EventArgs e)
        {
            string strLenguaje = "en-us";
            this.Session["strIdioma"] = strLenguaje;
        }

        protected void lnkFrances_Click(object sender, EventArgs e)
        {
            string strLenguaje = "fr-fr";
            this.Session["strIdioma"] = strLenguaje;
        }
    }
}