using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class clsCostCenter
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
        #region METODOS
        public clsCostCenter()
        {
            iCostCenter_id = -1;
            sCostCente_name = string.Empty;

            sCostCenter_desc = string.Empty;
            //  ICONCURRENCIA = 1;
        }
        public clsCostCenter(int iCostCenter_id, string sCostCente_name, string sCostCenter_desc)
        {
            this.iCostCenter_id = iCostCenter_id;
            this.sCostCente_name = sCostCente_name;
            this.sCostCenter_desc = sCostCenter_desc;
            //  this.ICONCURRENCIA = 1;
        }
        #endregion

    }
}