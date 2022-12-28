using Database;
using System.Data;

namespace Models.Adapters
{
    public class BaseAdapter
    {
        protected static string tableName = "";
        
        private static DataTable GetData(string sql) => DBAdapt.GetTable(sql);

        public static DataTable GetBySQL(string sql) => GetData(sql);

        public static DataTable GetAll() => GetData($"SELECT * FROM bdsc.{tableName}");

        public static DataTable GetById(int id) => DBAdapt.GetTable($"SELECT * FROM bdsc.{tableName} WHERE id = {id}");

    }
}
