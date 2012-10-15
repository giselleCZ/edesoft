using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOResponsible
    {
        public int Insert(
            string sPerson_name,
            string sPerson_lname,
            string sPerson_dni,
            string sPerson_phone,
            string sPerson_email,
            string sUsername,
            string sPassword,
            int iRol_id,
            DateTime dtStart_time,
            DateTime dtEnd_time,
            bool sStatus,
            SqlTransaction transaction)
            {
                List<DbParameter> lstParametros = new List<DbParameter>();
                DbParameter prmId = new SqlParameter();
                prmId.DbType = DbType.Int32;
                prmId.ParameterName = "@id";
                prmId.Direction = ParameterDirection.Output;
                lstParametros.Add(prmId);

                DbParameter prmsPerson_name = new SqlParameter();
                prmsPerson_name.DbType = DbType.String;
                prmsPerson_name.ParameterName = "@sPerson_name";
                prmsPerson_name.Value = sPerson_name;
                prmsPerson_name.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsPerson_name);

                DbParameter prmsStatus = new SqlParameter();
                prmsStatus.DbType = DbType.Binary;
                prmsStatus.ParameterName = "@sStatus";
                prmsStatus.Value = sStatus;
                prmsStatus.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsStatus);

                DbParameter prmsPerson_dni = new SqlParameter();
                prmsPerson_dni.DbType = DbType.String;
                prmsPerson_dni.ParameterName = "@sPerson_dni";
                prmsPerson_dni.Value = sPerson_dni;
                prmsPerson_dni.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsPerson_dni);

                DbParameter prmsPerson_phone = new SqlParameter();
                prmsPerson_phone.DbType = DbType.String;
                prmsPerson_phone.ParameterName = "@sPerson_phone";
                prmsPerson_phone.Value = sPerson_phone;
                prmsPerson_phone.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsPerson_phone);

                DbParameter prmsPerson_email = new SqlParameter();
                prmsPerson_email.DbType = DbType.String;
                prmsPerson_email.ParameterName = "@sPerson_email";
                prmsPerson_email.Value = sPerson_email;
                prmsPerson_email.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsPerson_email);

                DbParameter prmsUsername = new SqlParameter();
                prmsUsername.DbType = DbType.String;
                prmsUsername.ParameterName = "@sUsername";
                prmsUsername.Value = sUsername;
                prmsUsername.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsUsername);

                DbParameter prmiRol_id = new SqlParameter();
                prmiRol_id.DbType = DbType.Int32;
                prmiRol_id.ParameterName = "@iRol_id";
                prmiRol_id.Value = iRol_id;
                prmiRol_id.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiRol_id);

                DbParameter prmdtStart_time = new SqlParameter();
                prmdtStart_time.DbType = DbType.DateTime;
                prmdtStart_time.ParameterName = "@dtStart_time";
                prmdtStart_time.Value = dtStart_time;
                prmdtStart_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdtStart_time);

                DbParameter prmdtEnd_time = new SqlParameter();
                prmdtEnd_time.DbType = DbType.Int32;
                prmdtEnd_time.ParameterName = "@dtEnd_time";
                prmdtEnd_time.Value = dtEnd_time;
                prmdtEnd_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdtEnd_time);

                SQLConexion conProxy = new SQLConexion();
                if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblResponsibles_Insert", transaction))
                    return Convert.ToInt32(prmId.Value);
                return -1;

        }

        public DataSet selectRow(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iResponsible_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblResponsibles_SelectRow");
        }

        public DataSet selectAll()
        {
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(null, "dbo.sp_tblResponsibles_SelectAll");
        }

        public bool Update(int codigo)
        {
            List<DbParameter> lstParametros =new List<DbParameter>();
            
            DbParameter prmId= new SqlParameter();
            prmId.DbType= DbType.Int32;
            prmId.ParameterName = "@iResponsible_id";
            prmId.Value= codigo;
            prmId.Direction=ParameterDirection.Input;
            lstParametros.Add(prmId);
            
            SQLConexion conProxy=new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblResponsibles_Update");
        }

        public bool Delete(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iResponsibles_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblResponsibles_DeleteRow");
        }
    }
}
