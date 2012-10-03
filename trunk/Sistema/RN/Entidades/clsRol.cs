using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsRol
    {
        #region Atributos
        private int iRol_id;
        private string sRol_name;
        private int iStatus;

        #endregion
        #region Propiedades

        public int IRol_id
        {
            get { return iRol_id; }
            set { iRol_id = value; }
        }

        public int IStatus
        {
            get { return iStatus; }
            set { iStatus = value; }
        }

        public string SRol_name
        {
            get { return sRol_name; }
            set { sRol_name = value; }
        }
        #endregion
        #region Metodos

        #endregion
    }
}
