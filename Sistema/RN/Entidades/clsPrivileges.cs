using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    class clsPrivileges
    {
        #region Atributos
        private int iPrivilege_id;
        private clsRol iRol_id;
        private List<clsProgram> iProgram_id;
        private bool fUpdate_fla;
        private bool fRead_fla;
        private bool fDelete_fla;
        private bool fInsert_fla;


        #endregion
        #region Propiedades
        
        public int IPrivilege_id
        {
            get { return iPrivilege_id; }
            set { iPrivilege_id = value; }
        }

        public List<clsProgram> IProgram_id
        {
            get { return iProgram_id; }
            set { iProgram_id = value; }
        }

        public clsRol IRol_id
        {
            get { return iRol_id; }
            set { iRol_id = value; }
        }

        public bool FUpdate_fla
        {
            get { return fUpdate_fla; }
            set { fUpdate_fla = value; }
        }

        public bool FRead_fla
        {
            get { return fRead_fla; }
            set { fRead_fla = value; }
        }

        public bool FDelete_fla
        {
            get { return fDelete_fla; }
            set { fDelete_fla = value; }
        }

        public bool FInsert_fla
        {
            get { return fInsert_fla; }
            set { fInsert_fla = value; }
        }   
        #endregion
        #region Metodos

        #endregion
    }
}
