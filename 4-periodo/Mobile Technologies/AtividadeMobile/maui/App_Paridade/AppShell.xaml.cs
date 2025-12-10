using Microsoft.Extensions.DependencyInjection; // para GetService<>
using App_Paridade.Services; 
using App_Paridade.Views; 

namespace App_Paridade; 
public partial class AppShell : Shell 
{ 
    public AppShell() 
    { 
        InitializeComponent();

        // 🔑 Registrar rotas de navegação
        Routing.RegisterRoute(nameof(ItemsPage), typeof(ItemsPage));
        Routing.RegisterRoute(nameof(ApiDataPage), typeof(ApiDataPage));
        Routing.RegisterRoute(nameof(LocationPage), typeof(LocationPage));
        Routing.RegisterRoute(nameof(ItemDetailPage), typeof(ItemDetailPage));

        // Define ícone inicial conforme o tema atual 
        var themeService = Application.Current?.Handler?.MauiContext?.Services.GetService<IThemeService>(); 
        if (themeService != null) 
        { 
            var currentTheme = themeService.GetCurrentTheme(); 
            ThemeToggleButton.IconImageSource = currentTheme == AppTheme.Dark ? "sun.png" : "moon.png"; 
        } 
    } 
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
        
        // Troca o ícone 
        ThemeToggleButton.IconImageSource = newTheme == AppTheme.Dark ? "sun.png" : "moon.png"; 
    } 
}
