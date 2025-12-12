# UNIS INSIGHTS – MVP de Aplicativo de Business Intelligence Mobile-First

## 📌 Visão Geral

O **UNIS Insights** é um **MVP de aplicativo mobile-first de Business Intelligence**, desenvolvido no **Centro Universitário do Sul de Minas – UNIS-MG**, durante o **Projeto Integrador Extensionista** do **2º semestre de 2025**. O objetivo do projeto foi criar um aplicativo capaz de apresentar **indicadores acadêmicos e administrativos** de forma visual, responsiva e acessível em dispositivos móveis.

Participaram do desenvolvimento **mais de 40 alunos**, organizados em grupos temáticos responsáveis por partes específicas do sistema. Este README é focado no trabalho realizado pelo **Grupo 1**, responsável pelo desenvolvimento das telas de **Colaboradores**, **Área Administrativa** e pela **padronização visual do aplicativo** (logo, ícone e splash screen).

---

## 🏢 Instituição

**Centro Universitário do Sul de Minas – UNIS-MG**

---

## 🎯 Título do Projeto

**UNIS INSIGHTS – MVP de Aplicativo de Business Intelligence Mobile-First**

---

## 📦 Tipo de Projeto

**Projeto Integrador Extensionista – Interdisciplinar Acadêmico**

---

## 👤 Cargo / Função

**Desenvolvedor Mobile e Analista de Business Intelligence**

---

## 🗓 Período

**Agosto/2025 – Novembro/2025**

---

## 🛠 Tecnologias e Ferramentas Utilizadas

* **Framework:** .NET MAUI
* **Linguagens:** C#, XAML
* **Banco de Dados:** MySQL
* **Ferramentas:** MySQL Workbench, Visual Studio, GitHub, Figma
* **Testes Mobile:** Emulador Android
* **Outros:** Ferramentas de apoio com IA para revisão e suporte no desenvolvimento

---

## 📚 Contexto Geral do Projeto

A instituição buscava uma forma moderna e eficiente de visualizar seus principais **indicadores acadêmicos e de RH** diretamente em dispositivos móveis. Entre esses indicadores estavam:

* Número de alunos (calouros, veteranos, egressos)
* Engajamento
* Rotatividade
* Status de colaboradores
* Diversidade

Para atender essa necessidade, a turma foi organizada em **sete grupos**, cada um responsável por módulos específicos da aplicação. O desenvolvimento envolveu integração com banco de dados MySQL, arquitetura MVVM, criação de protótipos e estruturação de dashboards interativos.

---

## 🧩 Estrutura do Projeto (pastas e arquivos)

```text
4-ProjetoIntegradorExtensionista/MVP-de-App-BI-Dashboards-Mobile-First
│
├── Documentações Finais/                                            # Documentos principais (e finais) do projeto
│   ├── Documentação geral do projeto.pdf
│   ├── Slide Final Heicomp 2025-2.pdf
│
├── Documentações Iniciais/                                          # Documentos oficiais (e iniciais) do projeto
│   ├── Proposta do Professor/
│   │   ├── Formulário de Início de Projeto - HEICOMP 2025.2.pdf
│   │   ├── Proposta de Desenvolvimento do Prof. Palmuti.pdf
│   └── heicomp2025.pdf                                              # Documento base para a realização do projeto
│   └── ...
│
├── Entregáveis/                                                     # Feitos durante a evolução do projeto
│   ├── Termo de Abertura/                                           # Primeiro e único Termo de Abertura
│   └── ...                                                          # Demais arquivos
│
├── Programando o App/
│   ├── Heicomp_2025_2/                                              # Cópia da pasta base do repositório oficial do app
│       └── Models                                                   # Gerencia os dados e a lógica de negócios
│           └── ...
│       └── Resources                                                # Local central para armazenar todos os recursos do aplicativo
│           └── ...
│       └── Services                                                 # Conexão e Integrações com o Banco de Dados
│           └── ...
│       └── ViewModels                                               # Atua como mediador entre a Model e a View. Prepara e expõe os dados para a UI através de data binding e gerencia o estado da tela.
│           └── ...
│       └── Views                                                    # Define a interface do usuário (UI). É o que o usuário vê e interage. Observa o ViewModel.
│           └── ...
│       └── ...                                                      # Demais pastas e arquivos do app
│
└── .../                                                             # Demais pastas do projeto
```

---

## 🔍 Responsabilidades Principais

* Desenvolvimento da **Tela de Colaboradores** (front-end, back-end e integração com banco).
* Criação das consultas SQL utilizadas para listagens, gráficos e indicadores.
* Implementação dos filtros dinâmicos (unidade, período, status, setor etc.).
* Desenvolvimento da **Tela de Área Administrativa**, com listagens de colaboradores e filtros avançados.
* Padronização visual do aplicativo completo (nome do app, ícone, logo e splash screen).
* Integração das telas e recursos desenvolvidos ao repositório oficial do GitHub.
* Participação na organização técnica do projeto em reuniões com líderes dos grupos.

---

## 🧪 Metodologia e Desenvolvimento

O desenvolvimento seguiu uma linha de evolução prática, com ciclos de:

1. Entendimento dos requisitos
2. Definição de tarefas entre líderes dos grupos
3. Criação do design no Figma
4. Construção isolada das telas
5. Integração ao repositório oficial
6. Testes no emulador Android e ajustes
7. Padronização visual final

---

## 🖥️ Arquitetura e Tecnologias

O aplicativo segue o padrão **MVVM** (Model–View–ViewModel) com as seguintes camadas:

### **Interface (XAML)**

* Construção visual das telas
* Layouts responsivos mobile-first

### **Lógica de Negócio (C#)**

* ViewModels para ligação entre interface e dados
* Regras de negócio e tratamento de dados

### **Banco de Dados (MySQL)**

* Consultas SQL desenvolvidas para cada tela
* Integração via MySQL Connector

### **Ferramentas**

* **Visual Studio:** desenvolvimento em .NET MAUI
* **Workbench:** criação e testes das queries
* **GitHub:** versionamento e integração entre equipes
* **Figma:** referência visual e design

---

## 📊 Tela de Colaboradores (Principal Entrega)

### **Objetivo**

Exibir indicadores completos do setor de RH, incluindo estatísticas e gráficos.

### **Principais Funcionalidades**

* Total de colaboradores
* Divisão por gênero
* Status: ativos, em licença, estagiários e PCDs
* Gráfico de barras: colaboradores por setor
* Lista detalhada com:

  * Nome
  * Cargo
  * Setor
  * Status
* Filtros dinâmicos (unidade, período etc.)

### **Integração com Banco de Dados**

* As consultas SQL retornam dados agrupados, totais, filtros e listagens.

---

## 🗂 Tela de Área Administrativa

### **Objetivo Inicial**

Criar uma interface para controle de permissões dos usuários.

### **Limitação Identificada**

O banco fornecido não possuía dados suficientes para implementar permissões completas.

### **O que foi desenvolvido**

* Listagem ampla de colaboradores
* Filtros por unidade e situação
* Botão de adicionar colaborador
* Painel administrativo completo

---

## 🎨 Padronização Visual do Aplicativo

* Criação da **logo oficial**
* Criação da **splash screen**
* Alteração do **nome do aplicativo**
* Atualização do **ícone** e aplicação global da identidade visual

---

## 🧪 Conquistas com Métricas

* Desenvolvimento completo de **duas telas totalmente funcionais** e integradas ao app.
* Participação em um projeto colaborativo com **mais de 40 alunos**, utilizando Git para versionamento.
* MVP mobile totalmente funcional com dashboards, gráficos e filtros.
* Entrega de consultas SQL robustas para indicadores e gráficos.

---

## ▶️ Como executar o projeto

### **1. Baixar o Projeto**

Baixe o `.zip` da pasta do aplicativo no repositório:
👉 **[Clique aqui para ir até a pasta](https://github.com/LucasCiacci/Faculdade/tree/main/4-periodo/4-ProjetoIntegradorExtensionista/MVP-de-App-BI-Dashboards-Mobile-First/Programando%20o%20App/Heicomp_2025_2)**

Extraia os arquivos em seu computador.

Ou se preferir, faça o clone do repositório oficial do app:
👉 **[Clique aqui para ir até o repositório](https://github.com/PalmutiUnis/Heicomp_2025_2)**

---

### **2. Abrir no Visual Studio**

1. Abra o **Visual Studio 2022**
2. Clique em **Open a project or solution**
3. Selecione o arquivo:

   * `MauiApp1.sln`

---

### **3. Restaurar Dependências**

O Visual Studio irá restaurar automaticamente os pacotes NuGet.

Caso não aconteça:

* Vá em **Project → Manage NuGet Packages → Restore**

---

### **4. Executar no Emulador Android**

1. Conecte um dispositivo físico **OU** utilize o emulador Android do Visual Studio
2. Escolha a opção **Android Emulator** no dropdown
3. Clique em **Run** ▶️

Pronto! O aplicativo será inicializado com todas as funcionalidades disponíveis.

---

## 📌 Status do Projeto

**Concluído** ✔

---

## 👨‍💻 Autor

**Lucas Silva Ciacci**

---

## 🔗 Materiais Relacionados

* **Documentação oficial:** 👉 *[clique aqui para acessar a documentação](https://github.com/LucasCiacci/Faculdade/blob/main/4-periodo/4-ProjetoIntegradorExtensionista/MVP-de-App-BI-Dashboards-Mobile-First/Documenta%C3%A7%C3%B5es%20Finais/Documenta%C3%A7%C3%A3o%20geral%20do%20projeto.pdf)*
* **Repositório oficial do app:** 👉 [clique aqui para acessar o repositório](https://github.com/PalmutiUnis/Heicomp_2025_2)
* **Slides da apresentação:** 👉 *[clique aqui para acessar os slides](https://github.com/LucasCiacci/Faculdade/blob/main/4-periodo/4-ProjetoIntegradorExtensionista/MVP-de-App-BI-Dashboards-Mobile-First/Documenta%C3%A7%C3%B5es%20Finais/Slide%20Final%20Heicomp%202025-2.pdf)*

---

## 🚀 Possíveis Melhorias Futuras

* Implementação completa do sistema de permissões.
* Otimização de desempenho na tela de colaboradores.
* Melhoria da interação dos gráficos.
* Padronização avançada da experiência do usuário.

---
