using System;

namespace Models
{
    public class AlunoIvcDto
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Mae { get; set; }
        public string Pai { get; set; }
        public DateTime DtNasc { get; set; }
        public DateTime DtCad { get; set; }
        public int Sexo { get; set; }
        public string Naturalidade { get; set; }
        public int EstadoCivil { get; set; }
        public int Escolaridade { get; set; }
        public string Endereco { get; set; }
        public string Nr { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }

        public int EhEngajado { get; set; }
        public string DescEngajamento { get; set; }
        public int Sacranmento { get; set; }
        public int VaiAMissa { get; set; }
        public int OutraReligiao { get; set; }
        public string DescReligiao { get; set; }
        public int EhArtista { get; set; }
        public string DescArte { get; set; }
        public string Obs { get; set; }
        public int IdResponsavel { get; set; }
        public int GrauParentesco { get; set; }
        
        public string Responsavel { get; set; }
        public string Catequista { get; set; }
        public string Sala { get; set; }
        public int Ano { get; set; }
        public int Ativo { get; set; }
    }
}
