using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOLocalidad
    {
        public int Insert(string name, string desc, bool estado, int subarea)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iLocation_id";
            prmA.Direction = ParameterDirection.Output;
            lstParametros.Add(prmA);

            DbParameter prmB = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@sLocation_name";
            prmB.Value = name;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);

            DbParameter prmC = new SqlParameter();
            prmC.DbType = DbType.String;
            prmC.ParameterName = "@sLocation_desc";
            prmC.Value = desc;
            prmC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmC);

            DbParameter prmD = new SqlParameter();
            prmD.DbType = DbType.Boolean;
            prmD.ParameterName = "@sStatus";
            prmD.Value = estado;
            prmD.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);

            DbParameter prmE = new SqlParameter();
            prmE.DbType = DbType.Int32;
            prmE.ParameterName = "@iSubArea_id";
            prmE.Value = subarea;
            prmE.Direction = ParameterDirection.Input;
            lstParametros.Add(prmE);

            SQLConexion conProxy = new SQLConexion();

            if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblLocations_Insert"))
                return Convert.ToInt32(prmA.Value);
            return -1;

        }
        //public int Insert(string name, string desc, bool stado, int subarea, SqlTransaction transaccion)
       // {
       //     List<DbParameter> lstParametros = new List<DbParameter>();
       //     DbParameter prmA = new SqlParameter();
       //     prmA.DbType = DbType.Int32;
       //     prmA.ParameterName = "@iLocation_id";
       //     prmA.Direction = ParameterDirection.Output;
       //     lstParametros.Add(prmA);

       //     DbParameter prmB = new SqlParameter();
       //     prmB.DbType = DbType.String;
       //     prmB.ParameterName = "@sLocation_name";
       //     prmB.Value = name;
       //     prmB.Direction = ParameterDirection.Input;
       //     lstParametros.Add(prmB);

       //     DbParameter prmC = new SqlParameter();
       //     prmC.DbType = DbType.String;
       //     prmC.ParameterName = "@sLocation_desc";
       //     prmC.Value = desc;
       //     prmC.Direction = ParameterDirection.Input;
       //     lstParametros.Add(prmC);

       //     DbParameter prmD = new SqlParameter();
       //     prmD.DbType = DbType.Int32;
       //     prmD.ParameterName = "@sStatus";
       //     prmD.Value = stado;
       //     prmD.Direction = ParameterDirection.Input;
       //     lstParametros.Add(prmD);

       //     DbParameter prmE = new SqlParameter();
       //     prmE.DbType = DbType.String;
       //     prmE.ParameterName = "@iSubArea_id";
       //     prmE.Value = subarea;
       //     prmE.Direction = ParameterDirection.Input;
       //     lstParametros.Add(prmE);
            
            
       //     SQLConexion conProxy = new SQLConexion();
       //     if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblLocations_Insert", transaccion))
       //         return Convert.ToInt32(prmA.Value);
       //     return -1;

       // }

        public bool Actualizar(int codigo, string name, string desc, bool stado, int subarea)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iLocation_id";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            DbParameter prmB = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@sLocation_name";
            prmB.Value = name;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);

            DbParameter prmC = new SqlParameter();
            prmC.DbType = DbType.String;
            prmC.ParameterName = "@sLocation_desc";
            prmC.Value = desc;
            prmC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmC);

            DbParameter prmD = new SqlParameter();
            prmD.DbType = DbType.Boolean;
            prmD.ParameterName = "@sStatus";
            prmD.Value = stado;
            prmD.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);

            DbParameter prmE = new SqlParameter();
            prmE.DbType = DbType.Int32;
            prmE.ParameterName = "@iSubArea_id";
            prmE.Value = subarea;
            prmE.Direction = ParameterDirection.Input;
            lstParametros.Add(prmE);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "sp_tblLocations_Update");

        }
        public bool Eliminar( int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iLocation_id";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblLocations_DeleteRow");
        }

        public DataSet TraerTodos()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblLocations_SelectAll");

        }
        public DataSet TraerXId(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iLocation_id";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblLocations_SelectRow");

        }
        /// <summary>
        /// falta completar el metodo
        /// </summary>
        /// <param name="nombre"></param>
        /// <returns></returns>
        public DataSet TraerLocalidadxNombre(string nombre)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.String;
            prmA.ParameterName = "@sLocation_name";
            prmA.Value = nombre;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.TraerEmpleadoXNombre");

        }

    }
}
