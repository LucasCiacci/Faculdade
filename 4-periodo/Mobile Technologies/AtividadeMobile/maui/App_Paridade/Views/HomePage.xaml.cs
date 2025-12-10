using App_Paridade.Services;

namespace App_Paridade.Views;

public partial class HomePage : ContentPage
{
    public HomePage()
    {
        InitializeComponent();
    }

    private void OnUpdateGreetingClicked(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(NameEntry.Text))
        {
            GreetingLabel.Text = $"Olá, {NameEntry.Text}!";
        }
    }

    private async void OnLocationClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync(nameof(LocationPage));
    }

    private async void OnApiDataClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync(nameof(ApiDataPage));
    }

    private async void OnItemsClicked(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync(nameof(ItemsPage));
    }

    // 🔥 Novo método para corrigir o erro
    private void OnThemeToggleClicked(object sender, EventArgs e)
    {
        var themeService = Application.Current?.Handler?.MauiContext?.Services.GetService<IThemeService>();

        if (themeService == null)
        {
            System.Diagnostics.Debug.WriteLine("ThemeService não encontrado.");
            return;
        }

        var current = themeService.GetCurrentTheme();
        var newTheme = current == AppTheme.Light ? AppTheme.Dark : AppTheme.Light;

        // Aplica o tema
        themeService.SetTheme(newTheme);
    }
}
