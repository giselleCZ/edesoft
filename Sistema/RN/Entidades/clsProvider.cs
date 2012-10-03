using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsProvider
    {
        #region Atributos
        private int iProvider_id;
        private clsProviderType iProviderType_id;
        private string sProvider_name;
        private string sResponsible_name;
        private string sProvider_rs;
        private string sAddress;
        private int iPhone;
        private string sEmail;
        private string sProvider_desc;


        #endregion
        #region Propiedades
            public int IProvider_id
            {
                get { return iProvider_id; }
                set { iProvider_id = value; }
            }

            internal clsProviderType IProviderType_id
            {
                get { return iProviderType_id; }
                set { iProviderType_id = value; }
            }

            public string SProvider_name
            {
                get { return sProvider_name; }
                set { sProvider_name = value; }
            }

        public string SProvider_rs
        {
            get { return sProvider_rs; }
            set { sProvider_rs = value; }
        }

            public string SResponsible_name
            {
                get { return sResponsible_name; }
                set { sResponsible_name = value; }
            }

            public string SAddress
            {
                get { return sAddress; }
                set { sAddress = value; }
            }

            public int IPhone
            {
                get { return iPhone; }
                set { iPhone = value; }
            }

            public string SEmail
            {
                get { return sEmail; }
                set { sEmail = value; }
            }

            public string SProvider_desc
            {
                get { return sProvider_desc; }
                set { sProvider_desc = value; }
            }
        #endregion
        #region Metodos

        #endregion

    }
}
