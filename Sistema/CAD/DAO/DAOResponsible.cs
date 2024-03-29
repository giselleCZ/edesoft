﻿using System;
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
            int sStatus)
            {
                List<DbParameter> lstParametros = new List<DbParameter>();
                DbParameter prmId = new SqlParameter();
                prmId.DbType = DbType.Int32;
                prmId.ParameterName = "@id";
                prmId.Direction = ParameterDirection.Output;
                lstParametros.Add(prmId);

                DbParameter prmsPerson_lname = new SqlParameter();
                prmsPerson_lname.DbType = DbType.String;
                prmsPerson_lname.ParameterName = "@sPerson_lname";
                prmsPerson_lname.Value = sPerson_lname;
                prmsPerson_lname.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsPerson_lname);

                DbParameter prmsPerson_name = new SqlParameter();
                prmsPerson_name.DbType = DbType.String;
                prmsPerson_name.ParameterName = "@sPerson_name";
                prmsPerson_name.Value = sPerson_name;
                prmsPerson_name.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsPerson_name);

                DbParameter prmsStatus = new SqlParameter();
                prmsStatus.DbType = DbType.Int32;
                prmsStatus.ParameterName = "@sStatus";
                prmsStatus.Value = Convert.ToInt32(sStatus);
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

                DbParameter prmsPassword = new SqlParameter();
                prmsPassword.DbType = DbType.String;
                prmsPassword.ParameterName = "@sPassword";
                prmsPassword.Value = sPassword;
                prmsPassword.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsPassword);

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
                prmdtEnd_time.DbType = DbType.DateTime;
                prmdtEnd_time.ParameterName = "@dtEnd_time";
                prmdtEnd_time.Value = dtEnd_time;
                prmdtEnd_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdtEnd_time);

                SQLConexion conProxy = new SQLConexion();
                if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblResponsibles_Insert"))
                    return Convert.ToInt32(prmId.Value);
                return -1;

        }

        public DataSet selectByName(string sPerson_name)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.String;
            prmId.ParameterName = "@sPerson_name";
            prmId.Value = sPerson_name;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblResponsibles_SelectByName");
        }

        public DataSet selectByLName(string sPerson_lname)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.String;
            prmId.ParameterName = "@sPerson_lname";
            prmId.Value = sPerson_lname;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblResponsibles_SelectByLName");
        }

        public DataSet selectByUsername(string usrnm)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.String;
            prmId.ParameterName = "@sUsername";
            prmId.Value = usrnm;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblResponsibles_SelectByUsername");
        }

        public DataSet selectRow(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iPerson_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblResponsibles_SelectRow");
        }

        public DataSet selectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblResponsibles_SelectAll");
        }

        public bool Update(int iResponsible_id,
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
            int sStatus)
        {
            List<DbParameter> lstParametros =new List<DbParameter>();
            
            DbParameter prmId= new SqlParameter();
            prmId.DbType= DbType.Int32;
            prmId.ParameterName = "@iPerson_id";
            prmId.Value= iResponsible_id;
            prmId.Direction=ParameterDirection.Input;
            lstParametros.Add(prmId);

            DbParameter prmsPerson_lname = new SqlParameter();
            prmsPerson_lname.DbType = DbType.String;
            prmsPerson_lname.ParameterName = "@sPerson_lname";
            prmsPerson_lname.Value = sPerson_lname;
            prmsPerson_lname.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsPerson_lname);

            DbParameter prmsPerson_name = new SqlParameter();
            prmsPerson_name.DbType = DbType.String;
            prmsPerson_name.ParameterName = "@sPerson_name";
            prmsPerson_name.Value = sPerson_name;
            prmsPerson_name.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsPerson_name);

            DbParameter prmsStatus = new SqlParameter();
            prmsStatus.DbType = DbType.Int32;
            prmsStatus.ParameterName = "@sStatus";
            prmsStatus.Value = Convert.ToInt32(sStatus);
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

            DbParameter prmsPassword = new SqlParameter();
            prmsPassword.DbType = DbType.String;
            prmsPassword.ParameterName = "@sPassword";
            prmsPassword.Value = sPassword;
            prmsPassword.Direction = ParameterDirection.Input;
            lstParametros.Add(prmsPassword);

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
            prmdtEnd_time.DbType = DbType.DateTime;
            prmdtEnd_time.ParameterName = "@dtEnd_time";
            prmdtEnd_time.Value = dtEnd_time;
            prmdtEnd_time.Direction = ParameterDirection.Input;
            lstParametros.Add(prmdtEnd_time);

            SQLConexion conProxy=new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblResponsibles_Update");
        }

        public bool Delete(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iPerson_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblResponsibles_DeleteRow");
        }
    }
}
