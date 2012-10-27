using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOProveedor
    {
        public int Insertar(string nm, string rs, string phone, string email, string desc, string dir)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iProvider_id";
            prmA.Direction = ParameterDirection.Output;
            lstParametros.Add(prmA);

            DbParameter prmB = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@sProvider_name";
            prmB.Value = nm;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);

 

            DbParameter prmD = new SqlParameter();
            prmD.DbType = DbType.String;
            prmD.ParameterName = "@sProvider_rs";
            prmD.Value = rs;
            prmD.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);
            ////
            DbParameter prmE = new SqlParameter();
            prmE.DbType = DbType.String;
            prmE.ParameterName = "@sProvider_phone";
            prmE.Value = phone;
            prmE.Direction = ParameterDirection.Input;
            lstParametros.Add(prmE);

            DbParameter prmF = new SqlParameter();
            prmF.DbType = DbType.String;
            prmF.ParameterName = "@sProvider_email";
            prmF.Value = email;
            prmF.Direction = ParameterDirection.Input;
            lstParametros.Add(prmF);

            DbParameter prmG = new SqlParameter();
            prmG.DbType = DbType.String;
            prmG.ParameterName = "@sProvider_desc";
            prmG.Value = desc;
            prmG.Direction = ParameterDirection.Input;
            lstParametros.Add(prmG);

            DbParameter prmH = new SqlParameter();
            prmH.DbType = DbType.String;
            prmH.ParameterName = "@sProvider_address";
            prmH.Value = dir;
            prmH.Direction = ParameterDirection.Input;
            lstParametros.Add(prmH);

            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblProviders_Insert"))
                return Convert.ToInt32(prmA.Value);
            return -1;
        }

        public int Insertar(string nm, string rs, string phone, string email, string desc, string dir, SqlTransaction transaccion)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iProvider_id";
            prmA.Direction = ParameterDirection.Output;
            lstParametros.Add(prmA);

            DbParameter prmB = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@sProvider_name";
            prmB.Value = nm;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);

            DbParameter prmD = new SqlParameter();
            prmD.DbType = DbType.String;
            prmD.ParameterName = "@sProvider_rs";
            prmD.Value = rs;
            prmD.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);
            ////
            DbParameter prmE = new SqlParameter();
            prmE.DbType = DbType.String;
            prmE.ParameterName = "@sProvider_phone";
            prmE.Value = phone;
            prmE.Direction = ParameterDirection.Input;
            lstParametros.Add(prmE);

            DbParameter prmF = new SqlParameter();
            prmF.DbType = DbType.String;
            prmF.ParameterName = "@sProvider_email";
            prmF.Value = email;
            prmF.Direction = ParameterDirection.Input;
            lstParametros.Add(prmF);

            DbParameter prmG = new SqlParameter();
            prmG.DbType = DbType.String;
            prmG.ParameterName = "@sProvider_desc";
            prmG.Value = desc;
            prmG.Direction = ParameterDirection.Input;
            lstParametros.Add(prmG);

            DbParameter prmH = new SqlParameter();
            prmH.DbType = DbType.String;
            prmH.ParameterName = "@sProvider_address";
            prmH.Value = dir;
            prmH.Direction = ParameterDirection.Input;
            lstParametros.Add(prmH);

            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblProviders_Insert", transaccion))
                return Convert.ToInt32(prmA.Value);
            return -1;
        }

        public bool Actualizar(int codigo, string nm,  string rs, string phone, string email, string desc, string dir)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iProvider_id";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Output;
            lstParametros.Add(prmA);

            DbParameter prmB = new SqlParameter();
            prmB.DbType = DbType.String;
            prmB.ParameterName = "@sProvider_name";
            prmB.Value = nm;
            prmB.Direction = ParameterDirection.Input;
            lstParametros.Add(prmB);



            DbParameter prmD = new SqlParameter();
            prmD.DbType = DbType.String;
            prmD.ParameterName = "@sProvider_rs";
            prmD.Value = rs;
            prmD.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);
            ////
            DbParameter prmE = new SqlParameter();
            prmE.DbType = DbType.String;
            prmE.ParameterName = "@sProvider_phone";
            prmE.Value = phone;
            prmE.Direction = ParameterDirection.Input;
            lstParametros.Add(prmE);

            DbParameter prmF = new SqlParameter();
            prmF.DbType = DbType.String;
            prmF.ParameterName = "@sProvider_email";
            prmF.Value = email;
            prmF.Direction = ParameterDirection.Input;
            lstParametros.Add(prmF);

            DbParameter prmG = new SqlParameter();
            prmG.DbType = DbType.String;
            prmG.ParameterName = "@sProvider_desc";
            prmG.Value = desc;
            prmG.Direction = ParameterDirection.Input;
            lstParametros.Add(prmG);

            DbParameter prmH = new SqlParameter();
            prmH.DbType = DbType.String;
            prmH.ParameterName = "@sProvider_address";
            prmH.Value = dir;
            prmH.Direction = ParameterDirection.Input;
            lstParametros.Add(prmH);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblProviders_Update");
        }
        public bool Eliminar(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iProvider_id";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblProviders_DeleteRow");
        }

        public DataSet TraerProveedor()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            SQLConexion conProxy = new SQLConexion();
            // falta colocar el SP DE TRAER PROVEEDOR
            return conProxy.EjecutarConsulta(lstParametros, "dbo.TraerEmpleado");

        }

        public DataSet TraerProveedorXId(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iProvider_id";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblPrograms_SelectRow");
        }

    }
}
