using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class Proveedor
    {
        #region Atributos
        private int iProvider_id;
        private string sProvider_name;
        private string sProvider_rs;
        private string sProvider_phone;
        private string sProvider_email;
        private string sProvider_desc;
        private string sProvider_address;

        #endregion
        #region Propiedades
  
        public int IProvider_id
        {
            get { return iProvider_id; }
            set { iProvider_id = value; }
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
        public string SProvider_phone
        {
            get { return sProvider_phone; }
            set { sProvider_phone = value; }
        }
 
        public string SProvider_email
        {
            get { return sProvider_email; }
            set { sProvider_email = value; }
        }
 
        public string SProvider_desc
        {
            get { return sProvider_desc; }
            set { sProvider_desc = value; }
        }
      
        public string SProvider_address
        {
            get { return sProvider_address; }
            set { sProvider_address = value; }
        }
        #endregion
        #region Metodos
        public Proveedor()
        {
            iProvider_id = -1;
            sProvider_name = string.Empty;
            sProvider_rs = string.Empty;
            sProvider_phone = string.Empty;
            sProvider_email = string.Empty;
            sProvider_desc = string.Empty;
            sProvider_address = string.Empty;
        }
        public Proveedor(int codigo, string nm, string rs, string phone, string email, string desc, string dir)
        {
            iProvider_id = codigo;
            sProvider_name = nm;
            sProvider_rs = rs;
            sProvider_phone = phone;
            sProvider_email = email;
            sProvider_desc = desc;
            sProvider_address = dir;
        }
        #endregion
    }
}
