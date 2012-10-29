using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
   public class DAOCostCenter
    {
    public int Insert(string sCostCente_name, string sCostCenter_desc, int iCostCenter_gestion)
            {
              List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmCC = new SqlParameter();
            prmCC.DbType = DbType.Int32;
            prmCC.ParameterName = "@iCostCenter_id";
            prmCC.Direction = ParameterDirection.Output;
            lstParametros.Add(prmCC);

            DbParameter prmsCostCente_name = new SqlParameter();
            prmsCostCente_name.DbType = DbType.String;
            prmsCostCente_name.ParameterName = "@sCostCente_name";
            prmsCostCente_name.Value = sCostCente_name;
            prmsCostCente_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsCostCente_name);
            
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
        public bool Update(int iCostCenter_id, string sCostCente_name, string sCostCenter_desc, int iCostCenter_gestion)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            DbParameter prmCC = new SqlParameter();
            prmCC.DbType = DbType.Int32;
            prmCC.ParameterName = "@iCostCenter_id";
            prmCC.Direction = ParameterDirection.Output;
            lstParametros.Add(prmCC);

            DbParameter prmsCostCente_name = new SqlParameter();
            prmsCostCente_name.DbType = DbType.String;
            prmsCostCente_name.ParameterName = "@sCostCente_name";
            prmsCostCente_name.Value = sCostCente_name;
            prmsCostCente_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsCostCente_name);
            
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
       public bool Delete(int iCostCenter_id)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmiCostCenter_id = new SqlParameter();
            prmiCostCenter_id.DbType = DbType.Int32;
            prmiCostCenter_id.ParameterName = "@iCostCenter_id";
            prmiCostCenter_id.Value = iCostCenter_id;
            prmiCostCenter_id.Direction = ParameterDirection.Input;
            lstParametros.Add(prmiCostCenter_id);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.DeleteCostCenter");
        }
        public DataSet SelectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.SelCostCenter");
        }
       }
}