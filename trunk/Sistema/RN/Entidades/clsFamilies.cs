using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class clsFamilies
    {
        #region Atributos
            private int iFamily_id;
            private string sFamily_name;
            private string sFamily_desc;
            private int iDepreciation_time;
        #endregion
        #region Propiedades
            public int IFamily_id
            {
                get { return iFamily_id; }
                set { iFamily_id = value; }
            }
            public string SFamily_name
            {
                get { return sFamily_name; }
                set { sFamily_name = value; }
            }
            public string SFamily_desc
            {
                get { return sFamily_desc; }
                set { sFamily_desc = value; }
            }

            public int IDepreciation_time
            {
                get { return iDepreciation_time; }
                set { iDepreciation_time = value; }
            }

        #endregion
        #region Metodos

        #endregion


    }
}
