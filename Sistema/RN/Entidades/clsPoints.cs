using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsPoints
    {
        #region Atributos
            private int iPoint_id;
            private clsLocation iLocation_id;
            private string sPoint_desc;
            private string sStatus;
            private string sPoint_name;
        #endregion
        #region Propiedades
            public int IAsigLocActive
            {
                get { return iPoint_id; }
                set { iPoint_id = value; }
            }

            public clsLocation ILocation_id
            {
                get { return iLocation_id; }
                set { iLocation_id = value; }
            } 

            public string SPoint_desc
            {
                get { return sPoint_desc; }
                set { sPoint_desc = value; }
            }

            public string SStatus
            {
                get { return sStatus; }
                set { sStatus = value; }
            }

            public string SPoint_name
            {
                get { return sPoint_name; }
                set { sPoint_name = value; }
            }

        #endregion
        #region Metodos

        #endregion

    }
}
