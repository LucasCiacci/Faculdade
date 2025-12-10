using Microsoft.Maui.Controls;
using TesteTelaColaboradores.ViewModels;

namespace TesteTelaColaboradores.Views.ListaColaboradores
{
    public partial class ListaColaboradoresPage : ContentPage
    {
        private bool _initialized = false;

        public ListaColaboradoresPage()
        {
            InitializeComponent();
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            if (!_initialized && BindingContext is ListaColaboradoresViewModel vm)
            {
                _initialized = true;
                await vm.InitializeAsync();
            }
        }
    }
}
