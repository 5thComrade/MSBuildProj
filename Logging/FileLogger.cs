using System;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Payroll.TEAMLEASE.Logging
{

    public static class FileName
    {
        public static string _FileName { get; set; }
    }
    /// This class is used to log messages to the text file
    public class FileLogger : ILogger
    {
        protected string path = null;
        protected string fileLoc = null;
        public FileLogger()
        {
        }
        public FileLogger(string fileName, string Log)
        {
            // Use default file name, if invalid value is passed
            if ((fileName != null) || (fileName != string.Empty))
            {
                if (!Log.Equals("Audit"))
                    path = fileName;
                else
                {
                    path = AppDomain.CurrentDomain.BaseDirectory + @"Logs\Audit_Log\Template.html";
                    fileLoc = fileName;
                }

                FileName._FileName = fileName;
            }
            else
            {
                path = fileName;
            }
            if (!Log.Equals("Audit"))
            {
                // If the file is not present, create it
                if (!File.Exists(path))
                {
                    FileStream fs = File.Create(path);
                    fs.Close();
                }
            }
            else
            {
                if (!File.Exists(fileLoc))
                {
                    File.Copy(path, fileLoc);
                }

            }
        }

        #region ILogger Members

        public void LogInfo(Exception ex, string method)
        {

            StringBuilder sbLogMessage = new StringBuilder(1024);

            StreamWriter writer = new StreamWriter(path, true);
            sbLogMessage.Append("<tr><td></td>");
            sbLogMessage.Append("<td>" + DateTime.Now.ToString() + "</td>");
            sbLogMessage.Append("<td>" + HttpContext.Current.Request.Url.ToString() + "</td>");
            sbLogMessage.Append("<td>" + method + "</td>");
            sbLogMessage.Append("<td>" + ex.Message.ToString() + "</td></tr>");
            writer.WriteLine(sbLogMessage);
            writer.Flush();
            writer.Close();
        }
    }

      

    public static class Audit
    {
        public static void AuditLogInfo(this Page page)
        {
            string controlId;
            Control control = null;
            if (!page.IsPostBack)
                controlId = string.Empty;
            string controlName = page.Request.Params["__EVENTTARGET"];
            if (!String.IsNullOrEmpty(controlName))
            {
                control = page.FindControl(controlName);
            }
            else
            {
                Control foundControl;
                foreach (string ctl in page.Request.Form)
                {
                    if (ctl.EndsWith(".x") || ctl.EndsWith(".y"))
                    {
                        controlId = ctl.Substring(0, ctl.Length - 2);
                        foundControl = page.FindControl(controlId);
                    }
                    else
                    {
                        foundControl = page.FindControl(ctl);
                    }
                    if (!(foundControl is Button || foundControl is ImageButton)) continue;
                    control = foundControl;
                    break;
                }
            }
            Write.write(control == null ? String.Empty : control.ID, control);
        }
    }

    public static class Write
    {
        public static void write(string s, Control s1)
        {
            Control controltype;
            string action, contol, page;
            DataSet ds = new DataSet();
            contol = s;
            page = HttpContext.Current.Request.RawUrl.ToString();
            action = HttpContext.Current.Request.RequestType;
            controltype = s1;
            string fileName = FileName._FileName;                    
            string strName = HttpContext.Current.Request.ServerVariables["LOGON_USER"];
            string ipaddress;
            ipaddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                        
            StringBuilder sbLogMessage = new StringBuilder(1024);

            StreamWriter writer = new StreamWriter(fileName, true);
            sbLogMessage.Append("<tr><td></td>");
            sbLogMessage.Append("<td>" + action + "</td>");
            sbLogMessage.Append("<td>" + controltype + "</td>");
            sbLogMessage.Append("<td>" + contol + "</td>");
            sbLogMessage.Append("<td>" + DateTime.Now.ToString() + "</td>");
            sbLogMessage.Append("<td>" + page + "</td>");
            sbLogMessage.Append("<td>" + ipaddress + "</td>");
            sbLogMessage.Append("<td>" + strName + "</td></tr>");
            writer.WriteLine(sbLogMessage);
            writer.Flush();
            writer.Close();
        }
    }

        #endregion

}
