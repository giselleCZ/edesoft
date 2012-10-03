using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsCostCenter
    {
        #region Atributos
            private int iCostCenter_id;
            private string sCostCente_name;
            private string sCostCenter_desc;
            private int iCostCenter_gestion;
        #endregion
        #region Propiedades
            public int ICostCenter_id
            {
                get { return iCostCenter_id; }
                set { iCostCenter_id = value; }
            }

            public string SCostCenter_desc
            {
                get { return sCostCenter_desc; }
                set { sCostCenter_desc = value; }
            }

            public string SCostCente_name
            {
                get { return sCostCente_name; }
                set { sCostCente_name = value; }
            }

            public int DGestion_time
            {
                get { return iCostCenter_gestion; }
                set { iCostCenter_gestion = value; }
            }

        #endregion
        #region Metodos

        #endregion
    }
}
