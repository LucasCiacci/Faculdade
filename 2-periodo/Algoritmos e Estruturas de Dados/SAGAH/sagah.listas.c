#include <stdio.h>
#include <string.h>

#define MAX_ALUNOS 40

//Definir o struct -> estrutura do Aluno
typedef struct {
    char nome[20];
    float nota;
    char status; //'A'->ativo , 'C'->cancelado
} Aluno;

//Funções para manipular essa lista
void adicionarAluno(Aluno alunos[], int *n, char nome[], float nota, char status);
void excluirAluno(Aluno alunos[], int *n, char nome[]);
void ordenarPorNotaDecrescente(Aluno alunos[], int n);
void listarAlunos(Aluno alunos[], int n);
void listarAlunosAtivos(Aluno alunos[], int n);

//Programa Principal
int main() {
    Aluno alunos[MAX_ALUNOS];
    int n = 0; //n = 0 -> nº atual de alunos na lista

    //Exemplo de uso
    adicionarAluno(alunos, &n, "Lucas", 8.5, 'A');
    adicionarAluno(alunos, &n, "Alberane", 6.5, 'C');
    adicionarAluno(alunos, &n, "Alice", 9.1, 'A');
    adicionarAluno(alunos, &n, "Neymar", 6.4, 'A');
    adicionarAluno(alunos, &n, "CristianoRonaldo", 9.5, 'A');
    adicionarAluno(alunos, &n, "Messi", 9.5, 'C');
    adicionarAluno(alunos, &n, "Angelo", 5.3, 'C');
    adicionarAluno(alunos, &n, "Polyanna", 6.3, 'A');
    adicionarAluno(alunos, &n, "Alessandro", 7.4, 'A');
    adicionarAluno(alunos, &n, "Douglas", 3.2, 'A');

    printf("\nLista completa de alunos:\n");
    listarAlunos(alunos, n);

    printf("\nLista de alunos com matricula ativa:\n");
    listarAlunosAtivos(alunos, n);

    printf("\nExcluindo o aluno 'Neymar'...\n");
    excluirAluno(alunos, &n, "Neymar");

    printf("\nLista completa de alunos apos exclusao:\n");
    listarAlunos(alunos, n);

    printf("\nOrdenando alunos por nota em ordem decrescente:\n");
    ordenarPorNotaDecrescente(alunos, n);
    listarAlunos(alunos, n);

    return 0;
}

//Função para adicionar um aluno à lista
void adicionarAluno(Aluno alunos[], int *n, char nome[], float nota, char status) {
    if (*n < MAX_ALUNOS) {
        strcpy(alunos[*n].nome, nome);
        alunos[*n].nota = nota;
        alunos[*n].status = status;
        (*n)++;
    } else {
        printf("A lista de alunos está cheia!\n");
    }
}

//Função para excluir um aluno da lista
void excluirAluno(Aluno alunos[], int *n, char nome[]) {
    int i, j;
    for (i = 0; i < *n; i++) {
        if (strcmp(alunos[i].nome, nome) == 0) {
            for (j = i; j < *n; j++) {
                alunos[j] = alunos[j + 1]; //Move os alunos para preencher o espaço
            }
            (*n)--;
            printf("Aluno '%s' excluido com sucesso. \n", nome);
            return;
        }        
    }
    printf("Aluno '%s' nao encontrado.\n", nome);
}

//Função para ordenar os alunos por nota em ordem decrescente
void ordenarPorNotaDecrescente(Aluno alunos[], int n) {
    int i, j;
    Aluno temp;
    for (i = 0; i < n - 1; i++) {
        for (j = i + 1; j < n; j++) {
            if (alunos[i].nota < alunos[j].nota) {
                temp = alunos[i];
                alunos[i] = alunos[j];
                alunos[j] = temp;
            }            
        }        
    }    
}

//Função para listar todos os alunos
void listarAlunos(Aluno alunos[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Nome: %s, Nota: %.1f, Status: %s\n", alunos[i].nome, alunos[i].nota, alunos[i].status == 'A' ? "Ativa" : "Cancelada");
    }    
}

//Função para listar apenas os alunos com matrícula ativa
void listarAlunosAtivos(Aluno alunos[], int n) {
    for (int i = 0; i < n; i++) {
        if (alunos[i].status == 'A') {
            printf("Nome: %s, Nota: %.1f\n", alunos[i].nome, alunos[i].nota);
        }        
    }    
}

