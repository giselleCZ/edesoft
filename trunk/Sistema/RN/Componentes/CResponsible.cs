using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;

namespace RN.Componentes
{
    public class CResponsible
    {
        #region DMLS
        public static int Insert(clsResponsible objProxy)
        {
            ValidationException x = new ValidationException();
            if (string.IsNullOrEmpty(objProxy.SPerson_name)&& string.IsNullOrEmpty(objProxy.SPerson_lname))
                x.AgregarError("verifique el nombre del y el apellido de la persona");

            if (x.Cantidad > 0)
                throw x;

            DAOResponsible daoProxy = new DAOResponsible();
            return daoProxy.Insert(objProxy.SPerson_name, objProxy.SPerson_lname,objProxy.SPerson_dni,objProxy.SPerson_phone, objProxy.SPerson_email,objProxy.SUsername,objProxy.SPassword,objProxy.IRol_id.IRol_id,objProxy.DStart_time, objProxy.DEnd_time,objProxy.BStatus);
        }
        public static bool Update(clsResponsible objProxy)
        {
            ValidationException x = new ValidationException();
            if (objProxy.IResponsible_id <= 0)
                x.AgregarError("Ingrese el código");

            if (string.IsNullOrEmpty(objProxy.SPerson_name) && string.IsNullOrEmpty(objProxy.SPerson_lname))
                x.AgregarError("verifique el nombre del y el apellido de la persona");

            if (x.Cantidad > 0)
                throw x;

            DAOResponsible daoProxy = new DAOResponsible();
            return daoProxy.Update(objProxy.IResponsible_id, objProxy.SPerson_name, objProxy.SPerson_lname, objProxy.SPerson_dni, objProxy.SPerson_phone, objProxy.SPerson_email, objProxy.SUsername, objProxy.SPassword, objProxy.IRol_id.IRol_id, objProxy.DStart_time, objProxy.DEnd_time, objProxy.BStatus);
        }
        public static bool Delete(int iResponsible_id)
        {
            ValidationException x = new ValidationException();
            if (iResponsible_id <= 0)
                x.AgregarError("Ingrese el código de la persona");

            if (x.Cantidad > 0)
                throw x;

            DAOResponsible daoProxy = new DAOResponsible();
            return daoProxy.Delete(iResponsible_id);
        }
        #endregion
        #region Selects
        public static List<clsResponsible> SelectAll()
        {
            DAOResponsible daoProxy = new DAOResponsible();
            DataSet dtsProxy = daoProxy.selectAll();

            return LoadList(dtsProxy.Tables[0]);
        }
        public static List<clsResponsible> SelectRow(int codigo)
        {
            DAOResponsible daoProxy = new DAOResponsible();
            DataSet dtsProxy = daoProxy.selectRow(codigo);

            return LoadList(dtsProxy.Tables[0]);
        }

        public static List<clsResponsible> SelectByName(string name)
        {
            DAOResponsible daoProxy = new DAOResponsible();
            DataSet dtsProxy = daoProxy.selectByName(name);


            return LoadList(dtsProxy.Tables[0]);
        }

        public static List<clsResponsible> SelectByLName(string lname)
        {
            DAOResponsible daoProxy = new DAOResponsible();
            DataSet dtsProxy = daoProxy.selectByName(lname);


            return LoadList(dtsProxy.Tables[0]);
        }
        #endregion
        #region Metodos Privados
        private static List<clsResponsible> LoadList(DataTable tabla)
        {
            List<clsResponsible> lstProxy = new List<clsResponsible>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Load(fila));
            }
            return lstProxy;
        }
        private static clsResponsible Load(DataRow fila)
        {
            clsResponsible objProxy = new clsResponsible();

            objProxy.IResponsible_id = Convert.ToInt32(fila["iResponsible_id"]);
            objProxy.SPerson_name = fila["sPerson_name"].ToString();
            objProxy.SPerson_lname = fila["sPerson_lname"].ToString();
            objProxy.SPerson_dni = fila["sPerson_dni"].ToString();
            objProxy.SPerson_phone = fila["sPerson_phone"].ToString();
            objProxy.SPerson_email = fila["sPerson_email"].ToString();
            objProxy.SUsername = fila["sUsername"].ToString();
            objProxy.SPassword = fila["sPassword"].ToString();
            objProxy.IRol_id.IRol_id = Convert.ToInt32(fila["iRol_id"]);
            objProxy.DStart_time = Convert.ToDateTime(fila["dtStart_time"]);
            objProxy.DEnd_time = Convert.ToDateTime(fila["dtEnd_time"]);
            objProxy.BStatus = Convert.ToBoolean(fila["sStatus"]);
            
            return objProxy;
        }
        #endregion
    }
}
