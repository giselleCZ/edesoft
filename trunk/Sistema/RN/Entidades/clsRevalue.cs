using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsRevalue
    {
        #region Atributos
            private int iReval_id;
            private clsActive iActive_id;
            private string sReval_desc;
            private DateTime dReval_time;
            private string sUsername;
            private int iRevalPrice;
            private string sStatus;
        #endregion
        #region Propiedades
            public int IReval_id
            {
                get { return iReval_id; }
                set { iReval_id = value; }
            }

            public string SReval_desc
            {
                get { return sReval_desc; }
                set { sReval_desc = value; }
            }

            public clsActive IActive_id
            {
                get { return iActive_id; }
                set { iActive_id = value; }
            }

            public DateTime DReval_time
            {
                get { return dReval_time; }
                set { dReval_time = value; }
            }

            public string SUsername
            {
                get { return sUsername; }
                set { sUsername = value; }
            }

            public string SStatus
            {
                get { return sStatus; }
                set { sStatus = value; }
            }
            public int IRevalPrice
            {
                get { return iRevalPrice; }
                set { iRevalPrice = value; }
            }
        #endregion
        #region Metodos

        #endregion
    }
}
