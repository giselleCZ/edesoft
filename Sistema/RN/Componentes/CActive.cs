using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CActive
    {
        #region DMLS
        public static int Insert(clsActive objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SActive_name))
                x.AgregarError("Ingrese el nombre del Activo");

            if (x.Cantidad > 0)
                throw x;

            DAOActive daoProxy = new DAOActive();
            return daoProxy.Insert(objProxy.SActive_name, objProxy.SStatus, objProxy.ISubFamily_id.ISubFamily_id,objProxy.IProvider_id.IProvider_id, objProxy.SBarCode,objProxy.DRegister_time, objProxy.IUtilTime,objProxy.SBrand, objProxy.SModel, objProxy.SForm, objProxy.SSerialNumber, objProxy.SColor, objProxy.SCapacity, objProxy.SMaterial, objProxy.IHeihgt, objProxy.IWidth, objProxy.IWide, objProxy.IDiameter,objProxy.SUnit, objProxy.IDivNumber, objProxy.SAsignation_Type, objProxy.SAdquisition_Type, objProxy.DBuy_time, objProxy.IBuyPrice, objProxy.BInactive);
        }
        public static bool Update(clsActive objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.IActive_id <= 0)
                x.AgregarError("Ingrese el código");

            if (string.IsNullOrEmpty(objProxy.SActive_name))
                x.AgregarError("Ingrese el nombre del activo");

            if (x.Cantidad > 0)
                throw x;

            DAOActive daoProxy = new DAOActive();
            return daoProxy.Update(objProxy.IActive_id, objProxy.SActive_name, objProxy.SStatus, objProxy.ISubFamily_id.ISubFamily_id, objProxy.IProvider_id.IProvider_id, objProxy.SBarCode, objProxy.DRegister_time, objProxy.IUtilTime, objProxy.SBrand, objProxy.SModel, objProxy.SForm, objProxy.SSerialNumber, objProxy.SColor, objProxy.SCapacity, objProxy.SMaterial, objProxy.IHeihgt, objProxy.IWidth, objProxy.IWide, objProxy.IDiameter, objProxy.SUnit, objProxy.IDivNumber, objProxy.SAsignation_Type, objProxy.SAdquisition_Type, objProxy.DBuy_time, objProxy.IBuyPrice, objProxy.BInactive);
        }
        public static bool Delete(int iActive_id)
        {
            ValidationException x = new ValidationException();
            if (iActive_id <= 0)
                x.AgregarError("Ingrese el código del Activo");

            if (x.Cantidad > 0)
                throw x;

            DAOActive daoProxy = new DAOActive();
            return daoProxy.Delete(iActive_id);
        }
        #endregion
        #region Selects
        public static List<clsActive> SelectAll()
        {
            DAOActive daoProxy = new DAOActive();
            DataSet dtsProxy = daoProxy.selectAll();

            return LoadList(dtsProxy.Tables[0]);
        }
        public static List<clsActive> SelectRow(int codigo)
        {
            DAOActive daoProxy = new DAOActive();
            DataSet dtsProxy = daoProxy.selectRow(codigo);

            return LoadList(dtsProxy.Tables[0]);
        }
        public static List<clsActive> SelectByName(string nombre)
        {
            DAOActive daoProxy = new DAOActive();
            DataSet dtsProxy = daoProxy.selectByName(nombre);


            return LoadList(dtsProxy.Tables[0]);
        }
        #endregion
        #region Metodos Privados
        private static List<clsActive> LoadList(DataTable tabla)
        {
            List<clsActive> lstProxy = new List<clsActive>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Load(fila));
            }
            return lstProxy;
        }
        private static clsActive Load(DataRow fila)
        {
            clsActive objProxy = new clsActive();

            objProxy.IActive_id= Convert.ToInt32(fila["iActive_id"]);
            objProxy.SActive_name= fila["sActive_name"].ToString();
            objProxy.SStatus = fila["sStatus"].ToString();
            objProxy.ISubFamily_id.ISubFamily_id = Convert.ToInt32(fila["iSubFamily_id"]);
            objProxy.IProvider_id.IProvider_id = Convert.ToInt32(fila["iProvider_id"]);
            objProxy.SBarCode = fila["sBarCode"].ToString();
            objProxy.DRegister_time = Convert.ToDateTime(fila["dtRegister_time"]);
            objProxy.IUtilTime = Convert.ToInt32(fila["iUtilTime"]);
            objProxy.SBrand = fila["sBrand"].ToString();
            objProxy.SModel = fila["sModel"].ToString();
            objProxy.SForm = fila["sForm"].ToString();
            objProxy.SSerialNumber = fila["sSerialNumber"].ToString();
            objProxy.SColor = fila["sColor"].ToString();
            objProxy.SCapacity = fila["sCapacity"].ToString();
            objProxy.SMaterial = fila["sMaterial"].ToString();
            objProxy.IHeihgt = Convert.ToInt32(fila["iHeihgt"]);
            objProxy.IWidth = Convert.ToInt32(fila["iWidth"]);
            objProxy.IWide = Convert.ToInt32(fila["iWide"]);
            objProxy.IDiameter = Convert.ToInt32(fila["iDiameter"]);
            objProxy.SUnit = fila["sUnit"].ToString();
            objProxy.IDivNumber = Convert.ToInt32(fila["iDivNumber"]);
            objProxy.SAsignation_Type = fila["sAsignation_Type"].ToString();
            objProxy.SAdquisition_Type = fila["sAdquisition_Type"].ToString();
            objProxy.DBuy_time = Convert.ToDateTime(fila["dtBuy_time"]);
            objProxy.IBuyPrice = Convert.ToInt32(fila["iBuyPrice"]);
            objProxy.BInactive = Convert.ToBoolean(fila["bInactive"]);
            return objProxy;
        }
        #endregion
    }
}
