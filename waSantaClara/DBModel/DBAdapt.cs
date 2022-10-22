using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Threading.Tasks;

namespace Database
{
    public static class DBAdapt
    {
        public static DataTable GetTable(string cmd)
        {
            using (var adapt = new MySqlDataAdapter(cmd, new DBContext().GetNewConnection()))
            {
                DataTable dt = new DataTable();
                adapt.Fill(dt);
                return dt;
            }

        }

        public static async Task<int> Exec(string sql)
        {
            try
            {
                using (var cmd = new MySqlCommand(sql, new DBContext().GetNewConnection()))
                {
                    return await cmd.ExecuteNonQueryAsync();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
