using System;

namespace LDAP
{
    public class Usuario
    {
        private string nombreUsuario;
        private string nombreCompleto;
        private string nombre;
        private string apellido;
        private string correo;
        private string iniciales;

        public string NombreUsuario
        {
            get { return nombreUsuario; }
            set { nombreUsuario = value; }
        }
        public string NombreCompleto
        {
            get { return nombreCompleto; }
            set { nombreCompleto = value; }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }
        public string Correo
        {
            get { return correo; }
            set { correo = value; }
        }
        public string Iniciales
        {
            get { return iniciales; }
            set { iniciales = value; }
        }
    }
}
