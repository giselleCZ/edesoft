using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CAsigAsigResponsibleActiveActive
    {
        #region DMLS
        public static int Insert(clsAsigResponsibleActive objProxy)
        {
            ValidationException x = new ValidationException();
            //if (string.IsNullOrEmpty(objProxy.DtAsign_time)&& string.IsNullOrEmpty(objProxy.SPerson_lname))
            //    x.AgregarError("verifique el nombre del y el apellido de la persona");

            if (x.Cantidad > 0)
                throw x;

            DAOAsigResponsibleActive daoProxy = new DAOAsigResponsibleActive();

            return daoProxy.Insert(objProxy.SConfirmed_desc,objProxy.SAsignation_desc,objProxy.BStatus,objProxy.DtAsign_time,objProxy.DtDevolution_time,objProxy.BConfirmed,objProxy.IResponsible_id.IResponsible_id,objProxy.IActive_id.IActive_id);
        }
        public static bool Update(clsAsigResponsibleActive objProxy)
        {
            ValidationException x = new ValidationException();
            /*if (objProxy.IAsigResponsibleActive_id <= 0)
                x.AgregarError("Ingrese el código");

            if (string.IsNullOrEmpty(objProxy.SPerson_name) && string.IsNullOrEmpty(objProxy.SPerson_lname))
                x.AgregarError("verifique el nombre del y el apellido de la persona");
            */
            if (x.Cantidad > 0)
                throw x;

            DAOAsigResponsibleActive daoProxy = new DAOAsigResponsibleActive();
            return daoProxy.Update(objProxy.SConfirmed_desc, objProxy.SAsignation_desc, objProxy.BStatus, objProxy.DtAsign_time, objProxy.DtDevolution_time, objProxy.BConfirmed, objProxy.IResponsible_id.IResponsible_id, objProxy.IActive_id.IActive_id);
        }
        public static bool Delete(int iActive_id, int iResponsible_id)
        {
            ValidationException x = new ValidationException();
            if ((iActive_id <= 0)&&(iResponsible_id<=0))
                x.AgregarError("Ingrese el código de la persona y el codigo del activo");

            if (x.Cantidad > 0)
                throw x;

            DAOAsigResponsibleActive daoProxy = new DAOAsigResponsibleActive();
            return daoProxy.Delete(iResponsible_id,iActive_id);
        }
        #endregion
        #region Selects
        public static List<clsAsigResponsibleActive> SelectAll()
        {
            DAOAsigResponsibleActive daoProxy = new DAOAsigResponsibleActive();
            DataSet dtsProxy = daoProxy.selectAll();

            return LoadList(dtsProxy.Tables[0]);
        }
        public static List<clsAsigResponsibleActive> SelectRow(int iResponsible,int iActive_id)
        {
            DAOAsigResponsibleActive daoProxy = new DAOAsigResponsibleActive();
            DataSet dtsProxy = daoProxy.selectRow(iResponsible,iActive_id);

            return LoadList(dtsProxy.Tables[0]);
        }

        #endregion
        #region Metodos Privados
        private static List<clsAsigResponsibleActive> LoadList(DataTable tabla)
        {
            List<clsAsigResponsibleActive> lstProxy = new List<clsAsigResponsibleActive>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Load(fila));
            }
            return lstProxy;
        }
        private static clsAsigResponsibleActive Load(DataRow fila)
        {
            clsAsigResponsibleActive objProxy = new clsAsigResponsibleActive();
            objProxy.SConfirmed_desc = fila["sConfirmed_desc"].ToString();
            objProxy.SAsignation_desc = fila["sAsign_desc"].ToString();
            objProxy.IActive_id.IActive_id = Convert.ToInt32(fila["iActive_id"]);
            objProxy.IResponsible_id.IResponsible_id = Convert.ToInt32(fila["iPerson_id"]);
            objProxy.DtAsign_time = Convert.ToDateTime(fila["dtAsign_date"]);
            objProxy.DtDevolution_time = Convert.ToDateTime(fila["dtDevolution_date"]);
            objProxy.BStatus = Convert.ToBoolean(fila["sStatus"]);
            objProxy.BConfirmed = Convert.ToBoolean(fila["bConfirmed"]);
            
            return objProxy;
        }
        #endregion
    }
}
