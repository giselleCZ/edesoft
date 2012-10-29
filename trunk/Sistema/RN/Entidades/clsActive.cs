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
            private clsProvider iProvider_id;
            private clsSubFamily iSubFamily_id;
            private string sActive_desc;
            private string sBarCode;
            private DateTime dRegister_time;
            private int iUtilTime;
            private string sStatus;
            private string sBrand;
            private string sModel;
            private string sForm;
            private string sSerialNumber;
            private string sColor;
            private string sCapacity;
            private string sMaterial;
            private int iHeihgt;
            private int iWidth;
            private int iWide;
            private int iDiameter;
            private string sUnit;
            private int iDivNumber;
            private string sAsign_Type;
            private string sAcquisition_Type;
            private DateTime dtBuy_time;
            private int iBuy_price;
            private bool bInactive;
        #endregion
        #region Propiedades
            public int IActive_id
            {
                get { return iActive_id; }
                set { iActive_id = value; }
            }

            public clsProvider IProvider_id
            {
                get { return iProvider_id; }
                set { iProvider_id = value; }
            }

            public clsSubFamily ISubFamily_id
            {
                get { return iSubFamily_id; }
                set { iSubFamily_id = value; }
            }

            public bool BInactive
            {
                get { return bInactive; }
                set { bInactive = value; }
            }

            public string SActive_name
            {
                get { return sActive_name; }
                set { sActive_name = value; }
            }

            public string SBarCode
            {
                get { return sBarCode; }
                set { sBarCode = value; }
            }


            public string SActive_desc
            {
                get { return sActive_desc; }
                set { sActive_desc = value; }
            }

            public DateTime DRegister_time
            {
                get { return dRegister_time; }
                set { dRegister_time = value; }
            }

            public int IUtilTime
            {
                get { return iUtilTime; }
                set { iUtilTime = value; }
            }

            public string SStatus
            {
                get { return sStatus; }
                set { sStatus = value; }
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

            public int IHeihgt
            {
                get { return iHeihgt; }
                set { iHeihgt = value; }
            }

            public int IWidth
            {
                get { return iWidth; }
                set { iWidth = value; }
            }

            public int IWide
            {
                get { return iWide; }
                set { iWide = value; }
            }

            public int IDiameter
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

            public string SAsignation_Type
            {
                get { return sAsign_Type; }
                set { sAsign_Type = value; }
            }

            public string SAdquisition_Type
            {
                get { return sAcquisition_Type; }
                set { sAcquisition_Type = value; }
            }

            public DateTime DBuy_time
            {
                get { return dtBuy_time; }
                set { dtBuy_time = value; }
            }

            public int IBuyPrice
            {
                get { return iBuy_price; }
                set { iBuy_price = value; }
            }

        #endregion
        #region Metodos

        #endregion

    }
}
