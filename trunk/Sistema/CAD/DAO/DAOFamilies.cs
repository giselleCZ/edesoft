using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;
namespace CAD.DAO
{
    public class DAOFamilies
    {
        public int Insert(string sFamily_name, string sFamily_desc, int iDepreciation_time)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmiFamily_id = new SqlParameter();
            prmiFamily_id.DbType = DbType.Int32;
            prmiFamily_id.ParameterName = "@iFamily_id";
            prmiFamily_id.Direction = ParameterDirection.Output;
            lstParametros.Add(prmiFamily_id);

            DbParameter prmsFamily_name = new SqlParameter();
            prmsFamily_name.DbType = DbType.String;
            prmsFamily_name.ParameterName = "@sFamily_name";
            prmsFamily_name.Value = sFamily_name;
            prmsFamily_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsFamily_name);

            DbParameter prmsFamily_desc = new SqlParameter();
            prmsFamily_desc.DbType = DbType.String;
            prmsFamily_desc.ParameterName = "@sFamily_desc";
            prmsFamily_desc.Value = sFamily_desc;
            prmsFamily_desc.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsFamily_desc);

            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblFamilies_Insert"))
                return Convert.ToInt32(prmiFamily_id.Value);
            return -1;

        }
        public bool Update(int iFamily_id, string sFamily_name, string sFamily_desc, int iDepreciation_time)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmiFamily_id = new SqlParameter();
            prmiFamily_id.DbType = DbType.Int32;
            prmiFamily_id.ParameterName = "@iFamily_id";
            prmiFamily_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiFamily_id);

            DbParameter prmsFamily_name = new SqlParameter();
            prmsFamily_name.DbType = DbType.String;
            prmsFamily_name.ParameterName = "@sFamily_name";
            prmsFamily_name.Value = sFamily_name;
            prmsFamily_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsFamily_name);

            DbParameter prmsFamily_desc = new SqlParameter();
            prmsFamily_desc.DbType = DbType.String;
            prmsFamily_desc.ParameterName = "@sFamily_desc";
            prmsFamily_desc.Value = sFamily_desc;
            prmsFamily_desc.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsFamily_desc);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblFamilies_Update");

        }

        public bool Delete(int iFamily_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiFamily_id = new SqlParameter();
            prmiFamily_id.DbType = DbType.Int32;
            prmiFamily_id.ParameterName = "@iFamily_id";
            prmiFamily_id.Value = iFamily_id;
            prmiFamily_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiFamily_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblFamilies_DeleteRow");
        }
        public DataSet SelectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblFamilies_SelectAll");
        }
        public DataSet SelectRow(int iFamily_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiFamily_id = new SqlParameter();
            prmiFamily_id.DbType = DbType.Int32;
            prmiFamily_id.ParameterName = "@iFamily_id";
            prmiFamily_id.Value = iFamily_id;
            prmiFamily_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiFamily_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblFamilies_SelectRow");
        }
    }
}
