using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;

namespace CAD.DAO
{
    public class DAORol
    {
        public int Insert(string sRol_name, bool bStatus)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iRol_id";
            prmA.Direction = ParameterDirection.Output;
            lstParametros.Add(prmA);

            DbParameter prmsRol_name = new SqlParameter();
            prmsRol_name.DbType = DbType.String;
            prmsRol_name.ParameterName = "@sRol_name";
            prmsRol_name.Value = sRol_name;
            prmsRol_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsRol_name);
            
            DbParameter prmbStatus = new SqlParameter();
            prmbStatus.DbType = DbType.Boolean;
            prmbStatus.ParameterName = "@bStatus";
            prmbStatus.Value = bStatus;
            prmbStatus.Direction = ParameterDirection.Input;
            lstParametros.Add(prmbStatus);


            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblRols_Insert"))
                return Convert.ToInt32(prmA.Value);
            return -1;

        }
        public bool Update(int iRol_id, string sRol_name, bool bStatus)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iRol_id";
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            DbParameter prmsRol_name = new SqlParameter();
            prmsRol_name.DbType = DbType.String;
            prmsRol_name.ParameterName = "@sRol_name";
            prmsRol_name.Value = sRol_name;
            prmsRol_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsRol_name);

            DbParameter prmbStatus = new SqlParameter();
            prmbStatus.DbType = DbType.Boolean;
            prmbStatus.ParameterName = "@bStatus";
            prmbStatus.Value = bStatus;
            prmbStatus.Direction = ParameterDirection.Input;
            lstParametros.Add(prmbStatus);


            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblRols_Update");
        }
        public bool Delete(int iRol_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiRol_id = new SqlParameter();
            prmiRol_id.DbType = DbType.Int32;
            prmiRol_id.ParameterName = "@iRol_id";
            prmiRol_id.Value = iRol_id;
            prmiRol_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiRol_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblRols_DeleteRow");
        }
        public DataSet SelectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblRols_SelectAll");
        }
        public DataSet SelectRow(int iRol_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiRol_id = new SqlParameter();
            prmiRol_id.DbType = DbType.Int32;
            prmiRol_id.ParameterName = "@iRol_id";
            prmiRol_id.Value = iRol_id;
            prmiRol_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiRol_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblRols_SelectRow");
        }
    }
}
