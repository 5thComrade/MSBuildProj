using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{
   public class DAL_Client
    {
       public DataSet GetClient(BE_Client ObjBE_BE_Client)
       {
           SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
           return objSqlHelper.ExecuteQuery("SP_GET_CLIENT");
       }
    }
}
