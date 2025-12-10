#include <stdio.h>
#include <string.h>

#define MAX_LIVROS 10

//Definindo a estrutura do livro
struct Livro {
    int codigo;
    char titulo[100];
};

//Algumas várias globais
struct Livro pilha[MAX_LIVROS];
int topo = 0;

//Função para inserir um novo livro na pilha
void inserir() {
    int continuar;
    do {
        //Verificando se a pilha está cheia
        if (topo >= MAX_LIVROS) {
            printf("\nPilha esta cheia! Nao e possivel inserir mais livros.\n");
            break;
        }

        //Inserindo os dados do novo livro
        struct Livro novoLivro;
        printf("\nInserir livro na pilha\n");
        printf("Codigo do livro: ");
        scanf("%d", &novoLivro.codigo);
        getchar();
        printf("Titulo do livro: ");
        fgets(novoLivro.titulo, sizeof(novoLivro.titulo), stdin);
        novoLivro.titulo[strcspn(novoLivro.titulo, "\n")] = '\0'; //Remover a nova linha

        //Coloca o livro no topo da pilha
        pilha[topo] = novoLivro;
        topo++;

        printf("\nLivro inserido com sucesso!\n");

        //Verifica se o usuário quer continuar inserindo 
        printf("\nContinuar inserindo? (1-SIM / 2-NAO) ");
        scanf("%d", &continuar);
        
    } while (continuar == 1);    
}

//Função para remover o último livro da pilha
void remover() {
    if (topo == 0) {
        printf("\nPilha vazia! Nao ha livros para remover.\n");
    } else {
        topo--;
        printf("\nLivro removido: Codigo: %d, Titulo: %s\n", pilha[topo].codigo, pilha[topo].titulo);
    }    
}

//Função para exibir os livros da pilha
void exibirLivros() {
    if (topo == 0) {
        printf("\nA pilha esta vazia.\n");
    } else {
        printf("\nLivros na pilha:\n");
        for (int i = topo - 1; i >= 0; i--) {
            printf("Codigo: %d, Titulo: %s\n", pilha[i].codigo, pilha[i].titulo);
        }        
    }    
}

//Programa Principal
int main() {
    int opcao;

    do {
        printf("\nMenu de opcoes:\n");
        printf("1 - Inserir livro\n");
        printf("2 - Remover livro\n");
        printf("3 - Exibir livros\n");
        printf("4 - Sair\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);

        switch (opcao) {
        case 1:
            inserir();
            break;
        case 2:
            remover();    
            break;
        case 3:
            exibirLivros();
            break;
        case 4:
            printf("\nSaindo...\n");
            break;        
        default:
            printf("Opcao invalida! Tente novamente.\n");
        }

    } while (opcao != 4);

    return 0;    
}
