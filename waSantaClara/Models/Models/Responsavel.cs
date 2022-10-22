using System;

namespace Models
{
    public class Responsavel
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public DateTime DtCad { get; set; }
        public string Telefones { get; set; }
        public string Email { get; set; }
        public int Ativo { get; set; }
    }
}
