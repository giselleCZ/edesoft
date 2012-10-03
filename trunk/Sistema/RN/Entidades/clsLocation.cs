using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsLocation
    {
        #region Atributos
            private int iLocation_id;
            private clsSubArea iSubArea_id;
            private string sLocation_desc;
        #endregion
        
        #region Propiedades
            public int ILocation_id
            {
                get { return iLocation_id; }
                set { iLocation_id = value; }
            }

            public clsSubArea ISubArea_id
            {
                get { return iSubArea_id; }
                set { iSubArea_id = value; }
            }

            public string SLocation_desc
            {
                get { return sLocation_desc; }
                set { sLocation_desc = value; }
            }

        #endregion

        #region Metodos
        #endregion
    }
}
