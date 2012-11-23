using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class SubArea
    {
        #region Atributos

        private int iSubArea_id;
        private string sSubArea_name;
        private string sSubArea_desc;
        private bool bStatus;
        private int iArea_id;

        #endregion

        #region Propiedades

        public int ISubArea_id
        {
            get { return iSubArea_id; }
            set { iSubArea_id = value; }
        }
     
        public string SSubArea_name
        {
            get { return sSubArea_name; }
            set { sSubArea_name = value; }
        }
     
        public string SSubArea_desc
        {
            get { return sSubArea_desc; }
            set { sSubArea_desc = value; }
        }
    
        public bool BStatus
        {
            get { return bStatus; }
            set { bStatus = value; }
        }
       
        public int IArea_id
        {
            get { return iArea_id; }
            set { iArea_id = value; }
        }


        #endregion

        #region Metodos
        #endregion
    }
}
