using TesteTelaColaboradores.Services; // ✅ importe o namespace do DatabaseService
using System.Threading.Tasks;
using TesteTelaColaboradores.Views;

namespace TesteTelaColaboradores.Views
{
    public partial class MainPage : ContentPage
    {
        private readonly DatabaseService _dbService = new DatabaseService();
        public MainPage()
        {
            InitializeComponent();

            // 🔹 Teste de conexão
            TestarConexao();
        }
        private async void TestarConexao()
        {
            bool sucesso = await _dbService.TestarConexaoAsync();

            if (sucesso)
            {
                await DisplayAlert("Banco de Dados", "✅ Conexão MySQL aberta com sucesso!", "OK");

                var colabService = new ColaboradoresService();


                var unidades = await colabService.GetUnidadesAsync();
                string listaUnidades = string.Join("\n", unidades);
                await DisplayAlert("Unidades encontradas", listaUnidades, "OK");


                var anos = await colabService.GetAnosAsync();
                string listaAnos = string.Join(", ", anos);
                await DisplayAlert("Anos encontrados", listaAnos, "OK");


                int total = await colabService.GetTotalColaboradoresAsync("TODAS", 2024);
                await DisplayAlert("Total de colaboradores", total.ToString(), "OK");


                var distribuicao = await colabService.GetDistribuicaoGeneroAsync("TODAS", 2024);

                string texto = "";
                foreach (var item in distribuicao)
                {
                    texto += $"{item.Sexo}: {item.Quantidade} colaboradores ({item.Percentual}%)\n";
                }

                await DisplayAlert("Distribuição por gênero", texto, "OK");


                var status = await colabService.GetStatusColaboradoresAsync("TODAS", 2024);

                string msg = $"Ativos: {status.Ativos}\n" +
                             $"Em licença: {status.EmLicenca}\n" +
                             $"Estagiários: {status.Estagiarios}\n" +
                             $"PCD: {status.Pcd}";

                await DisplayAlert("Status dos colaboradores", msg, "OK");


                var setores = await colabService.GetColaboradoresPorSetorAsync("TODAS", 2024, top5: true);

                string msgSetores = "Top 5 setores:\n";
                foreach (var s in setores)
                {
                    msgSetores += $"{s.Setor}: {s.Quantidade}\n";
                }

                await DisplayAlert("Colaboradores por setor", msgSetores, "OK");


                var lista = await colabService.GetListaColaboradoresAsync("TODAS", 2024, top5: true);

                string textoLista = "Top 5 colaboradores:\n";
                foreach (var c in lista)
                {
                    textoLista += $"{c.Nome} — {c.Setor} — {c.Cargo} — {c.Status}\n";
                }

                await DisplayAlert("Lista de colaboradores", textoLista, "OK");


            }
            else
            {
                await DisplayAlert("Banco de Dados", "❌ Falha ao conectar no banco. Verifique o console.", "OK");
            }
        }




        private async void OnGoToColaboradoresClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync(nameof(ColaboradoresPage));
        }
    }
}
