using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class clsRol
    {
        #region Atributos
        private int iRol_id;
        private string sRol_name;
        private bool bStatus;

        #endregion
        #region Propiedades

        public int IRol_id
        {
            get { return iRol_id; }
            set { iRol_id = value; }
        }

        public bool BStatus
        {
            get { return bStatus; }
            set { bStatus = value; }
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
