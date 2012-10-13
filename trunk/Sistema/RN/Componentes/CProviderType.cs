using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;


namespace RN.Componentes
{
    class CProviderType
    {
        #region DMLS
        public static bool Insertar(clsProviderType objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SProvider_type))
                x.AgregarError("Ingrese el nombre del tipo de proveedor");

            if (x.Cantidad > 0)
                throw x;

            DAOProviderType daoProxy = new DAOProviderType();
            return daoProxy.Insertar(objProxy.SProvider_type) > 0;
        }
        public static bool ActualizarTipoProveedor(clsProviderType objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.IProviderType_id <= 0)
                x.AgregarError("Ingrese el id");

            if (string.IsNullOrEmpty(objProxy.SProvider_type))
                x.AgregarError("Ingrese el nombre");

            if (x.Cantidad > 0)
                throw x;

            DAOProviderType daoProxy = new DAOProviderType();
            return daoProxy.Actualizar(objProxy.IProviderType_id, objProxy.SProvider_type);
        }
        public static bool EliminarTipoProveedor(int codigo)
        {
            ValidationException x = new ValidationException();
            if (codigo <= 0)
                x.AgregarError("Ingrese el id");

            if (x.Cantidad > 0)
                throw x;

            DAOProviderType daoProxy = new DAOProviderType();
            return daoProxy.Eliminar(codigo);
        }
        #endregion
        #region Selects
        public static List<clsProvider> Traer()
        {
            DAOProviderType daoProxy = new DAOProviderType();
            DataSet dtsProxy = daoProxy.TraerProveedorTipo();

            return CargarLista(dtsProxy.Tables[0]);
        }
        public static List<clsProvider> TraerXId(int codigo)
        {
            DAOProviderType daoProxy = new DAOProviderType();
            DataSet dtsProxy = daoProxy.TraerProveedorTipoXId(codigo);


            return CargarLista(dtsProxy.Tables[0]);
        }
        public static List<clsProviderType> TraerXNombre(string nombre)
        {
            DAOProviderType daoProxy = new DAOProviderType();
            DataSet dtsProxy = daoProxy.TraerProveedorTipoXNombre(nombre);


            return CargarLista(dtsProxy.Tables[0]);
        }
        #endregion
        #region Metodos Privados
        private static List<clsProviderType> CargarLista(DataTable tabla)
        {
            List<clsProviderType> lstProxy = new List<clsProviderType>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }
        private static clsProviderType Cargar(DataRow fila)
        {
            clsProviderType objProxy = new clsProviderType();
            objProxy.IProviderType_id = Convert.ToInt32(fila["id"]);
            objProxy.SProvider_type = fila["nombre"].ToString();
            return objProxy;
        }
        #endregion
    }
}
