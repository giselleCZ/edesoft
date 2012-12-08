using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Collections.Generic;

namespace Sitio
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Consultar : System.Web.Services.WebService
    {
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetEmpleadosXNombre(string prefixText, int count)
        {
            List<string> lstResultado = new List<string>(count);
            List<RN.Entidades.Empleado> lstEmpleados = RN.Componentes.CEmpleado.TraerXNombre(prefixText);

            foreach (RN.Entidades.Empleado empleado in lstEmpleados)
            {
               // lstResultado.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(empleado.Nombre.Trim(), empleado.Codigo.ToString()));
            }
            return lstResultado.ToArray();
        }
    }
}
