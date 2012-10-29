using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    class CProvider
    {

        #region DMLS
        public static bool Insertar(clsProvider objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SProvider_name))
                x.AgregarError("Ingrese el nombre del proveedor");

            if (x.Cantidad > 0)
                throw x;

            DAOProvider daoProxy = new DAOProvider();
            return daoProxy.Insertar(objProxy.SProvider_name,objProxy.SProvider_lname,objProxy.SEmail,objProxy.IProviderType_id.IProviderType_id,objProxy.IPhone,objProxy.SContacto_name, objProxy.SAddress,objProxy.SProvider_desc) > 0;
        }
        public static bool ActualizarProveedor(clsProvider objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.IProvider_id <= 0)
                x.AgregarError("Ingrese el id");

            if (string.IsNullOrEmpty(objProxy.SProvider_name))
                x.AgregarError("Ingrese el nombre");



            if (x.Cantidad > 0)
                throw x;

            DAOProvider daoProxy = new DAOProvider();
            return daoProxy.Actualizar(objProxy.IProvider_id, objProxy.SProvider_name,objProxy.SProvider_lname,objProxy.SEmail,objProxy.IProviderType_id.IProviderType_id,objProxy.IPhone,objProxy.SContacto_name, objProxy.SAddress,objProxy.SProvider_desc);
        }
        public static bool EliminarProveedor(int codigo)
        {
            ValidationException x = new ValidationException();
            if (codigo <= 0)
                x.AgregarError("Ingrese el id");

            if (x.Cantidad > 0)
                throw x;

            DAOProvider daoProxy = new DAOProvider();
            return daoProxy.Eliminar(codigo);
        }
        #endregion
        #region Selects
        public static List<clsProvider> Traer()
        {
            DAOProvider daoProxy = new DAOProvider();
            DataSet dtsProxy = daoProxy.TraerTodos();

            return CargarLista(dtsProxy.Tables[0]);
        }
        public static List<clsProvider> TraerXId(int codigo)
        {
            DAOProvider daoProxy = new DAOProvider();
            DataSet dtsProxy = daoProxy.TraerXId(codigo);


            return CargarLista(dtsProxy.Tables[0]);
        }
       
        #endregion
        #region Metodos Privados
        private static List<clsProvider> CargarLista(DataTable tabla)
        {
            List<clsProvider> lstProxy = new List<clsProvider>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }
        private static clsProvider Cargar(DataRow fila)
        {
            clsProvider objProxy = new clsProvider();
            objProxy.IProvider_id = Convert.ToInt32(fila["id"]);
            objProxy.SProvider_name = fila["nombre"].ToString();
            return objProxy;
        }
        #endregion
    }
}
