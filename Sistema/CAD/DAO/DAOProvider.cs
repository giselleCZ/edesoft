using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;

namespace CAD.DAO
{
    public class DAOProvider
    {
        public int Insertar(string nombre, string apellido, int id_tipoProveedor, int telefono, string contacto_nm, string direccion, string descripcion)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@Provider_id";
            prmA.Direction = ParameterDirection.Output;
            lstParametros.Add(prmA);

            DbParameter prmB = new SqlParameter();
            prmB.DbType = DbType.Int32;
            prmB.ParameterName = "@ProviderType_id";
            prmB.Value = id_tipoProveedor;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);

            DbParameter prmC = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_name";
            prmB.Value = nombre;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmC);

            DbParameter prmD = new SqlParameter();
            prmB.DbType = DbType.Int32;
            prmB.ParameterName = "@Provider_phone";
            prmB.Value = telefono;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);

            DbParameter prmE = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_rs";
            prmB.Value = contacto_nm;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmE);

            DbParameter prmF = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_address";
            prmB.Value = direccion;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);

            DbParameter prmG = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_desc";
            prmB.Value = descripcion;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmG);

            DbParameter prmH = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_lname";
            prmB.Value = apellido;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmH);

            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.InsertProviders"))
                return Convert.ToInt32(prmA.Value);
            return -1;

        }
        public bool Actualizar(int id, string nombre, string apellido, string correo, int id_tipoProveedor, int telefono, string contacto_nm, string direccion, string descripcion)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@Provider_id";
            prmA.Value = id;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            DbParameter prmB = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_name";
            prmB.Value = nombre;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);

            DbParameter prmC = new SqlParameter();
            prmC.DbType = DbType.Int32;
            prmC.ParameterName = "@ProviderType_id";
            prmC.Value = id_tipoProveedor;
            prmC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmC);

            DbParameter prmD = new SqlParameter();
            prmC.DbType = DbType.Int32;
            prmC.ParameterName = "@Provider_phone";
            prmC.Value = telefono;
            prmC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);

            DbParameter prmE = new SqlParameter();
            prmC.DbType = DbType.String;
            prmC.ParameterName = "@Provider_rs";
            prmC.Value = contacto_nm;
            prmC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmE);

            DbParameter prmF = new SqlParameter();
            prmC.DbType = DbType.String;
            prmC.ParameterName = "@Provider_address";
            prmC.Value = direccion;
            prmC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmF);

            DbParameter prmG = new SqlParameter();
            prmC.DbType = DbType.String;
            prmC.ParameterName = "@Provider_desc";
            prmC.Value = descripcion;
            prmC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmG);

            DbParameter prmH = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_lname";
            prmB.Value = apellido;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmH);

            DbParameter prmI = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@Provider_email";
            prmB.Value = correo;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmI);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.UpdateProviders");
        }
        public bool Eliminar(int id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@Provider_id";
            prmA.Value = id;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.DeleteProviders");
        }
        public DataSet TraerTodos()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.TraerProviders");
        }
        public DataSet TraerXId(int id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@Provider_id";
            prmA.Value = id;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.TraerProvidersXId");
        }
    }
}
