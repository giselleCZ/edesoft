﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.269
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// Microsoft.VSDesigner generó automáticamente este código fuente, versión=4.0.30319.269.
// 
#pragma warning disable 1591

namespace Sitio.localhost {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.ComponentModel;
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="ConsultaSoap", Namespace="http://tempuri.org/")]
    public partial class Consulta : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback TraerEmpleadosOperationCompleted;
        
        private System.Threading.SendOrPostCallback TraerEmpleadoXIdOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public Consulta() {
            this.Url = global::Sitio.Properties.Settings.Default.Sitio_localhost_Consulta;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event TraerEmpleadosCompletedEventHandler TraerEmpleadosCompleted;
        
        /// <remarks/>
        public event TraerEmpleadoXIdCompletedEventHandler TraerEmpleadoXIdCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/TraerEmpleados", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public Empleado[] TraerEmpleados() {
            object[] results = this.Invoke("TraerEmpleados", new object[0]);
            return ((Empleado[])(results[0]));
        }
        
        /// <remarks/>
        public void TraerEmpleadosAsync() {
            this.TraerEmpleadosAsync(null);
        }
        
        /// <remarks/>
        public void TraerEmpleadosAsync(object userState) {
            if ((this.TraerEmpleadosOperationCompleted == null)) {
                this.TraerEmpleadosOperationCompleted = new System.Threading.SendOrPostCallback(this.OnTraerEmpleadosOperationCompleted);
            }
            this.InvokeAsync("TraerEmpleados", new object[0], this.TraerEmpleadosOperationCompleted, userState);
        }
        
        private void OnTraerEmpleadosOperationCompleted(object arg) {
            if ((this.TraerEmpleadosCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.TraerEmpleadosCompleted(this, new TraerEmpleadosCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/TraerEmpleadoXId", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public Empleado[] TraerEmpleadoXId(int codigo) {
            object[] results = this.Invoke("TraerEmpleadoXId", new object[] {
                        codigo});
            return ((Empleado[])(results[0]));
        }
        
        /// <remarks/>
        public void TraerEmpleadoXIdAsync(int codigo) {
            this.TraerEmpleadoXIdAsync(codigo, null);
        }
        
        /// <remarks/>
        public void TraerEmpleadoXIdAsync(int codigo, object userState) {
            if ((this.TraerEmpleadoXIdOperationCompleted == null)) {
                this.TraerEmpleadoXIdOperationCompleted = new System.Threading.SendOrPostCallback(this.OnTraerEmpleadoXIdOperationCompleted);
            }
            this.InvokeAsync("TraerEmpleadoXId", new object[] {
                        codigo}, this.TraerEmpleadoXIdOperationCompleted, userState);
        }
        
        private void OnTraerEmpleadoXIdOperationCompleted(object arg) {
            if ((this.TraerEmpleadoXIdCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.TraerEmpleadoXIdCompleted(this, new TraerEmpleadoXIdCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <comentarios/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.233")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public partial class Empleado {
        
        private int codigoField;
        
        private string nombreField;
        
        /// <comentarios/>
        public int Codigo {
            get {
                return this.codigoField;
            }
            set {
                this.codigoField = value;
            }
        }
        
        /// <comentarios/>
        public string Nombre {
            get {
                return this.nombreField;
            }
            set {
                this.nombreField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    public delegate void TraerEmpleadosCompletedEventHandler(object sender, TraerEmpleadosCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class TraerEmpleadosCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal TraerEmpleadosCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public Empleado[] Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((Empleado[])(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    public delegate void TraerEmpleadoXIdCompletedEventHandler(object sender, TraerEmpleadoXIdCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class TraerEmpleadoXIdCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal TraerEmpleadoXIdCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public Empleado[] Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((Empleado[])(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591