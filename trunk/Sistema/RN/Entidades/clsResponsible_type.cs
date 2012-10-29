using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class clsResponsibleType
    {
        #region Atributos
        private int iResponsibleType_id;
        private string sResponsibleType_desc;
        private string sResponsibleType_name;

        #endregion
        #region Propiedades

        public int IResponsibleType_id
        {
            get { return iResponsibleType_id; }
            set { iResponsibleType_id = value; }
        }

        public string SResponsibleType_desc
        {
            get { return sResponsibleType_desc; }
            set { sResponsibleType_desc = value; }
        }

        public string SResponsibleType_name
        {
            get { return sResponsibleType_name; }
            set { sResponsibleType_name = value; }
        }
        #endregion
        #region Metodos

        #endregion
    }
}
