using System;

namespace Models
{
    public class Paroquia
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public DateTime DtCad { get; set; }
        public DateTime DtFundacao { get; set; }
        public string Endereco { get; set; }
        public string Cep { get; set; }
        public string Telefone { get; set; }
        public string Email { get; set; }
        public string Facebook { get; set; }
        public string Instagram { get; set; }
        public string GeoLoc { get; set; }
        public string Telefones { get; set; }
        public string Obs { get; set; }
    }
}
