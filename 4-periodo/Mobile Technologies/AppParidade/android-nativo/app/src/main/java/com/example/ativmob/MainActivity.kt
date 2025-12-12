package com.example.ativmob

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.List
import androidx.compose.material.icons.filled.LocationOn
import androidx.compose.material.icons.filled.NightsStay
import androidx.compose.material.icons.filled.Place
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.WbSunny
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.isEmpty
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.core.content.ContextCompat
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.ativmob.ui.theme.AtivMobTheme
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json

@Serializable
data class Item(
    val id: Int,
    val name: String,
    val description: String
)

val embeddedJsonData = """
[
    {"id": 1, "name": "Apple iPhone 15", "description": "Latest model smartphone"},
    {"id": 2, "name": "Samsung Galaxy S24", "description": "High-end Android phone"},
    {"id": 3, "name": "Google Pixel 8", "description": "Stock Android experience"},
    {"id": 4, "name": "MacBook Air M3", "description": "Lightweight Apple laptop"},
    {"id": 5, "name": "Dell XPS 15", "description": "Powerful Windows laptop"},
    {"id": 6, "name": "Sony WH-1000XM5", "description": "Noise-cancelling headphones"},
    {"id": 7, "name": "Bose QuietComfort Ultra", "description": "Premium comfort headphones"},
    {"id": 8, "name": "Apple Watch Series 9", "description": "Feature-rich smartwatch"},
    {"id": 9, "name": "Samsung Galaxy Watch 6", "description": "Android smartwatch competitor"},
    {"id": 10, "name": "Kindle Paperwhite", "description": "E-reader for books"},
    {"id": 11, "name": "iPad Air 5", "description": "Versatile Apple tablet"},
    {"id": 12, "name": "Samsung Galaxy Tab S9", "description": "Android tablet for productivity"},
    {"id": 13, "name": "GoPro HERO12 Black", "description": "Action camera for adventures"},
    {"id": 14, "name": "DJI Mini 4 Pro", "description": "Compact and powerful drone"},
    {"id": 15, "name": "Nintendo Switch OLED", "description": "Hybrid gaming console"},
    {"id": 16, "name": "PlayStation 5", "description": "Next-gen Sony gaming console"},
    {"id": 17, "name": "Xbox Series X", "description": "Powerful Microsoft console"},
    {"id": 18, "name": "Anker PowerCore III", "description": "Portable phone charger"},
    {"id": 19, "name": "Logitech MX Master 3S", "description": "Ergonomic wireless mouse"},
    {"id": 20, "name": "Keychron K2 Pro", "description": "Mechanical keyboard for typing"}
]
"""

enum class Screen {
    Main,
    ListaEmbutida,
    Estados,
    Location
}

@OptIn(ExperimentalMaterial3Api::class)
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        val allItems: List<Item> = Json.decodeFromString(embeddedJsonData)

        setContent {
            val mainViewModel: MainViewModel = viewModel()
            val isDarkTheme by mainViewModel.isDarkTheme.collectAsState(initial = false)
            var currentScreen by remember { mutableStateOf<Screen>(Screen.Main) }

            AtivMobTheme(darkTheme = isDarkTheme) {
                Scaffold(
                    topBar = {
                        CenterAlignedTopAppBar(
                            title = {
                                Text(
                                    "AtivMob",
                                    style = MaterialTheme.typography.headlineSmall,
                                    fontWeight = FontWeight.Bold
                                )
                            },
                            actions = {
                                // Botão de alternar tema
                                IconButton(onClick = { mainViewModel.toggleTheme() }) {
                                    Icon(
                                        imageVector = if (isDarkTheme) Icons.Filled.WbSunny else Icons.Filled.NightsStay,
                                        contentDescription = if (isDarkTheme) "Modo Claro" else "Modo Escuro"
                                    )
                                }

                                // Botão Home (só aparece quando não estiver na tela principal)
                                if (currentScreen != Screen.Main) {
                                    IconButton(onClick = { currentScreen = Screen.Main }) {
                                        Icon(
                                            imageVector = Icons.Default.Home,
                                            contentDescription = "Página Inicial"
                                        )
                                    }
                                }
                            },
                            colors = TopAppBarDefaults.centerAlignedTopAppBarColors(
                                containerColor = MaterialTheme.colorScheme.primaryContainer,
                                titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                            )
                        )
                    },
                    modifier = Modifier.fillMaxSize()
                ) { innerPadding ->
                    when (currentScreen) {
                        Screen.Main -> MainScreen(
                            modifier = Modifier.padding(innerPadding),
                            onNavigateToListaEmbutida = { currentScreen = Screen.ListaEmbutida },
                            onNavigateToEstados = { currentScreen = Screen.Estados },
                            onNavigateToLocation = { currentScreen = Screen.Location },
                            viewModel = mainViewModel
                        )
                        Screen.ListaEmbutida -> ListaEmbutidaScreen(
                            modifier = Modifier.padding(innerPadding),
                            allItems = allItems,
                            onNavigateBackToMain = { currentScreen = Screen.Main }
                        )
                        Screen.Estados -> EstadosScreen(
                            modifier = Modifier.padding(innerPadding),
                            viewModel = mainViewModel,
                            onNavigateBackToMain = { currentScreen = Screen.Main }
                        )
                        Screen.Location -> LocationScreen(
                            modifier = Modifier.padding(innerPadding),
                            viewModel = mainViewModel,
                            onNavigateBackToMain = { currentScreen = Screen.Main }
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun MainScreen(
    modifier: Modifier = Modifier,
    onNavigateToListaEmbutida: () -> Unit,
    onNavigateToEstados: () -> Unit,
    onNavigateToLocation: () -> Unit,
    viewModel: MainViewModel
) {
    val uiState by viewModel.uiState.collectAsState()
    var nameInput by remember { mutableStateOf("") }

    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Spacer(modifier = Modifier.height(16.dp))

        // Cartão de boas-vindas
        Card(
            modifier = Modifier.fillMaxWidth(),
            elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
        ) {
            Column(
                modifier = Modifier.padding(16.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = "Olá, ${uiState.greeting}!",
                    style = MaterialTheme.typography.headlineMedium,
                    fontWeight = FontWeight.Bold,
                    textAlign = TextAlign.Center
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = uiState.displayTitle,
                    style = MaterialTheme.typography.bodyLarge,
                    textAlign = TextAlign.Center,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        // Campo para alterar o nome
        OutlinedTextField(
            value = nameInput,
            onValueChange = { nameInput = it },
            label = { Text("Digite seu nome") },
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            onClick = {
                if (nameInput.isNotBlank()) {
                    viewModel.updateGreeting(nameInput)
                    nameInput = ""
                }
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Atualizar Saudação")
        }

        Spacer(modifier = Modifier.height(8.dp))

        // Grid de funcionalidades
        Card(
            modifier = Modifier.fillMaxWidth(),
            elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
        ) {
            Column(
                modifier = Modifier.padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Text(
                    text = "Funcionalidades Disponíveis",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )

                // Botão para localização
                Button(
                    onClick = onNavigateToLocation,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(
                        imageVector = Icons.Default.LocationOn,
                        contentDescription = null,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Ver Localização GPS")
                }

                // Botão para Estados IBGE
                Button(
                    onClick = {
                        // Se não há dados carregados ainda, carrega automaticamente
                        if (uiState.estados.isEmpty() && !uiState.isLoading) {
                            viewModel.fetchStatesData()
                        }
                        onNavigateToEstados()
                    },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(
                        imageVector = Icons.Default.Place,
                        contentDescription = null,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Estados Brasileiros (IBGE)")
                }

                // Botão para Lista Embutida
                Button(
                    onClick = onNavigateToListaEmbutida,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(
                        imageVector = Icons.Default.List,
                        contentDescription = null,
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Lista de Produtos")
                }
            }
        }

        // Status dos dados IBGE (se houver)
        if (uiState.isLoading || uiState.estados.isNotEmpty() || uiState.error != null) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    when {
                        uiState.isLoading -> {
                            CircularProgressIndicator(modifier = Modifier.size(24.dp))
                            Spacer(modifier = Modifier.height(8.dp))
                            Text("Carregando dados do IBGE...")
                        }
                        uiState.error != null -> {
                            Text("⚠️ Erro ao carregar dados", color = Color.Red)
                        }
                        uiState.estados.isNotEmpty() -> {
                            Text("✅ ${uiState.estados.size} estados carregados")
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun LocationScreen(
    modifier: Modifier = Modifier,
    viewModel: MainViewModel,
    onNavigateBackToMain: () -> Unit
) {
    val context = LocalContext.current
    val uiState by viewModel.uiState.collectAsState()

    // Estado para controlar permissões
    var hasLocationPermission by remember {
        mutableStateOf(
            ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED ||
                    ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED
        )
    }

    // Launcher para solicitar permissões
    val permissionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestMultiplePermissions()
    ) { permissions ->
        hasLocationPermission = permissions[Manifest.permission.ACCESS_FINE_LOCATION] == true ||
                permissions[Manifest.permission.ACCESS_COARSE_LOCATION] == true

        if (hasLocationPermission) {
            viewModel.getCurrentLocation()
        }
    }

    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Header com botão de voltar
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onNavigateBackToMain) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Voltar"
                )
            }
            Text(
                text = "Localização Atual",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(start = 8.dp)
            )
        }

        Card(
            modifier = Modifier.fillMaxWidth(),
            elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
        ) {
            Column(
                modifier = Modifier.padding(16.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                when {
                    uiState.isLoadingLocation -> {
                        CircularProgressIndicator()
                        Spacer(modifier = Modifier.height(8.dp))
                        Text("Obtendo localização...")
                    }

                    uiState.currentLocation != null -> {
                        Text(
                            text = "📍 Localização encontrada",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Text("Latitude: ${String.format("%.6f", uiState.currentLocation!!.latitude)}")
                        Text("Longitude: ${String.format("%.6f", uiState.currentLocation!!.longitude)}")
                        uiState.currentLocation!!.accuracy?.let { accuracy ->
                            Text("Precisão: ${String.format("%.0f", accuracy)}m")
                        }
                    }

                    else -> {
                        Text(
                            text = "📍 Localização não disponível",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Text(
                            text = "Toque no botão abaixo para obter sua localização atual",
                            textAlign = TextAlign.Center,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }

        // Botão para obter localização
        Button(
            onClick = {
                if (hasLocationPermission) {
                    viewModel.getCurrentLocation()
                } else {
                    permissionLauncher.launch(
                        arrayOf(
                            Manifest.permission.ACCESS_FINE_LOCATION,
                            Manifest.permission.ACCESS_COARSE_LOCATION
                        )
                    )
                }
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = !uiState.isLoadingLocation
        ) {
            Icon(
                imageVector = Icons.Default.LocationOn,
                contentDescription = null,
                modifier = Modifier.size(18.dp)
            )
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                if (hasLocationPermission) "Obter Localização"
                else "Solicitar Permissão"
            )
        }

        // Dialog de erro
        uiState.locationError?.let { error ->
            AlertDialog(
                onDismissRequest = { viewModel.clearLocationError() },
                title = { Text("Erro de Localização") },
                text = { Text(error) },
                confirmButton = {
                    TextButton(onClick = { viewModel.clearLocationError() }) {
                        Text("OK")
                    }
                }
            )
        }

        // Explicação sobre permissões
        if (!hasLocationPermission) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.secondaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "ℹ️ Sobre a Permissão de Localização",
                        fontWeight = FontWeight.Bold,
                        style = MaterialTheme.typography.titleSmall
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Este aplicativo precisa de acesso à sua localização para mostrar suas coordenadas GPS atuais. Suas informações de localização não são armazenadas nem compartilhadas.",
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
        }
    }
}

@Composable
fun EstadosScreen(
    modifier: Modifier = Modifier,
    viewModel: MainViewModel,
    onNavigateBackToMain: () -> Unit
) {
    val uiState by viewModel.uiState.collectAsState()

    // Fazer a busca automaticamente quando a tela é aberta (se não há dados)
    LaunchedEffect(Unit) {
        if (uiState.estados.isEmpty() && !uiState.isLoading && uiState.error == null) {
            viewModel.fetchStatesData()
        }
    }

    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Header com botão de voltar
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onNavigateBackToMain) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Voltar"
                )
            }
            Text(
                text = "Estados Brasileiros",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(start = 8.dp)
            )
        }

        Spacer(modifier = Modifier.height(16.dp))

        when {
            uiState.isLoading -> {
                // Estado de loading
                Column(
                    modifier = Modifier.fillMaxSize(),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center
                ) {
                    CircularProgressIndicator(modifier = Modifier.size(48.dp))
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        text = "Buscando estados...",
                        style = MaterialTheme.typography.bodyLarge,
                        textAlign = TextAlign.Center
                    )
                    Text(
                        text = "Consultando API do IBGE",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f),
                        textAlign = TextAlign.Center
                    )
                }
            }

            uiState.error != null -> {
                // Estado de erro
                Column(
                    modifier = Modifier.fillMaxSize(),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center
                ) {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.errorContainer
                        )
                    ) {
                        Column(
                            modifier = Modifier.padding(24.dp),
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            Text(text = "⚠️", fontSize = 48.sp)
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                text = "Erro ao carregar dados",
                                style = MaterialTheme.typography.titleMedium,
                                textAlign = TextAlign.Center
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                text = uiState.error!!,
                                style = MaterialTheme.typography.bodyMedium,
                                textAlign = TextAlign.Center,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                            Button(
                                onClick = { viewModel.fetchStatesData() }
                            ) {
                                Text("Tentar Novamente")
                            }
                        }
                    }
                }
            }

            uiState.estados.isNotEmpty() -> {
                // Estados carregados com sucesso
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(bottom = 16.dp),
                    colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.primaryContainer)
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            text = "Total: ${uiState.estados.size} estados",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Dados obtidos da API do IBGE",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        )
                    }
                }

                // Lista de estados
                LazyColumn(
                    modifier = Modifier.weight(1f),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(uiState.estados.sortedBy { it.nome }) { estado ->
                        EstadoCard(estado = estado)
                    }
                }
            }
        }
    }
}

@Composable
fun EstadoCard(estado: Estado) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Sigla do estado em destaque
            Box(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .background(MaterialTheme.colorScheme.primary),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = estado.sigla,
                    color = Color.White,
                    fontWeight = FontWeight.Bold,
                    fontSize = 16.sp
                )
            }

            Spacer(modifier = Modifier.width(16.dp))

            // Informações do estado
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = estado.nome,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = "Região: ${estado.regiao.nome}",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
                )
                Text(
                    text = "ID: ${estado.id}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.5f)
                )
            }
        }
    }
}

@Composable
fun ListaEmbutidaScreen(
    modifier: Modifier = Modifier,
    allItems: List<Item>, // Keep this parameter
    onNavigateBackToMain: () -> Unit
) {
    var filterText by remember { mutableStateOf("") }
    // displayedItems is now derived directly from allItems and filterText
    // using our testable function.
    val displayedItems by remember(allItems, filterText) {
        derivedStateOf { // Use derivedStateOf for performance if calculations are complex
            filterItemsLogic(allItems, filterText)
        }
    }
    // Or simpler if the filtering is not too expensive for recomposition:
    // val displayedItems = filterItemsLogic(allItems, filterText)


    // No more filterItems() function directly inside here for the core logic.
    // The filtering happens reactively when filterText or allItems changes.

    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Header with botão de voltar
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onNavigateBackToMain) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Voltar"
                )
            }
            Text(
                text = "Lista de Produtos",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(start = 8.dp)
            )
        }

        Spacer(modifier = Modifier.height(16.dp))

        OutlinedTextField(
            value = filterText,
            onValueChange = { filterText = it }, // Simply update the filterText state
            label = { Text("Filtrar por nome ou descrição") },
            leadingIcon = {
                Icon(Icons.Default.Search, contentDescription = "Buscar")
            },
            modifier = Modifier.fillMaxWidth(),
            singleLine = true
        )

        Spacer(modifier = Modifier.height(16.dp))        // Contador de itens
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp),
            colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.secondaryContainer)
        ) {
            Text(
                text = "Mostrando ${displayedItems.size} de ${allItems.size} produtos",
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Medium,
                modifier = Modifier.padding(16.dp)
            )
        }

        if (displayedItems.isEmpty() && filterText.isNotBlank()) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
            ) {
                Column(
                    modifier = Modifier.padding(24.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(text = "🔍", fontSize = 48.sp)
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Nenhum produto encontrado",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "Tente uma busca diferente para \"$filterText\"",
                        style = MaterialTheme.typography.bodyMedium,
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        } else {
            LazyColumn(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(displayedItems) { item -> // Use the derived displayedItems
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Box(
                                    modifier = Modifier
                                        .size(36.dp)
                                        .clip(RoundedCornerShape(6.dp))
                                        .background(MaterialTheme.colorScheme.primary),
                                    contentAlignment = Alignment.Center
                                ) {
                                    Text(
                                        text = item.id.toString(),
                                        color = Color.White,
                                        fontWeight = FontWeight.Bold,
                                        fontSize = 16.sp
                                    )
                                }
                                Spacer(modifier = Modifier.width(16.dp))
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = item.name,
                                        style = MaterialTheme.typography.titleMedium,
                                        fontWeight = FontWeight.SemiBold
                                    )
                                    Text(
                                        text = item.description,
                                        style = MaterialTheme.typography.bodyMedium,
                                        color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

/**
 * Filters a list of items based on a query string.
 * The query is matched against the item's name and description, ignoring case.
 *
 * @param allItems The complete list of items to filter.
 * @param query The search query. If blank, returns all items.
 * @return A new list containing only the items that match the query.
 */
fun filterItemsLogic(allItems: List<Item>, query: String): List<Item> {
    val trimmedQuery = query.trim()
    return if (trimmedQuery.isBlank()) {
        allItems
    } else {
        allItems.filter { item ->
            item.name.contains(trimmedQuery, ignoreCase = true) ||
                    item.description.contains(trimmedQuery, ignoreCase = true)
        }
    }
}