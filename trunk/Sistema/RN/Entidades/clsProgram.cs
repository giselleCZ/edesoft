using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsProgram
    {
        #region Atributos
        private int iProgram_id;
        private string sProgram_name;
        private string sProgram_desc;
        private int iStatus;

        #endregion
        #region Propiedades
           
        public int IArea_id
        {
            get { return iProgram_id; }
            set { iProgram_id = value; }
        }


        public string SProgram_name
        {
            get { return sProgram_name; }
            set { sProgram_name = value; }
        }

        public int IStatus
        {
            get { return iStatus; }
            set { iStatus = value; }
        }
        public string SArea_desc
        {
            get { return sProgram_desc; }
            set { sProgram_desc = value; }
        }

        #endregion
        #region Metodos

        #endregion
    }
}
