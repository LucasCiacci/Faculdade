using MySql.Data.MySqlClient;
using System;
using System.Threading.Tasks;

namespace TesteTelaColaboradores.Services
{
    public class DatabaseService
    {
        // 🔹 Connection string - temporariamente colocamos aqui
        private readonly string _connectionString = "Server=cursoslivres.cl0yia62segf.sa-east-1.rds.amazonaws.com;Database=rhsenior_heicomp;User ID=heicomp;Password=heicomp2025;";

        // 🔹 Método para obter uma conexão nova
        public MySqlConnection GetConnection()
        {
            return new MySqlConnection(_connectionString);
        }

        // 🔹 Método para testar a conexão (vamos usar agora)
        public async Task<bool> TestarConexaoAsync()
        {
            try
            {
                using (var conn = GetConnection())
                {
                    await conn.OpenAsync();
                    Console.WriteLine("✅ Conexão MySQL aberta com sucesso!");
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("❌ Erro ao conectar no MySQL: " + ex.Message);
                return false;
            }
        }
    }
}
