using System;
using CAD.DAO;
using System.Data;
using RN.Entidades;
using System.Collections.Generic;


namespace RN.Componentes
{
    public class CSubArea
    {


        #region SELECTS

        public static List<SubArea> Traer()
        {
            DAOSubArea daoProxy = new DAOSubArea();
            DataSet dtsProxy = daoProxy.TraerTodos();

            return CargarLista(dtsProxy.Tables[0]);
        }

        //public static Proveedor TraerXId(int codigo)
        //{
        //    DAOProveedor daoProxy = new DAOProveedor();
        //    DataSet dtsProxy = daoProxy.TraerXId(codigo);

        //    return Cargar(dtsProxy.Tables[0].Rows[0]);
        //}

        //#endregion

        //#region METODOS PRIVADOS



        private static List<SubArea> CargarLista(DataTable tabla)
        {
            List<SubArea> lstProxy = new List<SubArea>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }

        private static SubArea Load(DataRow fila)
        {
            SubArea objProxy = new SubArea();
            objProxy.ISubArea_id = Convert.ToInt32(fila["iSubArea_id"]);
            objProxy.SSubArea_name = fila["sSubArea_name"].ToString();
            objProxy.SSubArea_desc = fila["sSubArea_desc"].ToString();
            objProxy.BStatus = Convert.ToBoolean(fila["bStatus"]);
            objProxy.IArea_id = Convert.ToInt32(fila["iArea_id"]);
            return objProxy;
        }

        public static SubArea SelectRow(int iSubArea_id)
        {
            DAOSubArea daoProxy = new DAOSubArea();
            DataSet dtsProxy = daoProxy.SelectRow(iSubArea_id);
            return Load(dtsProxy.Tables[0].Rows[0]);
        }
        
        public static List<SubArea> SelectAll()
        {
            DAOSubArea daoProxy = new DAOSubArea();
            DataSet dtsProxy = daoProxy.SelectAll();

            return CargarLista(dtsProxy.Tables[0]);
        }

        private static SubArea Cargar(DataRow fila)
        {
            SubArea objProxy = new SubArea();
            objProxy.ISubArea_id = Convert.ToInt32(fila["iSubArea_id"]);
            objProxy.SSubArea_name = fila["sSubArea_name"].ToString();
            //objProxy.SSubArea_desc = fila["sSubArea_desc"].ToString();
            //objProxy.BStatus = Convert.ToBoolean(fila["bStatus"]);
            //objProxy.IArea_id = Convert.ToInt32(fila["sProvider_email"]);
            
            return objProxy;
        }

        #endregion

    }
}
