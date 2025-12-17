using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using TesteTelaColaboradores.Models;

namespace TesteTelaColaboradores.Services
{
    public class ColaboradoresService
    {
        private readonly DatabaseService _databaseService;

        public ColaboradoresService()
        {
            _databaseService = new DatabaseService();
        }

        // 🔹 1. Carregar todas as unidades
        public async Task<List<string>> GetUnidadesAsync()
        {
            var unidades = new List<string>();

            using (var conn = _databaseService.GetConnection())
            {
                await conn.OpenAsync();

                string query = "SELECT DISTINCT Filial AS unidades FROM rhdataset;";

                using (var cmd = new MySqlCommand(query, conn))
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        unidades.Add(reader.GetString(0));
                    }
                }
            }

            // Adiciona a opção "Todas" no topo da lista
            unidades.Insert(0, "TODAS");

            return unidades;
        }
        
        // 🔹 2. Carregar todos os anos disponíveis
        public async Task<List<int>> GetAnosAsync()
        {
            var anos = new List<int>();

            using (var conn = _databaseService.GetConnection())
            {
                await conn.OpenAsync();

                string query = "SELECT DISTINCT YEAR(STR_TO_DATE(`Admissão`, '%d/%m/%Y')) AS anos FROM rhdataset ORDER BY anos DESC;";

                using (var cmd = new MySqlCommand(query, conn))
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        // A coluna é do tipo int
                        anos.Add(reader.GetInt32(0));
                    }
                }
            }

            return anos;
        }

        // 🔹 3. Total de colaboradores (com filtros)
        public async Task<int> GetTotalColaboradoresAsync(string unidade, int ano)
        {
            int total = 0;

            using (var conn = _databaseService.GetConnection())
            {
                await conn.OpenAsync();

                // Monta a base (CTE) aplicando filtros de unidade e ano
                string query = @"
            WITH base_colaboradores AS (
                SELECT *
                FROM rhdataset
                WHERE
                    STR_TO_DATE(`Admissão`, '%d/%m/%Y') <= STR_TO_DATE(CONCAT(@ano, '-12-31'), '%Y-%m-%d')
                    AND (
                        `Data Afastamento` = '00/00/0000'
                        OR STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y') >= STR_TO_DATE(CONCAT(@ano, '-01-01'), '%Y-%m-%d')
                    )
                    AND (
                        @unidade = 'TODAS'
                        OR `Filial` = @unidade
                    )
            )
            SELECT COUNT(*) AS total_colaboradores
            FROM base_colaboradores;
        ";

                using (var cmd = new MySqlCommand(query, conn))
                {
                    // Parâmetros
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);

                    // Execução
                    object result = await cmd.ExecuteScalarAsync();

                    if (result != DBNull.Value)
                        total = Convert.ToInt32(result);
                }
            }

            return total;
        }

        // 🔹 4. Distribuição por gênero (VERSÃO CORRIGIDA)
        public async Task<List<(string Sexo, int Quantidade, double Percentual)>> GetDistribuicaoGeneroAsync(string unidade, int ano)
        {
            var distribuicao = new List<(string Sexo, int Quantidade, double Percentual)>();

            using (var conn = _databaseService.GetConnection())
            {
                await conn.OpenAsync();

                string query = @"
            WITH base_colaboradores AS (
                SELECT *
                FROM rhdataset
                WHERE
                    STR_TO_DATE(`Admissão`, '%d/%m/%Y') <= STR_TO_DATE(CONCAT(@ano, '-12-31'), '%Y-%m-%d')
                    AND (
                        `Data Afastamento` = '00/00/0000'
                        OR STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y') >= STR_TO_DATE(CONCAT(@ano, '-01-01'), '%Y-%m-%d')
                    )
                    AND (
                        @unidade = 'TODAS'
                        OR `Filial` = @unidade
                    )
            )
            SELECT
                `Sexo`,
                COUNT(*) AS quantidade,
                ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM base_colaboradores), 1) AS percentual
            FROM base_colaboradores
            GROUP BY `Sexo`;
        ";

                using (var cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        // Pega os índices das colunas uma vez (mais eficiente)
                        int idxSexo = reader.GetOrdinal("Sexo");
                        int idxQuantidade = reader.GetOrdinal("quantidade");
                        int idxPercentual = reader.GetOrdinal("percentual");

                        while (await reader.ReadAsync())
                        {
                            // Verifica DBNull antes de ler
                            string sexo = reader.IsDBNull(idxSexo) ? string.Empty : reader.GetString(idxSexo);
                            int quantidade = reader.IsDBNull(idxQuantidade) ? 0 : reader.GetInt32(idxQuantidade);

                            double percentual = 0;
                            if (!reader.IsDBNull(idxPercentual))
                            {
                                // Pode vir como decimal/double dependendo do driver; usa Convert.ToDouble para maior robustez
                                var raw = reader.GetValue(idxPercentual);
                                percentual = Convert.ToDouble(raw);
                            }

                            distribuicao.Add((sexo, quantidade, percentual));
                        }
                    }
                }
            }

            return distribuicao;
        }

        // 🔹 5. Status dos colaboradores
        public async Task<(int Ativos, int EmLicenca, int Estagiarios, int Pcd)> GetStatusColaboradoresAsync(string unidade, int ano)
        {
            int ativos = 0;
            int emLicenca = 0;
            int estagiarios = 0;
            int pcd = 0;

            using (var conn = _databaseService.GetConnection())
            {
                await conn.OpenAsync();

                // Base de colaboradores com filtros aplicados
                string baseQuery = @"
            WITH base_colaboradores AS (
                SELECT *
                FROM rhdataset
                WHERE
                    STR_TO_DATE(`Admissão`, '%d/%m/%Y') <= STR_TO_DATE(CONCAT(@ano, '-12-31'), '%Y-%m-%d')
                    AND (
                        `Data Afastamento` = '00/00/0000'
                        OR STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y') >= STR_TO_DATE(CONCAT(@ano, '-01-01'), '%Y-%m-%d')
                    )
                    AND (
                        @unidade = 'TODAS'
                        OR `Filial` = @unidade
                    )
            )
        ";

                // 🔹 Ativos
                string qAtivos = baseQuery + @"SELECT COUNT(*) AS ativos FROM base_colaboradores;";

                using (var cmd = new MySqlCommand(qAtivos, conn))
                {
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);
                    object result = await cmd.ExecuteScalarAsync();
                    if (result != DBNull.Value)
                        ativos = Convert.ToInt32(result);
                }

                // 🔹 Em Licença
                string qLicenca = baseQuery + @"
            SELECT COUNT(*) AS em_licenca
            FROM base_colaboradores
            WHERE
                YEAR(STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y')) = @ano
            AND `Descrição (Situação)` IN (
                'Lic. s/ Remuneração','Ferias','Lic.Medica - 15 Dias',
                'Lic.Medica - 30 Dias Prof.','Licença Maternidade',
                'Licença Paternidade','Licença Paternidade Prof.','Auxilio Doenca'
            );
        ";

                using (var cmd = new MySqlCommand(qLicenca, conn))
                {
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);
                    object result = await cmd.ExecuteScalarAsync();
                    if (result != DBNull.Value)
                        emLicenca = Convert.ToInt32(result);
                }

                // 🔹 Estagiários
                string qEstagiarios = baseQuery + @"
            SELECT COUNT(*) AS estagiarios
            FROM base_colaboradores
            WHERE
                (`Título Reduzido (Cargo)` LIKE '%estag%' OR `Descrição (Instrução)` LIKE '%estag%');
        ";

                using (var cmd = new MySqlCommand(qEstagiarios, conn))
                {
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);
                    object result = await cmd.ExecuteScalarAsync();
                    if (result != DBNull.Value)
                        estagiarios = Convert.ToInt32(result);
                }

                // 🔹 PCD
                string qPcd = baseQuery + @"
            SELECT COUNT(*) AS pcd
            FROM base_colaboradores
            WHERE
                `Descrição (Deficiência)` IS NOT NULL
                AND `Descrição (Deficiência)` <> ''
                AND `Descrição (Deficiência)` <> 'Nenhuma';
        ";

                using (var cmd = new MySqlCommand(qPcd, conn))
                {
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);
                    object result = await cmd.ExecuteScalarAsync();
                    if (result != DBNull.Value)
                        pcd = Convert.ToInt32(result);
                }
            }

            return (ativos, emLicenca, estagiarios, pcd);
        }

        // 🔹 6. Colaboradores por setor (Top 5 ou todos)
        public async Task<List<(string Setor, int Quantidade)>> GetColaboradoresPorSetorAsync(string unidade, int ano, bool top5 = true)
        {
            var setores = new List<(string Setor, int Quantidade)>();

            using (var conn = _databaseService.GetConnection())
            {
                await conn.OpenAsync();

                string query = @"
            WITH base_colaboradores AS (
                SELECT *
                FROM rhdataset
                WHERE
                    STR_TO_DATE(`Admissão`, '%d/%m/%Y') <= STR_TO_DATE(CONCAT(@ano, '-12-31'), '%Y-%m-%d')
                    AND (
                        `Data Afastamento` = '00/00/0000'
                        OR STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y') >= STR_TO_DATE(CONCAT(@ano, '-01-01'), '%Y-%m-%d')
                    )
                    AND (
                        @unidade = 'TODAS'
                        OR `Filial` = @unidade
                    )
            )
            SELECT 
                `Descrição (C.Custo)` AS setor,
                COUNT(*) AS quantidade
            FROM base_colaboradores
            GROUP BY `Descrição (C.Custo)`
            ORDER BY quantidade DESC
        ";

                // Se for Top 5, adiciona o LIMIT
                if (top5)
                    query += " LIMIT 5;";

                using (var cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        int idxSetor = reader.GetOrdinal("setor");
                        int idxQtd = reader.GetOrdinal("quantidade");

                        while (await reader.ReadAsync())
                        {
                            string setor = reader.IsDBNull(idxSetor) ? "Indefinido" : reader.GetString(idxSetor);
                            int qtd = reader.IsDBNull(idxQtd) ? 0 : reader.GetInt32(idxQtd);

                            setores.Add((setor, qtd));
                        }
                    }
                }
            }

            return setores;
        }

        // 🔹 7. Lista de colaboradores (Top 5 ou todos)
        public async Task<List<(string Nome, string Setor, string Cargo, string Status)>> GetListaColaboradoresAsync(string unidade, int ano, bool top5 = true)
        {
            var colaboradores = new List<(string Nome, string Setor, string Cargo, string Status)>();

            using (var conn = _databaseService.GetConnection())
            {
                await conn.OpenAsync();

                string query = @"
            WITH base_colaboradores AS (
                SELECT *
                FROM rhdataset
                WHERE
                    STR_TO_DATE(`Admissão`, '%d/%m/%Y') <= STR_TO_DATE(CONCAT(@ano, '-12-31'), '%Y-%m-%d')
                    AND (
                        `Data Afastamento` = '00/00/0000'
                        OR STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y') >= STR_TO_DATE(CONCAT(@ano, '-01-01'), '%Y-%m-%d')
                    )
                    AND (
                        @unidade = 'TODAS'
                        OR `Filial` = @unidade
                    )
            )
            SELECT
                `Nome`,
                `Descrição (C.Custo)` AS setor,
                `Título Reduzido (Cargo)` AS cargo,
                CASE
                    WHEN `Descrição (Situação)` = 'Demitido'
                         AND YEAR(STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y')) = @ano
                        THEN 'Demitido'

                    WHEN `Descrição (Situação)` IN (
                        'Lic. s/ Remuneração','Ferias','Lic.Medica - 15 Dias',
                        'Lic.Medica - 30 Dias Prof.','Licença Maternidade',
                        'Licença Paternidade','Licença Paternidade Prof.','Auxilio Doenca'
                    )
                    AND YEAR(STR_TO_DATE(`Data Afastamento`, '%d/%m/%Y')) = @ano
                        THEN 'Com licença'

                    ELSE 'Ativo'
                END AS status
            FROM base_colaboradores
            ORDER BY `Nome`
        ";

                if (top5)
                    query += " LIMIT 5;";

                using (var cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ano", ano);
                    cmd.Parameters.AddWithValue("@unidade", unidade);

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        int idxNome = reader.GetOrdinal("Nome");
                        int idxSetor = reader.GetOrdinal("setor");
                        int idxCargo = reader.GetOrdinal("cargo");
                        int idxStatus = reader.GetOrdinal("status");

                        while (await reader.ReadAsync())
                        {
                            string nome = reader.IsDBNull(idxNome) ? "" : reader.GetString(idxNome);
                            string setor = reader.IsDBNull(idxSetor) ? "" : reader.GetString(idxSetor);
                            string cargo = reader.IsDBNull(idxCargo) ? "" : reader.GetString(idxCargo);
                            string status = reader.IsDBNull(idxStatus) ? "" : reader.GetString(idxStatus);

                            colaboradores.Add((nome, setor, cargo, status));
                        }
                    }
                }
            }

            return colaboradores;
        }

        // 🔹 8. Lista de colaboradores paginada e filtrada (retorna List)
        public async Task<List<(string Nome, string Setor, string Cargo, string Status)>>
            GetListaColaboradoresPaginadoAsync(string unidade, int ano, int offset, int limit, string filtro)
        {
            // NOTA: este método usa o GetListaColaboradoresAsync (que retorna List).
            // Se o dataset for muito grande, considere implementar paginação direto no SQL,
            // mas por agora usamos filtragem em memória com ToList() para simplicidade.
            var todos = await GetListaColaboradoresAsync(unidade, ano, false);

            IEnumerable<(string Nome, string Setor, string Cargo, string Status)> query = todos;

            if (!string.IsNullOrWhiteSpace(filtro))
            {
                string f = filtro.ToLowerInvariant();
                query = query.Where(c =>
                    (!string.IsNullOrEmpty(c.Nome) && c.Nome.ToLowerInvariant().Contains(f)) ||
                    (!string.IsNullOrEmpty(c.Setor) && c.Setor.ToLowerInvariant().Contains(f)) ||
                    (!string.IsNullOrEmpty(c.Cargo) && c.Cargo.ToLowerInvariant().Contains(f)) ||
                    (!string.IsNullOrEmpty(c.Status) && c.Status.ToLowerInvariant().Contains(f))
                );
            }

            var resultado = query.Skip(offset).Take(limit).ToList();
            return resultado;
        }

    }
}
