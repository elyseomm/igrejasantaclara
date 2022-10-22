using Database;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Models.Adapters
{
    public class RequisitoPadrinhoBatismoAdapter
    {
        private static RequisitosPadrinhoBatismo ParseRequisitoPadrinhoBatismoFromDataRow(DataRow dr)
        {
            return new RequisitosPadrinhoBatismo()
            {
                Id = int.Parse(dr["id"].ToString()),
                Requisito = dr["requisito"].ToString(),              
                Ativo = int.Parse( dr["ativo"].ToString() )
            };
        }
        public static List<RequisitosPadrinhoBatismo> All()
        {
            List<RequisitosPadrinhoBatismo> list = null;
            var strCmd = "SELECT * FROM bdsc.requisitospadrinhosbatismo";
            var dbcontatos = DBAdapt.GetTable(strCmd);
            if (dbcontatos != null)
            {
                list = new List<RequisitosPadrinhoBatismo>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseRequisitoPadrinhoBatismoFromDataRow(item));
            }

            return list;
        }

        public static List<RequisitosPadrinhoBatismo> GetByName(string nome)
        {
            List<RequisitosPadrinhoBatismo> list = null;
            var strCmd = $"SELECT * FROM bdsc.requisitospadrinhosbatismo WHERE nome LIKE '%{nome}%' AND ativo = 1";
            var dbcontatos = DBAdapt.GetTable(strCmd);
            if (dbcontatos != null)
            {
                list = new List<RequisitosPadrinhoBatismo>();
                foreach (DataRow item in dbcontatos.Rows)
                    list.Add(ParseRequisitoPadrinhoBatismoFromDataRow(item));
            }

            return list;
        }

    }
}
