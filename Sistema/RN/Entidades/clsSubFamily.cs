using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsSubFamily
    {
        #region Atributos
        private int iSubFamily_id;
        private clsFamily iFamily_id;
        private string sSubFamily_name;
        private string sSubFamily_desc;

        #endregion
        #region Propiedades
            public int ISubFamily_id
            {
                get { return iSubFamily_id; }
                set { iSubFamily_id = value; }
            }
            public clsFamily IFamily_id1
            {
                get { return iFamily_id; }
                set { iFamily_id = value; }
            }
            public string SSubFamily_name
            {
                get { return sSubFamily_name; }
                set { sSubFamily_name = value; }
            }

            public string SSubFamily_desc
            {
                get { return sSubFamily_desc; }
                set { sSubFamily_desc = value; }
            }


        #endregion
        #region Metodos

        #endregion


    }
}
