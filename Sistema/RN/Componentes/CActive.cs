using System;
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
            if (string.IsNullOrEmpty(objProxy.SActive_name))
                x.AgregarError("Ingrese el nombre del Activo");

            if (x.Cantidad > 0)
                throw x;

            DAOActive daoProxy = new DAOActive();
            return daoProxy.Insert(objProxy.SActive_name, objProxy.SStatus, objProxy.ISubFamily_id.ISubFamily_id,objProxy.IProvider_id.IProvider_id, objProxy.SBarCode,objProxy.DRegister_time, objProxy.IUtilTime,objProxy.SBrand, objProxy.SModel, objProxy.SForm, objProxy.SSerialNumber, objProxy.SColor, objProxy.SCapacity, objProxy.SMaterial, objProxy.IHeihgt, objProxy.IWidth, objProxy.IWide, objProxy.IDiameter,objProxy.SUnit, objProxy.IDivNumber, objProxy.SAsignation_Type, objProxy.SAdquisition_Type, objProxy.DBuy_time, objProxy.IBuyPrice, objProxy.BInactive);
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
            return daoProxy.Update(objProxy.IActive_id, objProxy.SActive_name, objProxy.SStatus, objProxy.ISubFamily_id.ISubFamily_id, objProxy.IProvider_id.IProvider_id, objProxy.SBarCode, objProxy.DRegister_time, objProxy.IUtilTime, objProxy.SBrand, objProxy.SModel, objProxy.SForm, objProxy.SSerialNumber, objProxy.SColor, objProxy.SCapacity, objProxy.SMaterial, objProxy.IHeihgt, objProxy.IWidth, objProxy.IWide, objProxy.IDiameter, objProxy.SUnit, objProxy.IDivNumber, objProxy.SAsignation_Type, objProxy.SAdquisition_Type, objProxy.DBuy_time, objProxy.IBuyPrice, objProxy.BInactive);
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
        public static List<Empleado> SelectAll()
        {
            DAOActive daoProxy = new DAOActive();
            DataSet dtsProxy = daoProxy.selectAll();

            return CargarLista(dtsProxy.Tables[0]);
        }
        public static List<Empleado> TraerXId(int codigo)
        {
            DAOEmpleado daoProxy = new DAOEmpleado();
            DataSet dtsProxy = daoProxy.TraerEmpleadoXId(codigo);

            
            return CargarLista(dtsProxy.Tables[0]);
        }
        public static List<Empleado> TraerXNombre(string nombre)
        {
            DAOEmpleado daoProxy = new DAOEmpleado();
            DataSet dtsProxy = daoProxy.TraerEmpleadoXNombre(nombre);


            return CargarLista(dtsProxy.Tables[0]);
        }
        #endregion
        #region Metodos Privados
        private static List<Empleado> CargarLista(DataTable tabla)
        {
            List<Empleado> lstProxy = new List<Empleado>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }
        private static Empleado Cargar(DataRow fila)
        {
            Empleado objProxy = new Empleado();
            objProxy.Codigo = Convert.ToInt32(fila["codigo"]);
            objProxy.Nombre = fila["nombre"].ToString();
            return objProxy;
        }
        #endregion
    }
}
