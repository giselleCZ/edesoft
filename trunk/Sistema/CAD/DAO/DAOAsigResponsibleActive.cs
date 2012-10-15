using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOAsigResponsibleActive
    {
        public int Insert(
            string sConfirmed_desc,
            string sAsign_desc,
            bool bStatus,
            DateTime dtAsign_date,
            DateTime dtDevolution_date,
            bool bConfirmed,
            int iPerson_id,
            int iActive_id,
            SqlTransaction transaction)
            {
                List<DbParameter> lstParametros = new List<DbParameter>();
                DbParameter prmCod = new SqlParameter();
                prmCod.DbType = DbType.Int32;
                prmCod.ParameterName = "@id";
                prmCod.Direction = ParameterDirection.Output;
                lstParametros.Add(prmCod);

                DbParameter prmsConfirmed_desc = new SqlParameter();
                prmsConfirmed_desc.DbType = DbType.String;
                prmsConfirmed_desc.ParameterName = "@sConfirmed_desc";
                prmsConfirmed_desc.Value = sConfirmed_desc;
                prmsConfirmed_desc.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsConfirmed_desc);

                DbParameter prmsAsign_desc = new SqlParameter();
                prmsAsign_desc.DbType = DbType.String;
                prmsAsign_desc.ParameterName = "@sAsign_desc";
                prmsAsign_desc.Value = sAsign_desc;
                prmsAsign_desc.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsAsign_desc);

                DbParameter prmbStatus = new SqlParameter();
                prmbStatus.DbType = DbType.Boolean;
                prmbStatus.ParameterName = "@bStatus";
                prmbStatus.Value = bStatus;
                prmbStatus.Direction = ParameterDirection.Input;
                lstParametros.Add(prmbStatus);

                DbParameter prmdtAsign_date = new SqlParameter();
                prmdtAsign_date.DbType = DbType.DateTime;
                prmdtAsign_date.ParameterName = "@dtAsign_date";
                prmdtAsign_date.Value = dtAsign_date;
                prmdtAsign_date.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdtAsign_date);

                DbParameter prmdtDevolution_date = new SqlParameter();
                prmdtDevolution_date.DbType = DbType.DateTime;
                prmdtDevolution_date.ParameterName = "@dtDevolution_date";
                prmdtDevolution_date.Value = dtDevolution_date;
                prmdtDevolution_date.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdtDevolution_date);

                DbParameter prmbConfirmed = new SqlParameter();
                prmbConfirmed.DbType = DbType.Boolean;
                prmbConfirmed.ParameterName = "@bConfirmed";
                prmbConfirmed.Value = bConfirmed;
                prmbConfirmed.Direction = ParameterDirection.Input;
                lstParametros.Add(prmbConfirmed);

                DbParameter prmiPerson_id = new SqlParameter();
                prmiPerson_id.DbType = DbType.Int16;
                prmiPerson_id.ParameterName = "@iPerson_id";
                prmiPerson_id.Value = iPerson_id;
                prmiPerson_id.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiPerson_id);

                SQLConexion conProxy = new SQLConexion();
                if (conProxy.EjecutarDML(lstParametros, "dbo.sp_AsigResponsibleActive_Insert", transaction))
                    return Convert.ToInt32(prmCod.Value);
                return -1;

        }

        public DataSet selectRow(int iPerson_id, int iActive_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiPerson_id = new SqlParameter();
            prmiPerson_id.DbType = DbType.Int32;
            prmiPerson_id.ParameterName = "@iPerson_id";
            prmiPerson_id.Value = iPerson_id;
            prmiPerson_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiPerson_id);

            DbParameter prmiActive_id = new SqlParameter();
            prmiActive_id.DbType = DbType.Int32;
            prmiActive_id.ParameterName = "@iActive_id";
            prmiActive_id.Value = iActive_id;
            prmiActive_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiActive_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_AsigResponsibleActive_SelectRow");
        }

        public DataSet selectAll()
        {
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(null, "dbo.sp_AsigResponsibleActive_SelectAll");
        }

        public bool Update(int iPerson_id, int iActive_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiPerson_id = new SqlParameter();
            prmiPerson_id.DbType = DbType.Int32;
            prmiPerson_id.ParameterName = "@iPerson_id";
            prmiPerson_id.Value = iPerson_id;
            prmiPerson_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiPerson_id);

            DbParameter prmiActive_id = new SqlParameter();
            prmiActive_id.DbType = DbType.Int32;
            prmiActive_id.ParameterName = "@iActive_id";
            prmiActive_id.Value = iActive_id;
            prmiActive_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiActive_id);
            
            SQLConexion conProxy=new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_AsigResponsibleActive_Update");
        }

        public bool Delete(int iPerson_id, int iActive_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiPerson_id = new SqlParameter();
            prmiPerson_id.DbType = DbType.Int32;
            prmiPerson_id.ParameterName = "@iPerson_id";
            prmiPerson_id.Value = iPerson_id;
            prmiPerson_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiPerson_id);

            DbParameter prmiActive_id = new SqlParameter();
            prmiActive_id.DbType = DbType.Int32;
            prmiActive_id.ParameterName = "@iActive_id";
            prmiActive_id.Value = iActive_id;
            prmiActive_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiActive_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblAsigResponsibleActive_DeleteRow");
        }
    }
}
