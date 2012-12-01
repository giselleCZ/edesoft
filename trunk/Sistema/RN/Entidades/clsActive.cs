using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RN.Entidades
{
    public class clsActive
    {
        #region Atributos            
            private int iActive_id; 
            private string sActive_name; 
            private clsSubFamilies iSubFamily_id;    
            private Proveedor iProvider_id;
            private string sBrand;
            private string sModel;
            private string sForm;
            private string sSerialNumber;
            private string sColor;
            private string sCapacity;
            private string sMaterial;
            private string sUnit; 
            private string sBarCode; 
            private string sAsign_Type;
            private string sAquisition_Type;
            private bool sStatus;
            private string sActive_desc;
            private DateTime dRegister_time;
            private DateTime iUtilTime;
            private DateTime dtBuy_time;
            private decimal iHeihgt;
            private decimal iWidth;
            private decimal iWide;
            private decimal iDiameter;
            private decimal iBuy_price;
            private int iDivNumber; 
     
        #endregion
        #region Propiedades

            public int IActive_id
            {
                get { return iActive_id; }
                set { iActive_id = value; }
            }


            public string SActive_name
            {
                get { return sActive_name; }
                set { sActive_name = value; }
            }


            public clsSubFamilies ISubFamily_id
            {
                get { return iSubFamily_id; }
                set { iSubFamily_id = value; }
            }


            public Proveedor IProvider_id
            {
                get { return iProvider_id; }
                set { iProvider_id = value; }
            }


            public string SActive_desc
            {
                get { return sActive_desc; }
                set { sActive_desc = value; }
            }


            public string SBarCode
            {
                get { return sBarCode; }
                set { sBarCode = value; }
            }


            public DateTime DRegister_time
            {
                get { return dRegister_time; }
                set { dRegister_time = value; }
            }


            public DateTime IUtilTime
            {
                get { return iUtilTime; }
                set { iUtilTime = value; }
            }


            public string SBrand
            {
                get { return sBrand; }
                set { sBrand = value; }
            }


            public string SModel
            {
                get { return sModel; }
                set { sModel = value; }
            }


            public string SForm
            {
                get { return sForm; }
                set { sForm = value; }
            }

            public string SSerialNumber
            {
                get { return sSerialNumber; }
                set { sSerialNumber = value; }
            }

            public string SColor
            {
                get { return sColor; }
                set { sColor = value; }
            }

            public string SCapacity
            {
                get { return sCapacity; }
                set { sCapacity = value; }
            }


            public string SMaterial
            {
                get { return sMaterial; }
                set { sMaterial = value; }
            }


            public decimal IHeihgt  //floar
            {
                get { return iHeihgt; }
                set { iHeihgt = value; }
            }


            public decimal IWidth
            {
                get { return iWidth; }
                set { iWidth = value; }
            }


            public decimal IWide
            {
                get { return iWide; }
                set { iWide = value; }
            }


            public decimal IDiameter
            {
                get { return iDiameter; }
                set { iDiameter = value; }
            }


            public string SUnit
            {
                get { return sUnit; }
                set { sUnit = value; }
            }


            public int IDivNumber
            {
                get { return iDivNumber; }
                set { iDivNumber = value; }
            }


            public string SAsign_Type
            {
                get { return sAsign_Type; }
                set { sAsign_Type = value; }
            }

            public string SAquisition_Type
            {
                get { return sAquisition_Type; }
                set { sAquisition_Type = value; }
            }
 
            public DateTime DtBuy_time
            {
                get { return dtBuy_time; }
                set { dtBuy_time = value; }
            }

            public decimal IBuy_price
            {
                get { return iBuy_price; }
                set { iBuy_price = value; }
            }

            public bool SStatus
            {
                get { return sStatus; }
                set { sStatus = value; }
            }

        #endregion
        #region Metodos

        #endregion

    }
}
