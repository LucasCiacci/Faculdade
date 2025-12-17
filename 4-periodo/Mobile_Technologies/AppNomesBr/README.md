# 📱 AppNomesBr

O **AppNomesBr** é um aplicativo desenvolvido em **.NET MAUI** que consome dados públicos do **IBGE** sobre os nomes mais comuns no Brasil.  
Com ele, é possível consultar rankings nacionais de nomes, aplicar filtros e montar um ranking personalizado armazenado localmente.

---

## 🚀 Funcionalidades

- Consultar o **Top 20 nacional de nomes**;
- Filtrar resultados por **sexo (M/F)**, **cidade** e **estado (UF)**;
- Pesquisar um **nome específico** na base do IBGE;
- Montar e salvar um **ranking personalizado de nomes** no dispositivo (SQLite);
- Excluir todo o ranking salvo (limpeza da base local).

---

## 🧩 Arquitetura

O projeto segue o padrão em **camadas**:

| Camada | Responsabilidade |
|--------|------------------|
| **Domain** | Entidades, DTOs e interfaces. |
| **Infrastructure** | Consumo da API do IBGE e persistência em SQLite. |
| **Service** | Lógica de negócios e integração entre API e repositório. |
| **UI (Pages)** | Interface do usuário em **.NET MAUI** (XAML e code-behind). |

---

## 📦 Tecnologias Utilizadas

- [.NET 8](https://dotnet.microsoft.com/)  
- [MAUI](https://learn.microsoft.com/dotnet/maui/what-is-maui)  
- [SQLite](https://www.sqlite.org/index.html)  
- [API de Nomes IBGE](https://servicodados.ibge.gov.br/api/docs/nomes?versao=2)  

---

## ⚙️ Como Executar

### Pré-requisitos
- [.NET 8 SDK](https://dotnet.microsoft.com/en-us/download) instalado  
- IDE com suporte a MAUI (ex.: [Visual Studio 2022](https://visualstudio.microsoft.com/))  
- Emulador ou dispositivo físico Android/iOS configurado

### Passo a passo
1. Clone o repositório ou baixe o zip da pasta:
   ```bash
   git clone https://github.com/LucasCiacci/AppNomesBr.git

2. Abra a solução no Visual Studio 2022:
   ```bash
   AppNomesBr.sln

3. Restaure os pacotes NuGet (caso necessário):
   ```bash
   dotnet restore

4. Configure o projeto de inicialização como AppNomesBr (MAUI).
5. Escolha um destino de execução:

   - Emulador Android
   - Dispositivo físico Android/iOS
   - Windows (caso esteja habilitado para MAUI)

6. Execute o projeto:
   ```bash
   dotnet build
   dotnet run
   ```
    ou pelo botão Run ▶️ no Visual Studio.

---

## 📊 Fluxo de Funcionamento

1. Usuário acessa a tela de **Ranking Nacional** ou **Nova Consulta**  
2. O **NomesBrService** consulta a **API do IBGE** via `NomesApi`  
3. Os dados são tratados e armazenados no **SQLite** pelo `NomesBrRepository`  
4. O ranking é exibido na interface, com filtros aplicáveis

---

## 👩‍💻👨‍💻 Autores

- Lucas Silva Ciacci  
- Fernanda Laudares Silva  
