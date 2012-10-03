using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsSubArea
    {
        #region Atributos
        private int iSubArea_id;
        private clsArea iArea_id;
        private string sSubArea_desc;
        private string sStatus;
        private string sSubArea_name;

        #endregion
        #region Propiedades
           
        public int ISubArea_id
        {
            get { return iSubArea_id; }
            set { iSubArea_id = value; }
        }

        public clsArea IArea_id
        {
            get { return iArea_id; }
            set { iArea_id = value; }
        }

        public string SSubArea_desc
        {
            get { return sSubArea_desc; }
            set { sSubArea_desc = value; }
        }

        public string SStatus
        {
            get { return sStatus; }
            set { sStatus = value; }
        }

        public string SSubArea_name
        {
            get { return sSubArea_name; }
            set { sSubArea_name = value; }
        }
        #endregion
        #region Metodos

        #endregion
    }
}
