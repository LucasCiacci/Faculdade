using Microsoft.Maui.Controls;
using TesteTelaColaboradores.ViewModels;

namespace TesteTelaColaboradores.Views
{
    public partial class ColaboradoresPage : ContentPage
    {
        private readonly ColaboradoresViewModel _viewModel;
        public ColaboradoresPage()
        {
            InitializeComponent();
            _viewModel = new ColaboradoresViewModel();
            BindingContext = _viewModel;
        }

        private async void OnBackClicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }
    }
}
