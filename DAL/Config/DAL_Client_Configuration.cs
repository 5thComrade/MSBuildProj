using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{
   public class DAL_Client_Configuration
    {
       public DataSet Client_Configuration_Insert(BE_Client_Configuration ObjBE_BE_Client_Configuration)
       {
           SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
           
           objSqlHelper.ClearParameters();
           
           objSqlHelper.CreateInParameter("@CCM_CLIENT_ID",ObjBE_BE_Client_Configuration.CCM_CLIENT_ID);
           objSqlHelper.CreateInParameter("@CCM_EMP_NO_AUTO", ObjBE_BE_Client_Configuration.CCM_EMP_NO_AUTO);
           objSqlHelper.CreateInParameter("@CCM_EMP_NO_LENGTH", ObjBE_BE_Client_Configuration.CCM_EMP_NO_LENGTH);
           objSqlHelper.CreateInParameter("@CCM_EMP_NO_FORMAT", ObjBE_BE_Client_Configuration.CCM_EMP_NO_FORMAT);
           objSqlHelper.CreateInParameter("@CCM_EMP_NO_STARTNO", ObjBE_BE_Client_Configuration.CCM_EMP_NO_STARTNO);
           objSqlHelper.CreateInParameter("@CCM_LTR_APPLICABLE", ObjBE_BE_Client_Configuration.CCM_LTR_APPLICABLE);
           objSqlHelper.CreateInParameter("@CCM_LTR_APPLICABLE_OPTION",ObjBE_BE_Client_Configuration.CCM_LTR_APPLICABLE_OPTION);
           objSqlHelper.CreateInParameter("@CCM_PROCESS_FROM ", ObjBE_BE_Client_Configuration.CCM_PROCESS_FROM);
           objSqlHelper.CreateInParameter("@CCM_APPLICABLE_REPORT",ObjBE_BE_Client_Configuration.CCM_APPLICABLE_REPORT);
           objSqlHelper.CreateInParameter("@CCM_PF_CAPPING", ObjBE_BE_Client_Configuration.CCM_PF_CAPPING);
           objSqlHelper.CreateInParameter("@CCM_LOAN", ObjBE_BE_Client_Configuration.CCM_LOAN);
           objSqlHelper.CreateInParameter("@CCM_LOAN_RATE_OF_INTEREST", ObjBE_BE_Client_Configuration.CCM_LOAN_RATE_OF_INTEREST);
           objSqlHelper.CreateInParameter("@CCM_LOAN_TYPE", ObjBE_BE_Client_Configuration.CCM_LOAN_TYPE);
           objSqlHelper.CreateInParameter("@CCM_LOAN_INT", ObjBE_BE_Client_Configuration.CCM_LOAN_INT);
           objSqlHelper.CreateInParameter("@CCM_SELF_SERVICE",ObjBE_BE_Client_Configuration.CCM_SELF_SERVICE);
           objSqlHelper.CreateInParameter("@CCM_ESS_PORTAL",ObjBE_BE_Client_Configuration.CCM_ESS_PORTAL);
           objSqlHelper.CreateInParameter("@CCM_EMB", ObjBE_BE_Client_Configuration.CCM_EMB);
           objSqlHelper.CreateInParameter("@CCM_EOI", ObjBE_BE_Client_Configuration.CCM_EOI);
           objSqlHelper.CreateInParameter("@CCM_EIP", ObjBE_BE_Client_Configuration.CCM_EIP);
           objSqlHelper.CreateInParameter("@CCM_EM", ObjBE_BE_Client_Configuration.CCM_EM);
           objSqlHelper.CreateInParameter("@CCM_FBP", ObjBE_BE_Client_Configuration.CCM_FBP);
           objSqlHelper.CreateInParameter("@CCM_TE", ObjBE_BE_Client_Configuration.CCM_TE);
           objSqlHelper.CreateInParameter("@CCM_PA", ObjBE_BE_Client_Configuration.CCM_PA);           
           objSqlHelper.CreateInParameter("@CCM_DIS_CLIENT_NAME",ObjBE_BE_Client_Configuration.CCM_DIS_CLIENT_NAME);
           objSqlHelper.CreateInParameter("@CCM_THEME_CLR_HDR",ObjBE_BE_Client_Configuration.CCM_THEME_CLR_HDR);
           objSqlHelper.CreateInParameter("@CCM_THEME_CLR_PAGE",ObjBE_BE_Client_Configuration.CCM_THEME_CLR_PAGE);
           objSqlHelper.CreateInParameter("@CCM_THEME_FONT",ObjBE_BE_Client_Configuration.CCM_THEME_FONT);
           objSqlHelper.CreateInParameter("@CCM_ROLE_TO_ENABLE",ObjBE_BE_Client_Configuration.CCM_ROLE_TO_ENABLE);
           objSqlHelper.CreateInParameter("@CCM_LOGIN_TO_DISABLE",ObjBE_BE_Client_Configuration.CCM_LOGIN_TO_DISABLE); 
           objSqlHelper.CreateInParameter("@CCM_EPSF_FROM",ObjBE_BE_Client_Configuration.CCM_EPSF_FROM);
           objSqlHelper.CreateInParameter("@CCM_EPSF_TO",ObjBE_BE_Client_Configuration.CCM_EPSF_TO);
           objSqlHelper.CreateInParameter("@CCM_FBP_FROM",ObjBE_BE_Client_Configuration.CCM_FBP_FROM);
           objSqlHelper.CreateInParameter("@CCM_FBP_TO",ObjBE_BE_Client_Configuration.CCM_FBP_TO);
           objSqlHelper.CreateInParameter("@CCM_PAYSLIP_FORMAT",ObjBE_BE_Client_Configuration.CCM_PAYSLIP_FORMAT);
           objSqlHelper.CreateInParameter("@CCM_PAYSLIP_TYPE", ObjBE_BE_Client_Configuration.CCM_PAYSLIP_TYPE);
           objSqlHelper.CreateInParameter("@CCM_PAYSLIP_COLUMNS", ObjBE_BE_Client_Configuration.CCM_PAYSLIP_COLUMNS);
           objSqlHelper.CreateInParameter("@CCM_PAYSLIP_PASS_PROT",ObjBE_BE_Client_Configuration.CCM_PAYSLIP_PASS_PROT);
           objSqlHelper.CreateInParameter("@CCM_PAYSLIP_PASS_PAR",ObjBE_BE_Client_Configuration.CCM_PAYSLIP_PASS_PAR);
           objSqlHelper.CreateInParameter("@CCM_ITSHEET_FORMAT", ObjBE_BE_Client_Configuration.CCM_ITSHEET_FORMAT);
           objSqlHelper.CreateInParameter("@CCM_ITSHEET_PASS_PROT",ObjBE_BE_Client_Configuration.CCM_ITSHEET_PASS_PROT);
           objSqlHelper.CreateInParameter("@CCM_ITSHEET_PASS_PAR ",ObjBE_BE_Client_Configuration.CCM_ITSHEET_PASS_PAR);
           objSqlHelper.CreateInParameter("@CCM_CREATED_BY", ObjBE_BE_Client_Configuration.CCM_CREATED_BY);

           objSqlHelper.CreateInParameter("@CTC_GRID_DETAILS", ObjBE_BE_Client_Configuration.CED_CTC_GRID_DETAILS);  

           return objSqlHelper.ExecuteQuery("SP_CLIENT_CONFIGURATION_INSERT");
       }
    }
}
