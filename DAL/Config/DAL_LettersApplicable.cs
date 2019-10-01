using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{
   public  class DAL_LettersApplicable
   {
       public DataSet GetLettesApplicable(BE_LettersApplicable ObjBE_LettersApplicable)
       {
           SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
           return objSqlHelper.ExecuteQuery("SP_GET_LETTERS_APPLICABLE");
       }
    }
}
