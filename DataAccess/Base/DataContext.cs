using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;
using Microsoft.Extensions.Configuration;

namespace DataAccess.Base
{
    public class DataContext
    {
        private List<SqlParameter> _parameters;
        protected string ProcedureName = string.Empty;
        private SqlConnection? _connection;
        private static string? _connectionString;

        public DataContext()
        {
            _parameters = new List<SqlParameter>();
        }

        public static void AddConnection(string connectionString)
        {
            _connectionString = connectionString;
        }

        private SqlCommand GetCommand()
        {
            var cmd = new SqlCommand(ProcedureName);
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (var parm in _parameters)
            { 
                cmd.Parameters.Add(parm);
            }

            return cmd;
        }

        private DBResult RunCommand(Func<SqlCommand,DBResult> action)
        {
            _connection = new SqlConnection(_connectionString);
            try
            {
                var cmd = GetCommand();

                if(_connection.State == ConnectionState.Closed)
                    _connection.Open();

                cmd.Connection = _connection;
                return action(cmd);
            }
            catch(Exception ex) {
                return new DBResult
                {
                    IsSuccess = false,
                    Message = $"{ex.Message} \n {ex.StackTrace ?? string.Empty}"
                };
            }
            finally { 
                if(_connection.State == ConnectionState.Open)
                    _connection.Close();
            }
        }

        protected void AddParameter(SqlParameter parameter)
        { 
            _parameters.Add(parameter);
        }
        protected void AddParameter(string name, object value)
        {
            _parameters.Add(new SqlParameter(name, value));
        }

        protected DBResult ExecuteNonQuery(Action<SqlCommand>? action = null)
        {
            return RunCommand((cmd) => {
                var res = cmd.ExecuteNonQuery();

                if (action != null) action(cmd);
                return new DBResult { IsSuccess = true, ResultCount = res };
            });
        }

        protected DBResult ExecuteScalar(Action<SqlCommand, object>? action = null)
        {
            return RunCommand((cmd) => {
                var res = cmd.ExecuteScalar();

                if (action != null) action(cmd,res);
                return new DBResult { IsSuccess = true };
            });
        }

        protected DBResult ExecuteWithResult(Action<DataSet>? action = null)
        {
            return RunCommand((cmd) => {
                var da = new SqlDataAdapter(cmd);
                var ds = new DataSet();
                da.Fill(ds);
                if (action != null) action(ds);
                return new DBResult { IsSuccess = true };
            });
        }

        protected DBResult ExecuteReader(Action<SqlDataReader> action)
        {
            return RunCommand((cmd) => {
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    action(reader);
                }

                return new DBResult { IsSuccess = true };
            });
            
        }
    }
}
