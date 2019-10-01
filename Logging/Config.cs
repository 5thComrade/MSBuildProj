using System.Collections.Specialized;
using System.Configuration;

namespace Payroll.TEAMLEASE.Logging
{
    /// <summary>
    /// Class which has a responsibility of loading the application 
    /// configurations. This class loads the configuration from
    /// app.config file. Other class need not worry about how and
    /// where configurations are stored, they can refer this class.
    /// </summary>
    public sealed class Config
    {
        /// <summary>
        /// Looging componet identifier configured tobe used
        /// </summary>
        private static string strLogID = "";
        private static string strAuditLogID = "";
        public static string LogID
        {
            get { return strLogID; }
        }
        public static string AuditLogID
        {
            get { return strAuditLogID; }
        }

        /// <summary>
        /// HtmlFileLogger component related configurations
        /// </summary>
        private static NameValueCollection FileLoggerConfig;
        public static NameValueCollection fileLoggerConfig
        {
            get { return FileLoggerConfig; }
        }

        /// <summary>
        /// EventLogger component related configurations
        /// </summary>
        private static NameValueCollection auditLoggerConfig;
        public static NameValueCollection AuditLoggerConfig
        {
            get { return auditLoggerConfig; }
        }

        static Config()
        {
            // Load the configurations
            Load();
            AuditLoad();
        }

        public static void Load()
        {

            // Load app settings
            strLogID = ConfigurationManager.AppSettings["LogClassID"];

            // Load configurations related to HtmlFileLogger component
            FileLoggerConfig =
                (NameValueCollection)
                ConfigurationManager.GetSection("FileLoggerConfigurations");

          
        }

        public static void AuditLoad()
        {
            // Load app settings
            strAuditLogID = ConfigurationManager.AppSettings["AuditLogClassID"];
            // Load configurations related to EventLogger component
            auditLoggerConfig =
                (NameValueCollection)
                ConfigurationManager.GetSection("AuditLoggerConfigurations");
        }


    }
}
