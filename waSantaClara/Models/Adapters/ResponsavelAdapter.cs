using Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Models.Adapters
{
    public class ResponsavelAdapter
    {
        private static Responsavel ParseResponsavelFromDataRow(DataRow dr)
        {
            DateTime.TryParse(dr["dtcad"].ToString(), out DateTime dtcad);

            return new Responsavel()
            {
                Id = int.Parse(dr["Id"].ToString()),                
                Nome = dr["nome"].ToString(),
                Email = dr["email"].ToString(),
                Telefones = dr["telefones"].ToString(),
                DtCad = dtcad,
                Ativo = int.Parse( dr["Ativo"].ToString() )
            };
        }
        public static List<Responsavel> All()
        {
            List<Responsavel> list = null;
            var strCmd = "SELECT * FROM bdsc.responsaveis_ivc";
            var dbregs = DBAdapt.GetTable(strCmd);
            if (dbregs != null)
            {
                list = new List<Responsavel>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseResponsavelFromDataRow(item));
            }

            return list;
        }

        public static Responsavel Get(int id)
        {
            List<Responsavel> list = null;
            var strCmd = $"SELECT * FROM bdsc.responsaveis_ivc WHERE id = {id}";
            var dbregs = DBAdapt.GetTable(strCmd);
            if (dbregs != null)
            {
                list = new List<Responsavel>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseResponsavelFromDataRow(item));
            }
            return list[0];
        }

        public static List<Responsavel> GetByName(string nome)
        {
            List<Responsavel> list = null;
            var strCmd = $"SELECT * FROM bdsc.responsaveis_ivc WHERE nome LIKE '%{nome}%' AND ativo = 1";
            var dbregs = DBAdapt.GetTable(strCmd);
            if (dbregs != null)
            {
                list = new List<Responsavel>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseResponsavelFromDataRow(item));
            }

            return list;
        }

        public static List<Responsavel> GetByEmail(string email)
        {
            List<Responsavel> list = null;
            var strCmd = $"SELECT * FROM bdsc.responsaveis_ivc WHERE email LIKE '%{email}%' AND ativo = 1";
            var dbregs = DBAdapt.GetTable(strCmd);
            if (dbregs != null)
            {
                list = new List<Responsavel>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseResponsavelFromDataRow(item));
            }

            return list;
        }

        public static List<Responsavel> GetByTelefone(string fone)
        {
            List<Responsavel> list = null;
            var strCmd = $"SELECT * FROM bdsc.responsaveis_ivc WHERE telefones LIKE '%{fone}%' AND ativo = 1";
            var dbregs = DBAdapt.GetTable(strCmd);
            if (dbregs != null)
            {
                list = new List<Responsavel>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseResponsavelFromDataRow(item));
            }

            return list;
        }

        public static bool Insert(Responsavel data)
        {
            try
            {
                var strCmd = $"INSERT INTO bdsc.responsaveis_ivc(nome,telefones,email) " +
                   $"VALUES('{data.Nome}','{data.Telefones}','{data.Email}')";
                var dbregs = DBAdapt.Exec(strCmd).Result;
                return dbregs > 0;

            }
            catch (Exception ex)
            {
                throw ex;
            }            
        }

        public static bool Update(Responsavel data)
        {
            try
            {
                var strCmd = $"UPDATE bdsc.responsaveis_ivc " +
                    $"SET nome= '{data.Nome}', telefones='{data.Telefones}', " +
                    $"email= '{data.Email}', ativo= {data.Ativo} " +
                    $"WHERE id = {data.Id}";
                var dbregs = DBAdapt.Exec(strCmd).Result;
                return dbregs > 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
