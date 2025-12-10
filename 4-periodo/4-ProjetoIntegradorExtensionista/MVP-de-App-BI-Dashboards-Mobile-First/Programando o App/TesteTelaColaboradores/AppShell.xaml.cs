using TesteTelaColaboradores.Views;
using TesteTelaColaboradores.Views.ListaColaboradores;

namespace TesteTelaColaboradores
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute(nameof(ColaboradoresPage), typeof(ColaboradoresPage));
            Routing.RegisterRoute(nameof(ListaColaboradoresPage), typeof(ListaColaboradoresPage));
        }
    }
}
