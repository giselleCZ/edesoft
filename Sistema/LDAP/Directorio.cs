using System;
using System.DirectoryServices;
using ActiveDs;
using System.Collections.Generic;
//ActiveDs.dll library. From VS.NET, select Project->Add Reference from the menu. Click the COM tab, click Active DS Type Library under Component Name

namespace LDAP
{
    public class Directorio
    {
        // esquema = "LDAP://dc=cainco,dc=org,dc=bo"
        private string esquema;
        // usuario = "manager"
        private string usuario;
        // contaseña = "Infinity2244"
        private string contraseña;
        private DirectoryEntry entry;

        public string Esquema
        {
            get { return esquema; }
            set { esquema = value; }
        }
        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        public string Contraseña
        {
            get { return contraseña; }
            set { contraseña = value; }
        }
        public Directorio(string esquema)
        {
            this.esquema = esquema;
            entry = new DirectoryEntry(esquema);
        }
        /*
         * Descripción de Propiedades de búsqueda LDAP
         * givenName = First Name         
         * sn = Last Name
         * cn = Display name
         * SAMAccountName = Nombre de usuario
         * initials = iniciales
         * mail = correo electrónico "Puede generar excepcion"         
         * telephoneNumber = Número de teléfono         
         * Description = Descripción
         */
        public static Usuario BuscarUsuario(string esquema, string usuario, string contraseña, string nombreUsuarioBuscar)
        {
            nombreUsuarioBuscar = LimpiarNombreDeUsuario(nombreUsuarioBuscar);
            DirectorySearcher dirBuscador = new DirectorySearcher();
            dirBuscador.SearchRoot = new DirectoryEntry(esquema, usuario, contraseña);
            dirBuscador.Filter = string.Format("(&(anr={0})(objectCategory=person))", nombreUsuarioBuscar);
            dirBuscador.SearchScope = SearchScope.Subtree;
            dirBuscador.PropertiesToLoad.AddRange(new String[] { "cn", "initials", "mail" });

            SearchResult usrProxy = dirBuscador.FindOne();
            Usuario usrFinal = new Usuario();
            usrFinal.NombreCompleto = usrProxy.Properties["cn"][0].ToString();
            usrFinal.Correo = usrProxy.Properties["mail"][0].ToString();
            usrFinal.Iniciales = usrProxy.Properties["initials"].Count > 0 ? usrProxy.Properties["initials"][0].ToString() : "0";            
            usrFinal.NombreUsuario = nombreUsuarioBuscar;
            return usrFinal;
        }
        private static string LimpiarNombreDeUsuario(string usuario)
        {
            return usuario.Replace("CAINCO\\", string.Empty);
        }
        public static List<string> BuscarRoles(string esquema, string usuario, string contraseña, string nombreUsuarioBuscar)
        {
            List<string> lista = new List<string>();

            DirectorySearcher dirBuscador = new DirectorySearcher();
            dirBuscador.SearchRoot = new DirectoryEntry(esquema, usuario, contraseña);
            dirBuscador.Filter = string.Format("(&(anr={0})(objectCategory=person))", nombreUsuarioBuscar);
            dirBuscador.SearchScope = SearchScope.Subtree;
            dirBuscador.PropertiesToLoad.AddRange(new String[] { "cn", "memberOf" });

            SearchResult usuarios = dirBuscador.FindOne();
            ResultPropertyValueCollection propiedades = usuarios.Properties["memberOf"];
            for (int i = 0; i < propiedades.Count; i++)
            {
                string valor = propiedades[i].ToString();
                valor = valor.ToLower();

                string[] strParser = { "," };
                string[] inf = valor.Split(strParser, StringSplitOptions.RemoveEmptyEntries);
                
                if (inf.Length > 1 && inf[0] == inf[1])
                    lista.Add(inf[0].Remove(0,3));
            }
            return lista;

        }
        public static bool ExisteUsuario(string esquema, string usuario, string contraseña, string nombreUsuarioBuscar)
        {
            DirectorySearcher dirBuscador = new DirectorySearcher();
            dirBuscador.SearchRoot = new DirectoryEntry(esquema, usuario, contraseña);
            dirBuscador.Filter = string.Format("(&(anr={0})(objectCategory=person))", nombreUsuarioBuscar);
            dirBuscador.SearchScope = SearchScope.Subtree;
            dirBuscador.PropertiesToLoad.AddRange(new String[] { "cn", "mail" });

            return (dirBuscador.FindOne() != null);
        }
    }
}
