using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsAsignPointsActives
    {
        #region Atributos
            private int iAsigLocActive;
            private clsPoints iPoint_id;
            private clsActive iActive_id;
            private DateTime dAsign_time;
            private DateTime sAsign_desc;
        #endregion
        #region Propiedades
            public int IAsigLocActive
            {
                get { return iAsigLocActive; }
                set { iAsigLocActive = value; }
            }

            public clsPoints IPoints_id
            {
                get { return iPoint_id; }
                set { iPoint_id = value; }
            } 

            public clsActive IActive_id
            {
                get { return iActive_id; }
                set { iActive_id = value; }
            }

            public DateTime DAsign_time
            {
                get { return dAsign_time; }
                set { dAsign_time = value; }
            }

            public DateTime SAsign_desc
            {
                get { return sAsign_desc; }
                set { sAsign_desc = value; }
            }
        #endregion
        #region Metodos

        #endregion

    }
}
