using System;
using System.Collections.Specialized;

namespace Payroll.TEAMLEASE.Logging
{
    /// <summary>
    /// This class exhibits the Factory Design Pattern.
    /// This class knows how to create a corresponding logger component.
    /// The clients requiring the logger component need to ask this factory
    /// for the component by specifying their ID and hence need not worry about
    /// how to create the component themselves.
    /// </summary>
    public class LoggerFactory
    {
        /// <summary>
        /// Private constructors, since no objects of LoggerFactory requried
        /// </summary>
        private LoggerFactory()
        {
        }

        static public ILogger CreateLogger(string identifier)
        {

            ILogger logger = null;
            if (identifier.CompareTo("FileLogger") == 0)
            {
                // Get the configuration related to HtmlFileLogger and
                // create the component.
                NameValueCollection HtmlConfig = Config.fileLoggerConfig;
                var path = AppDomain.CurrentDomain.BaseDirectory + @"Logs\Error_Log\" + HtmlConfig["FileName"];
                logger = new FileLogger(path,"Error");
            }
            else if (identifier.CompareTo("AuditFileLogger") == 0)
            {
                // Get the configuration related to HtmlFileLogger and
                // create the component.
                NameValueCollection AuditConfig = Config.AuditLoggerConfig;
                var path = AppDomain.CurrentDomain.BaseDirectory + @"Logs\Audit_Log\" + DateTime.Now.ToString("dd-MMM-yyyy") + AuditConfig["FileName"];
                logger = new FileLogger(path, "Audit");
            }
            return (logger);
        }
    }
}
