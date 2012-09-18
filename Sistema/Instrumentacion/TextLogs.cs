using System;
using System.Configuration;

namespace Instrumentacion
{
    public class TextLogs
    {
        private string strLogger;
        public TextLogs()
        {
            log4net.Config.XmlConfigurator.Configure();
            strLogger = ConfigurationManager.AppSettings["Logger"];
        }
        public void WriteError(string mensaje, Exception x)
        {
            log4net.ILog log = log4net.LogManager.GetLogger(strLogger);
            log.Error(mensaje, x);
        }
        public void WriteInfo(string mensaje)
        {
            log4net.ILog log = log4net.LogManager.GetLogger(strLogger);
            log.Info(mensaje);
        }
        public void WriteWarning(string mensaje, Exception x)
        {
            log4net.ILog log = log4net.LogManager.GetLogger(strLogger);
            log.Warn(mensaje, x);
        }
    }
}
