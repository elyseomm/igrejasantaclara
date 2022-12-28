using Database;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Models.Adapters
{
    public class ContatoAdapter : BaseAdapter
    {
        public ContatoAdapter()
        {
            tableName = "contatos";
        }
        private static Contato ParseContatoFromDataRow(DataRow dr)
        {
            return new Contato()
            {
                Id = int.Parse(dr["id"].ToString()),
                Funcao = dr["funcao"].ToString(),
                Nome = dr["nome"].ToString(),
                Email = dr["email"].ToString(),
                Telefone = dr["telefone"].ToString(),
                Obs = dr["obs"].ToString(),
                Ativo = int.Parse( dr["ativo"].ToString() )
            };
        }
        public static List<Contato> All()
        {
            List<Contato> list = null;
            var dbcontatos = GetAll();
            if (dbcontatos != null)
            {
                list = new List<Contato>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseContatoFromDataRow(item));
            }

            return list;
        }

        public static List<Contato> GetByName(string nome)
        {
            List<Contato> list = null;
            var strCmd = $"SELECT * FROM bdsc.contatos WHERE nome LIKE '%{nome}%' AND ativo = 1";
            var dbcontatos = GetBySQL(strCmd);
            if (dbcontatos != null)
            {
                list = new List<Contato>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseContatoFromDataRow(item));
            }

            return list;
        }

        public static List<Contato> GetByFuncao(string funcao)
        {
            List<Contato> list = null;
            var strCmd = $"SELECT * FROM bdsc.contatos WHERE funcao LIKE '%{funcao}%' AND ativo = 1";
            var dbcontatos = GetBySQL(strCmd);
            if (dbcontatos != null)
            {
                list = new List<Contato>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseContatoFromDataRow(item));
            }

            return list;
        }

    }
}
