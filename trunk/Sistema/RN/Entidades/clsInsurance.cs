using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsInsurance
    {
        #region Atributos
        private clsActive iActive_id;
        private int iInsurance_id;
        private string sInsurance_desc;
        private string Insurance_name;
        private DateTime dtInsurance_start;
        private DateTime dtInsurance_end;
        private string sInsurance_code;

        #endregion
        #region Propiedades

        public int IInsurance_id
        {
            get { return iInsurance_id; }
            set { iInsurance_id = value; }
        }

        public string SInsurance_desc
        {
            get { return sInsurance_desc; }
            set { sInsurance_desc = value; }
        }

        public string Insurance_name1
        {
            get { return Insurance_name; }
            set { Insurance_name = value; }
        }
        public DateTime DtInsurance_start
        {
            get { return dtInsurance_start; }
            set { dtInsurance_start = value; }
        }

        public DateTime DtInsurance_end
        {
            get { return dtInsurance_end; }
            set { dtInsurance_end = value; }
        }

        public string SInsurance_code
        {
            get { return sInsurance_code; }
            set { sInsurance_code = value; }
        }

        #endregion
        #region Metodos

        #endregion
    }
}
