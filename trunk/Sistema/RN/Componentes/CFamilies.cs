using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CFamilies
    {

        #region DMLS
        public static int Insert(clsFamilies objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SFamily_name))
                x.AgregarError("Ingrese el nombre de la Familia");

            if (x.Cantidad > 0)
                throw x;

            DAOFamilies daoProxy = new DAOFamilies();
            return daoProxy.Insert(objProxy.SFamily_name,objProxy.SFamily_desc,objProxy.IDepreciation_time);
        }
        public static bool Update(clsFamilies objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.IFamily_id <= 0)
                x.AgregarError("Ingrese el codigo de la Familia");

            if (string.IsNullOrEmpty(objProxy.SFamily_name))
                x.AgregarError("Ingrese el nombre de la Familia");

            if (x.Cantidad > 0)
                throw x;

            DAOFamilies daoProxy = new DAOFamilies();
            return daoProxy.Update(objProxy.IFamily_id, objProxy.SFamily_name, objProxy.SFamily_desc, objProxy.IDepreciation_time);
        }
        public static bool Delete(int iFamily_id)
        {
            ValidationException x = new ValidationException();
            if (iFamily_id <= 0)
                x.AgregarError("Ingrese el codigo de la Familia");

            if (x.Cantidad > 0)
                throw x;

            DAOFamilies daoProxy = new DAOFamilies();
            return daoProxy.Delete(iFamily_id);
        }
        #endregion
        #region Selects
        public static List<clsFamilies> SelectAll()
        {
            DAOFamilies daoProxy = new DAOFamilies();
            DataSet dtsProxy = daoProxy.SelectAll();

            return CargarLista(dtsProxy.Tables[0]);
        }
        public static clsFamilies SelectRow(int iFamilies_id)
        {
            DAOFamilies daoProxy = new DAOFamilies();
            DataSet dtsProxy = daoProxy.SelectRow(iFamilies_id);
            return Load(dtsProxy.Tables[0].Rows[0]);
        }
       
        #endregion
        #region Metodos Privados
        private static List<clsFamilies> CargarLista(DataTable tabla)
        {
            List<clsFamilies> lstProxy = new List<clsFamilies>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Load(fila));
            }
            return lstProxy;
        }
        private static clsFamilies Load(DataRow fila)
        {
            clsFamilies objProxy = new clsFamilies();
            objProxy.IFamily_id = Convert.ToInt32(fila["iFamily_id"]);
            objProxy.SFamily_name = fila["sFamily_name"].ToString();
            objProxy.SFamily_desc = fila["sFamily_desc"].ToString();
            objProxy.IDepreciation_time = Convert.ToInt32(fila["iDepreciation_time"]);
            return objProxy;
        }
        #endregion
    }
}
