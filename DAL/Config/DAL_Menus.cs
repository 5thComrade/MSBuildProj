using Payroll.Teamlease.Entity;
using Payroll.Teamlease.DAO;
using System.Data;

namespace Payroll.Teamlease.DAL
{
    public class DAL_Menus
    {
        public DataSet GetMenus(BE_Menus ObjBE_BE_Menus)
        {
            SqlHelper objSqlHelper = new SqlHelper("TLPayrollConfig");
            objSqlHelper.ClearParameters();
            objSqlHelper.CreateInParameter("@M_TYPE", ObjBE_BE_Menus.M_TYPE);
            return objSqlHelper.ExecuteQuery("SP_MENU_SELECTION");
        }
    }
}
