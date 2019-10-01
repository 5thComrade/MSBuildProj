using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{

    public class DAL_Employee_Information
    {
        public DataSet BindEmpMasterTable(BindEmpTemplateExport ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@EM_CLIENT_ID", ObjBE_Employee_Information.Client_ID);
            return objSqlHelper.ExecuteQuery("SP_EMP_MASTER_SELECT");
        }

        public DataSet BindEmpMasterByID(BE_Employee_Information ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@EM_CLIENT_ID", ObjBE_Employee_Information.EM_CLIENT_ID);
            objSqlHelper.CreateInParameter("@EM_ID", ObjBE_Employee_Information.EM_ID);
            return objSqlHelper.ExecuteQuery("SP_EMP_MASTER_SELECT_ID");
        }

        public DataSet EmployeeMasterInformation_Insert(BE_Employee_Information ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");

            objSqlHelper.ClearParameters();

            //Employee Details
            objSqlHelper.CreateInParameter("@EM_CLIENT_ID", ObjBE_Employee_Information.EM_CLIENT_ID);
            objSqlHelper.CreateInParameter("@EM_EMP_NO", ObjBE_Employee_Information.EM_EMP_NO);
            objSqlHelper.CreateInParameter("@EM_DOB", ObjBE_Employee_Information.EM_DOB);
            objSqlHelper.CreateInParameter("@EM_GENDER", ObjBE_Employee_Information.EM_GENDER);
            objSqlHelper.CreateInParameter("@EM_TITLE", ObjBE_Employee_Information.EM_TITLE);
            objSqlHelper.CreateInParameter("@EM_NAME", ObjBE_Employee_Information.EM_NAME);
            objSqlHelper.CreateInParameter("@EM_EMAIL", ObjBE_Employee_Information.EM_EMAIL);
            objSqlHelper.CreateInParameter("@EM_MOBILE", ObjBE_Employee_Information.EM_MOBILE);
            objSqlHelper.CreateInParameter("@EM_PRESENT_ADDRESS", ObjBE_Employee_Information.EM_PRESENT_ADDRESS);
            objSqlHelper.CreateInParameter("@EM_PRESENT_CITY", ObjBE_Employee_Information.EM_PRESENT_CITY);
            objSqlHelper.CreateInParameter("@EM_PRESENT_STATE", ObjBE_Employee_Information.EM_PRESENT_STATE);
            objSqlHelper.CreateInParameter("@EM_PRESENT_PINCODE", ObjBE_Employee_Information.EM_PRESENT_PINCODE);
            objSqlHelper.CreateInParameter("@EM_PRESENT_COUNTRY", ObjBE_Employee_Information.EM_PRESENT_COUNTRY);
            objSqlHelper.CreateInParameter("@EM_NATIONALITY", ObjBE_Employee_Information.EM_NATIONALITY);
            objSqlHelper.CreateInParameter("@EM_JOB_TYPE", ObjBE_Employee_Information.EM_JOB_TYPE);           
            objSqlHelper.CreateInParameter("@CREATED_BY", ObjBE_Employee_Information.EM_CREATED_BY);

            //EMPLOYEE ADDRESS
            objSqlHelper.CreateInParameter("@EA_PERMANENT_ADDRESS", ObjBE_Employee_Information.EA_PERMANENT_ADDRESS);
            objSqlHelper.CreateInParameter("@EA_PERMANENT_CITY", ObjBE_Employee_Information.EA_PERMANENT_CITY);
            objSqlHelper.CreateInParameter("@EA_PERMANENT_STATE", ObjBE_Employee_Information.EA_PERMANENT_STATE);
            objSqlHelper.CreateInParameter("@EA_PERMANENT_PINCODE", ObjBE_Employee_Information.EA_PERMANENT_PINCODE);
            objSqlHelper.CreateInParameter("@EA_PERMANENT_COUNTRY", ObjBE_Employee_Information.EA_PERMANENT_COUNTRY);
            objSqlHelper.CreateInParameter("@EA_PERMANENT_NATIONALITY", ObjBE_Employee_Information.EA_PERMANENT_NATIONALITY);
            //EMPLOYEE MAILING ADDRESS
            objSqlHelper.CreateInParameter("@EA_MAILING_ADDRESS", ObjBE_Employee_Information.EA_MAILING_ADDRESS);
            objSqlHelper.CreateInParameter("@EA_MAILING_CITY", ObjBE_Employee_Information.EA_MAILING_CITY);
            objSqlHelper.CreateInParameter("@EA_MAILING_STATE", ObjBE_Employee_Information.EA_MAILING_STATE);
            objSqlHelper.CreateInParameter("@EA_MAILING_PINCODE", ObjBE_Employee_Information.EA_MAILING_PINCODE);
            objSqlHelper.CreateInParameter("@EA_MAILING_COUNTRY", ObjBE_Employee_Information.EA_MAILING_COUNTRY);
            objSqlHelper.CreateInParameter("@EA_MAILING_NATIONALITY", ObjBE_Employee_Information.EA_MAILING_NATIONALITY);
            objSqlHelper.CreateInParameter("@EA_CREATED_BY", ObjBE_Employee_Information.EA_CREATED_BY);

            
            
            //EMPLOYEE WORK
            objSqlHelper.CreateInParameter("@EW_PREVEXP", ObjBE_Employee_Information.EW_PREVEXP);
            objSqlHelper.CreateInParameter("@EW_PREVCOMPANY", ObjBE_Employee_Information.EW_PREVCOMPANY);
            objSqlHelper.CreateInParameter("@EW_PREVDESIGNATION", ObjBE_Employee_Information.EW_PREVDESIGNATION);
            objSqlHelper.CreateInParameter("@EW_PREVDOJ", ObjBE_Employee_Information.EW_PREVDOJ);
            objSqlHelper.CreateInParameter("@EW_PREVDOL", ObjBE_Employee_Information.EW_PREVDOL);
            objSqlHelper.CreateInParameter("@EW_CREATED_BY", ObjBE_Employee_Information.EW_CREATED_BY);

            //EMPLOYEE EDUCATION
            //objSqlHelper.CreateInParameter("@EE_HIGHESTQUALIFICATION", ObjBE_Employee_Information.EE_HIGHESTQUALIFICATION);
            //objSqlHelper.CreateInParameter("@EE_SCOREPERCENTAGE", ObjBE_Employee_Information.EE_SCOREPERCENTAGE);
            //objSqlHelper.CreateInParameter("@EE_PASSEDYEAR", ObjBE_Employee_Information.EE_PASSEDYEAR);
            //objSqlHelper.CreateInParameter("@EE_CREATED_BY", ObjBE_Employee_Information.EE_CREATED_BY);

            //EMPLOYEE OFFICIAL
            objSqlHelper.CreateInParameter("@EO_DOJ", ObjBE_Employee_Information.EO_DOJ);            
            objSqlHelper.CreateInParameter("@EO_DOL", ObjBE_Employee_Information.EO_DOL);            
            objSqlHelper.CreateInParameter("@EO_DESIGNATION", ObjBE_Employee_Information.EO_DESIGNATION);
            objSqlHelper.CreateInParameter("@EO_DEPARTMENT", ObjBE_Employee_Information.EO_DEPARTMENT);
            objSqlHelper.CreateInParameter("@EO_COST_CENTER", ObjBE_Employee_Information.EO_COST_CENTER);
            objSqlHelper.CreateInParameter("@EO_BRANCH", ObjBE_Employee_Information.EO_BRANCH);
            objSqlHelper.CreateInParameter("@EO_PONUMBER", ObjBE_Employee_Information.EO_PONUMBER);
            objSqlHelper.CreateInParameter("@EO_CATEGORY", ObjBE_Employee_Information.EO_CATEGORY);
            objSqlHelper.CreateInParameter("@EO_JOBLOCATION", ObjBE_Employee_Information.EO_JOBLOCATION);
            objSqlHelper.CreateInParameter("@EO_PT_STATE", ObjBE_Employee_Information.EO_PT_STATE);
            objSqlHelper.CreateInParameter("@EO_ESI_CONTRIBUTION", ObjBE_Employee_Information.EO_ESI_CONTRIBUTION);
            objSqlHelper.CreateInParameter("@EO_PF_CONTRIBUTION", ObjBE_Employee_Information.EO_PF_CONTRIBUTION);
            objSqlHelper.CreateInParameter("@EO_PF_CAPPING", ObjBE_Employee_Information.EO_PF_CAPPING);
            objSqlHelper.CreateInParameter("@EO_HANDICAP", ObjBE_Employee_Information.EO_HANDICAP);
            objSqlHelper.CreateInParameter("@EO_SENIOR_CITIZEN", ObjBE_Employee_Information.EO_SENIOR_CITIZEN);
            objSqlHelper.CreateInParameter("@EO_PFUAN_NUMBER", ObjBE_Employee_Information.EO_PFUAN_NUMBER);
            objSqlHelper.CreateInParameter("@EO_ESI_NUMBER", ObjBE_Employee_Information.EO_ESI_NUMBER);
            objSqlHelper.CreateInParameter("@EO_AADHAR_NUMBER", ObjBE_Employee_Information.EO_AADHAR_NUMBER);
            objSqlHelper.CreateInParameter("@EO_PAN", ObjBE_Employee_Information.EO_PAN);
            objSqlHelper.CreateInParameter("@EO_PASSPORT_NUMBER", ObjBE_Employee_Information.EO_PASSPORT_NUMBER);
            objSqlHelper.CreateInParameter("@EO_DRIVERSLICENSE", ObjBE_Employee_Information.EO_DRIVERSLICENSE);
            objSqlHelper.CreateInParameter("@EO_OFFICE_ADDRESS", ObjBE_Employee_Information.EO_OFFICE_ADDRESS);
            objSqlHelper.CreateInParameter("@EO_OFFICE_CITY", ObjBE_Employee_Information.EO_OFFICE_CITY);
            objSqlHelper.CreateInParameter("@EO_OFFICE_STATE", ObjBE_Employee_Information.EO_OFFICE_STATE);
            objSqlHelper.CreateInParameter("@EO_OFFICE_PINCODE", ObjBE_Employee_Information.EO_OFFICE_PINCODE);
            objSqlHelper.CreateInParameter("@EO_OFFICE_COUNTRY", ObjBE_Employee_Information.EO_OFFICE_COUNTRY);
            //objSqlHelper.CreateInParameter("@EO_PAYMODE", ObjBE_Employee_Information.EB_Payment_Mode);
            //objSqlHelper.CreateInParameter("@EO_BANK", ObjBE_Employee_Information.EB_Bank_Name);
            //objSqlHelper.CreateInParameter("@EO_BANKBRANCH", ObjBE_Employee_Information.EB_Branch);
            //objSqlHelper.CreateInParameter("@EO_ACC_NO", ObjBE_Employee_Information.EB_Account_Number);
            //objSqlHelper.CreateInParameter("@EO_IFSC_CODE", ObjBE_Employee_Information.EB_IFSC_Code);            
            ////objSqlHelper.CreateInParameter("@PROFILE_IMAGE", ObjBE_Employee_Information.EM_PROFILE_IMG);
            //objSqlHelper.CreateInParameter("@EE_INSTITUTE_NAME", ObjBE_Employee_Information.EE_INSTITUTENAME);
            objSqlHelper.CreateInParameter("@EW_SKILLS", ObjBE_Employee_Information.EW_SKILLS);
            objSqlHelper.CreateInParameter("@QUALIFICATION", ObjBE_Employee_Information.Qualification);

            //Employee Bank Details
            objSqlHelper.CreateInParameter("@EB_IFSC_Code", ObjBE_Employee_Information.EB_IFSC_Code);
            objSqlHelper.CreateInParameter("@EB_Payment_Mode", ObjBE_Employee_Information.EB_Payment_Mode);
            objSqlHelper.CreateInParameter("@EB_Account_Number", ObjBE_Employee_Information.EB_Account_Number);
            objSqlHelper.CreateInParameter("@EB_Bank_Name", ObjBE_Employee_Information.EB_Bank_Name);
            objSqlHelper.CreateInParameter("@EB_Branch", ObjBE_Employee_Information.EB_Branch);
            objSqlHelper.CreateInParameter("@EB_Address", ObjBE_Employee_Information.EB_Address);
            objSqlHelper.CreateInParameter("@EO_CREATEDBY", ObjBE_Employee_Information.EM_CREATED_BY);

            return objSqlHelper.ExecuteQuery("SP_EMP_MASTER_INSERT");

        }

        public DataSet EmployeeInformation_MassInsert(BE_Employee_Information ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@FILEPATH", ObjBE_Employee_Information.FilePath);
            objSqlHelper.CreateInParameter("@CREATED_BY", ObjBE_Employee_Information.EM_CREATED_BY);
            return objSqlHelper.ExecuteQuery("SP_EMPLOYEEMASTER_MASSINSERT");
        }

        public DataSet EmployeeMandatoryInformation_MassInsert(BE_Employee_Information ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@FILEPATH", ObjBE_Employee_Information.FilePath);
            objSqlHelper.CreateInParameter("@CREATED_BY", ObjBE_Employee_Information.EM_CREATED_BY);
            return objSqlHelper.ExecuteQuery("SP_MandatoryEmployee_MassInsert");
        }

        public DataSet Specific_EmployeeEducation_Details(BE_Employee_Information ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@EMP_ID", ObjBE_Employee_Information.EM_ID);
            return objSqlHelper.ExecuteQuery("SP_SPECIFIC_EMP_EDUCATION_FETCH");
        }

        public DataSet UpdateEmployee(BE_Employee_Information ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");
            objSqlHelper.ClearParameters();

            //Employee_Profile
            objSqlHelper.CreateInParameter("@EMP_ID", ObjBE_Employee_Information.EM_ID);
            objSqlHelper.CreateInParameter("@OPTION", ObjBE_Employee_Information.Option);
            objSqlHelper.CreateInParameter("@EMAIL", ObjBE_Employee_Information.EM_EMAIL);
            objSqlHelper.CreateInParameter("@DOB", ObjBE_Employee_Information.EM_DOB);
            objSqlHelper.CreateInParameter("@MOBILENO", ObjBE_Employee_Information.EM_MOBILE);

            //Employee Primary
            objSqlHelper.CreateInParameter("@EMP_NO", ObjBE_Employee_Information.EM_EMP_NO);
            objSqlHelper.CreateInParameter("@CLIENT_ID", ObjBE_Employee_Information.EM_CLIENT_ID);
            objSqlHelper.CreateInParameter("@SALUATION", ObjBE_Employee_Information.EM_TITLE);
            objSqlHelper.CreateInParameter("@JOBTYPE", ObjBE_Employee_Information.EM_JOB_TYPE);
            objSqlHelper.CreateInParameter("@GENDER", ObjBE_Employee_Information.EM_GENDER);

            //Employee Present Address
            objSqlHelper.CreateInParameter("@PRESENT_ADDRESS", ObjBE_Employee_Information.EM_PRESENT_ADDRESS);
            objSqlHelper.CreateInParameter("@PRESENT_CITY", ObjBE_Employee_Information.EM_PRESENT_CITY);
            objSqlHelper.CreateInParameter("@PRESENT_STATE", ObjBE_Employee_Information.EM_PRESENT_STATE);
            objSqlHelper.CreateInParameter("@PRESENT_PINCODE", ObjBE_Employee_Information.EM_PRESENT_PINCODE);
            objSqlHelper.CreateInParameter("@PRESENT_COUNTRY", ObjBE_Employee_Information.EM_PRESENT_COUNTRY);
            objSqlHelper.CreateInParameter("@PRESENT_NATIONALITY", ObjBE_Employee_Information.EM_NATIONALITY);

            //Employee Permanent Address
            objSqlHelper.CreateInParameter("@PERMANENT_ADDRESS", ObjBE_Employee_Information.EA_PERMANENT_ADDRESS);
            objSqlHelper.CreateInParameter("@PERMANENT_CITY", ObjBE_Employee_Information.EA_PERMANENT_CITY);
            objSqlHelper.CreateInParameter("@PERMANENT_STATE", ObjBE_Employee_Information.EA_PERMANENT_STATE);
            objSqlHelper.CreateInParameter("@PERMANENT_PINCODE", ObjBE_Employee_Information.EA_PERMANENT_PINCODE);
            objSqlHelper.CreateInParameter("@PERMANENT_COUNTRY", ObjBE_Employee_Information.EA_PERMANENT_COUNTRY);
            objSqlHelper.CreateInParameter("@PERMANENT_NATIONALITY", ObjBE_Employee_Information.EA_PERMANENT_NATIONALITY);

            //Employee Mailing Address
            objSqlHelper.CreateInParameter("@MAILING_ADDRESS", ObjBE_Employee_Information.EA_MAILING_ADDRESS);
            objSqlHelper.CreateInParameter("@MAILING_CITY", ObjBE_Employee_Information.EA_MAILING_CITY);
            objSqlHelper.CreateInParameter("@MAILING_STATE", ObjBE_Employee_Information.EA_MAILING_STATE);
            objSqlHelper.CreateInParameter("@MAILING_PINCODE", ObjBE_Employee_Information.EA_MAILING_PINCODE);
            objSqlHelper.CreateInParameter("@MAILING_COUNTRY", ObjBE_Employee_Information.EA_MAILING_COUNTRY);
            objSqlHelper.CreateInParameter("@MAILING_NATIONALITY", ObjBE_Employee_Information.EA_MAILING_NATIONALITY);

            //Employee Work 
            objSqlHelper.CreateInParameter("@PREV_COMPANY", ObjBE_Employee_Information.EW_PREVCOMPANY);
            objSqlHelper.CreateInParameter("@PREV_DESIGNATION", ObjBE_Employee_Information.EW_PREVDESIGNATION);
            objSqlHelper.CreateInParameter("@PREV_EXP", ObjBE_Employee_Information.EW_PREVEXP);
            objSqlHelper.CreateInParameter("@SKILLS", ObjBE_Employee_Information.EW_SKILLS);
            objSqlHelper.CreateInParameter("@PREV_DOJ", ObjBE_Employee_Information.EW_PREVDOJ);
            objSqlHelper.CreateInParameter("@PREV_DOL", ObjBE_Employee_Information.EW_PREVDOL);

            //Employee Education
            objSqlHelper.CreateInParameter("@QUALIFICATION", ObjBE_Employee_Information.EE_HIGHESTQUALIFICATION);
            objSqlHelper.CreateInParameter("@INSTITUTENAME", ObjBE_Employee_Information.EE_INSTITUTENAME);
            objSqlHelper.CreateInParameter("@PASSING_YEAR", ObjBE_Employee_Information.EE_PASSEDYEAR);
            objSqlHelper.CreateInParameter("@PERCENTAGE", ObjBE_Employee_Information.EE_SCOREPERCENTAGE);            

            //Employee Official
            objSqlHelper.CreateInParameter("@OFFICIAL_DOJ", ObjBE_Employee_Information.EO_DOJ);
            objSqlHelper.CreateInParameter("@OFFICIAL_DOL", ObjBE_Employee_Information.EO_DOL);
            objSqlHelper.CreateInParameter("@OFFICIAL_DESIGNATION", ObjBE_Employee_Information.EO_DESIGNATION);
            objSqlHelper.CreateInParameter("@OFFICIAL_PFCAPPING", ObjBE_Employee_Information.EO_PF_CAPPING);
            objSqlHelper.CreateInParameter("@OFFICIAL_DEPARTMENT", ObjBE_Employee_Information.EO_DEPARTMENT);
            objSqlHelper.CreateInParameter("@OFFICIAL_PONUMBER", ObjBE_Employee_Information.EO_PONUMBER);
            objSqlHelper.CreateInParameter("@OFFICIAL_BRANCH", ObjBE_Employee_Information.EO_BRANCH);
            objSqlHelper.CreateInParameter("@OFFICIAL_ESICONTRIBUTION ", ObjBE_Employee_Information.EO_ESI_CONTRIBUTION);
            objSqlHelper.CreateInParameter("@OFFICIAL_JOBLOCATION", ObjBE_Employee_Information.EO_JOBLOCATION);
            objSqlHelper.CreateInParameter("@OFFICIAL_COSTCENTER", ObjBE_Employee_Information.EO_COST_CENTER);
            objSqlHelper.CreateInParameter("@OFFICIAL_CATEGORY", ObjBE_Employee_Information.EO_CATEGORY);
            objSqlHelper.CreateInParameter("@OFFICIAL_PFCONTRIBUTION", ObjBE_Employee_Information.EO_PF_CONTRIBUTION);
            objSqlHelper.CreateInParameter("@OFFICIAL_PTSTATE", ObjBE_Employee_Information.EO_PT_STATE);
            objSqlHelper.CreateInParameter("@OFFICIAL_ESINUMBER", ObjBE_Employee_Information.EO_ESI_NUMBER);
            objSqlHelper.CreateInParameter("@OFFICIAL_AADHARNO", ObjBE_Employee_Information.EO_AADHAR_NUMBER);
            objSqlHelper.CreateInParameter("@OFFICIAL_HANDICAP", ObjBE_Employee_Information.EO_HANDICAP);
            objSqlHelper.CreateInParameter("@OFFICIAL_PFUAN_NO", ObjBE_Employee_Information.EO_PFUAN_NUMBER);
            objSqlHelper.CreateInParameter("@OFFICIAL_PASSPORT_NUMBER ", ObjBE_Employee_Information.EO_PASSPORT_NUMBER);
            objSqlHelper.CreateInParameter("@OFFICIAL_DL_NO", ObjBE_Employee_Information.EO_DRIVERSLICENSE);
            objSqlHelper.CreateInParameter("@OFFICIAL_SENIORCITIZEN", ObjBE_Employee_Information.EO_SENIOR_CITIZEN);
            objSqlHelper.CreateInParameter("@OFFICIAL_PAN", ObjBE_Employee_Information.EO_PAN);
            objSqlHelper.CreateInParameter("@OFFICIAL_CITY", ObjBE_Employee_Information.EO_OFFICE_CITY);
            objSqlHelper.CreateInParameter("@OFFICIAL_STATE", ObjBE_Employee_Information.EO_OFFICE_STATE);
            objSqlHelper.CreateInParameter("@OFFICIAL_COUNTRY", ObjBE_Employee_Information.EO_OFFICE_COUNTRY);
            objSqlHelper.CreateInParameter("@OFFICIAL_PINCODE", ObjBE_Employee_Information.EO_OFFICE_PINCODE);
            objSqlHelper.CreateInParameter("@OFFICIAL_ADDRESS", ObjBE_Employee_Information.EO_OFFICE_ADDRESS);

            //Employee Bank
            objSqlHelper.CreateInParameter("@BANK_IFSCCODE", ObjBE_Employee_Information.EB_IFSC_Code);
            objSqlHelper.CreateInParameter("@BANK_ACCOUNT_NO ", ObjBE_Employee_Information.EB_Account_Number);
            objSqlHelper.CreateInParameter("@BANK_PAYMODE", ObjBE_Employee_Information.EB_Payment_Mode);
            objSqlHelper.CreateInParameter("@BANK_NAME", ObjBE_Employee_Information.EB_Bank_Name);
            objSqlHelper.CreateInParameter("@BANK_BRANCH", ObjBE_Employee_Information.EB_Branch);
            objSqlHelper.CreateInParameter("@BANK_ADDRESS", ObjBE_Employee_Information.EB_Address);

            objSqlHelper.CreateInParameter("@CREATED_BY", ObjBE_Employee_Information.EM_CREATED_BY);
            
            return objSqlHelper.ExecuteQuery("SP_UPDATE_EMPLOYEE_DETAILS");
        }

        public DataSet EducatioDetails_Insert(BE_Employee_Information ObjBE_Employee_Information)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollEmployee");
            objSqlHelper.ClearParameters();

            objSqlHelper.CreateInParameter("@EMP_ID", ObjBE_Employee_Information.EE_EM_ID);
            objSqlHelper.CreateInParameter("@QAULIFICATION", ObjBE_Employee_Information.EE_HIGHESTQUALIFICATION);
            objSqlHelper.CreateInParameter("@INSTITUTENAME", ObjBE_Employee_Information.EE_INSTITUTENAME);
            objSqlHelper.CreateInParameter("@YEAROFPASSING", ObjBE_Employee_Information.EE_PASSEDYEAR);
            objSqlHelper.CreateInParameter("@PERCENTAGE", ObjBE_Employee_Information.EE_SCOREPERCENTAGE);
            objSqlHelper.CreateInParameter("@CREATED_BY", ObjBE_Employee_Information.EE_CREATED_BY);
            return objSqlHelper.ExecuteQuery("SP_EDUCATION_DETAILS_INSERT");

        }
    }
}
