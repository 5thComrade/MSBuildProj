using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{
  public class DAL_Payslip_Columns
    {
      public DataSet GetPayslip_Columns(BE_Payslip_Columns ObjBE_BE_Payslip_Columns )
      {
          SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
          return objSqlHelper.ExecuteQuery("SP_GET_PAYSLIP_COLUMNS");
      }
    }
}
