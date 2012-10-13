using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOFactura
    {
        public int Insertar(string sActive_name,
            string sStatus, int iSubFamily_id,
            int iProvider_id,
            string sBarcode,
            DateTime dRegister_time,
            int iUtilTime,
            string sBrand,
            string sModel,
            string sForm,
            string sSerialNumber,
            string sColor,
            string sCapacity,
            string sMaterial,
            double iHeihgt,
            double iWidth,
            double iWide,
            double iDiameter,
            string sUnit,
            int iDivNumber,
            string sAsign_type,
            string sAcquisition_type,
            DateTime dtBuy_time,
            double iBuy_price,
            bool bInActive)
            {
                List<DbParameter> lstParametros = new List<DbParameter>();
                DbParameter prmCod = new SqlParameter();
                prmCod.DbType = DbType.Int32;
                prmCod.ParameterName = "@codigo";
                prmCod.Direction = ParameterDirection.Output;
                lstParametros.Add(prmCod);

                DbParameter prmsActive_name = new SqlParameter();
                prmsActive_name.DbType = DbType.String;
                prmsActive_name.ParameterName = "@sActive_name";
                prmsActive_name.Value = sActive_name;
                prmsActive_name.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsActive_name);

                DbParameter prmsStatus = new SqlParameter();
                prmsStatus.DbType = DbType.String;
                prmsStatus.ParameterName = "@sStatus";
                prmsStatus.Value = sStatus;
                prmsStatus.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsStatus);

                DbParameter prmiSubFamily_id = new SqlParameter();
                prmiSubFamily_id.DbType = DbType.Int16;
                prmiSubFamily_id.ParameterName = "@iSubFamily_id";
                prmiSubFamily_id.Value = iSubFamily_id;
                prmiSubFamily_id.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiSubFamily_id);

                DbParameter prmiProvider_id = new SqlParameter();
                prmiProvider_id.DbType = DbType.Int16;
                prmiProvider_id.ParameterName = "@iProvider_id";
                prmiProvider_id.Value = iProvider_id;
                prmiProvider_id.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiProvider_id);

                DbParameter prmsBarcode = new SqlParameter();
                prmsBarcode.DbType = DbType.String;
                prmsBarcode.ParameterName = "@sBarcode";
                prmsBarcode.Value = sBarcode;
                prmsBarcode.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsBarcode);

                DbParameter prmdRegister_time = new SqlParameter();
                prmdRegister_time.DbType = DbType.DateTime;
                prmdRegister_time.ParameterName = "@dRegister_time";
                prmdRegister_time.Value = dRegister_time;
                prmdRegister_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdRegister_time);

                DbParameter prmiUtilTime = new SqlParameter();
                prmiUtilTime.DbType = DbType.Int32;
                prmiUtilTime.ParameterName = "@iUtilTime";
                prmiUtilTime.Value = iUtilTime;
                prmiUtilTime.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiUtilTime);

                DbParameter prmsBrand = new SqlParameter();
                prmsBrand.DbType = DbType.String;
                prmsBrand.ParameterName = "@sBrand";
                prmsBrand.Value = sBrand;
                prmsBrand.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsBrand);

                DbParameter prmsModel = new SqlParameter();
                prmsModel.DbType = DbType.String;
                prmsModel.ParameterName = "@sModel";
                prmsModel.Value = sModel;
                prmsModel.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsModel);

                DbParameter prmsForm = new SqlParameter();
                prmsForm.DbType = DbType.String;
                prmsForm.ParameterName = "@sForm";
                prmsForm.Value = sForm;
                prmsForm.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsForm);

                DbParameter prmsSerialNumber = new SqlParameter();
                prmsSerialNumber.DbType = DbType.String;
                prmsSerialNumber.ParameterName = "@sSerialNumber";
                prmsSerialNumber.Value = sSerialNumber;
                prmsSerialNumber.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsSerialNumber);

                DbParameter prmsColor = new SqlParameter();
                prmsColor.DbType = DbType.String;
                prmsColor.ParameterName = "@sColor";
                prmsColor.Value = sColor;
                prmsColor.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsColor);

                DbParameter prmsCapacity = new SqlParameter();
                prmsCapacity.DbType = DbType.String;
                prmsCapacity.ParameterName = "@sCapacity";
                prmsCapacity.Value = sCapacity;
                prmsCapacity.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsCapacity);

                DbParameter prmsMaterial = new SqlParameter();
                prmsMaterial.DbType = DbType.String;
                prmsMaterial.ParameterName = "@sMaterial";
                prmsMaterial.Value = sMaterial;
                prmsMaterial.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsMaterial);

                DbParameter prmiHeihgt = new SqlParameter();
                prmiHeihgt.DbType = DbType.Int16;
                prmiHeihgt.ParameterName = "@iHeihgt";
                prmiHeihgt.Value = iHeihgt;
                prmiHeihgt.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiHeihgt);

                DbParameter prmiWidth = new SqlParameter();
                prmiWidth.DbType = DbType.Int16;
                prmiWidth.ParameterName = "@iWidth";
                prmiWidth.Value = iWidth;
                prmiWidth.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiWidth);

                DbParameter prmsColor = new SqlParameter();
                prmsColor.DbType = DbType.String;
                prmsColor.ParameterName = "@sColor";
                prmsColor.Value = sColor;
                prmsColor.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsColor);





                SQLConexion conProxy = new SQLConexion();
                if (conProxy.EjecutarDML(lstParametros, "dbo.InsertFactura", transaccion))
                    return Convert.ToInt32(prmA.Value);
                return -1;

            }
        public DataSet TraerFacturaXId(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@codigo";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.TraerFactura");
        }        
    }
}
