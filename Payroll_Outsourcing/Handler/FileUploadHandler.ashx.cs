using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;

namespace Payroll_Outsourcing.Handler
{
    /// <summary>
    /// Summary description for FileUploadHandler
    /// </summary>
    public class FileUploadHandler : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {            
            string Option = HttpContext.Current.Request.QueryString["Option"] == null ? string.Empty : HttpContext.Current.Request.QueryString["Option"];
            string clientpath = string.Empty;

            if (Option.Equals("EmployeeMasterMandatory_MassInsert"))
            {
                clientpath = ConfigurationManager.AppSettings["EmployeeMasterMandatory_MassInsert"].ToString();
            }
            else if (Option.Equals("EmployeeMaster_MassInsert"))
            {
                clientpath = ConfigurationManager.AppSettings["EmployeeMaster_MassInsert"].ToString();
            }
            else if (Option.Equals("SalaryMaster"))
            {
                clientpath = ConfigurationManager.AppSettings["SalaryComponent_MassInsert"].ToString();
            }
            else
            {
                clientpath = Convert.ToString(ConfigurationManager.AppSettings["Uploads"]);
            }
            Random GenRandomFileName = new Random();
            if (context.Request.Files.Count > 0)
            {
                string filename = string.Empty;
                HttpFileCollection files = context.Request.Files;
                string GetExtnesion = string.Empty;
                string UniqueFilePath = string.Empty;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    filename = Path.GetFileName(file.FileName);
                    UniqueFilePath = GenRandomFileName.Next(1, 20) + filename;
                    if (Directory.Exists(clientpath))
                    {
                        file.SaveAs(clientpath + UniqueFilePath);
                    }
                    else
                    {
                        Directory.CreateDirectory(clientpath);
                        file.SaveAs(clientpath + UniqueFilePath);
                    }

                }
                HttpContext.Current.Session["FilePath"] = (clientpath + UniqueFilePath);
                context.Response.Write("Success");
            }
            else
            {
                context.Response.Write(string.Empty);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}