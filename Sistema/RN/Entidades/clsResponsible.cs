using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class clsResponsible
    {
        #region Atributos
            private int iResponsible_id;
            private clsRol iRol_id;
            private clsResponsibleType iResponsibleType_id;
            private string sPerson_name;
            private string sPerson_lname;
            private string sPerson_phone;
            private string sPerson_email;
            private string sPerson_dni;
            private string sUsername;
            private string sPassword;
            private DateTime dStart_time;
            private DateTime dEnd_time;
            private int sStatus;
        #endregion
        #region Propiedades
            public int IResponsible_id
            {
                get { return iResponsible_id; }
                set { iResponsible_id = value; }
            }

            public clsResponsibleType IResponsibleType_type
            {
                get { return iResponsibleType_id; }
                set { iResponsibleType_id = value; }
            }


            public string SPerson_name
            {
                get { return sPerson_name; }
                set { sPerson_name = value; }
            }

            public string SPerson_dni
            {
                get { return sPerson_dni; }
                set { sPerson_dni = value; }
            }

            public string SPerson_lname
            {
                get { return sPerson_lname; }
                set { sPerson_lname = value; }
            }

            public string SPerson_phone
            {
                get { return sPerson_phone; }
                set { sPerson_phone = value; }
            }

            public string SPerson_email
            {
                get { return sPerson_email; }
                set { sPerson_email = value; }
            }

            public string SUsername
            {
                get { return sUsername; }
                set { sUsername = value; }
            }

            public string SPassword
            {
                get { return sPassword; }
                set { sPassword = value; }
            }

            public clsRol IRol_id
            {
                get { return iRol_id; }
                set { iRol_id = value; }
            }
            public DateTime DStart_time
            {
                get { return dStart_time; }
                set { dStart_time = value; }
            }

            public DateTime DEnd_time
            {
                get { return dEnd_time; }
                set { dEnd_time = value; }
            }

            public int SStatus
            {
                get { return sStatus; }
                set { sStatus = value; }
            }


        #endregion
        #region Metodos

        #endregion
    }
}
