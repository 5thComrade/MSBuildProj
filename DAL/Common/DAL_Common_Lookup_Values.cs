using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;


namespace Payroll.Teamlease.DAL
{
    public class DAL_Common_Lookup_Values
    {
        public DataSet GetCommonLookupValues(BE_Common_Lookup_Values ObjBE_Common_Lookup_Values)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@CLV_TYPE", ObjBE_Common_Lookup_Values.CLV_TYPE);
            return objSqlHelper.ExecuteQuery("SP_COMMON_LOOKUP_VALUES_SELECT");
        }
    }
}
