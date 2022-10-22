using MySql.Data.MySqlClient;
using System;
using System.Configuration;

namespace Database
{
    public class DBContext
    {
        protected MySqlConnection conn = null;
        protected static string connString;

        public DBContext()
        {
            connString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            Console.WriteLine(connString);            
        }

        public MySqlConnection GetNewConnection()
        {

            try
            {
                conn = new MySqlConnection(connString);
                conn.Open();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return conn;
        }
    }
}
