using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAORespCostCenter
    {
        public int Insert(
            int iResponsible_id,
            int iCostCenter_id,
            int iPercent,
            DateTime dtAsignation_time)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmiResponsible_id = new SqlParameter();
            prmiResponsible_id.DbType = DbType.Int32;
            prmiResponsible_id.ParameterName = "@iResponsible_id";
            prmiResponsible_id.Value = Convert.ToInt32(iResponsible_id);
            prmiResponsible_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiResponsible_id);

            DbParameter prmiCostCenter_id = new SqlParameter();
            prmiCostCenter_id.DbType = DbType.Int32;
            prmiCostCenter_id.ParameterName = "@iCostCenter_id";
            prmiCostCenter_id.Value = Convert.ToInt32(iCostCenter_id);
            prmiCostCenter_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_id);

            DbParameter prmiPercent = new SqlParameter();
            prmiPercent.DbType = DbType.Int32;
            prmiPercent.ParameterName = "@iPercent";
            prmiPercent.Value = Convert.ToInt32(iPercent);
            prmiPercent.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiPercent);

            DbParameter prmdtAsignation_time = new SqlParameter();
            prmdtAsignation_time.DbType = DbType.DateTime;
            prmdtAsignation_time.ParameterName = "@dtAsignation_time";
            prmdtAsignation_time.Value = dtAsignation_time;
            prmdtAsignation_time.Direction = ParameterDirection.Input;
            lstParametros.Add(prmdtAsignation_time);

            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblPeopleCostCenters_Insert"))
                return 1;
            return -1;

        }

        public DataSet selectRow(
            int iResponsible_id,
            int iCostCenter_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmiResponsible_id = new SqlParameter();
            prmiResponsible_id.DbType = DbType.Int32;
            prmiResponsible_id.ParameterName = "@iResponsible_id";
            prmiResponsible_id.Value = Convert.ToInt32(iResponsible_id);
            prmiResponsible_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiResponsible_id);

            DbParameter prmiCostCenter_id = new SqlParameter();
            prmiCostCenter_id.DbType = DbType.Int32;
            prmiCostCenter_id.ParameterName = "@iCostCenter_id";
            prmiCostCenter_id.Value = Convert.ToInt32(iCostCenter_id);
            prmiCostCenter_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblPeopleCostCenters_SelectRow");
        }

        public DataSet selectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblPeopleCostCenters_SelectAll");
        }

        public int Update(
            int iResponsible_id,
            int iCostCenter_id,
            int iPercent,
            DateTime dtAsignation_time)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmiResponsible_id = new SqlParameter();
            prmiResponsible_id.DbType = DbType.Int32;
            prmiResponsible_id.ParameterName = "@iResponsible_id";
            prmiResponsible_id.Value = Convert.ToInt32(iResponsible_id);
            prmiResponsible_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiResponsible_id);

            DbParameter prmiCostCenter_id = new SqlParameter();
            prmiCostCenter_id.DbType = DbType.Int32;
            prmiCostCenter_id.ParameterName = "@iCostCenter_id";
            prmiCostCenter_id.Value = Convert.ToInt32(iCostCenter_id);
            prmiCostCenter_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_id);

            DbParameter prmiPercent = new SqlParameter();
            prmiPercent.DbType = DbType.Int32;
            prmiPercent.ParameterName = "@iPercent";
            prmiPercent.Value = Convert.ToInt32(iPercent);
            prmiPercent.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiPercent);

            DbParameter prmdtAsignation_time = new SqlParameter();
            prmdtAsignation_time.DbType = DbType.DateTime;
            prmdtAsignation_time.ParameterName = "@dtAsignation_time";
            prmdtAsignation_time.Value = dtAsignation_time;
            prmdtAsignation_time.Direction = ParameterDirection.Input;
            lstParametros.Add(prmdtAsignation_time);

            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblPeopleCostCenters_Update"))
                return 1;
            return -1;

        }

        public bool Delete(
            int iResponsible_id,
            int iCostCenter_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmiResponsible_id = new SqlParameter();
            prmiResponsible_id.DbType = DbType.Int32;
            prmiResponsible_id.ParameterName = "@iResponsible_id";
            prmiResponsible_id.Value = Convert.ToInt32(iResponsible_id);
            prmiResponsible_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiResponsible_id);

            DbParameter prmiCostCenter_id = new SqlParameter();
            prmiCostCenter_id.DbType = DbType.Int32;
            prmiCostCenter_id.ParameterName = "@iCostCenter_id";
            prmiCostCenter_id.Value = Convert.ToInt32(iCostCenter_id);
            prmiCostCenter_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblPeopleCostCenters_DeleteRow");
        }
    }
}
