﻿using System;
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
            //if (string.IsNullOrEmpty(objProxy.SActive_name))
            //    x.AgregarError("Ingrese el nombre del Activo");

            //if (x.Cantidad > 0)
            //    throw x;

            DAOActive daoProxy = new DAOActive();
            return daoProxy.Insert(objProxy.SActive_name, 
                                    objProxy.ISubFamily_id.ISubFamily_id, 
                                    objProxy.IProvider_id.IProvider_id, 
                                    objProxy.SActive_desc,
                                    objProxy.SBarCode,
                                    objProxy.DRegister_time,
                                    objProxy.IUtilTime,
                                    objProxy.SBrand,
                                    objProxy.SModel,
                                    objProxy.SForm,
                                    objProxy.SSerialNumber,
                                    objProxy.SColor,
                                    objProxy.SCapacity,
                                    objProxy.SMaterial,
                                    objProxy.IHeihgt,
                                    objProxy.IWidth,
                                    objProxy.IWide,
                                    objProxy.IDiameter,
                                    objProxy.SUnit,
                                    objProxy.IDivNumber,
                                    objProxy.SAsign_Type,
                                    objProxy.SAquisition_Type,
                                    objProxy.DtBuy_time,
                                    objProxy.IBuy_price, 
                                    objProxy.SStatus);
        
                                  
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
            return daoProxy.Update(objProxy.IActive_id,
                                    objProxy.SActive_name,
                                    objProxy.ISubFamily_id.ISubFamily_id,
                                    objProxy.IProvider_id.IProvider_id,
                                    objProxy.SActive_desc,
                                    objProxy.SBarCode,
                                    objProxy.DRegister_time,
                                    objProxy.IUtilTime,
                                    objProxy.SBrand,
                                    objProxy.SModel,
                                    objProxy.SForm,
                                    objProxy.SSerialNumber,
                                    objProxy.SColor,
                                    objProxy.SCapacity,
                                    objProxy.SMaterial,
                                    objProxy.IHeihgt,
                                    objProxy.IWidth,
                                    objProxy.IWide,
                                    objProxy.IDiameter,
                                    objProxy.SUnit,
                                    objProxy.IDivNumber,
                                    objProxy.SAsign_Type,
                                    objProxy.SAquisition_Type,
                                    objProxy.DtBuy_time,
                                    objProxy.IBuy_price,
                                    objProxy.SStatus);
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

        public static clsActive SelectRow(int codigo)
        {
            DAOActive daoProxy = new DAOActive();
            DataSet dtsProxy = daoProxy.selectRow(codigo);

            return Load(dtsProxy.Tables[0].Rows[0]);
        }

        public static List<clsActive> SelectByName(string nombre)
        {
            DAOActive daoProxy = new DAOActive();
            DataSet dtsProxy = daoProxy.selectByName(nombre);


            return LoadList(dtsProxy.Tables[0]);
        }

        public static clsActive TraerXid(int codigo)
        {
            DAOActive daoProxy = new DAOActive();
            DataSet dtsProxy = daoProxy.TraerXId(codigo);

            return Load(dtsProxy.Tables[0].Rows[0]);
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

            objProxy.IActive_id = Convert.ToInt32(fila["iActive_id"]);
            objProxy.SActive_name = fila["sActive_name"].ToString();
            RN.Entidades.clsSubFamilies sf = CSubFamilies.SelectRow(Convert.ToInt32(fila["iSubFamily_id"]));
            RN.Entidades.Proveedor pro = CProveedor.TraerXId(Convert.ToInt32(fila["iProvider_id"]));
            objProxy.ISubFamily_id= sf;
            objProxy.IProvider_id= pro;
            objProxy.SActive_desc = fila["sActive_desc"].ToString();
            objProxy.SBarCode = fila["sBarCode"].ToString();
            objProxy.DRegister_time = Convert.ToDateTime(fila["dRegister_time"]);
            objProxy.IUtilTime = Convert.ToDateTime(fila["iUtilTime"]);
            objProxy.SBrand = fila["sBrand"].ToString();
            objProxy.SModel = fila["sModel"].ToString();
            objProxy.SForm = fila["sForm"].ToString();
            objProxy.SSerialNumber = fila["sSerialNumber"].ToString();
            objProxy.SColor = fila["sColor"].ToString();
            objProxy.SCapacity = fila["sCapacity"].ToString();
            objProxy.SMaterial = fila["sMaterial"].ToString();
            objProxy.IHeihgt = Convert.ToDecimal(fila["iHeihgt"]);
            objProxy.IWidth = Convert.ToDecimal(fila["iWidth"]);
            objProxy.IWide = Convert.ToDecimal(fila["iWide"]);
            objProxy.IDiameter = Convert.ToDecimal(fila["iDiameter"]);
            objProxy.SUnit = fila["sUnit"].ToString();
            objProxy.IDivNumber = Convert.ToInt32(fila["iDivNumber"]);
            objProxy.SAsign_Type = fila["sAsign_type"].ToString();
            objProxy.SAquisition_Type = fila["sAcquisition_Type"].ToString();
            objProxy.DtBuy_time = Convert.ToDateTime(fila["dtBuy_time"]);
            objProxy.IBuy_price = Convert.ToDecimal(fila["iBuy_price"]);
            objProxy.SStatus = Convert.ToBoolean(fila["sStatus"]);

            return objProxy;
        }
        #endregion
    }
}
