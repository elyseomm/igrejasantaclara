using Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Models.Adapters
{
    public class ParoquiaAdapter
    {
        private static Paroquia ParseParoquiaFromDataRow(DataRow dr)
        {
            DateTime.TryParse(dr["dtcad"].ToString(), out DateTime dtcad);
            DateTime.TryParse(dr["dtfundacao"].ToString(), out DateTime dtfundacao);

            return new Paroquia()
            {
                Id = int.Parse( dr["id"].ToString() ),
                Nome = dr["nome"].ToString(),
                Endereco = dr["endereco"].ToString(),
                Cep = dr["cep"].ToString(),
                
                DtCad = dtcad,
                DtFundacao = dtfundacao,

                Email = dr["email"].ToString(),
                Telefone = dr["telefone"].ToString(),
                Facebook = dr["facebook"].ToString(),
                Instagram = dr["instagram"].ToString(),
                GeoLoc = dr["geoloc"].ToString(),
                Telefones = dr["telefones"].ToString(),
                Obs = dr["obs"].ToString(),
            };
        }
        public static Paroquia Get()
        { 
            List<Paroquia> list = null;
            var strCmd = "SELECT * FROM bdsc.paroquia";
            var dbrows = DBAdapt.GetTable(strCmd);
            if (dbrows != null)
            {
                list = new List<Paroquia>();
                foreach (DataRow item in dbrows.Rows)
                    list.Add(ParseParoquiaFromDataRow(item));
            }
            return list.FirstOrDefault();
        }

        public static List<Paroquia> GetByName(string nome)
        {
            List<Paroquia> list = null;
            var strCmd = $"SELECT * FROM bdsc.paroquia WHERE nome LIKE '%{nome}%' AND ativo = 1";
            var dbcontatos = DBAdapt.GetTable(strCmd);
            if (dbcontatos != null)
            {
                list = new List<Paroquia>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseParoquiaFromDataRow(item));
            }

            return list;
        }
    }
}
