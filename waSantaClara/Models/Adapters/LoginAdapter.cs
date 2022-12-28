using Database;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Models.Adapters
{
    public class LoginAdapter: BaseAdapter
    {
        public LoginAdapter()
        {
            tableName = "usuarios";
        }
        private static UsuarioLogin ParseUsuarioFromDataRow(DataRow dr)
        {
            int.TryParse(dr["nivel"].ToString(), out int nivel);
            return new UsuarioLogin()
            {
                Id = int.Parse(dr["id"].ToString()),
                Usuario = dr["usuario"].ToString(),
                Senha = dr["senha"].ToString(),
                Nivel = nivel,
                Ativo = int.Parse( dr["ativo"].ToString() )
            };
        }
        public static List<UsuarioLogin> All()
        {
            List<UsuarioLogin> list = null;            
            var dbcontatos = GetAll();
            if (dbcontatos != null)
            {
                list = new List<UsuarioLogin>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseUsuarioFromDataRow(item));
            }

            return list;
        }

        public static List<UsuarioLogin> GetLogin(string usuario, string senha)
        {
            List<UsuarioLogin> list = null;
            var strCmd = $"SELECT * FROM bdsc.{tableName} WHERE usuario = '{usuario}' AND  ativo = 1";
            var dbcontatos = GetBySQL(strCmd);
            if (dbcontatos != null)
            {
                list = new List<UsuarioLogin>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseUsuarioFromDataRow(item));
            }

            return list;
        }

    }
}
