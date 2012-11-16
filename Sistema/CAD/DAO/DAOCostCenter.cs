using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOCostCenter
    {
        public int Insert(string sCostCenter_name, string sCostCenter_desc, int iCostCenter_gestion)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmCC = new SqlParameter();
            prmCC.DbType = DbType.Int32;
            prmCC.ParameterName = "@iCostCenter_id";
            prmCC.Direction = ParameterDirection.Output;
            lstParametros.Add(prmCC);

            DbParameter prmsCostCenter_name = new SqlParameter();
            prmsCostCenter_name.DbType = DbType.String;
            prmsCostCenter_name.ParameterName = "@sCostCenter_name";
            prmsCostCenter_name.Value = sCostCenter_name;
            prmsCostCenter_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsCostCenter_name);

            DbParameter prmsCostCenter_desc = new SqlParameter();
            prmsCostCenter_desc.DbType = DbType.String;
            prmsCostCenter_desc.ParameterName = "@sCostCenter_desc";
            prmsCostCenter_desc.Value = sCostCenter_desc;
            prmsCostCenter_desc.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsCostCenter_desc);

            DbParameter prmiCostCenter_gestion = new SqlParameter();
            prmiCostCenter_gestion.DbType = DbType.Int16;
            prmiCostCenter_gestion.ParameterName = "@iCostCenter_gestion";
            prmiCostCenter_gestion.Value = iCostCenter_gestion;
            prmiCostCenter_gestion.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_gestion);


            SQLConexion conProxy = new SQLConexion();
            if (conProxy.EjecutarDML(lstParametros, "dbo.InsCostCenter"))
                return Convert.ToInt32(prmCC.Value);
            return -1;

        }
        public bool Update(int iCostCenter_id, string sCostCenter_name, string sCostCenter_desc, int iCostCenter_gestion)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmCC = new SqlParameter();
            prmCC.DbType = DbType.Int32;
            prmCC.ParameterName = "@iCostCenter_id";
            prmCC.Value = iCostCenter_id;
            prmCC.Direction = ParameterDirection.Input;
            lstParametros.Add(prmCC);

            DbParameter prmsCostCenter_name = new SqlParameter();
            prmsCostCenter_name.DbType = DbType.String;
            prmsCostCenter_name.ParameterName = "@sCostCenter_name";
            prmsCostCenter_name.Value = sCostCenter_name;
            prmsCostCenter_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsCostCenter_name);

            DbParameter prmsCostCenter_desc = new SqlParameter();
            prmsCostCenter_desc.DbType = DbType.String;
            prmsCostCenter_desc.ParameterName = "@sCostCenter_desc";
            prmsCostCenter_desc.Value = sCostCenter_desc;
            prmsCostCenter_desc.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsCostCenter_desc);



            DbParameter prmiCostCenter_gestion = new SqlParameter();
            prmiCostCenter_gestion.DbType = DbType.Int16;
            prmiCostCenter_gestion.ParameterName = "@iCostCenter_gestion";
            prmiCostCenter_gestion.Value = iCostCenter_gestion;
            prmiCostCenter_gestion.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_gestion);


            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.ActCostCenter");
        }
        public bool Eliminar(int iCostCenter_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiCostCenter_id = new SqlParameter();
            prmiCostCenter_id.DbType = DbType.Int32;
            prmiCostCenter_id.ParameterName = "@iCostCenter_id";
            prmiCostCenter_id.Value = iCostCenter_id;
            prmiCostCenter_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_id);

            /*   DbParameter prmDe = new SqlParameter();
               prmDe.DbType = DbType.Int32;
               prmDe.ParameterName = "@iEvento";
               prmDe.Value = 3;
               prmDe.Direction = ParameterDirection.Input;
               lstParametros.Add(prmDe);*/
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.DeleteCostCenter");
        }
        public DataSet SelectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.SelCostCenter");
        }
        public DataSet TraerCentrodeCostosXId(int iCostCenter_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iCostCenter_id";
            prmA.Value = iCostCenter_id;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            DbParameter prmD = new SqlParameter();
            prmD.DbType = DbType.Int32;
            prmD.ParameterName = "@iEvento";
            prmD.Value = 5;
            prmD.Direction = ParameterDirection.Input;
            lstParametros.Add(prmD);
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.TraerCostCenterXId");
        }
    }
}
    


