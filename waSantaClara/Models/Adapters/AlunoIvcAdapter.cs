using Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Models.Adapters
{
    public class AlunoIvcAdapter: BaseAdapter
    {
        public AlunoIvcAdapter()
        {
            tableName = "alunos_ivc";
        }

        private static AlunoIvc ParseAlunoIvcFromDataRow(DataRow dr)
        {
            DateTime.TryParse(dr["dtcad"].ToString(), out DateTime dtcad);
            DateTime.TryParse(dr["dtnasc"].ToString(), out DateTime dtnasc);
            int.TryParse(dr["escolaridade"].ToString(), out int escolaridade);
            int.TryParse(dr["outra_religiao"].ToString(), out int outrareligiao);
            int.TryParse(dr["ehartista"].ToString(), out int ehartista);
            int.TryParse(dr["sacramento"].ToString(), out int sacramento);
            int.TryParse(dr["vaiamissa"].ToString(), out int vaiamissa);

            return new AlunoIvc()
            {
                Id = int.Parse(dr["Id"].ToString()),
                Nome = dr["nome"].ToString(),

                Pai = dr["pai"].ToString(),
                Mae = dr["mae"].ToString(),

                Sexo = int.Parse(dr["sexo"].ToString()),
                Naturalidade = dr["naturalidade"].ToString(),
                EstadoCivil = int.Parse(dr["estadocivil"].ToString()),

                Escolaridade = escolaridade,

                Endereco = dr["endereco"].ToString(),
                Nr = dr["nr"].ToString(),
                Bairro = dr["bairro"].ToString(),
                Cidade = dr["cidade"].ToString(),

                EhEngajado = int.Parse(dr["ehengajado"].ToString()),
                DescEngajamento = dr["desc_engajamento"].ToString(),

                Sacranmento = sacramento,
                VaiAMissa = vaiamissa,

                OutraReligiao = outrareligiao,
                DescReligiao = dr["desc_religiao"].ToString(),

                EhArtista = ehartista,
                DescArte = dr["desc_arte"].ToString(),

                Obs = dr["obs"].ToString(),

                IdResponsavel = int.Parse(dr["idresponsavel"].ToString()),
                GrauParentesco = int.Parse(dr["grauparentesco"].ToString()),

                DtCad = dtcad,
                DtNasc = dtnasc,

                Ativo = int.Parse(dr["ativo"].ToString() )
            };
        }

        private static AlunoIvcDto ParseAlunoIvcDtoFromDataRow(DataRow dr)
        {
            DateTime.TryParse(dr["dtcad"].ToString(), out DateTime dtcad);
            DateTime.TryParse(dr["dtnasc"].ToString(), out DateTime dtnasc);
            int.TryParse(dr["escolaridade"].ToString(), out int escolaridade);
            int.TryParse(dr["outra_religiao"].ToString(), out int outrareligiao);
            int.TryParse(dr["ehartista"].ToString(), out int ehartista);
            int.TryParse(dr["sacramento"].ToString(), out int sacramento);
            int.TryParse(dr["vaiamissa"].ToString(), out int vaiamissa);

            int.TryParse(dr["ano"].ToString(), out int ano);

            return new AlunoIvcDto()
            {
                Id = int.Parse(dr["Id"].ToString()),
                Nome = dr["nome"].ToString(),

                Pai = dr["pai"].ToString(),
                Mae = dr["mae"].ToString(),

                Sexo = int.Parse(dr["sexo"].ToString()),
                Naturalidade = dr["naturalidade"].ToString(),
                EstadoCivil = int.Parse(dr["estadocivil"].ToString()),

                Escolaridade = escolaridade,

                Endereco = dr["endereco"].ToString(),
                Nr = dr["nr"].ToString(),
                Bairro = dr["bairro"].ToString(),
                Cidade = dr["cidade"].ToString(),

                EhEngajado = int.Parse(dr["ehengajado"].ToString()),
                DescEngajamento = dr["desc_engajamento"].ToString(),

                Sacranmento = sacramento,
                VaiAMissa = vaiamissa,

                OutraReligiao = outrareligiao,
                DescReligiao = dr["desc_religiao"].ToString(),

                EhArtista = ehartista,
                DescArte = dr["desc_arte"].ToString(),

                Obs = dr["obs"].ToString(),

                IdResponsavel = int.Parse(dr["idresponsavel"].ToString()),
                GrauParentesco = int.Parse(dr["grauparentesco"].ToString()),

                DtCad = dtcad,
                DtNasc = dtnasc,

                Ativo = int.Parse(dr["ativo"].ToString()),

                Responsavel = dr["responsavel"].ToString(),
                Catequista = dr["catequista"].ToString(),
                Sala = dr["sala"].ToString(),
                Ano = ano
            };
        }

        private static VwTurmasDto ParseVwTurmaDtoFromDataRow(DataRow dr)
        {
            return new VwTurmasDto()
            {
                Id = int.Parse(dr["Id"].ToString()),
                Aluno = dr["aluno"].ToString(),
                Responsavel = dr["responsavel"].ToString(),
                Catequista = dr["catequista"].ToString(),
                Sala = dr["sala"].ToString(),
                Turma = dr["turma"].ToString()
            };
        }

        public static List<AlunoIvc> All()
        {
            List<AlunoIvc> list = null;
            var strCmd = $"SELECT * FROM bdsc.{tableName}";
            var dbregs = DBAdapt.GetTable(strCmd);
            if (dbregs != null)
            {
                list = new List<AlunoIvc>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseAlunoIvcFromDataRow(item));
            }

            return list;
        }

        public static AlunoIvc Get(int id)
        {
            List<AlunoIvc> list = null;            
            var dbregs = GetById(id);
            if (dbregs != null)
            {
                list = new List<AlunoIvc>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseAlunoIvcFromDataRow(item));
            }
            return list[0];
        }

        public static List<AlunoIvc> GetByName(string nome)
        {
            List<AlunoIvc> list = null;
            var strCmd = $"SELECT * FROM bdsc.{tableName} WHERE nome LIKE '%{nome}%' AND ativo = 1";
            var dbregs = GetBySQL(strCmd);
            if (dbregs != null)
            {
                list = new List<AlunoIvc>();
                foreach (DataRow item in dbregs.Rows)
                    list.Add(ParseAlunoIvcFromDataRow(item));
            }

            return list;
        }


        public static List<AlunoIvcDto> GetListagem(string sql)
        {
            List<AlunoIvcDto> list = null;
            var newSQL = $"SELECT a.*, r.nome 'responsavel', '' catequista, '' sala, 2022 ano " +
                        $"FROM bdsc.{tableName} a " +
                        "LEFT JOIN bdsc.responsaveis_ivc r ON(r.id = a.idresponsavel) " +
                        $"WHERE {sql}";

            try
            {
                var dbregs = GetBySQL(newSQL);
                if (dbregs != null)
                {
                    list = new List<AlunoIvcDto>();
                    foreach (DataRow item in dbregs.Rows)
                        list.Add(ParseAlunoIvcDtoFromDataRow(item));
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return list;
        }

        public static List<VwTurmasDto> GetTurmasIvcListagem(string sql)
        {
            List<VwTurmasDto> list = null;
            var newSQL = $"SELECT * FROM bdsc.vw_turmas WHERE {sql}";

            try
            {
                var dbregs = GetBySQL(newSQL);
                if (dbregs != null)
                {
                    list = new List<VwTurmasDto>();
                    foreach (DataRow item in dbregs.Rows)
                        list.Add(ParseVwTurmaDtoFromDataRow(item));
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return list;
        }

        public static bool Insert(AlunoIvc data)
        {
            try
            {
                var strCmd = $"INSERT INTO bdsc.{tableName}(nome, mae, pai, dtnasc, sexo, naturalidade, estadocivil," +
                    $"escolaridade, endereco, nr, bairro, cidade, ehengajado, desc_engajamento, sacramento, vaiamissa," +
                    $"outra_religiao, desc_religiao, ehartista , desc_arte, obs , idresponsavel , grauparentesco)" +
                   $"VALUES('{data.Nome}','{data.Mae}','{data.Pai}',STR_TO_DATE('{data.DtNasc.ToShortDateString()}','%d/%m/%Y'), {data.Sexo},'{data.Naturalidade}',{data.EstadoCivil}," +
                   $"{data.Escolaridade},'{data.Endereco}','{data.Nr}','{data.Bairro}','{data.Cidade}',{data.EhEngajado},'{data.DescEngajamento}'," +
                   $"{data.Sacranmento}, {data.VaiAMissa},{data.OutraReligiao},'{data.DescReligiao}',{data.EhArtista},'{data.DescArte}'," +
                   $"'{data.Obs}',{data.IdResponsavel},{data.GrauParentesco})";
                var dbregs = DBAdapt.Exec(strCmd).Result;
                return dbregs > 0;

            }
            catch (Exception ex)
            {
                throw ex;
            }            
        }

        public static bool Update(AlunoIvc data)
        {
            try
            {
                var strCmd = $"UPDATE bdsc.{tableName} SET nome='{data.Nome}', mae='{data.Mae}', pai= '{data.Pai}', dtnasc=STR_TO_DATE('{data.DtNasc.ToShortDateString()}','%d/%m/%Y')," +
                    $"sexo= {data.Sexo}, naturalidade='{data.Naturalidade}'," +
                    $"estadocivil= {data.EstadoCivil}, escolaridade={data.Escolaridade}," +
                    $"endereco='{data.Escolaridade}', nr='{data.Nr}', bairro='{data.Bairro}', cidade='{data.Cidade}'," +
                    $"ehengajado= {data.EhEngajado}, desc_engajamento='{data.DescEngajamento}', sacramento={data.Sacranmento}, vaiamissa={data.VaiAMissa}," +
                    $"outra_religiao= {data.OutraReligiao}, desc_religiao='{data.DescReligiao}' ," +
                    $"ehartista= {data.EhArtista}, desc_arte='{data.DescArte}' ," +
                    $"obs='{data.Obs}', idresponsavel={data.IdResponsavel}, grauparentesco={data.GrauParentesco}," +
                    $"ativo={data.Ativo} " +
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
