using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace RN.Entidades
{
    public class Localidad
    {
        #region Atributos

        private int ilocacion_id;
        private string slocacion_nm;
        private string slocacion_desc;
        private bool sstado;
        private int isubarea;
        private string subarea;
   
        #endregion

        #region Propiedades

        public int Ilocacion_id
        {
            get { return ilocacion_id; }
            set { ilocacion_id = value; }
        }

        public string Slocacion_nm
        {
            get { return slocacion_nm; }
            set { slocacion_nm = value; }
        }
 
        public string Slocacion_desc
        {
            get { return slocacion_desc; }
            set { slocacion_desc = value; }
        }

        public bool Sstado
        {
            get { return sstado; }
            set { sstado = value; }
        }

        public int Isubarea
        {
            get { return isubarea; }
            set { isubarea = value; }
        }

      

        public string Subarea
        {
            get { return subarea; }
            set { subarea = value; }
        }

        #endregion

        #region Metodos

        //public Localidad()
        //{
        //    ilocacion_id = -1;
        //    slocacion_desc = string.Empty;
        //    slocacion_nm = string.Empty;
        //    isubarea = -1;
        //}

        //public Localidad(int codigo, string desc, string nm, int idsub)
        //{
        //    ilocacion_id = codigo;
        //    slocacion_desc = desc;
        //    slocacion_nm = nm;
        //    isubarea = idsub;
        //}
   
        #endregion
    }
}
