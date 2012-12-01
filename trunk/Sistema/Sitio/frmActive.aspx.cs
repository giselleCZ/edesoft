using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RN.Componentes;
using RN.Entidades;
using System.Globalization;

namespace Sitio
{
    public partial class frmActive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlBuscar.Visible = false;
                CargarProveedor();
                CargarSubFamilia();
                CargarEstado();
                LoadActives();
                txtdRegister_time.Text = DateTime.Now.ToString();

            }
        }
        public void LoadActives()
        {
            List<clsActive> obj = CActive.SelectAll();
            grdActives.DataSource = obj;
            grdActives.DataBind();
        }

        public string getActive(int iActive)
        {
            RN.Entidades.clsActive Actives = RN.Componentes.CActive.TraerXid(iActive);
            return Actives.SActive_name;
        }


        public string getSubFamily(object objFamily)
        {
            int ifam = Convert.ToInt32(DataBinder.Eval(objFamily, "IActive_id"));
            clsActive fam = CActive.SelectRow(ifam);
            int iFamily = fam.ISubFamily_id.ISubFamily_id;
            RN.Entidades.clsSubFamilies Family = CSubFamilies.SelectRow(iFamily);
            return Family.SSubFamily_name;
        }
        public string getSubFamily(int iFamily)
        {
            RN.Entidades.clsSubFamilies Family = CSubFamilies.SelectRow(iFamily);
            return Family.SSubFamily_name;
        }

        public void loadSubFamily(int iFamily_id)
        {
            List<clsSubFamilies> objFamily = CSubFamilies.SelectAll();
            ddSubFamilia.DataSource = objFamily;
            ddSubFamilia.DataTextField = "SSubFamily_name";
            ddSubFamilia.DataValueField = "ISubFamily_id";
            SetDDLs(ddSubFamilia, getSubFamily(iFamily_id));
            //ddlFamily.SelectedValue = getSelectedFamily(iFamily_id);
            ddSubFamilia.DataBind();
        }

        public string getProveedor(object objProveedor)
        {
            int iResp = Convert.ToInt32(DataBinder.Eval(objProveedor, "IActive_id"));
            clsActive prov = CActive.SelectRow(iResp);  
            int iprov = prov.IProvider_id.IProvider_id;  /// esperar
            RN.Entidades.Proveedor prove = CProveedor.TraerXId(iprov);
            return prove.SProvider_name;
        }

        public string getProveedor(int prov)
        {

            RN.Entidades.Proveedor prove = CProveedor.TraerXId(prov);
            return prove.SProvider_name;
        }

        public void loadProveedor(int prove)
        {
            List<RN.Entidades.Proveedor> objFamily = CProveedor.Traer();
            ddlProveedor.DataSource = objFamily;
            ddlProveedor.DataTextField = "SProvider_name";
            ddlProveedor.DataValueField = "IProvider_id";
            SetDDLs(ddlProveedor, getSubFamily(prove));
            ddlProveedor.DataBind();
        }

        private void SetDDLs(DropDownList d, string val)
        {
            ListItem li;
            for (int i = 0; i < d.Items.Count; i++)
            {
                li = d.Items[i];
                if (li.Value == val)
                {
                    d.SelectedIndex = i;
                    break;
                }
            }
        }

        protected void CargarProveedor()
        {
            List<RN.Entidades.Proveedor> obj = RN.Componentes.CProveedor.Traer();
            ddlProveedor.DataSource = obj;
            ddlProveedor.DataTextField = "SProvider_name";
            ddlProveedor.DataValueField = "IProvider_id";
            ddlProveedor.DataBind();
            this.ddlProveedor.Items.Insert(0, new ListItem("Elija Proveedor", "0"));
        }


        protected void CargarSubFamilia()
        {
            List<RN.Entidades.clsSubFamilies> obj = RN.Componentes.CSubFamilies.SelectAll();
            ddSubFamilia.DataSource = obj;
            ddSubFamilia.DataTextField = "SSubFamily_name";
            ddSubFamilia.DataValueField = "ISubFamily_id";
            ddSubFamilia.DataBind();
            //  this.ddProveedor.Items.Insert(0, new ListItem("Elija Proveedor", "0"));
        }

        protected void CargarEstado()
        {
            List<RN.Entidades.clsEstado> obj = RN.Componentes.CEstado.Traer();
            ddlEstado.DataSource = obj;
            ddlEstado.DataTextField = "SEstado";
            ddlEstado.DataValueField = "IEstado";
            ddlEstado.DataBind();
            //  this.ddProveedor.Items.Insert(0, new ListItem("Elija Proveedor", "0"));
        }

        protected void btGuardar_Click(object sender, EventArgs e)
        {
        
            clsActive active = new clsActive();
            active.SActive_name = txtsActive_name.Text;
            RN.Entidades.clsSubFamilies sub = CSubFamilies.SelectRow(Convert.ToInt32(ddSubFamilia.SelectedValue));
            active.ISubFamily_id = sub;

            RN.Entidades.Proveedor pro = CProveedor.TraerXId(Convert.ToInt32(ddlProveedor.SelectedValue));
            active.IProvider_id = pro;

            active.SActive_desc = txtsActive_desc.Text;
            active.SBarCode = txtsBarcode.Text;

            ///----------fecha actual
            txtdRegister_time.Text = DateTime.Now.ToString();
            active.DRegister_time = Convert.ToDateTime(txtdRegister_time.Text);
            ///--------------------

            active.IUtilTime = Convert.ToDateTime(txtiUtilTime.Text);
            active.SBrand = txtsBrand.Text;
            active.SModel = txtsModel.Text;
            active.SForm = txtsForm.Text;
            active.SSerialNumber = txtsSerialNumber.Text;
            active.SColor = txtsColor.Text;
            active.SCapacity = txtsCapacity.Text;
            active.SMaterial = txtsMaterial.Text;
            
            
           //------------heihgt
            string sh=(txtiHeihgt.Text);
            double val = Convert.ToDouble(sh, CultureInfo.CreateSpecificCulture("en-US"));
            decimal x = Convert.ToDecimal(val);
            active.IHeihgt = (x);
            ///--------------width
            string sw = (txtiWidth.Text);
            double val1 = Convert.ToDouble(sw, CultureInfo.CreateSpecificCulture("en-US"));
            decimal vw = Convert.ToDecimal(val1);
            active.IWidth = (vw);
            ///---------------wide
            string sd = (txtiWide.Text);
            double val2 = Convert.ToDouble(sd, CultureInfo.CreateSpecificCulture("en-US"));
            decimal x2 = Convert.ToDecimal(val2);
            active.IWide = (x2);
            ///-------------diameter
            string di = (txtiDiameter.Text);
            double val3 = Convert.ToDouble(di, CultureInfo.CreateSpecificCulture("en-US"));
            decimal x3 = Convert.ToDecimal(val3);
            active.IDiameter = (x3);
            ///------------price
            string pr = (txtiBuy_price.Text);
            double val4 = Convert.ToDouble(pr, CultureInfo.CreateSpecificCulture("en-US"));
            decimal x4 = Convert.ToDecimal(val4);
            active.IBuy_price = (x4);
            ///
            active.SUnit = txtsUnit.Text;
            int division = Convert.ToInt32(txtiDivNumber.Text);
            active.IDivNumber = division;
            active.SAsign_Type = txtsAsign_type.Text;
            active.SAquisition_Type = txtsAdquisition_type.Text;
            active.DtBuy_time = Convert.ToDateTime(txtdtBuy_time.Text);
           
            int ss = Convert.ToInt32(ddlEstado.SelectedValue.ToString());
            active.SStatus = Convert.ToBoolean(ss);

            if (string.IsNullOrEmpty(txtCodigo.Text))
            {
                int iActive = CActive.Insert(active);
                txtCodigo.Text = iActive.ToString();
                pnlBuscar.Visible = true;
                LoadActives();
                grdActives.Enabled = true;
            }
            else
            {
                active.IActive_id = Convert.ToInt32(txtCodigo.Text);
                CActive.Update(active);
                LoadActives();
            }

        }
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = true;
            pnlBuscar.Visible = false;
            CargarProveedor();
            CargarSubFamilia();
            CargarEstado();

            txtCodigo.Text = "";
            txtdRegister_time.Text = DateTime.Now.ToString();
            txtdtBuy_time.Text = "";
            txtiBuy_price.Text = "";
            txtiDiameter.Text = "";
            txtiDivNumber.Text = "";
            txtiHeihgt.Text = "";
            txtiUtilTime.Text = "";
            txtiWide.Text = "";
            txtiWidth.Text = "";
            txtsActive_desc.Text = "";
            txtsActive_name.Text = "";
            txtsAdquisition_type.Text = "";
            txtsAsign_type.Text = "";
            txtsBarcode.Text = "";
            txtsBrand.Text = "";
            txtsCapacity.Text = "";
            txtsColor.Text = "";
            txtsForm.Text = "";
            txtsMaterial.Text = "";
            txtsModel.Text = "";
            txtsSerialNumber.Text = "";
            txtsUnit.Text = "";
            
         }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            pnlNuevo.Visible = false;
            pnlBuscar.Visible = true;
        }
        protected void ResultGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int iActive_id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                clsActive active = RN.Componentes.CActive.SelectRow(iActive_id);
                txtCodigo.Text = active.IActive_id.ToString();
                txtdRegister_time.Text = active.DRegister_time.ToString();
                txtdtBuy_time.Text = active.DtBuy_time.ToString();
                //txtiBuy_price.Text = active.IBuy_price.ToString();
                //txtiDiameter.Text = active.IDiameter.ToString();
                txtiDivNumber.Text = active.IDivNumber.ToString();
                //txtiHeihgt.Text = active.IHeihgt.ToString();
                txtiUtilTime.Text = active.IUtilTime.ToString();
                //txtiWide.Text = active.IWide.ToString();
                //txtiWidth.Text = active.IWidth.ToString();
                txtsActive_desc.Text = active.SActive_desc.ToString();
                txtsActive_name.Text = active.SActive_name.ToString();
                txtsAdquisition_type.Text = active.SAquisition_Type.ToString();
                txtsAsign_type.Text = active.SAsign_Type.ToString();
                txtsBarcode.Text = active.SBarCode.ToString();
                txtsBrand.Text = active.SBrand.ToString();
                txtsCapacity.Text = active.SCapacity.ToString();
                txtsColor.Text = active.SColor.ToString();
                txtsForm.Text = active.SForm.ToString();
                txtsMaterial.Text = active.SMaterial.ToString();
                txtsModel.Text = active.SModel.ToString();
                txtsSerialNumber.Text = active.SSerialNumber.ToString();
                txtsUnit.Text = active.SUnit.ToString();
                ///-------------------
                txtiDiameter.Text =  Convert.ToString(active.IDiameter.ToString()).Replace(",", ".");
                txtiWide.Text =  Convert.ToString(active.IWide.ToString()).Replace(",", ".");
                txtiWidth.Text = Convert.ToString(active.IWidth.ToString()).Replace(",", ".");
                txtiHeihgt.Text = Convert.ToString(active.IHeihgt.ToString()).Replace(",", ".");
                txtiBuy_price.Text = Convert.ToString(active.IBuy_price.ToString()).Replace(",", ".");
                ///-----------------------
                this.ddlProveedor.SelectedValue = Convert.ToString(active.IProvider_id.IProvider_id);
                this.ddSubFamilia.SelectedValue = Convert.ToString(active.ISubFamily_id.ISubFamily_id);
                this.ddlEstado.SelectedIndex = Convert.ToInt32(active.SStatus);
                pnlNuevo.Visible = true;
               
            }
            else
            {
                if (e.CommandName == "Eliminar")
                {
                    CActive.Delete(iActive_id);
                    LoadActives();
                }
            }

        }

            
    }
}