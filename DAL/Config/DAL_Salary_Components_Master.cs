using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{
    public class DAL_Salary_Components_Master
    {
        public DataSet GetSalaryComponents(BE_Salary_Components_Master ObjBE_Salary_Components_Master)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
            objSqlHelper.ClearParameters();
            return objSqlHelper.ExecuteQuery("SP_GET_SALARY_COMPONENTS");
        }

        public DataSet BindSpecificComponents(BE_Salary_Components_Master ObjBE_Salary_Components_Master)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@CM_ID", ObjBE_Salary_Components_Master.CM_ID);
            objSqlHelper.CreateInParameter("@CM_NAME", ObjBE_Salary_Components_Master.CM_NAME);
            return objSqlHelper.ExecuteQuery("SP_GET_SALARY_SPECIFIC_COMPONENTS");
        }

        //Added by Deepak ----for Mass Insert Salary Components
        public DataSet SalaryComponents_MassInsert(BE_Salary_Components_Master ObjBE_Salary_Components_Master_Mass_Insert)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");            
            //objSqlHelper.CreateInParameter("@CM_CREATEDBY", ObjBE_Salary_Components_Master_Mass_Insert.CM_CREATED_BY);
            //objSqlHelper.CreateStructureParameter("@SALARYTYPE", ObjBE_Salary_Components_Master_Mass_Insert.SALARYTYPE);
            //return objSqlHelper.ExecuteQuery("PROC_SALARYCOMPONENT_MASS_INSERT");            
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@FILEPATH", ObjBE_Salary_Components_Master_Mass_Insert.CM_FilePath);
            objSqlHelper.CreateInParameter("@CREATED_BY", ObjBE_Salary_Components_Master_Mass_Insert.CM_CREATED_BY);
            return objSqlHelper.ExecuteQuery("SP_SALARY_COMPONENT_MASS_INSERT");

        }

        public DataSet SalaryComponents_Insert(BE_Salary_Components_Master ObjBE_Salary_Components_Master)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
            
            objSqlHelper.ClearParameters();

            objSqlHelper.CreateInParameter("@CM_NAME", ObjBE_Salary_Components_Master.CM_NAME);
            objSqlHelper.CreateInParameter("@CM_DESCRIPTION", ObjBE_Salary_Components_Master.CM_DESC);
            objSqlHelper.CreateInParameter("@CM_TYPE", ObjBE_Salary_Components_Master.CM_TYPE);
            objSqlHelper.CreateInParameter("@CM_VALUE_TYPE", ObjBE_Salary_Components_Master.CM_VALUE_TYPE);
            objSqlHelper.CreateInParameter("@CM_APPLICABLE", ObjBE_Salary_Components_Master.CM_APPLICABLE);
            objSqlHelper.CreateInParameter("@CM_FC", ObjBE_Salary_Components_Master.CM_FC);
            objSqlHelper.CreateInParameter("@CM_CF_COMP", ObjBE_Salary_Components_Master.CM_CF_COMP);
            objSqlHelper.CreateInParameter("@CM_PRORATED_CO", ObjBE_Salary_Components_Master.CM_PRORATED_COMP);
            objSqlHelper.CreateInParameter("@CM_ARREARS", ObjBE_Salary_Components_Master.CM_ARREARS);
            objSqlHelper.CreateInParameter("@CM_PF", ObjBE_Salary_Components_Master.CM_PF);
            objSqlHelper.CreateInParameter("@CM_ESIC", ObjBE_Salary_Components_Master.CM_ESIC);
            objSqlHelper.CreateInParameter("@CM_PT", ObjBE_Salary_Components_Master.CM_PT);
            objSqlHelper.CreateInParameter("@CM_TDS_GROSS", ObjBE_Salary_Components_Master.CM_TDS_GROSS);
            objSqlHelper.CreateInParameter("@CM_ADHOC", ObjBE_Salary_Components_Master.CM_ADHOC);
            objSqlHelper.CreateInParameter("@CM_PROFIT", ObjBE_Salary_Components_Master.CM_PROFIT);
            objSqlHelper.CreateInParameter("@CM_CREATED_BY", ObjBE_Salary_Components_Master.CM_CREATED_BY);            
            objSqlHelper.CreateInParameter("@CM_TDS_EST", ObjBE_Salary_Components_Master.CM_TDS_EST);
            return objSqlHelper.ExecuteQuery("SP_SALARYCOMPONENTS_INSERT");
        }

        public DataSet UpdateSalaryComponent_Properties(BE_Salary_Components_Master ObjBE_Salary_Components_Master)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");

            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@CM_ID", ObjBE_Salary_Components_Master.CM_ID);
            objSqlHelper.CreateInParameter("@CM_NAME", ObjBE_Salary_Components_Master.CM_NAME);
            objSqlHelper.CreateInParameter("@CM_DESCRIPTION", ObjBE_Salary_Components_Master.CM_DESC);
            objSqlHelper.CreateInParameter("@CM_TYPE", ObjBE_Salary_Components_Master.CM_TYPE);
            objSqlHelper.CreateInParameter("@CM_VALUE_TYPE", ObjBE_Salary_Components_Master.CM_VALUE_TYPE);
            objSqlHelper.CreateInParameter("@CM_APPLICABLE", ObjBE_Salary_Components_Master.CM_APPLICABLE);
            objSqlHelper.CreateInParameter("@CM_FC", ObjBE_Salary_Components_Master.CM_FC);
            objSqlHelper.CreateInParameter("@CM_CF_COMP", ObjBE_Salary_Components_Master.CM_CF_COMP);
            objSqlHelper.CreateInParameter("@CM_PRORATED_CO", ObjBE_Salary_Components_Master.CM_PRORATED_COMP);
            objSqlHelper.CreateInParameter("@CM_ARREARS", ObjBE_Salary_Components_Master.CM_ARREARS);
            objSqlHelper.CreateInParameter("@CM_PF", ObjBE_Salary_Components_Master.CM_PF);
            objSqlHelper.CreateInParameter("@CM_ESIC", ObjBE_Salary_Components_Master.CM_ESIC);
            objSqlHelper.CreateInParameter("@CM_PT", ObjBE_Salary_Components_Master.CM_PT);
            objSqlHelper.CreateInParameter("@CM_TDS_GROSS", ObjBE_Salary_Components_Master.CM_TDS_GROSS);
            objSqlHelper.CreateInParameter("@CM_ADHOC", ObjBE_Salary_Components_Master.CM_ADHOC);
            objSqlHelper.CreateInParameter("@CM_PROFIT", ObjBE_Salary_Components_Master.CM_PROFIT);            
            objSqlHelper.CreateInParameter("@CM_TDS_EST", ObjBE_Salary_Components_Master.CM_TDS_EST);
            return objSqlHelper.ExecuteQuery("SP_SALARYCOMPONENTS_UPDATE");
        }
    }
}
