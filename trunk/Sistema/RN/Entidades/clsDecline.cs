using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsDecline
    {
        #region Atributos
            private int iDecline_id;
            private clsActive iActive_id;
            private string sDecline_desc;
            private DateTime dDecline_time;
            private string sDecline_type;
            private string sUsername;
        #endregion

        #region Propiedades
            public int IDecline_id
            {
                get { return iDecline_id; }
                set { iDecline_id = value; }
            }

            public clsActive IActive_id
            {
                get { return iActive_id; }
                set { iActive_id = value; }
            }

            public string SDecline_desc
            {
                get { return sDecline_desc; }
                set { sDecline_desc = value; }
            }

            public DateTime DDecline_time
            {
                get { return dDecline_time; }
                set { dDecline_time = value; }
            }

            public string SDecline_type
            {
                get { return sDecline_type; }
                set { sDecline_type = value; }
            }

            public string SUsername
            {
                get { return sUsername; }
                set { sUsername = value; }
            }
        #endregion
        #region Metodos

        #endregion

    }
}
