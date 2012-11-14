using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;


namespace RN.Componentes
{
    public class CProveedor
    {
        #region DMLS

        public static int Insertar(Proveedor objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SProvider_name))
                x.AgregarError("Ingrese el nombre del empleado");

            if (string.IsNullOrEmpty(objProxy.SProvider_rs))
                x.AgregarError("Ingrese el nombre del rs?");
            
            if (string.IsNullOrEmpty(objProxy.SProvider_phone))
                x.AgregarError("Ingrese el nombre del telefono");

            if (string.IsNullOrEmpty(objProxy.SProvider_email))
                x.AgregarError("Ingrese el nombre del correo");

            if (string.IsNullOrEmpty(objProxy.SProvider_desc))
                x.AgregarError("Ingrese el nombre del descripcion");

            if (string.IsNullOrEmpty(objProxy.SProvider_address))
                x.AgregarError("Ingrese el nombre del direccion");

            if (x.Cantidad > 0)
                throw x;

          DAOProveedor daoProxy = new DAOProveedor();
            return daoProxy.Insertar(objProxy.SProvider_name,objProxy.SProvider_rs,objProxy.SProvider_phone, objProxy.SProvider_email,objProxy.SProvider_desc,objProxy.SProvider_address);
        }

        public static bool Actualizar(Proveedor objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.IProvider_id <= 0)
                x.AgregarError("Ingrese el código proveedor");

            if (string.IsNullOrEmpty(objProxy.SProvider_name))
                x.AgregarError("Ingrese el nombre del empleado");
          
            if (string.IsNullOrEmpty(objProxy.SProvider_rs))
                x.AgregarError("Ingrese el nombre del rs?");

            if (string.IsNullOrEmpty(objProxy.SProvider_phone))
                x.AgregarError("Ingrese el nombre del telefono");

            if (string.IsNullOrEmpty(objProxy.SProvider_email))
                x.AgregarError("Ingrese el nombre del correo");

            if (string.IsNullOrEmpty(objProxy.SProvider_desc))
                x.AgregarError("Ingrese el nombre del descripcion");
                        if (string.IsNullOrEmpty(objProxy.SProvider_address))
                x.AgregarError("Ingrese el nombre del direccion");

            if (x.Cantidad > 0)
                throw x;
            DAOProveedor daoProxy = new DAOProveedor();
            return daoProxy.Actualizar(objProxy.IProvider_id, objProxy.SProvider_name, objProxy.SProvider_rs, objProxy.SProvider_phone, objProxy.SProvider_email, objProxy.SProvider_desc, objProxy.SProvider_address);
        }

        public static bool EliminarProveedor(int codigo)
        {
            ValidationException x = new ValidationException();
            if (codigo <= 0)
                x.AgregarError("Ingrese el código");
            
            //veamos si lo usamos
            //if (x.Cantidad > 0)
            //    throw x;

            DAOProveedor daoProxy = new DAOProveedor();
            return daoProxy.Eliminar(codigo);
        }

       
        #endregion

        #region SELECTS

        public static List<Proveedor> Traer()
        {
            DAOProveedor daoProxy = new DAOProveedor();
            DataSet dtsProxy = daoProxy.TraerTodos();

            return CargarLista(dtsProxy.Tables[0]);
        }

        public static Proveedor TraerXId(int codigo)
        {
            DAOProveedor daoProxy = new DAOProveedor();
            DataSet dtsProxy = daoProxy.TraerXId(codigo);

            return Cargar(dtsProxy.Tables[0].Rows[0]);
        }

        #endregion

        #region METODOS PRIVADOS



        private static List<Proveedor> CargarLista(DataTable tabla)
        {
            List<Proveedor> lstProxy = new List<Proveedor>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }


        private static Proveedor Cargar(DataRow fila)
        {
            Proveedor objProxy = new Proveedor();
            objProxy.IProvider_id = Convert.ToInt32(fila["iProvider_id"]);
            objProxy.SProvider_name = fila["sProvider_name"].ToString();
            objProxy.SProvider_rs = fila["sProvider_rs"].ToString();
            objProxy.SProvider_phone = fila["sProvider_phone"].ToString();
            objProxy.SProvider_email = fila["sProvider_email"].ToString();
            objProxy.SProvider_desc = fila["sProvider_desc"].ToString();
            objProxy.SProvider_address = fila["sProvider_address"].ToString();

            return objProxy;
        }

        #endregion

    }
}
