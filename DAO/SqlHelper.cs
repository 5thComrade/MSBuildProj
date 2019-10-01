using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace Payroll.Teamlease.DAO
{
    public class SqlHelper : IDisposable
    {
        SqlConnection _conn = null;
        ArrayList ParameterArray = null;
        string _connString = null;
        SqlTransaction _trans = null;
        bool _disposed = false;
        public SqlTransaction Transaction { get { return _trans; } }

        public static string ConnectionString { get; set; }

        public SqlHelper(string ConnectionString)
        {
            try
            {
                //ConnectionString = "Data Source=clcs2srvr;Initial Catalog=CLCSUATLIVENEW;User Id=sa;Password=sqlserver123$;Connect Timeout=4000; pooling='true'; Max Pool Size=200";// System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                ConnectionString = System.Configuration.ConfigurationManager.AppSettings[ConnectionString];
                _connString = ConnectionString;
                ParameterArray = new ArrayList();
            }
            catch (Exception Ex)
            {
                
            }
        }

        public void Connect()
        {
            _conn = new SqlConnection(_connString);
            _conn.Open();
        }

        public void DisConnect()
        {
            _conn.Close();
            //Dispose();
        }

        public void CreateInParameter(string sParamName, object oParamValue)
        {
            SqlParameter objOparm = new SqlParameter(sParamName, SqlDbType.VarChar);
            objOparm.Value = oParamValue;
            ParameterArray.Add(objOparm);
        }

        public void CreateMaxParameter(string sParamName, object oParamValue)
        {
            SqlParameter objOparm = new SqlParameter(sParamName, SqlDbType.Text);
            objOparm.Value = oParamValue;
            ParameterArray.Add(objOparm);
        }

        public void CreateOutParameter(string sParamName, object oParamValue)
        {
            SqlParameter objOparm = new SqlParameter(sParamName, SqlDbType.VarChar, 500);
            objOparm.Direction = ParameterDirection.Output;
            ParameterArray.Add(objOparm);
        }

        public void CreateParameterBinary(string sParamName, byte[] oParamValue)
        {
            SqlParameter objOparm = new SqlParameter(sParamName, SqlDbType.Binary);
            objOparm.Value = oParamValue;
            ParameterArray.Add(objOparm);
        }
        public void CreateStructureParameter(string sParamName, object oParamValue)
        {
            SqlParameter objOparm = new SqlParameter(sParamName, SqlDbType.Structured);
            objOparm.Value = oParamValue;
            ParameterArray.Add(objOparm);
        }
        public void ClearParameters()
        {
            ParameterArray.Clear();
        }

        public SqlCommand CreateCommand(string sProcedureName)
        {
            SqlCommand cmd = new SqlCommand(sProcedureName, _conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = sProcedureName;
            SqlParameter[] paramArray = ParameterArray.ToArray(typeof(SqlParameter)) as SqlParameter[];
            cmd.Parameters.AddRange(paramArray);
            return cmd;
        }

        public DataSet ExecuteQuery(string sProcedureName)
        {
            Connect();
            DataSet ds = new DataSet();
            using (_conn)
            {
                using (SqlCommand cmd = CreateCommand(sProcedureName))
                {
                    cmd.CommandTimeout = 0;
                    SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                    adapt.Fill(ds);
                }
                DisConnect();
                return ds;
            }
        }

        public string ExecuteNonQuery(string sProcedureName)
        {
            Connect();
            string RetVal = string.Empty;
            DataSet ds = new DataSet();
            using (_conn)
            {
                using (SqlCommand cmd = CreateCommand(sProcedureName))
                {
                    cmd.ExecuteNonQuery();
                    if (cmd.Parameters.Contains("@PO_RETCODE"))
                        RetVal = cmd.Parameters["@PO_RETCODE"].Value.ToString();
                    DisConnect();
                    return RetVal;
                }
            }
        }

        public SqlTransaction BeginTransation()
        {
            RollbackTransation();
            _trans = _conn.BeginTransaction();
            return Transaction;
        }

        public void CommitTransation()
        {
            if (_trans != null)
            {
                _trans.Commit();
                _trans = null;
            }
        }

        public void RollbackTransation()
        {
            if (_trans != null)
            {
                _trans.Rollback();
                _trans = null;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                // Need to dispose managed resources if being called manually
                if (disposing)
                {
                    if (_conn != null)
                    {
                        _conn.Dispose();
                        _conn = null;
                    }
                }
                _disposed = true;
            }
        }
    }
}
