#include <stdio.h>
#include <string.h>

#define MAX 30

typedef struct {
    int matricula;
    char nome[20];
    int polo;
} Aluno;

Aluno fila[MAX];
int inicio = 0; //índice do primeiro elemento da fila
int fim = 0;    //índice do próximo elemento da fila

//Função para inserir um aluno na fila
void inserir() {
    if (fim < MAX) {
        printf("\nChegando novo aluno na fila\n");
        printf("Numero da Matricula: ");
        scanf("%d", &fila[fim].matricula);

        printf("Nome: ");
        getchar();
        fgets(fila[fim].nome, 50, stdin);
        fila[fim].nome[strcspn(fila[fim].nome, "\n")] = '\0';

        printf("Polo do aluno (1- UnisPresencial, 2- UnisEAD): ");
        scanf("%d", &fila[fim].polo);

        fim++;
        printf("\nAluno inserido com sucesso!\n");
    } else {
        printf("\nFila cheia, aluno ão inserido!\n");
    }    
}

//Função para consultar o primeiro aluno da fila
void consultar_primeiro() {
    if (inicio < fim) {
        printf("\nPrimeiro aluno da fila:\n");
        printf("Matricula: %d\n", fila[inicio].matricula);
        printf("Nome: %s\n", fila[inicio].nome);
        printf("Polo: %d\n", fila[inicio].polo);
    } else {
        printf("\nFila vazia!\n");
    }    
}

//Programa Principal
int main () {
    int opcao;

    do {
        printf("\nEscolha uma opcao: \n1. Inserir aluno\n2. Consultar primeiro aluno\n3. Sair\n");
        scanf("%d", &opcao);

        switch (opcao) {
        case 1:
            inserir();
            break;
        case 2:
            consultar_primeiro();
            break;
        case 3:
            printf("\nSaindo...\n");
            break;
        default:
            printf("\nOpcao invalida!\n");
        }
    } while (opcao != 3);

    return 0;    
}
