using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CLocalidad
    {
        #region DMLS
        
        public static int Insertar(Localidad objProxy)
        {
            ValidationException x = new ValidationException();


            if (string.IsNullOrEmpty(objProxy.Slocacion_nm))
                x.AgregarError("Ingrese el nombre del nombre");

            if (string.IsNullOrEmpty(objProxy.Slocacion_desc))
                x.AgregarError("Ingrese el nombre del descripcion");

            if (objProxy.Sstado)
                x.AgregarError("Ingrese el nombre del estado");

            if (objProxy.Isubarea<=0)
                x.AgregarError("Ingrese el sub-area");

            //if (x.Cantidad > 0)
            //    throw x;

            DAOLocalidad daoProxy = new DAOLocalidad();
            return daoProxy.Insert(objProxy.Slocacion_nm, objProxy.Slocacion_desc, objProxy.Sstado, objProxy.Isubarea);
        }

        public static bool Actualizar(Localidad objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.Ilocacion_id <= 0)
                x.AgregarError("Ingrese el código");

            if (string.IsNullOrEmpty(objProxy.Slocacion_nm))
                x.AgregarError("Ingrese el nombre");

            if (string.IsNullOrEmpty(objProxy.Slocacion_desc))
                x.AgregarError("Ingrese el descripcion");

            if (objProxy.Sstado)
                x.AgregarError("Ingrese el estado");

            if (objProxy.Isubarea <= 0)
                x.AgregarError("Ingrese el código Subarea");

            if (x.Cantidad > 0)
                throw x;
            DAOLocalidad daoProxy = new DAOLocalidad();
            return daoProxy.Actualizar(objProxy.Ilocacion_id, objProxy.Slocacion_nm, objProxy.Slocacion_desc, objProxy.Sstado, objProxy.Isubarea);
        }
        public static bool EliminarLocalidad(int codigo)
        {
            ValidationException x = new ValidationException();
            if (codigo <= 0)
                x.AgregarError("Ingrese el código");

            //if (x.Cantidad > 0)
            //    throw x;

            DAOLocalidad daoProxy = new DAOLocalidad();
            return daoProxy.Eliminar(codigo);
        }

        #endregion

        #region Selects

        public static List<Localidad> Traer()
        {
            DAOLocalidad daoProxy = new DAOLocalidad();
            DataSet dtsProxy = daoProxy.TraerTodos();
            return CargarLista(dtsProxy.Tables[0]);
        }

        public static Localidad TraerXId(int codigo)
        {
            DAOLocalidad daoProxy = new DAOLocalidad();
            DataSet dtsProxy = daoProxy.TraerXId(codigo);
            return Cargar(dtsProxy.Tables[0].Rows[0]);
        }

        #endregion

        #region Metodos Privados

        private static List<Localidad> CargarLista(DataTable tabla)
        {
            List<Localidad> lstProxy = new List<Localidad>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }

        private static Localidad Cargar(DataRow fila)
        {
            Localidad objProxy = new Localidad();
            objProxy.Ilocacion_id = Convert.ToInt32(fila["iLocation_id"]);
            objProxy.Slocacion_nm = fila["sLocation_name"].ToString();
            objProxy.Slocacion_desc = fila["sLocation_desc"].ToString();
            objProxy.Sstado = Convert.ToBoolean(fila["sStatus"]);
            objProxy.Isubarea = Convert.ToInt32(fila["iSubArea_id"]);
          //  objProxy.Subarea = fila["sSubArea_name"].ToString();
            return objProxy;
        }

        #endregion


    }
}
