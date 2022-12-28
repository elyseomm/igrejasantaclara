using System;
using System.Text;

namespace Custom
{
    public static class Helper
    {
        //convert string para base64
        static public string EncodeToBase64(string texto)
        {
            try
            {
                byte[] textoAsBytes = Encoding.ASCII.GetBytes(texto);
                string resultado = Convert.ToBase64String(textoAsBytes);
                return resultado;
            }
            catch (Exception)
            {
                throw;
            }
        }

        //converte de base64 para texto
        static public string DecodeFrom64(string dados)
        {
            try
            {
                byte[] dadosAsBytes = Convert.FromBase64String(dados);
                string resultado = ASCIIEncoding.ASCII.GetString(dadosAsBytes);
                return resultado;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
