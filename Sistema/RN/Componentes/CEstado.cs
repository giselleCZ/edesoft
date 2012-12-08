using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAD.DAO;
using RN.Entidades;
using System.Data;

namespace RN.Componentes
{
    public class CEstado
    {
        public static List<clsEstado> Traer()
        {
            DAOEstado daoProxy = new DAOEstado();
            DataSet dtsProxy = daoProxy.TraerTodos();

            return CargarLista(dtsProxy.Tables[0]);
        }

        private static List<clsEstado> CargarLista(DataTable tabla)
        {
            List<clsEstado> lstProxy = new List<clsEstado>();

            foreach (DataRow fila in tabla.Rows)
            {
                lstProxy.Add(Cargar(fila));
            }
            return lstProxy;
        }

        private static clsEstado Cargar(DataRow fila)
        {
            clsEstado objProxy = new clsEstado();
            objProxy.IEstado = Convert.ToInt32(fila["estado_id"]);
            objProxy.SEstado = fila["estado"].ToString();
           

            return objProxy;
        }

        private static clsEstado Load(DataRow fila)
        {
            clsEstado objProxy = new clsEstado();
            objProxy.IEstado = Convert.ToInt32(fila["estado_id"]);
            objProxy.SEstado = fila["estado"].ToString();

            return objProxy;
        }
        public static clsEstado SelectRow(int estado_id)
        {
            DAOEstado daoProxy = new DAOEstado();
            DataSet dtsProxy = daoProxy.SelectRow(estado_id);
            return Load(dtsProxy.Tables[0].Rows[0]);
        }

    }
}
