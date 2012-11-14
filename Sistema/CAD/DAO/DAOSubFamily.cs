using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOSubFamily
    {
        public int Insert(
            int iFamily_id,
            string sSubFamily_name,
            string sSubFamily_desc)
            {
                List<DbParameter> lstParametros = new List<DbParameter>();
                DbParameter prmId = new SqlParameter();
                prmId.DbType = DbType.Int32;
                prmId.ParameterName = "@id";
                prmId.Direction = ParameterDirection.Output;
                lstParametros.Add(prmId);

                DbParameter prmsSubFamily_name = new SqlParameter();
                prmsSubFamily_name.DbType = DbType.String;
                prmsSubFamily_name.ParameterName = "@sSubFamily_name";
                prmsSubFamily_name.Value = sSubFamily_name;
                prmsSubFamily_name.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsSubFamily_name);

                DbParameter prmsSubFamily_desc = new SqlParameter();
                prmsSubFamily_desc.DbType = DbType.String;
                prmsSubFamily_desc.ParameterName = "@sSubFamily_desc";
                prmsSubFamily_desc.Value = sSubFamily_desc;
                prmsSubFamily_desc.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsSubFamily_desc);

                DbParameter prmiFamily_id = new SqlParameter();
                prmiFamily_id.DbType = DbType.Int32;
                prmiFamily_id.ParameterName = "@iFamily_id";
                prmiFamily_id.Value = Convert.ToInt32(iFamily_id);
                prmiFamily_id.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiFamily_id);

                SQLConexion conProxy = new SQLConexion();
                if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblSubFamilies_Insert"))
                    return Convert.ToInt32(prmId.Value);
                return -1;

        }

        public DataSet selectByName(string sSubFamily_name)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.String;
            prmId.ParameterName = "@sSubFamily_name";
            prmId.Value = sSubFamily_name;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblSubFamilies_SelectByName");
        }

        public DataSet selectRow(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iSubFamily_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblSubFamilies_SelectRow");
        }

        public DataSet selectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblSubFamilies_SelectAll");
        }

        public bool Update(int iSubFamily_id,
            int iFamily_id,
            string sSubFamily_name,
            string sSubFamily_desc)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmiSubFamily_id = new SqlParameter();
            prmiSubFamily_id.DbType = DbType.Int32;
            prmiSubFamily_id.ParameterName = "@iSubFamily_id";
            prmiSubFamily_id.Value = Convert.ToInt32(iSubFamily_id);
            prmiSubFamily_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiSubFamily_id);

            DbParameter prmsSubFamily_name = new SqlParameter();
            prmsSubFamily_name.DbType = DbType.String;
            prmsSubFamily_name.ParameterName = "@sSubFamily_name";
            prmsSubFamily_name.Value = sSubFamily_name;
            prmsSubFamily_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsSubFamily_name);

            DbParameter prmsSubFamily_desc = new SqlParameter();
            prmsSubFamily_desc.DbType = DbType.String;
            prmsSubFamily_desc.ParameterName = "@sSubFamily_desc";
            prmsSubFamily_desc.Value = sSubFamily_desc;
            prmsSubFamily_desc.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsSubFamily_desc);

            DbParameter prmiFamily_id = new SqlParameter();
            prmiFamily_id.DbType = DbType.Int32;
            prmiFamily_id.ParameterName = "@iFamily_id";
            prmiFamily_id.Value = Convert.ToInt32(iFamily_id);
            prmiFamily_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiFamily_id);

            SQLConexion conProxy=new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblSubFamilies_Update");
        }

        public bool Delete(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iSubFamilies_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblSubFamilies_DeleteRow");
        }
    }
}
