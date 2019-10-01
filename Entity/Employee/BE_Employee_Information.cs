using System.Data;
namespace Payroll.Teamlease.Entity
{
    public class BE_Employee_Information
    {

        // EMPLOYEE_MASTER
        public int recid { get; set; }
        public string EM_ID { get; set; }
        public string EM_ASSC_ID { get; set; }
        public string EM_EMP_NO { get; set; }
        public string EM_CLIENT_ID { get; set; }
        public string EM_DOB { get; set; }
        public string EM_GENDER { get; set; }
        public string EM_TITLE { get; set; }
        public string EM_NAME { get; set; }
        public string EM_EMAIL { get; set; }
        public string EM_MOBILE { get; set; }
        public string EM_PRESENT_ADDRESS { get; set; }
        public string EM_PRESENT_CITY { get; set; }
        public string EM_PRESENT_STATE { get; set; }
        public string EM_PRESENT_PINCODE { get; set; }
        public string EM_PRESENT_COUNTRY { get; set; }
        public string EM_NATIONALITY { get; set; }
        public string EM_JOB_TYPE { get; set; }
        public string EM_PROFILE_IMG { get; set; }        
        public string EM_STATUS { get; set; }
        public string EM_CREATED_BY { get; set; }
        public string EM_CREATED_DATE { get; set; }
        public string EM_MODIFIED_BY { get; set; }
        public string EM_MODIFIED_DATE { get; set; }
        public string EA_EM_ASSC_ID { get; set; }
        public string EM_EM_Salutation { get; set; }
        public string Json_EducationDetails { get; set; }
        public string Option { get; set; }
        public string EM_SALUATIONVALUE { get; set; }
        public string EM_JOBTYPEVALUE { get; set; }
        

        // EMPLOYEE_ADDRESS
        public string EA_PERMANENT_ADDRESS { get; set; }
        public string EA_PERMANENT_CITY { get; set; }
        public string EA_PERMANENT_STATE { get; set; }
        public string EA_PERMANENT_PINCODE { get; set; }
        public string EA_PERMANENT_COUNTRY { get; set; }
        public string EA_PERMANENT_NATIONALITY { get; set; }
        public string EA_CREATED_BY { get; set; }
        public string EA_CREATED_DATE { get; set; }
        public string EA_MODIFIED_BY { get; set; }
        public string EA_MODIFIED_DATE { get; set; }
        public string EA_MAILING_ADDRESS { get; set; }
        public string EA_MAILING_CITY { get; set; }
        public string EA_MAILING_STATE { get; set; }
        public string EA_MAILING_PINCODE { get; set; }
        public string EA_MAILING_COUNTRY { get; set; }
        public string EA_MAILING_NATIONALITY { get; set; }
        

        // EMPLOYEE_OFFICIAL
        public string EO_EM_ID { get; set; }
        public string EO_DOJ { get; set; }
        public string EO_SYS_DOJ { get; set; }
        public string EO_DOL { get; set; }
        public string EO_SYS_DOL { get; set; }
        public string EO_DESIGNATION { get; set; }
        public string EO_DEPARTMENT { get; set; }
        public string EO_COST_CENTER { get; set; }
        public string EO_BRANCH { get; set; }
        public string EO_PONUMBER { get; set; }
        public string EO_CATEGORY { get; set; }
        public string EO_JOBLOCATION { get; set; }
        public string EO_PT_STATE { get; set; }
        public string EO_ESI_CONTRIBUTION { get; set; }
        public string EO_PF_CONTRIBUTION { get; set; }
        public string EO_PF_CAPPING { get; set; }
        public string EO_HANDICAP { get; set; }
        public string EO_SENIOR_CITIZEN { get; set; }
        public string EO_PFUAN_NUMBER { get; set; }
        public string EO_ESI_NUMBER { get; set; }
        public string EO_AADHAR_NUMBER { get; set; }
        public string EO_PAN { get; set; }
        public string EO_PASSPORT_NUMBER { get; set; }
        public string EO_DRIVERSLICENSE { get; set; }
        public string EO_OFFICE_ADDRESS { get; set; }
        public string EO_OFFICE_CITY { get; set; }
        public string EO_OFFICE_STATE { get; set; }
        public string EO_OFFICE_PINCODE { get; set; }
        public string EO_OFFICE_COUNTRY { get; set; }
        public string EO_PAYMODE { get; set; }
        public string EO_BANK { get; set; }
        public string EO_BANKBRANCH { get; set; }
        public string EO_ACC_NO { get; set; }
        public string EO_IFSC_CODE { get; set; }
        public string EO_CREATEDBY { get; set; }
        public string EO_CREATED_DATE { get; set; }
        // EMPLOYEE_EDUCATION
        public string EE_EM_ID { get; set; }
        public string EE_HIGHESTQUALIFICATION { get; set; }
        public string EE_PASSEDYEAR { get; set; }
        public string EE_SCOREPERCENTAGE { get; set; }
        public string EE_CREATED_BY { get; set; }
        public string EE_CREATED_DATE { get; set; }
        public string EE_INSTITUTENAME { get; set; }
        // EMPLOYEE_FAMILY
        public string EF_EM_ID { get; set; }
        public string EF_FATHER_NAME { get; set; }
        public string EF_FATHER_DOB { get; set; }
        public string EF_MOTHER_NAME { get; set; }
        public string EF_MOTHER_DOB { get; set; }
        public string EF_SPOUSE_NAME { get; set; }
        public string EF_SPOUSE_DOB { get; set; }
        public string EF_CHILD1_NAME { get; set; }
        public string EF_CHILD1_DOB { get; set; }
        public string EF_CHILD2_NAME { get; set; }
        public string EF_CHILD2_DOB { get; set; }
        public string EF_CREATED_BY { get; set; }
        public string EF_CREATED_DATE { get; set; }
        // EMPLOYEE_WORK
        public string EW_EM_ID { get; set; }
        public string EW_PREVEXP { get; set; }
        public string EW_PREVCOMPANY { get; set; }
        public string EW_PREVDESIGNATION { get; set; }
        public string EW_PREVDOJ { get; set; }
        public string EW_PREVDOL { get; set; }
        public string EW_CREATED_BY { get; set; }
        public string EW_CREATED_DATE { get; set; }
        public string EW_SKILLS { get; set; }
        public string Qualification { get; set; }

        //Employee Bank Details
        public string EB_EM_ID { get; set; }
        public string EB_IFSC_Code { get; set; }
        public string EB_Payment_Mode { get; set; }
        public string EB_Account_Number { get; set; }
        public string EB_Bank_Name { get; set; }
        public string EB_Branch { get; set; }
        public string EB_Address { get; set; }
        public string EB_PAYMODE_VALUE { get; set; }
        public string ERROR_MSG { get; set; }


        //EMPLOYEE MASS INSERT
        public DataTable EmployeeMasterType { get; set; }
        public string ErrorMessage { get; set; }    
        public string Errorlines { get; set; }
        public string FilePath { get;set; }
    }

    public class BindEmpTemplateExport
    {
        public int recid { get; set; }
        public string Emp_No { get; set; }
        public string Emp_Name { get; set; }
        public string Client_ID { get; set; }
        public string Mob_No { get; set; }
        public string DOB { get; set; }
        public string Gender { get; set; }
        public string EmailID { get; set; }
        public string Address { get; set; }
        public string Status { get; set; }
    }
}
