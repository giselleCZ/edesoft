using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CRol
    {

        #region DMLS
        public static bool Insertar(clsRol objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SRol_name))
                x.AgregarError("Ingrese el nombre del rol");

            if (x.Cantidad > 0)
                throw x;

            DAORol daoProxy = new DAORol();
            return daoProxy.Insert(objProxy.SRol_name,objProxy.BStatus) > 0;
        }
        public static bool Update(clsRol objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.IRol_id <= 0)
                x.AgregarError("Ingrese el id del rol");

            if (string.IsNullOrEmpty(objProxy.SRol_name))
                x.AgregarError("Ingrese el nombre del rol");

            if (x.Cantidad > 0)
                throw x;

            DAORol daoProxy = new DAORol();
            return daoProxy.Update(objProxy.IRol_id,objProxy.SRol_name, objProxy.BStatus);
        }
        public static bool Delete(int iRol_id)
        {
            ValidationException x = new ValidationException();
            if (iRol_id <= 0)
                x.AgregarError("Ingrese el id del rol");

            if (x.Cantidad > 0)
                throw x;

            DAORol daoProxy = new DAORol();
            return daoProxy.Delete(iRol_id);
        }
        #endregion
        #region Selects
        public static List<clsRol> SelectAll()
        {
            DAORol daoProxy = new DAORol();
            DataSet dtsProxy = daoProxy.SelectAll();

            return CargarLista(dtsProxy.Tables[0]);
        }
        public static clsRol SelectRow(int iRol_id)
        {
            DAORol daoProxy = new DAORol();
            DataSet dtsProxy = daoProxy.SelectRow(iRol_id);
            return Load(dtsProxy.Tables[0].Rows[0]);
        }
       
        #endregion
        #region Metodos Privados
        private static List<clsRol> CargarLista(DataTable tabla)
        {
            List<clsRol> lstProxy = new List<clsRol>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Load(fila));
            }
            return lstProxy;
        }
        private static clsRol Load(DataRow fila)
        {
            clsRol objProxy = new clsRol();
            objProxy.IRol_id = Convert.ToInt32(fila["iRol_id"]);
            objProxy.SRol_name = fila["sRol_name"].ToString();
            objProxy.BStatus = Convert.ToBoolean(fila["bStatus"]);
            return objProxy;
        }
        #endregion
    }
}
