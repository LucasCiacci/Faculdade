using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using TesteTelaColaboradores.Models;
using TesteTelaColaboradores.Services;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using System.Linq;

namespace TesteTelaColaboradores.ViewModels
{
    public class ColaboradoresViewModel : INotifyPropertyChanged
    {
        private readonly ColaboradoresService _service;

        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string propertyName = null)
            => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        public ColaboradoresViewModel()
        {
            _service = new ColaboradoresService();

            // inicializa comandos e propriedades que o XAML / código espera
            AbrirPopupCommand = new Command(async () => await AbrirPopup());
            FecharPopupCommand = new Command(() => MostrarTodosSetores = false);

            // comando que abre a lista completa (navegação com parâmetros)
            AbrirListaCompletaCommand = new Command(async () => await AbrirListaCompleta());

            // comando para exibir valor ao clicar na barra
            MostrarValorCommand = new Command<string>(MostrarValor);

            // mantém compatibilidade com popups antigos (se usados)
            FecharPopupColaboradoresCommand = new Command(() => MostrarTodosColaboradores = false);

            // inicia carga
            _ = CarregarDadosIniciais();
        }

        // --------------------
        // Propriedades / Bindings
        // --------------------
        private ObservableCollection<string> _unidades;
        public ObservableCollection<string> Unidades
        {
            get => _unidades;
            set { _unidades = value; OnPropertyChanged(); }
        }

        private ObservableCollection<int> _anos;
        public ObservableCollection<int> Anos
        {
            get => _anos;
            set { _anos = value; OnPropertyChanged(); }
        }

        private string _unidadeSelecionada = "TODAS";
        public string UnidadeSelecionada
        {
            get => _unidadeSelecionada;
            set
            {
                if (_unidadeSelecionada != value)
                {
                    _unidadeSelecionada = value;
                    OnPropertyChanged();
                    _ = AtualizarDados();
                }
            }
        }

        private int? _anoSelecionado = DateTime.Now.Year;
        public int? AnoSelecionado
        {
            get => _anoSelecionado;
            set
            {
                if (_anoSelecionado != value)
                {
                    _anoSelecionado = value;
                    OnPropertyChanged();
                    if (value.HasValue)
                        _ = AtualizarDados();
                }
            }
        }

        private int _totalColaboradores;
        public int TotalColaboradores
        {
            get => _totalColaboradores;
            set { _totalColaboradores = value; OnPropertyChanged(); }
        }

        private ObservableCollection<GeneroDistribuicaoModel> _distribuicaoGenero;
        public ObservableCollection<GeneroDistribuicaoModel> DistribuicaoGenero
        {
            get => _distribuicaoGenero;
            set { _distribuicaoGenero = value; OnPropertyChanged(); }
        }

        private string _generoHomensDisplay;
        public string GeneroHomensDisplay
        {
            get => _generoHomensDisplay;
            set { _generoHomensDisplay = value; OnPropertyChanged(); }
        }

        private string _generoMulheresDisplay;
        public string GeneroMulheresDisplay
        {
            get => _generoMulheresDisplay;
            set { _generoMulheresDisplay = value; OnPropertyChanged(); }
        }

        private StatusColaboradoresModel _status;
        public StatusColaboradoresModel Status
        {
            get => _status;
            set { _status = value; OnPropertyChanged(); }
        }

        private ObservableCollection<SetorModel> _setores;
        public ObservableCollection<SetorModel> Setores
        {
            get => _setores;
            set { _setores = value; OnPropertyChanged(); }
        }

        private ObservableCollection<ColaboradorResumoModel> _colaboradores;
        public ObservableCollection<ColaboradorResumoModel> Colaboradores
        {
            get => _colaboradores;
            set { _colaboradores = value; OnPropertyChanged(); }
        }

        // --------------------
        // Popup / listagens completas
        // --------------------
        private bool _mostrarTodosSetores;
        public bool MostrarTodosSetores
        {
            get => _mostrarTodosSetores;
            set { _mostrarTodosSetores = value; OnPropertyChanged(); }
        }

        private ObservableCollection<SetorModel> _todosSetores;
        public ObservableCollection<SetorModel> TodosSetores
        {
            get => _todosSetores;
            set { _todosSetores = value; OnPropertyChanged(); }
        }

        // popup colaboradores (caso use)
        private bool _mostrarTodosColaboradores;
        public bool MostrarTodosColaboradores
        {
            get => _mostrarTodosColaboradores;
            set { _mostrarTodosColaboradores = value; OnPropertyChanged(); }
        }

        private ObservableCollection<ColaboradorResumoModel> _todosColaboradores;
        public ObservableCollection<ColaboradorResumoModel> TodosColaboradores
        {
            get => _todosColaboradores;
            set { _todosColaboradores = value; OnPropertyChanged(); }
        }

        // --------------------
        // Mostrar valor das barras
        // --------------------
        private bool _mostrarValor1;
        public bool MostrarValor1 { get => _mostrarValor1; set { _mostrarValor1 = value; OnPropertyChanged(); } }

        private bool _mostrarValor2;
        public bool MostrarValor2 { get => _mostrarValor2; set { _mostrarValor2 = value; OnPropertyChanged(); } }

        private bool _mostrarValor3;
        public bool MostrarValor3 { get => _mostrarValor3; set { _mostrarValor3 = value; OnPropertyChanged(); } }

        private bool _mostrarValor4;
        public bool MostrarValor4 { get => _mostrarValor4; set { _mostrarValor4 = value; OnPropertyChanged(); } }

        private bool _mostrarValor5;
        public bool MostrarValor5 { get => _mostrarValor5; set { _mostrarValor5 = value; OnPropertyChanged(); } }

        // --------------------
        // Comandos públicos
        // --------------------
        public ICommand AbrirPopupCommand { get; }
        public ICommand FecharPopupCommand { get; }

        public ICommand AbrirListaCompletaCommand { get; }
        public ICommand FecharPopupColaboradoresCommand { get; }

        public ICommand MostrarValorCommand { get; }

        // --------------------
        // Implementações de métodos
        // --------------------
        private void MostrarValor(string index)
        {
            MostrarValor1 = MostrarValor2 = MostrarValor3 = MostrarValor4 = MostrarValor5 = false;
            switch (index)
            {
                case "1": MostrarValor1 = true; break;
                case "2": MostrarValor2 = true; break;
                case "3": MostrarValor3 = true; break;
                case "4": MostrarValor4 = true; break;
                case "5": MostrarValor5 = true; break;
            }
        }

        private async Task CarregarDadosIniciais()
        {
            try
            {
                var unidades = await _service.GetUnidadesAsync();
                var anos = await _service.GetAnosAsync();

                Unidades = new ObservableCollection<string>(unidades);
                Anos = new ObservableCollection<int>(anos);

                UnidadeSelecionada = "TODAS";
                AnoSelecionado = anos.Count > 0 ? anos[0] : DateTime.Now.Year;

                await AtualizarDados();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Erro CarregarDadosIniciais: {ex.Message}");
            }
        }

        private async Task AtualizarDados()
        {
            try
            {
                var unidade = UnidadeSelecionada ?? "TODAS";
                var ano = AnoSelecionado ?? DateTime.Now.Year;

                // total
                TotalColaboradores = await _service.GetTotalColaboradoresAsync(unidade, ano);

                // genero
                var dist = await _service.GetDistribuicaoGeneroAsync(unidade, ano);
                var listaGenero = new ObservableCollection<GeneroDistribuicaoModel>();
                foreach (var item in dist)
                    listaGenero.Add(new GeneroDistribuicaoModel { Sexo = item.Sexo, Quantidade = item.Quantidade, Percentual = item.Percentual });
                DistribuicaoGenero = listaGenero;

                GeneroHomensDisplay = listaGenero.Count > 0 ? $"{listaGenero[0].Quantidade} ({listaGenero[0].Percentual:F1}%)" : "0 (0%)";
                GeneroMulheresDisplay = listaGenero.Count > 1 ? $"{listaGenero[1].Quantidade} ({listaGenero[1].Percentual:F1}%)" : "0 (0%)";

                // status
                var s = await _service.GetStatusColaboradoresAsync(unidade, ano);
                Status = new StatusColaboradoresModel { Ativos = s.Ativos, EmLicenca = s.EmLicenca, Estagiarios = s.Estagiarios, Pcd = s.Pcd };

                // setores top5
                var setores = await _service.GetColaboradoresPorSetorAsync(unidade, ano, true);
                var listaSetores = new ObservableCollection<SetorModel>();
                foreach (var item in setores)
                {
                    double altura = Math.Clamp(item.Quantidade / 2.0, 3, 200);
                    listaSetores.Add(new SetorModel { Setor = item.Setor, Quantidade = item.Quantidade, Altura = altura });
                }
                Setores = listaSetores;

                // lista top5
                var lista = await _service.GetListaColaboradoresAsync(unidade, ano, true);
                var listaColabs = new ObservableCollection<ColaboradorResumoModel>();
                foreach (var item in lista)
                    listaColabs.Add(new ColaboradorResumoModel { Nome = item.Nome, Setor = item.Setor, Cargo = item.Cargo, Status = item.Status });
                Colaboradores = listaColabs;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Erro AtualizarDados: {ex.Message}");
            }
        }

        private async Task AbrirPopup()
        {
            try
            {
                var unidade = UnidadeSelecionada ?? "TODAS";
                var ano = AnoSelecionado ?? DateTime.Now.Year;
                var setores = await _service.GetColaboradoresPorSetorAsync(unidade, ano, false);

                TodosSetores = new ObservableCollection<SetorModel>();
                foreach (var s in setores)
                    TodosSetores.Add(new SetorModel { Setor = s.Setor, Quantidade = s.Quantidade });

                MostrarTodosSetores = true;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Erro ao abrir popup de setores: {ex.Message}");
            }
        }
        private async Task AbrirListaCompleta()
        {
            try
            {
                var unidade = Uri.EscapeDataString(UnidadeSelecionada ?? "TODAS");
                var ano = AnoSelecionado ?? DateTime.Now.Year;

                await Shell.Current.GoToAsync($"ListaColaboradoresPage?unidade={unidade}&ano={ano}");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Erro ao abrir ListaColaboradoresPage: {ex.Message}");
            }
        }

    }
}
