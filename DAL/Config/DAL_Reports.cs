using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{
    public class DAL_Reports
    {
        public DataSet GetSpecific_Reports(BE_Reports ObjBE_BE_Reports)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
            objSqlHelper.CreateInParameter("@REPORT_TYPE", ObjBE_BE_Reports.PR_TYPE);
            return objSqlHelper.ExecuteQuery("SP_GET_REPORT");
        }
    }
}
