#include <stdio.h>

//Criando a struct Aluno
struct Aluno {
    char nome[50];
    int idade;
    float nota;
};

int main () {
    //Acessando a struct e colocando informações em cada um dos campos
    struct Aluno alunos[3];
    for (int i = 0; i < 3; i++) {
        printf("Digite o nome do aluno %d: ", i + 1);
        scanf("%s", alunos[i].nome);

        printf("Digite a idade do aluno %d: ", i + 1);
        scanf("%d", &alunos[i].idade);

        printf("Digite a nota do aluno %d: ", i + 1);
        scanf("%f", &alunos[i].nota);

        printf("-----------------------\n");
}

    //Mostrando as informações de cada aluno
    printf("\nInformacoes dos alunos:\n");
    for (int i = 0; i < 3; i++) {
        printf("Nome: %s, Idade: %d, Nota: %.1f\n", alunos[i].nome, alunos[i].idade, alunos[i].nota);
    }

    return 0;
}