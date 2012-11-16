using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CCostCenter
    {

        public static int Insert(clsCostCenter objProxy)
        {

            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SCostCente_name))
                x.AgregarError("Ingrese el nombre del centro de costo");

            if (x.Cantidad > 0)
                throw x;

            DAOCostCenter daoProxy = new DAOCostCenter();
            return daoProxy.Insert(objProxy.SCostCente_name, objProxy.SCostCenter_desc, objProxy.DGestion_time);
        }
        public static bool Update(clsCostCenter objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.ICostCenter_id <= 0)
                x.AgregarError("Ingrese el código");

            if (string.IsNullOrEmpty(objProxy.SCostCente_name))
                x.AgregarError("Ingrese el nombre del centro");

            if (x.Cantidad > 0)
                throw x;

            DAOCostCenter daoProxy = new DAOCostCenter();
            return daoProxy.Update(objProxy.ICostCenter_id, objProxy.SCostCente_name, objProxy.SCostCenter_desc, objProxy.DGestion_time);
        }
        /*   public static bool Delete(int codigo)
           {
               ValidationException x = new ValidationException();
               if (codigo <= 0)
                   x.AgregarError("Ingrese el código");

               DAOCostCenter daoProxy = new DAOCostCenter();
               return daoProxy.Delete(codigo);
           }*/
        #region Selects
        public static List<clsCostCenter> Traer()
        {
            DAOCostCenter daoProxy = new DAOCostCenter();
            DataSet dtsProxy = daoProxy.SelectAll();

            return CargarLista(dtsProxy.Tables[0]);
        }
        public static clsCostCenter TraerXId(int iCostCenter_id)
        {
            DAOCostCenter daoProxy = new DAOCostCenter();
            DataSet dtsProxy = daoProxy.TraerCentrodeCostosXId(iCostCenter_id);

            return Cargar(dtsProxy.Tables[0].Rows[0]);
        }

        public static bool Eliminar(int iCostCenter_id)
        {
            ValidationException x = new ValidationException();
            if (iCostCenter_id <= 0)
                x.AgregarError("Ingrese el código");

            if (x.Cantidad > 0)
                throw x;

            DAOCostCenter daoProxy = new DAOCostCenter();
            return daoProxy.Eliminar(iCostCenter_id);
        }
        #endregion

        #region Metodos Privados
        private static List<clsCostCenter> CargarLista(DataTable tabla)
        {
            List<clsCostCenter> lstProxy = new List<clsCostCenter>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }
        private static clsCostCenter Cargar(DataRow fila)
        {
            clsCostCenter objProxy = new clsCostCenter();
            objProxy.ICostCenter_id = Convert.ToInt32(fila["iCostCenter_id"]);
            objProxy.SCostCente_name = fila["sCostCenter_name"].ToString();
            objProxy.SCostCenter_desc = fila["sCostCenter_desc"].ToString();
            objProxy.DGestion_time = Convert.ToInt32(fila["iCostCenter_gestion"]);
            return objProxy;
        }
        #endregion


    }
}
