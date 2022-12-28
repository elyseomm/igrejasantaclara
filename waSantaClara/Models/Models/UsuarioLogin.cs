namespace Models
{
    public class UsuarioLogin
    {
        public int Id { get; set; }
        public string Usuario { get; set; }        
        public string Senha { get; set; }
        public int Nivel { get; set; } = 0;
        public int Ativo { get; set; }
    }
}
