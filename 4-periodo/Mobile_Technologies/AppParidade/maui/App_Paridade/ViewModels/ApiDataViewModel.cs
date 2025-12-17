using System.Collections.ObjectModel;
using System.Windows.Input;
using System.Linq;
using System.Threading.Tasks;
using App_Paridade.Models;
using App_Paridade.Services;
using Microsoft.Maui.Controls;

namespace App_Paridade.ViewModels
{
    public class ApiDataViewModel : BindableObject
    {
        private readonly IApiService _apiService;

        // Coleção observável para ser exibida no XAML
        public ObservableCollection<Localidade> Estados { get; } = new();

        private bool _isBusy;
        public bool IsBusy
        {
            get => _isBusy;
            set
            {
                if (_isBusy != value)
                {
                    _isBusy = value;
                    OnPropertyChanged();
                    (LoadEstadosCommand as Command)?.ChangeCanExecute();
                }
            }
        }

        public ICommand LoadEstadosCommand { get; }

        public ApiDataViewModel(IApiService apiService)
        {
            _apiService = apiService;

            // Command que dispara o carregamento da lista
            LoadEstadosCommand = new Command(
                async () => await LoadEstadosAsync(),
                () => !IsBusy
            );
        }

        // Método para buscar os estados e atualizar a lista
        public async Task LoadEstadosAsync()
        {
            if (IsBusy) return;

            try
            {
                IsBusy = true;
                Estados.Clear();

                // Busca a lista no serviço
                var estados = await _apiService.GetEstadosAsync();

                if (estados != null)
                {
                    // Ordena alfabeticamente pelo Nome
                    foreach (var estado in estados.OrderBy(e => e.Nome))
                    {
                        Estados.Add(estado);
                    }
                }
            }
            finally
            {
                IsBusy = false;
            }
        }
    }
}
