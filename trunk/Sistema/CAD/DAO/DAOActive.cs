using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace CAD.DAO
{
    public class DAOActive
    {


        public int Insert(
            string sActive_name,
            int iSubFamily_id,
            int iProvider_id,
            string sActive_desc,
            string sBarcode,
            DateTime dRegister_time,
            DateTime iUtilTime,
            string sBrand,
            string sModel,
            string sForm,
            string sSerialNumber,
            string sColor,
            string sCapacity,
            string sMaterial,
            decimal iHeihgt,
            decimal iWidth,
            decimal iWide,
            decimal iDiameter,
            string sUnit,
            int iDivNumber,
            string sAsign_type,
            string sAquisition_type,
            DateTime dtBuy_time,
            decimal iBuy_price,
            bool sStatus
            )
            {
                List<DbParameter> lstParametros = new List<DbParameter>();
            
                DbParameter prmCod = new SqlParameter();
                prmCod.DbType = DbType.Int32;
                prmCod.ParameterName = "@iActive_id";
                prmCod.Direction = ParameterDirection.Output;
                lstParametros.Add(prmCod);

                DbParameter prmsActive_name = new SqlParameter();
                prmsActive_name.DbType = DbType.String;
                prmsActive_name.ParameterName = "@sActive_name";
                prmsActive_name.Value = sActive_name;
                prmsActive_name.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsActive_name);

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

                DbParameter prmsUnit = new SqlParameter();
                prmsUnit.DbType = DbType.String;
                prmsUnit.ParameterName = "@sUnit";
                prmsUnit.Value = sUnit;
                prmsUnit.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsUnit);

                DbParameter prmsAsign_type = new SqlParameter();
                prmsAsign_type.DbType = DbType.String;
                prmsAsign_type.ParameterName = "@sAsign_type";
                prmsAsign_type.Value = sAsign_type;
                prmsAsign_type.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsAsign_type);

                DbParameter prmsAquisition_type = new SqlParameter();
                prmsAquisition_type.DbType = DbType.String;
                prmsAquisition_type.ParameterName = "@sAcquisition_type";
                prmsAquisition_type.Value = sAquisition_type;
                prmsAquisition_type.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsAquisition_type);
            
                DbParameter prmsStatus = new SqlParameter();
                prmsStatus.DbType = DbType.Boolean;
                prmsStatus.ParameterName = "@sStatus";
                prmsStatus.Value = sStatus;
                prmsStatus.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsStatus);

                DbParameter prmsActive_desc = new SqlParameter();
                prmsActive_desc.DbType = DbType.String;
                prmsActive_desc.ParameterName = "@sActive_desc";
                prmsActive_desc.Value = sActive_desc;
                prmsActive_desc.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsActive_desc);

                DbParameter prmdRegister_time = new SqlParameter();
                prmdRegister_time.DbType = DbType.DateTime;
                prmdRegister_time.ParameterName = "@dRegister_time";
                prmdRegister_time.Value = dRegister_time;
                prmdRegister_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdRegister_time);

                DbParameter prmiUtilTime = new SqlParameter();
                prmiUtilTime.DbType = DbType.DateTime;
                prmiUtilTime.ParameterName = "@iUtilTime";
                prmiUtilTime.Value = iUtilTime;
                prmiUtilTime.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiUtilTime);

                DbParameter prmdtBuy_time = new SqlParameter();
                prmdtBuy_time.DbType = DbType.DateTime;
                prmdtBuy_time.ParameterName = "@dtBuy_time";
                prmdtBuy_time.Value = dtBuy_time;
                prmdtBuy_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdtBuy_time);

                DbParameter prmiHeihgt = new SqlParameter();
                prmiHeihgt.DbType = DbType.Decimal;
                prmiHeihgt.ParameterName = "@iHeihgt";
                prmiHeihgt.Value = iHeihgt;
           
                prmiHeihgt.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiHeihgt);

                DbParameter prmiWidth = new SqlParameter();
                prmiWidth.DbType = DbType.Decimal;
                prmiWidth.ParameterName = "@iWidth";
                prmiWidth.Value = iWidth;
                prmiWidth.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiWidth);

                DbParameter prmiWide = new SqlParameter();
                prmiWide.DbType = DbType.Decimal;
                prmiWide.ParameterName = "@iWide";
                prmiWide.Value = iWide;
                prmiWide.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiWide);

                DbParameter prmiDiameter = new SqlParameter();
                prmiDiameter.DbType = DbType.Decimal;
                prmiDiameter.ParameterName = "@iDiameter";
                prmiDiameter.Value = iDiameter;
                prmiDiameter.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiDiameter);

                DbParameter prmiBuy_price = new SqlParameter();
                prmiBuy_price.DbType = DbType.Decimal;
                prmiBuy_price.ParameterName = "@iBuy_price";
                prmiBuy_price.Value = iBuy_price;
                prmiBuy_price.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiBuy_price);

                DbParameter prmiDivNumber = new SqlParameter();
                prmiDivNumber.DbType = DbType.Int32;
                prmiDivNumber.ParameterName = "@iDivNumber";
                prmiDivNumber.Value = iDivNumber;
                prmiDivNumber.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiDivNumber);

                SQLConexion conProxy = new SQLConexion();
                if (conProxy.EjecutarDML(lstParametros, "dbo.sp_tblActives_Insert"))
                    return Convert.ToInt32(prmCod.Value);
                return -1;

        }

        public DataSet selectRow(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iActive_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblActives_SelectRow");
        }

        public DataSet selectByName(string name)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmName = new SqlParameter();
            prmName.DbType = DbType.String;
            prmName.ParameterName = "@sActive_name";
            prmName.Value = name;
            prmName.Direction = ParameterDirection.Input;
            lstParametros.Add(prmName);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblActives_SelectByName");
        }

        public DataSet selectAll()
        {
            List<DbParameter> lstParametros = new List<DbParameter>();
            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblActives_SelectAll");
        }

        public bool Update( 
            int iActive_id,
            string sActive_name,
            int iSubFamily_id,
            int iProvider_id,
            string sActive_desc,
            string sBarcode,
            DateTime dRegister_time,
            DateTime iUtilTime,
            string sBrand,
            string sModel,
            string sForm,
            string sSerialNumber,
            string sColor,
            string sCapacity,
            string sMaterial,
            decimal iHeihgt,
            decimal iWidth,
            decimal iWide,
            decimal iDiameter,
            string sUnit,
            int iDivNumber,
            string sAsign_type,
            string sAquisition_type,
            DateTime dtBuy_time,
            decimal iBuy_price,
            bool sStatus)
            {
                List<DbParameter> lstParametros = new List<DbParameter>();

                DbParameter prmiActive_id = new SqlParameter();
                prmiActive_id.DbType = DbType.Int32;
                prmiActive_id.ParameterName = "@iActive_id";
                prmiActive_id.Value = iActive_id;
                prmiActive_id.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiActive_id);


                DbParameter prmsActive_name = new SqlParameter();
                prmsActive_name.DbType = DbType.String;
                prmsActive_name.ParameterName = "@sActive_name";
                prmsActive_name.Value = sActive_name;
                prmsActive_name.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsActive_name);

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

                DbParameter prmsUnit = new SqlParameter();
                prmsUnit.DbType = DbType.String;
                prmsUnit.ParameterName = "@sUnit";
                prmsUnit.Value = sUnit;
                prmsUnit.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsUnit);

                DbParameter prmsAsign_type = new SqlParameter();
                prmsAsign_type.DbType = DbType.String;
                prmsAsign_type.ParameterName = "@sAsign_type";
                prmsAsign_type.Value = sAsign_type;
                prmsAsign_type.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsAsign_type);

                DbParameter prmsAquisition_type = new SqlParameter();
                prmsAquisition_type.DbType = DbType.String;
                prmsAquisition_type.ParameterName = "@sAcquisition_type";
                prmsAquisition_type.Value = sAquisition_type;
                prmsAquisition_type.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsAquisition_type);

                DbParameter prmsStatus = new SqlParameter();
                prmsStatus.DbType = DbType.Boolean;
                prmsStatus.ParameterName = "@sStatus";
                prmsStatus.Value = sStatus;
                prmsStatus.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsStatus);

                DbParameter prmsActive_desc = new SqlParameter();
                prmsActive_desc.DbType = DbType.String;
                prmsActive_desc.ParameterName = "@sActive_desc";
                prmsActive_desc.Value = sActive_desc;
                prmsActive_desc.Direction = ParameterDirection.Input;
                lstParametros.Add(prmsActive_desc);

                DbParameter prmdRegister_time = new SqlParameter();
                prmdRegister_time.DbType = DbType.DateTime;
                prmdRegister_time.ParameterName = "@dRegister_time";
                prmdRegister_time.Value = dRegister_time;
                prmdRegister_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdRegister_time);

                DbParameter prmiUtilTime = new SqlParameter();
                prmiUtilTime.DbType = DbType.DateTime;
                prmiUtilTime.ParameterName = "@iUtilTime";
                prmiUtilTime.Value = iUtilTime;
                prmiUtilTime.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiUtilTime);

                DbParameter prmdtBuy_time = new SqlParameter();
                prmdtBuy_time.DbType = DbType.DateTime;
                prmdtBuy_time.ParameterName = "@dtBuy_time";
                prmdtBuy_time.Value = dtBuy_time;
                prmdtBuy_time.Direction = ParameterDirection.Input;
                lstParametros.Add(prmdtBuy_time);

                DbParameter prmiHeihgt = new SqlParameter();
                prmiHeihgt.DbType = DbType.Decimal;
                prmiHeihgt.ParameterName = "@iHeihgt";
                prmiHeihgt.Value = iHeihgt;

                prmiHeihgt.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiHeihgt);

                DbParameter prmiWidth = new SqlParameter();
                prmiWidth.DbType = DbType.Decimal;
                prmiWidth.ParameterName = "@iWidth";
                prmiWidth.Value = iWidth;
                prmiWidth.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiWidth);

                DbParameter prmiWide = new SqlParameter();
                prmiWide.DbType = DbType.Decimal;
                prmiWide.ParameterName = "@iWide";
                prmiWide.Value = iWide;
                prmiWide.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiWide);

                DbParameter prmiDiameter = new SqlParameter();
                prmiDiameter.DbType = DbType.Decimal;
                prmiDiameter.ParameterName = "@iDiameter";
                prmiDiameter.Value = iDiameter;
                prmiDiameter.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiDiameter);

                DbParameter prmiBuy_price = new SqlParameter();
                prmiBuy_price.DbType = DbType.Decimal;
                prmiBuy_price.ParameterName = "@iBuy_price";
                prmiBuy_price.Value = iBuy_price;
                prmiBuy_price.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiBuy_price);

                DbParameter prmiDivNumber = new SqlParameter();
                prmiDivNumber.DbType = DbType.Int32;
                prmiDivNumber.ParameterName = "@iDivNumber";
                prmiDivNumber.Value = iDivNumber;
                prmiDivNumber.Direction = ParameterDirection.Input;
                lstParametros.Add(prmiDivNumber);

            
                SQLConexion conProxy=new SQLConexion();
                return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblActives_Update");
        }

        public bool Delete(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmId = new SqlParameter();
            prmId.DbType = DbType.Int32;
            prmId.ParameterName = "@iActive_id";
            prmId.Value = codigo;
            prmId.Direction = ParameterDirection.Input;
            lstParametros.Add(prmId);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarDML(lstParametros, "dbo.sp_tblActives_DeleteRow");
        }

        public DataSet TraerXId(int codigo)
        {
            List<DbParameter> lstParametros = new List<DbParameter>();

            DbParameter prmA = new SqlParameter();
            prmA.DbType = DbType.Int32;
            prmA.ParameterName = "@iActive_id";
            prmA.Value = codigo;
            prmA.Direction = ParameterDirection.Input;
            lstParametros.Add(prmA);

            SQLConexion conProxy = new SQLConexion();
            return conProxy.EjecutarConsulta(lstParametros, "dbo.sp_tblActives_SelectRow");
        } 

    }
}
