using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows.Input;
using TesteTelaColaboradores.Models;
using TesteTelaColaboradores.Services;
using Microsoft.Maui.Controls;

namespace TesteTelaColaboradores.ViewModels
{
    [QueryProperty(nameof(Unidade), "unidade")]
    [QueryProperty(nameof(Ano), "ano")]
    public class ListaColaboradoresViewModel : INotifyPropertyChanged
    {
        private readonly ColaboradoresService _service;
        private const int PageSize = 25;
        private int _offset = 0;
        private bool _temMais = true;
        private bool _isLoading = false;

        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string name = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));

        public ListaColaboradoresViewModel()
        {
            _service = new ColaboradoresService();
            CarregarMaisCommand = new Command(async () => await CarregarMais());
            BuscarCommand = new Command(async () => await Recarregar());
            // NÃO iniciar aqui — iniciaremos em OnAppearing da página via InitializeAsync
        }

        // chamado pela página quando aparecer
        public async Task InitializeAsync()
        {
            // garante que offset/coleções estejam limpos
            _offset = 0;
            Colaboradores.Clear();
            TemMais = true;
            await CarregarMais();
        }

        private string _filtro;
        public string Filtro
        {
            get => _filtro;
            set
            {
                if (_filtro != value)
                {
                    _filtro = value;
                    OnPropertyChanged();
                    // recarrega com novo filtro (aguarda)
                    _ = Recarregar();
                }
            }
        }

        private ObservableCollection<ColaboradorResumoModel> _colaboradores = new();
        public ObservableCollection<ColaboradorResumoModel> Colaboradores
        {
            get => _colaboradores;
            set { _colaboradores = value; OnPropertyChanged(); }
        }

        public bool TemMais
        {
            get => _temMais;
            set { _temMais = value; OnPropertyChanged(); }
        }

        public ICommand CarregarMaisCommand { get; }
        public ICommand BuscarCommand { get; }

        private async Task Recarregar()
        {
            if (_isLoading) return;

            _offset = 0;
            Colaboradores.Clear();
            TemMais = true;

            // ⚠️ não carregar automaticamente tudo aqui.
            // apenas se houver filtro (digitação no SearchBar)
            if (!string.IsNullOrWhiteSpace(Filtro))
                await CarregarMais();
        }


        private async Task CarregarMais()
        {
            if (!TemMais) return;
            if (_isLoading) return;

            try
            {
                _isLoading = true;

                var unidade = Unidade ?? "TODAS";
                var ano = Ano;

                // chama serviço paginado (retorna List<(string Nome, ...)>)
                var novos = await _service.GetListaColaboradoresPaginadoAsync(unidade, ano, _offset, PageSize, Filtro ?? "");

                if (novos == null || novos.Count == 0)
                {
                    TemMais = false;
                    return;
                }

                int adicionados = 0;
                foreach (var item in novos)
                {
                    // evita duplicar itens idênticos (proteção extra)
                    if (Colaboradores.Any(c => c.Nome == item.Nome && c.Setor == item.Setor && c.Cargo == item.Cargo))
                        continue;

                    Colaboradores.Add(new ColaboradorResumoModel
                    {
                        Nome = item.Nome,
                        Setor = item.Setor,
                        Cargo = item.Cargo,
                        Status = item.Status
                    });
                    adicionados++;
                }

                _offset += adicionados;

                // se retornou menos que a page size, acabou
                if (adicionados < PageSize)
                    TemMais = false;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Erro CarregarMais: {ex.Message}");
                TemMais = false;
            }
            finally
            {
                _isLoading = false;
            }
        }

        private string _unidade = "TODAS";
        public string Unidade
        {
            get => _unidade;
            set { _unidade = value; OnPropertyChanged(); }
        }

        private int _ano = DateTime.Now.Year;
        public int Ano
        {
            get => _ano;
            set { _ano = value; OnPropertyChanged(); }
        }
    }
}
