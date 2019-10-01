using Payroll.Teamlease.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using Payroll.Teamlease.Entity;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Globalization;
using System.Web.Script.Serialization;
using System.IO;
using System.Net;
using System.Text;
namespace Payroll_Outsourcing.GUI.WebServices
{
    /// <summary>
    /// Summary description for Payroll_Webservices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Payroll_Webservices : System.Web.Services.WebService
    {


        #region Deepak
        #region EmployeeMaster
        [WebMethod(EnableSession = true)]
        public string BindEmpMasterTable(string ClientID)
        {
            BindEmpTemplateExport ObjBE_Employee_Information = new BindEmpTemplateExport();
            BAL_Employee_Information ObjBAL_Employee_Information = new BAL_Employee_Information();
            List<BindEmpTemplateExport> ls_EmployeeInformation = new List<BindEmpTemplateExport>();
            DataSet ds = new DataSet();
            try
            {
                ObjBE_Employee_Information.Client_ID = ClientID;
                ds = ObjBAL_Employee_Information.BindEmpMasterTable(ObjBE_Employee_Information);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    int i = 1;
                    foreach (DataRow drow in ds.Tables[0].Rows)
                    {
                        ls_EmployeeInformation.Add(new BindEmpTemplateExport
                        {
                            //EMPLOYEE_MASTER   
                            recid = i,
                            //  EM_ID = drow["EM_ID"].ToString(),
                            Emp_No = "<div style=text-decoration:underline;'><a href='#' onclick='EmployeeMasterView(\"" + drow["EM_ID"].ToString() + "\",\"V\")' style='text-decoration:underline;'>" + drow["EM_EMP_NO"].ToString() + "</a></div>",
                            Emp_Name = drow["EM_NAME"].ToString(),
                            Client_ID = drow["EM_CLIENT_ID"].ToString(),
                            Mob_No = drow["EM_MOBILE"].ToString(),
                            DOB = Convert.ToDateTime(drow["EM_DOB"]).ToString("dd-MM-yyyy"),
                            Gender = drow["EM_GENDER"].ToString(),
                            EmailID = drow["EM_EMAIL"].ToString(),
                            //EM_TITLE = drow["EM_TITLE"].ToString(),                    
                            Address = drow["EM_PRESENT_ADDRESS"].ToString(),
                            /* EM_PRESENT_CITY = drow["EM_PRESENT_CITY"].ToString(),
                             EM_PRESENT_STATE = drow["EM_PRESENT_STATE"].ToString(),
                             EM_PRESENT_PINCODE = drow["EM_PRESENT_PINCODE"].ToString(),
                             EM_PRESENT_COUNTRY = drow["EM_PRESENT_COUNTRY"].ToString(),
                             EM_NATIONALITY = drow["EM_NATIONALITY"].ToString(),
                             EM_JOB_TYPE = drow["EM_JOB_TYPE"].ToString(), */
                            Status = drow["EM_STATUS"].ToString(),
                            /*EM_CREATED_BY = drow["EM_CREATED_BY"].ToString(),
                            EM_CREATED_DATE = drow["EM_CREATED_DATE"].ToString(),
                            EM_MODIFIED_BY = drow["EM_MODIFIED_BY"].ToString(),
                            EM_MODIFIED_DATE = drow["EM_MODIFIED_DATE"].ToString(),*/

                            /*    //EMPLOYEE_ADDRESS   

                                EA_PERMANENT_ADDRESS = drow["EA_PERMANENT_ADDRESS"].ToString(),
                                EA_PERMANENT_CITY = drow["EA_PERMANENT_CITY"].ToString(),
                                EA_PERMANENT_STATE = drow["EA_PERMANENT_STATE"].ToString(),
                                EA_PERMANENT_PINCODE = drow["EA_PERMANENT_PINCODE"].ToString(),
                                EA_PERMANENT_COUNTRY = drow["EA_PERMANENT_COUNTRY"].ToString(),
                                EA_CREATED_BY = drow["EA_CREATED_BY"].ToString(),
                                EA_CREATED_DATE = drow["EA_CREATED_DATE"].ToString(),
                                EA_MODIFIED_BY = drow["EA_MODIFIED_BY"].ToString(),
                                EA_MODIFIED_DATE = drow["EA_MODIFIED_DATE"].ToString(),
                                //EMPLOYEE_OFFICIAL              
                                EO_EM_ID = drow["EO_EM_ID"].ToString(),
                                EO_DOJ = drow["EO_DOJ"].ToString(),
                                EO_SYS_DOJ = drow["EO_SYS_DOJ"].ToString(),
                                EO_DOL = drow["EO_DOL"].ToString(),
                                EO_SYS_DOL = drow["EO_SYS_DOL"].ToString(),
                                EO_DESIGNATION = drow["EO_DESIGNATION"].ToString(),
                                EO_DEPARTMENT = drow["EO_DEPARTMENT"].ToString(),
                                EO_COST_CENTER = drow["EO_COST_CENTER"].ToString(),
                                EO_BRANCH = drow["EO_BRANCH"].ToString(),
                                EO_PONUMBER = drow["EO_PONUMBER"].ToString(),
                                EO_CATEGORY = drow["EO_CATEGORY"].ToString(),
                                EO_JOBLOCATION = drow["EO_JOBLOCATION"].ToString(),
                                EO_PT_STATE = drow["EO_PT_STATE"].ToString(),
                                EO_ESI_CONTRIBUTION = drow["EO_ESI_CONTRIBUTION"].ToString(),
                                EO_PF_CONTRIBUTION = drow["EO_PF_CONTRIBUTION"].ToString(),
                                EO_PF_CAPPING = drow["EO_PF_CAPPING"].ToString(),
                                EO_HANDICAP = drow["EO_HANDICAP"].ToString(),
                                EO_SENIOR_CITIZEN = drow["EO_SENIOR_CITIZEN"].ToString(),
                                EO_PFUAN_NUMBER = drow["EO_PFUAN_NUMBER"].ToString(),
                                EO_ESI_NUMBER = drow["EO_ESI_NUMBER"].ToString(),
                                EO_AADHAR_NUMBER = drow["EO_AADHAR_NUMBER"].ToString(),
                                EO_PAN = drow["EO_PAN"].ToString(),
                                EO_PASSPORT_NUMBER = drow["EO_PASSPORT_NUMBER"].ToString(),
                                EO_DRIVERSLICENSE = drow["EO_DRIVERSLICENSE"].ToString(),
                                EO_OFFICE_ADDRESS = drow["EO_OFFICE_ADDRESS"].ToString(),
                                EO_OFFICE_CITY = drow["EO_OFFICE_CITY"].ToString(),
                                EO_OFFICE_STATE = drow["EO_OFFICE_STATE"].ToString(),
                                EO_OFFICE_PINCODE = drow["EO_OFFICE_PINCODE"].ToString(),
                                EO_OFFICE_COUNTRY = drow["EO_OFFICE_COUNTRY"].ToString(),
                                EO_PAYMODE = drow["EO_PAYMODE"].ToString(),
                                EO_BANK = drow["EO_BANK"].ToString(),
                                EO_BANKBRANCH = drow["EO_BANKBRANCH"].ToString(),
                                EO_ACC_NO = drow["EO_ACC_NO"].ToString(),
                                EO_IFSC_CODE = drow["EO_IFSC_CODE"].ToString(),
                                EO_CREATEDBY = drow["EO_CREATEDBY"].ToString(),
                                EO_CREATED_DATE = drow["EO_CREATED_DATE"].ToString(),
                                //EMPLOYEE_EDUCATION            
                                EE_EM_ID = drow["EE_EM_ID"].ToString(),
                                EE_HIGHESTQUALIFICATION = drow["EE_HIGHESTQUALIFICATION"].ToString(),
                                EE_PASSEDYEAR = drow["EE_PASSEDYEAR"].ToString(),
                                EE_SCOREPERCENTAGE = drow["EE_SCOREPERCENTAGE"].ToString(),
                                EE_CREATED_BY = drow["EE_CREATED_BY"].ToString(),
                                EE_CREATED_DATE = drow["EE_CREATED_DATE"].ToString(),

                                //EMPLOYEE_FAMILY 
                                EF_EM_ID = drow["EF_EM_ID"].ToString(),
                                EF_FATHER_NAME = drow["EF_FATHER_NAME"].ToString(),
                                EF_FATHER_DOB = drow["EF_FATHER_DOB"].ToString(),
                                EF_MOTHER_NAME = drow["EF_MOTHER_NAME"].ToString(),
                                EF_MOTHER_DOB = drow["EF_MOTHER_DOB"].ToString(),
                                EF_SPOUSE_NAME = drow["EF_SPOUSE_NAME"].ToString(),
                                EF_SPOUSE_DOB = drow["EF_SPOUSE_DOB"].ToString(),
                                EF_CHILD1_NAME = drow["EF_CHILD1_NAME"].ToString(),
                                EF_CHILD1_DOB = drow["EF_CHILD1_DOB"].ToString(),
                                EF_CHILD2_NAME = drow["EF_CHILD2_NAME"].ToString(),
                                EF_CHILD2_DOB = drow["EF_CHILD2_DOB"].ToString(),
                                EF_CREATED_BY = drow["EF_CREATED_BY"].ToString(),
                                EF_CREATED_DATE = drow["EF_CREATED_DATE"].ToString(),

                                //EMPLOYEE_WORK               
                                EW_EM_ID = drow["EW_EM_ID"].ToString(),
                                EW_PREVEXP = drow["EW_PREVEXP"].ToString(),
                                EW_PREVCOMPANY = drow["EW_PREVCOMPANY"].ToString(),
                                EW_PREVDESIGNATION = drow["EW_PREVDESIGNATION"].ToString(),
                                EW_PREVDOJ = drow["EW_PREVDOJ"].ToString(),
                                EW_PREVDOL = drow["EW_PREVDOL"].ToString(),
                                EW_CREATED_BY = drow["EW_CREATED_BY"].ToString(),
                                EW_CREATED_DATE = drow["EW_CREATED_DATE"].ToString() */
                        });
                        i = i + 1;
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_Employee_Information = null;
                ObjBAL_Employee_Information = null;
            }

            var json = JsonConvert.SerializeObject(ls_EmployeeInformation);
            return json;
        }

        [WebMethod(EnableSession = true)]
        public List<BE_Employee_Information> Specific_EmployeeEducation_Details(string Emp_ID)
        {
            BE_Employee_Information ObjBE_Employee_Information = new BE_Employee_Information();
            BAL_Employee_Information ObjBAL_Employee_Information = new BAL_Employee_Information();
            List<BE_Employee_Information> ls_EducationDetails = new List<BE_Employee_Information>();
            DataSet ds = new DataSet();
            try
            {
                ObjBE_Employee_Information.EM_ID = Emp_ID;
                ds = ObjBAL_Employee_Information.Specific_EmployeeEducation_Details(ObjBE_Employee_Information);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow drow in ds.Tables[0].Rows)
                    {
                        ls_EducationDetails.Add(new BE_Employee_Information
                        {
                            EE_HIGHESTQUALIFICATION = drow["QUALIFICATION"].ToString(),
                            EE_PASSEDYEAR = drow["YEAROFPASSING"].ToString(),
                            EE_SCOREPERCENTAGE = drow["PERCENTAGE"].ToString(),
                            EE_INSTITUTENAME = drow["INSTITUTENAME"].ToString(),
                        });
                    }
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                ObjBE_Employee_Information = null;
                ObjBAL_Employee_Information = null;
            }
            return ls_EducationDetails;
        }

        [WebMethod(EnableSession = true)]
        public string UpdateEmployee(
            string Option
           , string Emp_Id
           , string Email
           , string DOB
           , string Mobile
           , string Emp_No
           , string Client_ID
           , string Saluation
           , string JobType
           , string Gender
           , string Present_Address
           , string Present_State
           , string Present_City
           , string Present_Country
           , string Present_Nationality
           , string Present_Pincode
           , string Permanent_Address
           , string Permanent_State
           , string Permanent_City
           , string Permanent_Country
           , string Permanent_Nationality
           , string Permanent_Pincode
           , string Mailing_Address
           , string Mailing_State
           , string Mailing_City
           , string Mailing_Country
           , string Mailing_Nationality
           , string Mailing_Pincode
           , string Prev_Company
           , string Prev_Designation
           , string YearofExp
           , string Skills
           , string Prev_Doj
           , string Prev_Dol
           , string Qualification
           , string InstituteName
           , string YearofPassing
           , string Percentage
           , string Official_Doj
           , string Official_Dol
           , string Official_Designation
           , string Official_PFCapping
           , string Official_Department
           , string Official_PoNo
           , string Official_Branch
           , string Official_ESIContribution
           , string Official_JobLocation
           , string Official_CostCenter
           , string Official_Category
           , string Official_PFContribution
           , string Official_PTState
           , string Official_ESINo
           , string Official_AadharNo
           , string Official_Handicap
           , string Official_PFUANNo
           , string Official_PassportNo
           , string Official_DLNo
           , string Official_SeniorCitizen
           , string Official_PANNo
           , string Official_City
           , string Official_State
           , string Official_Country
           , string Official_Pincode
           , string Official_Address
           , string Bank_IFSCCode
           , string Bank_Account
           , string Bank_PayMode
           , string Bank_Name
           , string Bank_Branch
           , string Bank_Address
           , string Created_By)
        {
            BE_Employee_Information ObjBE_Employee_Information = new BE_Employee_Information();
            BAL_Employee_Information ObjBAL_Employee_Information = new BAL_Employee_Information();
            DataSet ds = new DataSet();
            string result = string.Empty;
            try
            {
                //Employee Profile
                ObjBE_Employee_Information.Option = Option;
                ObjBE_Employee_Information.EM_ID = Emp_Id;
                ObjBE_Employee_Information.EM_EMAIL = Email;
                ObjBE_Employee_Information.EM_DOB = DOB;
                ObjBE_Employee_Information.EM_MOBILE = Mobile;
                //Employee Primary Details
                ObjBE_Employee_Information.EM_EMP_NO = Emp_No;
                ObjBE_Employee_Information.EM_CLIENT_ID = Client_ID;
                ObjBE_Employee_Information.EM_TITLE = Saluation;
                ObjBE_Employee_Information.EM_JOB_TYPE = JobType;
                ObjBE_Employee_Information.EM_GENDER = Gender;
                //Employee Present Address
                ObjBE_Employee_Information.EM_PRESENT_ADDRESS = Present_Address;
                ObjBE_Employee_Information.EM_PRESENT_STATE = Present_State;
                ObjBE_Employee_Information.EM_PRESENT_CITY = Present_City;
                ObjBE_Employee_Information.EM_PRESENT_COUNTRY = Present_Country;
                ObjBE_Employee_Information.EM_NATIONALITY = Present_Nationality;
                ObjBE_Employee_Information.EM_PRESENT_PINCODE = Present_Pincode;
                //Employee Permanent Address
                ObjBE_Employee_Information.EA_PERMANENT_ADDRESS = Permanent_Address;
                ObjBE_Employee_Information.EA_PERMANENT_STATE = Permanent_State;
                ObjBE_Employee_Information.EA_PERMANENT_CITY = Permanent_City;
                ObjBE_Employee_Information.EA_PERMANENT_COUNTRY = Permanent_Country;
                ObjBE_Employee_Information.EA_PERMANENT_NATIONALITY = Permanent_Nationality;
                ObjBE_Employee_Information.EA_PERMANENT_PINCODE = Permanent_Pincode;
                //Employee Mailing Address
                ObjBE_Employee_Information.EA_MAILING_ADDRESS = Mailing_Address;
                ObjBE_Employee_Information.EA_MAILING_STATE = Mailing_State;
                ObjBE_Employee_Information.EA_MAILING_CITY = Mailing_City;
                ObjBE_Employee_Information.EA_MAILING_COUNTRY = Mailing_Country;
                ObjBE_Employee_Information.EA_MAILING_NATIONALITY = Mailing_Nationality;
                ObjBE_Employee_Information.EA_MAILING_PINCODE = Permanent_Pincode;
                //Employee Work Experience
                ObjBE_Employee_Information.EW_PREVCOMPANY = Prev_Company;
                ObjBE_Employee_Information.EW_PREVDESIGNATION = Prev_Designation;
                ObjBE_Employee_Information.EW_PREVEXP = YearofExp;
                ObjBE_Employee_Information.EW_SKILLS = Skills;
                ObjBE_Employee_Information.EW_PREVDOJ = Prev_Doj;
                ObjBE_Employee_Information.EW_PREVDOL = Prev_Dol;
                //Employee Education
                ObjBE_Employee_Information.EE_HIGHESTQUALIFICATION = Qualification;
                ObjBE_Employee_Information.EE_INSTITUTENAME = InstituteName;
                ObjBE_Employee_Information.EE_PASSEDYEAR = YearofPassing;
                ObjBE_Employee_Information.EE_SCOREPERCENTAGE = Percentage;
                //Employee Official
                ObjBE_Employee_Information.EO_DOJ = Official_Doj;
                ObjBE_Employee_Information.EO_DOL = Official_Dol;
                ObjBE_Employee_Information.EO_DESIGNATION = Official_Designation;
                ObjBE_Employee_Information.EO_PF_CAPPING = Official_PFCapping;
                ObjBE_Employee_Information.EO_DEPARTMENT = Official_Department;
                ObjBE_Employee_Information.EO_PONUMBER = Official_PoNo;
                ObjBE_Employee_Information.EO_BRANCH = Official_Branch;
                ObjBE_Employee_Information.EO_ESI_CONTRIBUTION = Official_ESIContribution;
                ObjBE_Employee_Information.EO_JOBLOCATION = Official_JobLocation;
                ObjBE_Employee_Information.EO_COST_CENTER = Official_CostCenter;
                ObjBE_Employee_Information.EO_CATEGORY = Official_Category;
                ObjBE_Employee_Information.EO_PF_CONTRIBUTION = Official_PFContribution;
                ObjBE_Employee_Information.EO_PT_STATE = Official_PTState;
                ObjBE_Employee_Information.EO_ESI_NUMBER = Official_ESINo;
                ObjBE_Employee_Information.EO_AADHAR_NUMBER = Official_AadharNo;
                ObjBE_Employee_Information.EO_HANDICAP = Official_Handicap;
                ObjBE_Employee_Information.EO_PFUAN_NUMBER = Official_PFUANNo;
                ObjBE_Employee_Information.EO_PASSPORT_NUMBER = Official_PassportNo;
                ObjBE_Employee_Information.EO_DRIVERSLICENSE = Official_DLNo;
                ObjBE_Employee_Information.EO_SENIOR_CITIZEN = Official_SeniorCitizen;
                ObjBE_Employee_Information.EO_PAN = Official_PANNo;
                ObjBE_Employee_Information.EO_OFFICE_CITY = Official_City;
                ObjBE_Employee_Information.EO_OFFICE_STATE = Official_State;
                ObjBE_Employee_Information.EO_OFFICE_COUNTRY = Official_Country;
                ObjBE_Employee_Information.EO_OFFICE_PINCODE = Official_Pincode;
                ObjBE_Employee_Information.EO_OFFICE_ADDRESS = Official_Address;
                //Employee Bank
                ObjBE_Employee_Information.EB_IFSC_Code = Bank_IFSCCode;
                ObjBE_Employee_Information.EB_Account_Number = Bank_Account;
                ObjBE_Employee_Information.EB_Payment_Mode = Bank_PayMode;
                ObjBE_Employee_Information.EB_Bank_Name = Bank_Name;
                ObjBE_Employee_Information.EB_Branch = Bank_Branch;
                ObjBE_Employee_Information.EB_Address = Bank_Address;

                ObjBE_Employee_Information.EM_CREATED_BY = Created_By;

                ds = ObjBAL_Employee_Information.UpdateEmployee(ObjBE_Employee_Information);
                result = ds.Tables[0].Rows[0][0].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_Employee_Information = null;
                ObjBAL_Employee_Information = null;
            }
            return result;
        }

        [WebMethod(EnableSession = true)]
        public List<BE_Employee_Information> BindEmpMasterByID(string ClientID, string Assc_ID)
        {
            BE_Employee_Information ObjBE_Employee_Information = new BE_Employee_Information();
            BAL_Employee_Information ObjBAL_Employee_Information = new BAL_Employee_Information();
            List<BE_Employee_Information> ls_EmployeeInformation = new List<BE_Employee_Information>();
            DataSet ds = new DataSet();
            string EducationDetails = string.Empty;
            try
            {
                ObjBE_Employee_Information.EM_CLIENT_ID = ClientID;
                ObjBE_Employee_Information.EM_ID = Assc_ID;
                ds = ObjBAL_Employee_Information.BindEmpMasterByID(ObjBE_Employee_Information);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    string Previous_DOJ = string.Empty;
                    string Previous_DOL = string.Empty;
                    string Official_Doj = string.Empty;
                    string Official_DOl = string.Empty;

                    if (ds.Tables[1].Rows.Count > 0 || ds.Tables[1].Rows.Count == 0)
                    {
                        EducationDetails = JsonConvert.SerializeObject(ds.Tables[1]);
                    }
                    foreach (DataRow drow in ds.Tables[0].Rows)
                    {
                        //if (!string.IsNullOrEmpty(drow["EW_PREVDOJ"].ToString()))
                        //{
                        //    Previous_DOJ = Convert.ToDateTime(drow["EW_PREVDOJ"]).ToString("dd-MM-yyyy");

                        //}
                        //if (!string.IsNullOrEmpty(drow["EW_PREVDOJ"].ToString()))
                        //{
                        //    Previous_DOL = Convert.ToDateTime(drow["EW_PREVDOL"]).ToString("dd-MM-yyyy");
                        //}

                        //if (!string.IsNullOrEmpty(drow["EO_DOJ"].ToString()))
                        //{
                        //    Official_Doj = Convert.ToDateTime(drow["EO_DOJ"]).ToString("dd-MM-yyyy");

                        //}
                        //if (!string.IsNullOrEmpty(drow["EO_DOL"].ToString()))
                        //{
                        //    Official_DOl = Convert.ToDateTime(drow["EO_DOL"]).ToString("dd-MM-yyyy");
                        //}

                        Official_Doj = drow["EO_DOJ"].ToString();
                        Official_DOl = drow["EO_DOL"].ToString();
                        if (Official_Doj.Equals("-"))
                        {
                            Official_Doj = "-";
                        }
                        else
                        {
                            // Official_Doj = Convert.ToDateTime(drow["EO_DOJ"]).ToString("dd-MM-yyyy");
                        }

                        if (Official_DOl.Equals("-"))
                        {
                            Official_DOl = "-";
                        }
                        else
                        {
                            // Official_DOl = Convert.ToDateTime(drow["EO_DOL"]).ToString("dd-MM-yyyy");
                        }
                        ls_EmployeeInformation.Add(new BE_Employee_Information
                        {
                            //EMPLOYEE_MASTER   
                            EM_ID = drow["EM_ID"].ToString(),
                            EM_EMP_NO = drow["EM_EMP_NO"].ToString(),
                            EM_CLIENT_ID = drow["EM_CLIENT_ID"].ToString(),
                            EM_DOB = Convert.ToDateTime(drow["EM_DOB"]).ToString("dd-MM-yyyy"),
                            EM_GENDER = drow["EM_GENDER"].ToString(),
                            EM_TITLE = drow["CLV_VALUE"].ToString(),
                            EM_SALUATIONVALUE = drow["EM_TITLE"].ToString(),
                            EM_NAME = drow["EM_NAME"].ToString(),
                            EM_EMAIL = drow["EM_EMAIL"].ToString(),
                            EM_MOBILE = drow["EM_MOBILE"].ToString(),
                            EM_PRESENT_ADDRESS = drow["EM_PRESENT_ADDRESS"].ToString(),
                            EM_PRESENT_CITY = drow["EM_PRESENT_CITY"].ToString(),
                            EM_PRESENT_STATE = drow["EM_PRESENT_STATE"].ToString(),
                            EM_PRESENT_PINCODE = drow["EM_PRESENT_PINCODE"].ToString(),
                            EM_PRESENT_COUNTRY = drow["EM_PRESENT_COUNTRY"].ToString(),
                            EM_NATIONALITY = drow["EM_NATIONALITY"].ToString(),
                            EM_JOB_TYPE = drow["EM_JOB_TYPE"].ToString(),
                            EM_JOBTYPEVALUE = drow["EM_JOBTYPEVALUE"].ToString(),
                            EM_STATUS = drow["EM_STATUS"].ToString(),
                            EM_CREATED_BY = drow["EM_CREATED_BY"].ToString(),
                            EM_CREATED_DATE = drow["EM_CREATED_DATE"].ToString(),
                            EM_MODIFIED_BY = drow["EM_MODIFIED_BY"].ToString(),
                            EM_MODIFIED_DATE = drow["EM_MODIFIED_DATE"].ToString(),
                            EM_PROFILE_IMG = "data:image/jpg;base64," + drow["EM_PROFILE_IMG"].ToString(),

                            ////EMPLOYEE_ADDRESS   
                            EA_PERMANENT_ADDRESS = drow["EA_PERMANENT_ADDRESS"].ToString(),
                            EA_PERMANENT_CITY = drow["EA_PERMANENT_CITY"].ToString(),
                            EA_PERMANENT_STATE = drow["EA_PERMANENT_STATE"].ToString(),
                            EA_PERMANENT_PINCODE = drow["EA_PERMANENT_PINCODE"].ToString(),
                            EA_PERMANENT_COUNTRY = drow["EA_PERMANENT_COUNTRY"].ToString(),
                            EA_PERMANENT_NATIONALITY = drow["EA_PERMANENT_NATIONALITY"].ToString(),
                            EA_CREATED_BY = drow["EA_CREATED_BY"].ToString(),
                            EA_CREATED_DATE = drow["EA_CREATED_DATE"].ToString(),
                            EA_MODIFIED_BY = drow["EA_MODIFIED_BY"].ToString(),
                            EA_MODIFIED_DATE = drow["EA_MODIFIED_DATE"].ToString(),

                            EA_MAILING_ADDRESS = drow["EA_MAILING_ADDRESS"].ToString(),
                            EA_MAILING_CITY = drow["EA_MAILING_CITY"].ToString(),
                            EA_MAILING_STATE = drow["EA_MAILING_STATE"].ToString(),
                            EA_MAILING_PINCODE = drow["EA_MAILING_PINCODE"].ToString(),
                            EA_MAILING_COUNTRY = drow["EA_MAILING_COUNTRY"].ToString(),
                            EA_MAILING_NATIONALITY = drow["EA_MAILING_NATIONALITY"].ToString(),

                            //EMPLOYEE_OFFICIAL              
                            EO_EM_ID = drow["EO_EM_ID"].ToString(),
                            EO_DOJ = Official_Doj,
                            EO_SYS_DOJ = drow["EO_SYS_DOJ"].ToString(),
                            EO_DOL = Official_DOl,
                            EO_SYS_DOL = drow["EO_SYS_DOL"].ToString(),
                            EO_DESIGNATION = drow["EO_DESIGNATION"].ToString(),
                            EO_DEPARTMENT = drow["EO_DEPARTMENT"].ToString(),
                            EO_COST_CENTER = drow["EO_COST_CENTER"].ToString(),
                            EO_BRANCH = drow["EO_BRANCH"].ToString(),
                            EO_PONUMBER = drow["EO_PONUMBER"].ToString(),
                            EO_CATEGORY = drow["EO_CATEGORY"].ToString(),
                            EO_JOBLOCATION = drow["EO_JOBLOCATION"].ToString(),
                            EO_PT_STATE = drow["EO_PT_STATE"].ToString(),
                            EO_ESI_CONTRIBUTION = drow["EO_ESI_CONTRIBUTION"].ToString(),
                            EO_PF_CONTRIBUTION = drow["EO_PF_CONTRIBUTION"].ToString(),
                            EO_PF_CAPPING = drow["EO_PF_CAPPING"].ToString(),
                            EO_HANDICAP = drow["EO_HANDICAP"].ToString(),
                            EO_SENIOR_CITIZEN = drow["EO_SENIOR_CITIZEN"].ToString(),
                            EO_PFUAN_NUMBER = drow["EO_PFUAN_NUMBER"].ToString(),
                            EO_ESI_NUMBER = drow["EO_ESI_NUMBER"].ToString(),
                            EO_AADHAR_NUMBER = drow["EO_AADHAR_NUMBER"].ToString(),
                            EO_PAN = drow["EO_PAN"].ToString(),
                            EO_PASSPORT_NUMBER = drow["EO_PASSPORT_NUMBER"].ToString(),
                            EO_DRIVERSLICENSE = drow["EO_DRIVERSLICENSE"].ToString(),
                            EO_OFFICE_ADDRESS = drow["EO_OFFICE_ADDRESS"].ToString(),
                            EO_OFFICE_CITY = drow["EO_OFFICE_CITY"].ToString(),
                            EO_OFFICE_STATE = drow["EO_OFFICE_STATE"].ToString(),
                            EO_OFFICE_PINCODE = drow["EO_OFFICE_PINCODE"].ToString(),
                            EO_OFFICE_COUNTRY = drow["EO_OFFICE_COUNTRY"].ToString(),
                            EO_PAYMODE = drow["EO_PAYMODE"].ToString(),
                            EO_BANK = drow["EO_BANK"].ToString(),
                            EO_BANKBRANCH = drow["EO_BANKBRANCH"].ToString(),
                            EO_ACC_NO = drow["EO_ACC_NO"].ToString(),
                            EO_IFSC_CODE = drow["EO_IFSC_CODE"].ToString(),
                            EO_CREATEDBY = drow["EO_CREATEDBY"].ToString(),
                            EO_CREATED_DATE = drow["EO_CREATED_DATE"].ToString(),

                            //EMPLOYEE_EDUCATION            
                            //EE_EM_ID = drow["EMP_ID"].ToString(),
                            //EE_HIGHESTQUALIFICATION = drow["QUALIFICATION"].ToString(),
                            //EE_PASSEDYEAR = drow["YEAROFPASSING"].ToString(),
                            //EE_SCOREPERCENTAGE = drow["PERCENTAGE"].ToString(),
                            //EE_CREATED_BY = drow["EE_CREATED_BY"].ToString(),
                            //EE_CREATED_DATE = drow["EE_CREATED_DATE"].ToString(),
                            //EE_INSTITUTENAME = drow["INSTITUTENAME"].ToString(),

                            ////EMPLOYEE_FAMILY              
                            EF_EM_ID = drow["EF_EM_ID"].ToString(),
                            EF_FATHER_NAME = drow["EF_FATHER_NAME"].ToString(),
                            EF_FATHER_DOB = drow["EF_FATHER_DOB"].ToString(),
                            EF_MOTHER_NAME = drow["EF_MOTHER_NAME"].ToString(),
                            EF_MOTHER_DOB = drow["EF_MOTHER_DOB"].ToString(),
                            EF_SPOUSE_NAME = drow["EF_SPOUSE_NAME"].ToString(),
                            EF_SPOUSE_DOB = drow["EF_SPOUSE_DOB"].ToString(),
                            EF_CHILD1_NAME = drow["EF_CHILD1_NAME"].ToString(),
                            EF_CHILD1_DOB = drow["EF_CHILD1_DOB"].ToString(),
                            EF_CHILD2_NAME = drow["EF_CHILD2_NAME"].ToString(),
                            EF_CHILD2_DOB = drow["EF_CHILD2_DOB"].ToString(),
                            EF_CREATED_BY = drow["EF_CREATED_BY"].ToString(),
                            EF_CREATED_DATE = drow["EF_CREATED_DATE"].ToString(),

                            ////EMPLOYEE_WORK               
                            EW_EM_ID = drow["EW_EM_ID"].ToString(),
                            EW_PREVEXP = drow["EW_PREVEXP"].ToString(),
                            EW_PREVCOMPANY = drow["EW_PREVCOMPANY"].ToString(),
                            EW_PREVDESIGNATION = drow["EW_PREVDESIGNATION"].ToString(),
                            EW_PREVDOJ = drow["EW_PREVDOJ"].ToString(),
                            EW_PREVDOL = drow["EW_PREVDOl"].ToString(),
                            EW_SKILLS = drow["EW_SKILLS"].ToString(),
                            EW_CREATED_BY = drow["EW_CREATED_BY"].ToString(),
                            EW_CREATED_DATE = drow["EW_CREATED_DATE"].ToString(),

                            //EMPLOYEE BANK DETAILS
                            EB_IFSC_Code = drow["EO_IFSC_CODE"].ToString(),
                            EB_Payment_Mode = drow["EO_PAYMODE"].ToString(),
                            EB_PAYMODE_VALUE = drow["CLV_PAYMODEVALUE"].ToString(),
                            EB_Account_Number = drow["EO_ACC_NO"].ToString(),
                            EB_Bank_Name = drow["EO_BANK"].ToString(),
                            EB_Branch = drow["EO_BANKBRANCH"].ToString(),
                            EB_Address = drow["EO_BANK_ADDRESS"].ToString(),
                            Json_EducationDetails = EducationDetails
                        });
                    }


                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_Employee_Information = null;
                ObjBAL_Employee_Information = null;
            }
            return ls_EmployeeInformation;
        }

        [WebMethod(EnableSession = true)]
        public List<BE_Common_Lookup_Values> GetCommonLookupValues(string Lookupvalue)
        {
            BE_Common_Lookup_Values objBE_Common_Lookup_Values = new BE_Common_Lookup_Values();
            BAL_Common_Lookup_Values objBAL_Common_Lookup_Values = new BAL_Common_Lookup_Values();
            List<BE_Common_Lookup_Values> ls_LookUp_Values = new List<BE_Common_Lookup_Values>();
            DataSet ds = new DataSet();
            try
            {
                objBE_Common_Lookup_Values.CLV_TYPE = Lookupvalue;
                ds = objBAL_Common_Lookup_Values.GetCommonLookupValues(objBE_Common_Lookup_Values);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {
                        ls_LookUp_Values.Add(new BE_Common_Lookup_Values
                        {
                            CLV_LOOKUP_ID = Convert.ToString(dtrow["CLV_LOOKUP_ID"]),
                            CLV_VALUE = Convert.ToString(dtrow["CLV_VALUE"]),
                            CLV_REMARKS = Convert.ToString(dtrow["CLV_REMARKS"])
                        });
                    }

                }

            }

            catch (Exception ex)
            {
                //
            }
            finally
            {
                objBE_Common_Lookup_Values = null;
                objBAL_Common_Lookup_Values = null;
            }
            return ls_LookUp_Values;
        }

        private byte[] ConvertStringToBytes(string input)
        {
            MemoryStream stream = new MemoryStream();

            using (StreamWriter writer = new StreamWriter(stream))
            {
                writer.Write(input);
                writer.Flush();
            }

            return stream.ToArray();
        }

        [WebMethod(EnableSession = true)]
        public string APICallBankDetails(string IFSCCODE)
        {
            string code = IFSCCODE;
            string url = "https://ifsc-api.herokuapp.com/" + code;
            string errorText;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            try
            {
                WebResponse response = request.GetResponse();
                using (Stream responseStream = response.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
                    return reader.ReadToEnd();
                }
            }
            catch (WebException ex)
            {
                WebResponse errorResponse = ex.Response;
                using (Stream responseStream = errorResponse.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, Encoding.GetEncoding("utf-8"));
                    errorText = reader.ReadToEnd();
                    // log errorText
                }
                //throw;
                return errorText;
            }


        }


        [WebMethod(EnableSession = true)]
        public string EmployeeMasterInformation_Insert(
            string EM_EMP_NO, string EM_NAME, string EM_EMAIL
            , string EM_CLIENT_ID, string EM_JOB_TYPE, string EM_MOBILE
            , string EM_TITLE, string EM_DOB, string EM_GENDER
            , string EM_PRESENT_ADDRESS, string EM_PRESENT_CITY, string EM_PRESENT_STATE
            , string EM_NATIONALITY, string EM_PRESENT_COUNTRY, string EM_PRESENT_PINCODE
            , string EA_PERMANENT_ADDRESS, string EA_PERMANENT_CITY, string EA_PERMANENT_STATE
            , string EA_PERMANENT_NATIONALITY, string EA_PERMANENT_COUNTRY, string EA_PERMANENT_PINCODE
            , string EA_MAILING_ADDRESS, string EA_MAILING_CITY, string EA_MAILING_STATE
            , string EA_MAILING_NATIONALITY, string EA_MAILING_COUNTRY, string EA_MAILING_PINCODE
            , string Qualification
            , string EW_PREVCOMPANY, string EW_PREVDESIGNATION, string EW_PREVEXP
            , string EW_SKILLS, string EW_PREVDOJ, string EW_PREVDOL
            , string EO_DOJ, string EO_DOL, string EO_DESIGNATION
            , string EO_DEPARTMENT, string EO_BRANCH, string EO_JOBLOCATION
            , string EO_COST_CENTER, string EO_PONUMBER, string EO_CATEGORY
            , string EO_PT_STATE, string EO_ESI_NUMBER, string EO_AADHAR_NUMBER
            , string EO_PFUAN_NUMBER, string EO_PASSPORT_NUMBER, string EO_DRIVERSLICENSE
            , string EO_PAN, string EO_PF_CAPPING, string EO_ESI_CONTRIBUTION, string EO_PF_CONTRIBUTION
            , string EO_HANDICAP, string EO_SENIOR_CITIZEN, string EO_OFFICE_STATE
            , string EO_OFFICE_CITY, string EO_OFFICE_COUNTRY, string EO_OFFICE_PINCODE
            , string EO_OFFICE_ADDRESS, string EB_IFSC_Code, string EB_Payment_Mode
            , string EB_Account_Number, string EB_Bank_Name, string EB_Branch, string EB_Address
            , string EM_CREATED_BY)
        {
            BE_Employee_Information ObjBE_Employee_Information = new BE_Employee_Information();
            BAL_Employee_Information ObjBAL_Employee_Information = new BAL_Employee_Information();
            DataSet ds = new DataSet();
            string result = string.Empty;
            try
            {
                //EMPLOYEE MASTER               
                ObjBE_Employee_Information.EM_EMP_NO = EM_EMP_NO;
                ObjBE_Employee_Information.EM_NAME = EM_NAME;
                ObjBE_Employee_Information.EM_EMAIL = EM_EMAIL;
                ObjBE_Employee_Information.EM_CLIENT_ID = EM_CLIENT_ID;
                ObjBE_Employee_Information.EM_JOB_TYPE = EM_JOB_TYPE;
                ObjBE_Employee_Information.EM_MOBILE = EM_MOBILE;
                ObjBE_Employee_Information.EM_TITLE = EM_TITLE;
                ObjBE_Employee_Information.EM_DOB = EM_DOB;
                ObjBE_Employee_Information.EM_GENDER = EM_GENDER;
                //EMPLOYEE ADDRESS
                ObjBE_Employee_Information.EM_PRESENT_ADDRESS = EM_PRESENT_ADDRESS;
                ObjBE_Employee_Information.EM_PRESENT_CITY = EM_PRESENT_CITY;
                ObjBE_Employee_Information.EM_PRESENT_STATE = EM_PRESENT_STATE;
                ObjBE_Employee_Information.EM_NATIONALITY = EM_NATIONALITY;
                ObjBE_Employee_Information.EM_PRESENT_COUNTRY = EM_PRESENT_COUNTRY;
                ObjBE_Employee_Information.EM_PRESENT_PINCODE = EM_PRESENT_PINCODE;
                ObjBE_Employee_Information.EM_CREATED_BY = EM_CREATED_BY;
                //EMPLOYEE PERMANENT ADDRESS
                ObjBE_Employee_Information.EA_PERMANENT_ADDRESS = EA_PERMANENT_ADDRESS;
                ObjBE_Employee_Information.EA_PERMANENT_CITY = EA_PERMANENT_CITY;
                ObjBE_Employee_Information.EA_PERMANENT_STATE = EA_PERMANENT_STATE;
                ObjBE_Employee_Information.EA_PERMANENT_NATIONALITY = EA_PERMANENT_NATIONALITY;
                ObjBE_Employee_Information.EA_PERMANENT_COUNTRY = EA_PERMANENT_COUNTRY;
                ObjBE_Employee_Information.EA_PERMANENT_PINCODE = EA_PERMANENT_PINCODE;

                ObjBE_Employee_Information.EA_CREATED_BY = EM_CREATED_BY;

                //EMPLOYEE MAILING ADDRESS
                ObjBE_Employee_Information.EA_MAILING_ADDRESS = EA_MAILING_ADDRESS;
                ObjBE_Employee_Information.EA_MAILING_CITY = EA_MAILING_CITY;
                ObjBE_Employee_Information.EA_MAILING_STATE = EA_MAILING_STATE;
                ObjBE_Employee_Information.EA_MAILING_COUNTRY = EA_MAILING_COUNTRY;
                ObjBE_Employee_Information.EA_MAILING_PINCODE = EA_MAILING_PINCODE;
                ObjBE_Employee_Information.EA_MAILING_NATIONALITY = EA_MAILING_NATIONALITY;

                //EMPLOYEE WORK
                ObjBE_Employee_Information.EW_PREVCOMPANY = EW_PREVCOMPANY;
                ObjBE_Employee_Information.EW_PREVDESIGNATION = EW_PREVDESIGNATION;
                ObjBE_Employee_Information.EW_PREVEXP = EW_PREVEXP;
                ObjBE_Employee_Information.EW_SKILLS = EW_SKILLS;
                ObjBE_Employee_Information.EW_PREVDOJ = EW_PREVDOJ;
                ObjBE_Employee_Information.EW_PREVDOL = EW_PREVDOL;
                ObjBE_Employee_Information.EW_CREATED_BY = EM_CREATED_BY;

                //EMPLOYEE EDUCATION
                ObjBE_Employee_Information.Qualification = Qualification;
                //ObjBE_Employee_Information.EE_HIGHESTQUALIFICATION = EE_HIGHESTQUALIFICATION;
                //ObjBE_Employee_Information.EE_PASSEDYEAR = EE_PASSEDYEAR;
                //ObjBE_Employee_Information.EE_SCOREPERCENTAGE = EE_SCOREPERCENTAGE;
                //ObjBE_Employee_Information.EE_CREATED_BY = EM_CREATED_BY;

                //EMPLOYEE OFFICIAL
                ObjBE_Employee_Information.EO_DOJ = EO_DOJ;
                ObjBE_Employee_Information.EO_DOL = EO_DOL;
                ObjBE_Employee_Information.EO_DESIGNATION = EO_DESIGNATION;
                ObjBE_Employee_Information.EO_DEPARTMENT = EO_DEPARTMENT;
                ObjBE_Employee_Information.EO_BRANCH = EO_BRANCH;
                ObjBE_Employee_Information.EO_JOBLOCATION = EO_JOBLOCATION;
                ObjBE_Employee_Information.EO_COST_CENTER = EO_COST_CENTER;
                ObjBE_Employee_Information.EO_PONUMBER = EO_PONUMBER;
                ObjBE_Employee_Information.EO_CATEGORY = EO_CATEGORY;
                ObjBE_Employee_Information.EO_PT_STATE = EO_PT_STATE;
                ObjBE_Employee_Information.EO_ESI_NUMBER = EO_ESI_NUMBER;
                ObjBE_Employee_Information.EO_AADHAR_NUMBER = EO_AADHAR_NUMBER;
                ObjBE_Employee_Information.EO_PFUAN_NUMBER = EO_PFUAN_NUMBER;
                ObjBE_Employee_Information.EO_PASSPORT_NUMBER = EO_PASSPORT_NUMBER;
                ObjBE_Employee_Information.EO_DRIVERSLICENSE = EO_DRIVERSLICENSE;
                ObjBE_Employee_Information.EO_PAN = EO_PAN;
                ObjBE_Employee_Information.EO_PF_CAPPING = EO_PF_CAPPING;
                ObjBE_Employee_Information.EO_ESI_CONTRIBUTION = EO_ESI_CONTRIBUTION;
                ObjBE_Employee_Information.EO_PF_CONTRIBUTION = EO_PF_CONTRIBUTION;
                ObjBE_Employee_Information.EO_HANDICAP = EO_HANDICAP;
                ObjBE_Employee_Information.EO_SENIOR_CITIZEN = EO_SENIOR_CITIZEN;
                ObjBE_Employee_Information.EO_OFFICE_STATE = EO_OFFICE_STATE;
                ObjBE_Employee_Information.EO_OFFICE_CITY = EO_OFFICE_CITY;
                ObjBE_Employee_Information.EO_OFFICE_COUNTRY = EO_OFFICE_COUNTRY;
                ObjBE_Employee_Information.EO_OFFICE_PINCODE = EO_OFFICE_PINCODE;
                ObjBE_Employee_Information.EO_OFFICE_ADDRESS = EO_OFFICE_ADDRESS;

                //EMPLOYEE BANK DETAILS
                ObjBE_Employee_Information.EB_IFSC_Code = EB_IFSC_Code;
                ObjBE_Employee_Information.EB_Payment_Mode = EB_Payment_Mode;
                ObjBE_Employee_Information.EB_Account_Number = EB_Account_Number;
                ObjBE_Employee_Information.EB_Bank_Name = EB_Bank_Name;
                ObjBE_Employee_Information.EB_Branch = EB_Branch;
                ObjBE_Employee_Information.EB_Address = EB_Address;
                ObjBE_Employee_Information.EO_CREATEDBY = EM_CREATED_BY;
                //ObjBE_Employee_Information.EM_PROFILE_IMG = EM_PROFILE_IMG;                              
                ds = ObjBAL_Employee_Information.EmployeeMasterInformation_Insert(ObjBE_Employee_Information);
                result = ds.Tables[0].Rows[0][0].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_Employee_Information = null;
                ObjBAL_Employee_Information = null;
            }
            return result;

        }

        [WebMethod(EnableSession = true)]
        public string GetUrlPath()
        {
            return Convert.ToString(HttpContext.Current.Session["FilePath"]);
        }


        [WebMethod(EnableSession = true)]
        public List<BE_Employee_Information> EmployeeInformation_MassInsert(string JsonData, string Option)
        {
            BE_Employee_Information ObjBE_Employee_Information = new BE_Employee_Information();
            BAL_Employee_Information ObjBAL_Employee_Information = new BAL_Employee_Information();
            List<BE_Employee_Information> ObjBE_Employee_Information_ErrorDetails = new List<BE_Employee_Information>();
            string Result = string.Empty;
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                dt = (DataTable)JsonConvert.DeserializeObject(JsonData, (typeof(DataTable)));
                ObjBE_Employee_Information.FilePath = GetUrlPath();
                ObjBE_Employee_Information.EM_CREATED_BY = "Admin";
                if (Option.Equals("MandatoryEmployeeMasterHeader"))
                {
                    ds = ObjBAL_Employee_Information.EmployeeMandatoryInformation_MassInsert(ObjBE_Employee_Information);
                }
                else
                {
                    ds = ObjBAL_Employee_Information.EmployeeInformation_MassInsert(ObjBE_Employee_Information);
                }
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Columns.Count == 1)
                {
                    BE_Employee_Information ObjError = new BE_Employee_Information();
                    ObjError.Errorlines = string.Empty;
                    ObjError.ErrorMessage = ds.Tables[0].Rows[0][0].ToString();
                    ObjBE_Employee_Information_ErrorDetails.Add(ObjError);
                }
                else if (ds.Tables.Count > 0 && ds.Tables[0].Columns.Count == 2)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        BE_Employee_Information ObjError = new BE_Employee_Information();
                        ObjError.Errorlines = row["ERROR_LINES"].ToString();
                        ObjError.ErrorMessage = row["ERROR_MESSAGE"].ToString();
                        ObjBE_Employee_Information_ErrorDetails.Add(ObjError);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_Employee_Information = null;
                ObjBAL_Employee_Information = null;
            }
            return ObjBE_Employee_Information_ErrorDetails;
        }


        [WebMethod(EnableSession = true)]
        public string EducatioDetails_Insert(string Emp_id, string Qualification, string InstituteName, string YearofPassing, string Percentage, string Created_by)
        {
            BE_Employee_Information ObjBE_Employee_Information = new BE_Employee_Information();
            BAL_Employee_Information ObjBAL_Employee_Information = new BAL_Employee_Information();
            DataSet ds = new DataSet();
            string Result = string.Empty;
            try
            {
                ObjBE_Employee_Information.EE_EM_ID = Emp_id;
                ObjBE_Employee_Information.EE_HIGHESTQUALIFICATION = Qualification;
                ObjBE_Employee_Information.EE_INSTITUTENAME = InstituteName;
                ObjBE_Employee_Information.EE_PASSEDYEAR = YearofPassing;
                ObjBE_Employee_Information.EE_SCOREPERCENTAGE = Percentage;
                ObjBE_Employee_Information.EE_CREATED_BY = Created_by;
                ds = ObjBAL_Employee_Information.EducatioDetails_Insert(ObjBE_Employee_Information);
                Result = ds.Tables[0].Rows[0][0].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_Employee_Information = null;
                ObjBAL_Employee_Information = null;
            }
            return Result;
        }

        #endregion
        #endregion

        #region Chandramouli

        #region Config


        #region Salary_Components_Master

        #region Deepak


        [WebMethod(EnableSession = true)]
        public string GetSalaryComponents()
        {
            BE_Salary_Components_Master objBE_Salary_Components_Master = new BE_Salary_Components_Master();
            BAL_Salary_Components_Master objBAL_Salary_Components_Master = new BAL_Salary_Components_Master();
            List<BE_Salary_Components_Master> ls_Salary_Components_Master = new List<BE_Salary_Components_Master>();
            DataSet ds = new DataSet();
            try
            {
                ds = objBAL_Salary_Components_Master.GetSalaryComponents(objBE_Salary_Components_Master);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    int i = 1;
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {
                        ls_Salary_Components_Master.Add(new BE_Salary_Components_Master
                        {
                            recid = i,
                            CM_ID = Convert.ToString(dtrow["CM_ID"]),
                            CM_NAME = "<div style=text-decoration:underline;'><a href='#' onclick='ComponentsView(\"" + Convert.ToString(dtrow["CM_ID"]) + "\",\"V\",\"" + Convert.ToString(dtrow["CM_NAME"]) + "\")' style='text-decoration:underline;'>" + Convert.ToString(dtrow["CM_NAME"]) + "</a></div>",
                            CM_SEARCH_VALUE = Convert.ToString(dtrow["CM_NAME"]),
                            CM_DESC = Convert.ToString(dtrow["CM_DESC"]),
                            CLV_VALUE = Convert.ToString(dtrow["CLV_VALUE"]),
                            CM_TYPE = Convert.ToString(dtrow["CM_TYPE"]),
                            CM_STATUS = Convert.ToString(dtrow["CM_STATUS"]),
                            CM_APPLICABLE = Convert.ToString(dtrow["CM_APPLICABLE"]),
                            CM_FC = Convert.ToString(dtrow["CM_FC"]),
                            CM_CF_COMP = Convert.ToString(dtrow["CM_CF_COMP"]),
                            CM_PRORATED_COMP = Convert.ToString(dtrow["CM_PRORATED_COMP"]),
                            CM_ARREARS = Convert.ToString(dtrow["CM_ARREARS"]),
                            CM_PF = Convert.ToString(dtrow["CM_PF"]),
                            CM_ESIC = Convert.ToString(dtrow["CM_ESIC"]),
                            CM_PT = Convert.ToString(dtrow["CM_PT"]),
                            CM_TDS_GROSS = Convert.ToString(dtrow["CM_TDS_GROSS"]),
                            CM_ADHOC = Convert.ToString(dtrow["CM_ADHOC"]),
                            CM_PROFIT = Convert.ToString(dtrow["CM_PROFIT"]),
                            CM_VALUE_TYPE = Convert.ToString(dtrow["CM_VALUE_TYPE"])
                        });
                        i = i + 1;
                    }

                }
            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                objBE_Salary_Components_Master = null;
                objBAL_Salary_Components_Master = null;
            }
            var json = JsonConvert.SerializeObject(ls_Salary_Components_Master);
            return json;
        }

        [WebMethod]
        public List<BE_Salary_Components_Master> BindSpecificComponents(string CM_ID,string CM_NAME)
        {
            BE_Salary_Components_Master objBE_Salary_Components_Master = new BE_Salary_Components_Master();
            BAL_Salary_Components_Master objBAL_Salary_Components_Master = new BAL_Salary_Components_Master();
            List<BE_Salary_Components_Master> ls_Salary_Components_Master = new List<BE_Salary_Components_Master>();
            DataSet ds = new DataSet();
            try
            {
                if (!string.IsNullOrEmpty(CM_ID) && !string.IsNullOrEmpty(CM_NAME))
                {
                    objBE_Salary_Components_Master.CM_ID = CM_ID;
                    objBE_Salary_Components_Master.CM_NAME = CM_NAME;
                    ds = objBAL_Salary_Components_Master.BindSpecificComponents(objBE_Salary_Components_Master);
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow drow in ds.Tables[0].Rows)
                        {
                            ls_Salary_Components_Master.Add(new BE_Salary_Components_Master
                            {
                                CM_NAME = drow["COMPONENT_NAME"].ToString(),
                                CM_DESC = drow["COMPONENT_DESCRIPTION"].ToString(),
                                CM_TYPE = drow["COMPONENT_TYPE"].ToString(),
                                CM_COMPONENT_VALUE = drow["COMPONENT_VALUE"].ToString(),
                                CM_STATUS = drow["STATUS"].ToString(),

                                CM_APPLICABLE = drow["Applicable"].ToString(),
                                CM_APPLICABLE_VALUE = drow["Applicable_Value"].ToString(),

                                CM_FC = drow["FullComponent"].ToString(),
                                CM_FC_VALUE = drow["FullComponent_Value"].ToString(),

                                CM_CF_COMP = drow["CarryForward"].ToString(),
                                CM_CF_COMP_VALUE = drow["CarryForward_Value"].ToString(),

                                CM_PRORATED_COMP = drow["ProratedComp"].ToString(),
                                CM_PRORATED_COMP_VALUE = drow["ProratedComp_Value"].ToString(),

                                CM_ARREARS = drow["Arrears"].ToString(),
                                CM_ARREARS_VALUE = drow["Arrears_Value"].ToString(),

                                CM_PF = drow["PF"].ToString(),
                                CM_PF_VALUE = drow["PF_Value"].ToString(),

                                CM_ESIC = drow["Esic"].ToString(),
                                CM_ESIC_VALUE = drow["Esic_Value"].ToString(),

                                CM_PT = drow["PT"].ToString(),
                                CM_PT_VALUE = drow["PT_Value"].ToString(),

                                CM_TDS_GROSS = drow["TDS_Gross"].ToString(),
                                CM_TDS_GROSS_VALUE = drow["TDS_Gross_Value"].ToString(),

                                CM_ADHOC = drow["Adhoc"].ToString(),
                                CM_ADHOC_VALUE = drow["Adhoc_value"].ToString(),

                                CM_PROFIT = drow["Profit"].ToString(),
                                CM_PROFIT_VALUE = drow["Profit_value"].ToString(),

                                CM_TDS_EST = drow["TDS_EST"].ToString(),
                                CM_TDS_EST_VALUE = drow["TDS_EST_Value"].ToString(),

                                CM_VALUE_TYPE = drow["VALUE_TYPE"].ToString(),
                            });

                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                objBE_Salary_Components_Master = null;
                objBAL_Salary_Components_Master = null;
            }
            return ls_Salary_Components_Master;

        }

        [WebMethod(EnableSession = true)]
        public List<BE_Menus> GetMenus(string Type)
        {
            BE_Menus objBE_BE_Menus = new BE_Menus();
            BAL_Menus objBAL_BAL_Menus = new BAL_Menus();
            List<BE_Menus> ls_menus = new List<BE_Menus>();
            DataSet ds = new DataSet();
            try
            {
                objBE_BE_Menus.M_TYPE = Type;
                ds = objBAL_BAL_Menus.GetMenus(objBE_BE_Menus);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {
                        ls_menus.Add(new BE_Menus
                        {
                            M_ID = Convert.ToString(dtrow["M_ID"]),
                            M_NAME = Convert.ToString(dtrow["M_NAME"]),
                        });
                    }

                }

            }

            catch (Exception ex)
            {
                //
            }
            finally
            {
                objBE_BE_Menus = null;
                objBAL_BAL_Menus = null;
            }
            return ls_menus;
        }

        [WebMethod(EnableSession = true)]
        public List<BE_Client> GetClient()
        {
            BE_Client objBE_BE_Client = new BE_Client();
            BAL_Client objBAL_BAL_Client = new BAL_Client();
            List<BE_Client> ls_Client = new List<BE_Client>();
            DataSet ds = new DataSet();
            try
            {

                ds = objBAL_BAL_Client.GetClient(objBE_BE_Client);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {
                        ls_Client.Add(new BE_Client
                        {
                            PCM_ID = Convert.ToString(dtrow["PCM_ID"]),
                            PCM_NAME = Convert.ToString(dtrow["PCM_NAME"]),
                        });
                    }

                }

            }

            catch (Exception ex)
            {
                //
            }
            finally
            {
                objBE_BE_Client = null;
                objBAL_BAL_Client = null;
            }
            return ls_Client;
        }

        [WebMethod(EnableSession = true)]
        public List<BE_Salary_Components_Master> SalaryComponents_MassInsert(string JsonData, string Option)
        {
            BE_Salary_Components_Master ObjBE_Salary_Components_Master = new BE_Salary_Components_Master();
            BAL_Salary_Components_Master ObjBAL_Salary_Components_Master = new BAL_Salary_Components_Master();
            List<BE_Salary_Components_Master> ObjBE_Salary_Components_Master_ErrorDetails = new List<BE_Salary_Components_Master>();
            string Result = string.Empty;
            try
            {
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                dt = (DataTable)JsonConvert.DeserializeObject(JsonData, (typeof(DataTable)));
                //ObjBE_Salary_Components_Master.SALARYTYPE = dt;
                ObjBE_Salary_Components_Master.CM_FilePath = GetUrlPath();
                ObjBE_Salary_Components_Master.CM_CREATED_BY = "Admin";
                if (Option.Equals("SalaryMaster"))
                {
                    ds = ObjBAL_Salary_Components_Master.SalaryComponents_MassInsert(ObjBE_Salary_Components_Master);
                }
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Columns.Count == 1)
                {
                    BE_Salary_Components_Master ObjError = new BE_Salary_Components_Master();
                    ObjError.Errorlines = string.Empty;
                    ObjError.ErrorMessage = ds.Tables[0].Rows[0][0].ToString();
                    ObjBE_Salary_Components_Master_ErrorDetails.Add(ObjError);
                }
                else if (ds.Tables.Count > 0 && ds.Tables[0].Columns.Count == 2)
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        BE_Salary_Components_Master ObjError = new BE_Salary_Components_Master();
                        ObjError.Errorlines = row["ERROR_LINES"].ToString();
                        ObjError.ErrorMessage = row["ERROR_MESSAGE"].ToString();
                        ObjBE_Salary_Components_Master_ErrorDetails.Add(ObjError);
                    }
                }
            }

            catch (Exception ex)
            {

            }

            finally
            {
                ObjBE_Salary_Components_Master = null;
                ObjBAL_Salary_Components_Master = null;
            }
            return ObjBE_Salary_Components_Master_ErrorDetails;
        }


        [WebMethod(EnableSession = true)]
        public string SalaryComponents_Insert(
            string CM_NAME,
            string CM_DESC,
            string CM_TYPE,
            string CM_VALUE_TYPE,
            string CM_APPLICABLE,
            string CM_FC,
            string CM_CF_COMP,
            string CM_PRORATED_COMP,
            string CM_ARREARS,
            string CM_PF,
            string CM_ESIC,
            string CM_PT,
            string CM_TDS_GROSS,
            string CM_ADHOC,
            string CM_PROFIT,
            string CM_TDS_EST,
            string CM_CREATED_BY)
        {
            BE_Salary_Components_Master ObjBE_BE_Salary_Components_Master = new BE_Salary_Components_Master();
            BAL_Salary_Components_Master ObjBAL_BAL_Salary_Components_Master = new BAL_Salary_Components_Master();

            DataSet ds = new DataSet();
            string result = string.Empty;
            try
            {
                ObjBE_BE_Salary_Components_Master.CM_NAME = CM_NAME;
                ObjBE_BE_Salary_Components_Master.CM_DESC = CM_DESC;
                ObjBE_BE_Salary_Components_Master.CM_TYPE = CM_TYPE;
                ObjBE_BE_Salary_Components_Master.CM_VALUE_TYPE = CM_VALUE_TYPE;
                ObjBE_BE_Salary_Components_Master.CM_APPLICABLE = CM_APPLICABLE;
                ObjBE_BE_Salary_Components_Master.CM_FC = CM_FC;
                ObjBE_BE_Salary_Components_Master.CM_CF_COMP = CM_CF_COMP;
                ObjBE_BE_Salary_Components_Master.CM_PRORATED_COMP = CM_PRORATED_COMP;
                ObjBE_BE_Salary_Components_Master.CM_ARREARS = CM_ARREARS;
                ObjBE_BE_Salary_Components_Master.CM_PF = CM_PF;
                ObjBE_BE_Salary_Components_Master.CM_ESIC = CM_ESIC;
                ObjBE_BE_Salary_Components_Master.CM_PT = CM_PT;
                ObjBE_BE_Salary_Components_Master.CM_TDS_GROSS = CM_TDS_GROSS;
                ObjBE_BE_Salary_Components_Master.CM_ADHOC = CM_ADHOC;
                ObjBE_BE_Salary_Components_Master.CM_PROFIT = CM_PROFIT;
                ObjBE_BE_Salary_Components_Master.CM_TDS_EST = CM_TDS_EST;
                ObjBE_BE_Salary_Components_Master.CM_CREATED_BY = CM_CREATED_BY;

                ds = ObjBAL_BAL_Salary_Components_Master.SalaryComponents_Insert(ObjBE_BE_Salary_Components_Master);
                result = ds.Tables[0].Rows[0][0].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_BE_Salary_Components_Master = null;
                ObjBAL_BAL_Salary_Components_Master = null;
            }
            return result;
        }

        [WebMethod(EnableSession = true)]
        public List<BE_LettersApplicable> BindLettersApllicableOption()
        {
            BE_LettersApplicable ObjBE_LettersApplicable = new BE_LettersApplicable();
            BAL_LettersApplicable ObjBAL_LettersApplicable = new BAL_LettersApplicable();
            List<BE_LettersApplicable> ls_LettersApplicable = new List<BE_LettersApplicable>();
            DataSet ds = new DataSet();
            try
            {

                ds = ObjBAL_LettersApplicable.GetLettesApplicable(ObjBE_LettersApplicable);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {
                        ls_LettersApplicable.Add(new BE_LettersApplicable
                        {
                            LTM_Value = Convert.ToString(dtrow["VALUE"]),
                            LTM_Name = Convert.ToString(dtrow["NAME"])
                        });
                    }

                }

            }

            catch (Exception ex)
            {
                //
            }
            finally
            {
                ObjBE_LettersApplicable = null;
                ObjBAL_LettersApplicable = null;
            }
            return ls_LettersApplicable;

        }

        [WebMethod(EnableSession = true)]
        public List<BE_Reports> GetSpecific_Reports(string ReportType)
        {
            BE_Reports objBE_BE_Reports = new BE_Reports();
            BAL_Reports objBAL_BAL_Reports = new BAL_Reports();
            List<BE_Reports> ls_BE_Reports = new List<BE_Reports>();
            DataSet ds = new DataSet();
            try
            {
                objBE_BE_Reports.PR_TYPE = ReportType;
                ds = objBAL_BAL_Reports.GetSpecific_Reports(objBE_BE_Reports);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {
                        ls_BE_Reports.Add(new BE_Reports
                        {
                            PR_ID = Convert.ToString(dtrow["VALUE"]),
                            PR_NAME = Convert.ToString(dtrow["NAME"]),
                            PR_DESCRIPTION = Convert.ToString(dtrow["DESCRIPTIONS"]),
                            PR_STATUS = Convert.ToString(dtrow["STATUS"]),
                            PR_TYPE = Convert.ToString(dtrow["TYPE"])
                        });
                    }

                }

            }

            catch (Exception ex)
            {
                //
            }
            finally
            {
                objBE_BE_Reports = null;
                objBAL_BAL_Reports = null;
            }
            return ls_BE_Reports;
        }



        [WebMethod(EnableSession = true)]
        public List<BE_Payslip_Columns> GetPayslip_Columns()
        {
            BE_Payslip_Columns ObjBE_BE_Payslip_Columns = new BE_Payslip_Columns();
            BAL_Payslip_Columns ObjBE_BAL_Payslip_Columns = new BAL_Payslip_Columns();
            List<BE_Payslip_Columns> ls_BE_Payslip_Columns = new List<BE_Payslip_Columns>();

            DataSet ds = new DataSet();
            try
            {
                ds = ObjBE_BAL_Payslip_Columns.GetPayslip_Columns(ObjBE_BE_Payslip_Columns);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {
                        ls_BE_Payslip_Columns.Add(new BE_Payslip_Columns
                        {
                            PSC_ID = Convert.ToString(dtrow["VALUE"]),
                            PSC_NAME = Convert.ToString(dtrow["NAME"]),
                            PSC_DESCRIPTION = Convert.ToString(dtrow["DESCRIPTIONS"]),
                            PSC_STATUS = Convert.ToString(dtrow["STATUS"])
                        });
                    }

                }

            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_BE_Payslip_Columns = null;
                ObjBE_BAL_Payslip_Columns = null;
            }
            return ls_BE_Payslip_Columns;
        }

        [WebMethod(EnableSession = true)]
        public string Client_Configuration_Insert(
                                     string CCM_CLIENT_ID
                                    , string CCM_EMP_NO_AUTO
                                    , string CCM_EMP_NO_LENGTH
                                    , string CCM_EMP_NO_FORMAT
                                    , string CCM_EMP_NO_STARTNO
                                    , string CCM_LTR_APPLICABLE
                                    , string CCM_LTR_APPLICABLE_OPTION
                                    , string CCM_PROCESS_FROM
                                    , string CCM_APPLICABLE_REPORT
                                    , string CCM_PF_CAPPING
                                    , string CCM_LOAN
                                    , string CCM_LOAN_RATE_OF_INTEREST
                                    , string CCM_LOAN_TYPE
                                    , string CCM_LOAN_INT
                                    , string CCM_SELF_SERVICE
                                    , string CCM_ESS_PORTAL
                                    , string CCM_EMB
                                    , string CCM_EOI
                                    , string CCM_EIP
                                    , string CCM_EM
                                    , string CCM_FBP
                                    , string CCM_TE
                                    , string CCM_PA
                                    , string CCM_DIS_CLIENT_NAME
                                    , string CCM_THEME_CLR_HDR
                                    , string CCM_THEME_CLR_PAGE
                                    , string CCM_THEME_FONT
                                    , string CCM_ROLE_TO_ENABLE
                                    , string CCM_LOGIN_TO_DISABLE
                                    , string CCM_EPSF_FROM
                                    , string CCM_EPSF_TO
                                    , string CCM_FBP_FROM
                                    , string CCM_FBP_TO
                                    , string CCM_PAYSLIP_FORMAT
                                    , string CCM_PAYSLIP_TYPE
                                    , string CCM_PAYSLIP_COLUMNS
                                    , string CCM_PAYSLIP_PASS_PROT
                                    , string CCM_PAYSLIP_PASS_PAR
                                    , string CCM_ITSHEET_FORMAT
                                    , string CCM_ITSHEET_PASS_PROT
                                    , string CCM_ITSHEET_PASS_PAR
                                    , string CCM_CREATED_BY
                                    , string CED_CTC_GRID_DETAILS)
        {
            BE_Client_Configuration ObjBE_BE_Client_Configuration = new BE_Client_Configuration();
            BAL_Client_Configuration ObjBAL_BAL_Client_Configuration = new BAL_Client_Configuration();

            DataSet ds = new DataSet();
            string Result = string.Empty;
            try
            {
                ObjBE_BE_Client_Configuration.CCM_CLIENT_ID = CCM_CLIENT_ID;
                ObjBE_BE_Client_Configuration.CCM_EMP_NO_AUTO = CCM_EMP_NO_AUTO;
                ObjBE_BE_Client_Configuration.CCM_EMP_NO_LENGTH = CCM_EMP_NO_LENGTH;
                ObjBE_BE_Client_Configuration.CCM_EMP_NO_FORMAT = CCM_EMP_NO_FORMAT;
                ObjBE_BE_Client_Configuration.CCM_EMP_NO_STARTNO = CCM_EMP_NO_STARTNO;
                ObjBE_BE_Client_Configuration.CCM_LTR_APPLICABLE = CCM_LTR_APPLICABLE;
                ObjBE_BE_Client_Configuration.CCM_LTR_APPLICABLE_OPTION = CCM_LTR_APPLICABLE_OPTION;
                ObjBE_BE_Client_Configuration.CCM_PROCESS_FROM = CCM_PROCESS_FROM;
                ObjBE_BE_Client_Configuration.CCM_APPLICABLE_REPORT = CCM_APPLICABLE_REPORT;
                ObjBE_BE_Client_Configuration.CCM_PF_CAPPING = CCM_PF_CAPPING;
                ObjBE_BE_Client_Configuration.CCM_LOAN = CCM_LOAN;
                ObjBE_BE_Client_Configuration.CCM_LOAN_RATE_OF_INTEREST = CCM_LOAN_RATE_OF_INTEREST;
                ObjBE_BE_Client_Configuration.CCM_LOAN_TYPE = CCM_LOAN_TYPE;
                ObjBE_BE_Client_Configuration.CCM_LOAN_INT = CCM_LOAN_INT;
                ObjBE_BE_Client_Configuration.CCM_SELF_SERVICE = CCM_SELF_SERVICE;
                ObjBE_BE_Client_Configuration.CCM_ESS_PORTAL = CCM_ESS_PORTAL;
                ObjBE_BE_Client_Configuration.CCM_EMB = CCM_EMB;
                ObjBE_BE_Client_Configuration.CCM_EOI = CCM_EOI;
                ObjBE_BE_Client_Configuration.CCM_EIP = CCM_EIP;
                ObjBE_BE_Client_Configuration.CCM_EM = CCM_EM;
                ObjBE_BE_Client_Configuration.CCM_FBP = CCM_FBP;
                ObjBE_BE_Client_Configuration.CCM_TE = CCM_TE;
                ObjBE_BE_Client_Configuration.CCM_PA = CCM_PA;
                ObjBE_BE_Client_Configuration.CCM_DIS_CLIENT_NAME = CCM_DIS_CLIENT_NAME;
                ObjBE_BE_Client_Configuration.CCM_THEME_CLR_HDR = CCM_THEME_CLR_HDR;
                ObjBE_BE_Client_Configuration.CCM_THEME_CLR_PAGE = CCM_THEME_CLR_PAGE;
                ObjBE_BE_Client_Configuration.CCM_THEME_FONT = CCM_THEME_FONT;
                ObjBE_BE_Client_Configuration.CCM_ROLE_TO_ENABLE = CCM_ROLE_TO_ENABLE;
                ObjBE_BE_Client_Configuration.CCM_LOGIN_TO_DISABLE = CCM_LOGIN_TO_DISABLE;
                ObjBE_BE_Client_Configuration.CCM_EPSF_FROM = CCM_EPSF_FROM;
                ObjBE_BE_Client_Configuration.CCM_EPSF_TO = CCM_EPSF_TO;
                ObjBE_BE_Client_Configuration.CCM_FBP_FROM = CCM_FBP_FROM;
                ObjBE_BE_Client_Configuration.CCM_FBP_TO = CCM_FBP_TO;
                ObjBE_BE_Client_Configuration.CCM_PAYSLIP_FORMAT = CCM_PAYSLIP_FORMAT;
                ObjBE_BE_Client_Configuration.CCM_PAYSLIP_TYPE = CCM_PAYSLIP_TYPE;
                ObjBE_BE_Client_Configuration.CCM_PAYSLIP_COLUMNS = CCM_PAYSLIP_COLUMNS;
                ObjBE_BE_Client_Configuration.CCM_PAYSLIP_PASS_PROT = CCM_PAYSLIP_PASS_PROT;
                ObjBE_BE_Client_Configuration.CCM_PAYSLIP_PASS_PAR = CCM_PAYSLIP_PASS_PAR;
                ObjBE_BE_Client_Configuration.CCM_ITSHEET_FORMAT = CCM_ITSHEET_FORMAT;
                ObjBE_BE_Client_Configuration.CCM_ITSHEET_PASS_PROT = CCM_ITSHEET_PASS_PROT;
                ObjBE_BE_Client_Configuration.CCM_ITSHEET_PASS_PAR = CCM_ITSHEET_PASS_PAR;
                ObjBE_BE_Client_Configuration.CCM_CREATED_BY = CCM_CREATED_BY;

                ObjBE_BE_Client_Configuration.CED_CTC_GRID_DETAILS = CED_CTC_GRID_DETAILS;

                ds = ObjBAL_BAL_Client_Configuration.Client_Configuration_Insert(ObjBE_BE_Client_Configuration);
                Result = ds.Tables[0].Rows[0][0].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_BE_Client_Configuration = null;
                ObjBAL_BAL_Client_Configuration = null;
            }
            return Result;
        }


        [WebMethod(EnableSession = true)]
        public string UpdateSalaryComponent_Properties(
            string CM_ID,
            string CM_NAME,
            string CM_DESC,
            string CM_TYPE,
            string CM_VALUE_TYPE,
            string CM_APPLICABLE,
            string CM_FC,
            string CM_CF_COMP,
            string CM_PRORATED_COMP,
            string CM_ARREARS,
            string CM_PF,
            string CM_ESIC,
            string CM_PT,
            string CM_TDS_GROSS,
            string CM_ADHOC,
            string CM_PROFIT,
            string CM_TDS_EST)
        {
            BE_Salary_Components_Master ObjBE_BE_Salary_Components_Master = new BE_Salary_Components_Master();
            BAL_Salary_Components_Master ObjBAL_BAL_Salary_Components_Master = new BAL_Salary_Components_Master();

            DataSet ds = new DataSet();
            string Result = string.Empty;
            try
            {
                ObjBE_BE_Salary_Components_Master.CM_ID = CM_ID;
                ObjBE_BE_Salary_Components_Master.CM_NAME = CM_NAME;
                ObjBE_BE_Salary_Components_Master.CM_DESC = CM_DESC;
                ObjBE_BE_Salary_Components_Master.CM_TYPE = CM_TYPE;
                ObjBE_BE_Salary_Components_Master.CM_VALUE_TYPE = CM_VALUE_TYPE;
                ObjBE_BE_Salary_Components_Master.CM_APPLICABLE = CM_APPLICABLE;
                ObjBE_BE_Salary_Components_Master.CM_FC = CM_FC;
                ObjBE_BE_Salary_Components_Master.CM_CF_COMP = CM_CF_COMP;
                ObjBE_BE_Salary_Components_Master.CM_PRORATED_COMP = CM_PRORATED_COMP;
                ObjBE_BE_Salary_Components_Master.CM_ARREARS = CM_ARREARS;
                ObjBE_BE_Salary_Components_Master.CM_PF = CM_PF;
                ObjBE_BE_Salary_Components_Master.CM_ESIC = CM_ESIC;
                ObjBE_BE_Salary_Components_Master.CM_PT = CM_PT;
                ObjBE_BE_Salary_Components_Master.CM_TDS_GROSS = CM_TDS_GROSS;
                ObjBE_BE_Salary_Components_Master.CM_ADHOC = CM_ADHOC;
                ObjBE_BE_Salary_Components_Master.CM_PROFIT = CM_PROFIT;
                ObjBE_BE_Salary_Components_Master.CM_TDS_EST = CM_TDS_EST;

                ds = ObjBAL_BAL_Salary_Components_Master.UpdateSalaryComponent_Properties(ObjBE_BE_Salary_Components_Master);
                Result = ds.Tables[0].Rows[0][0].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjBE_BE_Salary_Components_Master = null;
                ObjBAL_BAL_Salary_Components_Master = null;
            }
            return Result;
        }
        
        #endregion
        #endregion
        #endregion
        #endregion
    }
}
