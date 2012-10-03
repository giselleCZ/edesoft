using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsAsigRespActive
    {
        #region Atributos
            private int iAsigRespActive_id;
            private clsResponsible iResponsible_id;
            private clsActive iActive_id;
            private DateTime dtAsign_date;
            private DateTime dtDevolution_time;
            private string sAsign_desc;
            private string sStatus;
            private DateTime dtConfirmed_time;
            private string sConfirmed_desc;
        #endregion
        #region Propiedades
            public int IAsigRespActive_id
            {
                get { return iAsigRespActive_id; }
                set { iAsigRespActive_id = value; }
            }

            public clsResponsible IResponsible_id
            {
                get { return iResponsible_id; }
                set { iResponsible_id = value; }
            }

            public string SStatus
            {
                get { return sStatus; }
                set { sStatus = value; }
            }

            public clsActive IActive_id
            {
                get { return iActive_id; }
                set { iActive_id = value; }
            }

            public DateTime DtAsign_time
            {
                get { return dtAsign_date; }
                set { dtAsign_date = value; }
            }

            public string SAsignation_desc
            {
                get { return sAsign_desc; }
                set { sAsign_desc = value; }
            }

            public DateTime DtAsign_time
            {
                get { return dtDevolution_time; }
                set { dtDevolution_time = value; }
            }

            public string SConfirmed_desc
            {
                get { return sConfirmed_desc; }
                set { sConfirmed_desc = value; }
            }

        #endregion
        #region Metodos

        #endregion

    }
}
