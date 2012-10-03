using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsPersonCostCenter
    {
        #region Atributos
        private int iPersonCostCenter_id;
        private List<clsCostCenter> iCostCenter_id;
        private clsResponsible iResponsible_id;
        private DateTime dtAsign_time;


        #endregion
        #region Propiedades
           
        public int IPersonCostCenter_id
        {
            get { return iPersonCostCenter_id; }
            set { iPersonCostCenter_id = value; }
        }

        public List<clsCostCenter> ICostCenter_id
        {
            get { return iCostCenter_id; }
            set { iCostCenter_id = value; }
        }

        public clsResponsible IResponsible_id
        {
            get { return iResponsible_id; }
            set { iResponsible_id = value; }
        }

        public DateTime DtAsign_time
        {
            get { return dtAsign_time; }
            set { dtAsign_time = value; }
        }

        #endregion
        #region Metodos

        #endregion
    }
}
