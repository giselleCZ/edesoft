using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CSubFamilies
    {
        #region DMLS
        public static int Insert(clsSubFamilies objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SSubFamily_name))
                x.AgregarError("verifique el nombre de la subfamilia");
            if (x.Cantidad > 0)
                throw x;

            DAOSubFamily daoProxy = new DAOSubFamily();
            return daoProxy.Insert(objProxy.IFamily_id.IFamily_id,objProxy.SSubFamily_name, objProxy.SSubFamily_desc);
        }
        public static bool Update(clsSubFamilies objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.ISubFamily_id <= 0)
                x.AgregarError("Ingrese el código");

            if (string.IsNullOrEmpty(objProxy.SSubFamily_name))
                x.AgregarError("verifique el nombre de la subfamilia");

            if (x.Cantidad > 0)
                throw x;

            DAOSubFamily daoProxy = new DAOSubFamily();
            return daoProxy.Update(objProxy.ISubFamily_id, objProxy.IFamily_id.IFamily_id, objProxy.SSubFamily_name, objProxy.SSubFamily_desc);
        }
        public static bool Delete(int iSubFamily_id)
        {
            ValidationException x = new ValidationException();
            if (iSubFamily_id <= 0)
                x.AgregarError("Ingrese el código de la subfamilia");

            if (x.Cantidad > 0)
                throw x;

            DAOSubFamily daoProxy = new DAOSubFamily();
            return daoProxy.Delete(iSubFamily_id);
        }
        #endregion
        #region Selects
        public static List<clsSubFamilies> SelectAll()
        {
            DAOSubFamily daoProxy = new DAOSubFamily();
            DataSet dtsProxy = daoProxy.selectAll();

            return LoadList(dtsProxy.Tables[0]);
        }
        public static clsSubFamilies SelectRow(int codigo)
        {
            DAOSubFamily daoProxy = new DAOSubFamily();
            DataSet dtsProxy = daoProxy.selectRow(codigo);

            return Load(dtsProxy.Tables[0].Rows[0]);
        }

        public static List<clsSubFamilies> SelectByName(string name)
        {
            DAOSubFamily daoProxy = new DAOSubFamily();
            DataSet dtsProxy = daoProxy.selectByName(name);


            return LoadList(dtsProxy.Tables[0]);
        }

        public static List<clsSubFamilies> SelectByLName(string lname)
        {
            DAOSubFamily daoProxy = new DAOSubFamily();
            DataSet dtsProxy = daoProxy.selectByName(lname);


            return LoadList(dtsProxy.Tables[0]);
        }
        #endregion
        #region Metodos Privados
        private static List<clsSubFamilies> LoadList(DataTable tabla)
        {
            List<clsSubFamilies> lstProxy = new List<clsSubFamilies>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Load(fila));
            }
            return lstProxy;
        }
        private static clsSubFamilies Load(DataRow fila)
        {
            clsSubFamilies objProxy = new clsSubFamilies();

            objProxy.ISubFamily_id = Convert.ToInt32(fila["iSubFamily_id"]);
            objProxy.SSubFamily_name = fila["sSubFamily_name"].ToString();
            objProxy.SSubFamily_desc = fila["sSubFamily_desc"].ToString();
            
            clsFamilies family = CFamilies.SelectRow(Convert.ToInt32(fila["iFamily_id"]));
            objProxy.IFamily_id = family;
            
            return objProxy;
        }
        #endregion
    }
}
