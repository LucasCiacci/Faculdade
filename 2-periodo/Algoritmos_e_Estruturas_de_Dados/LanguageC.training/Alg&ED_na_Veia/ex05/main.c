#include <stdio.h>

struct Pessoa {
    char nome[100];
    int idade;
    float altura;
} Pessoa;

int main() {

    struct Pessoa pessoa;
    printf("valor nome: ");
    scanf("%s", &pessoa.nome);

    printf("valor idade: ");
    scanf("%d", &pessoa.idade);

    printf("valor altura: ");
    scanf("%f", &pessoa.altura);

    printf("O nome e: %s\n", pessoa.nome);
    printf("A idade e: %d\n", pessoa.idade);
    printf("O altura e: %.2f\n", pessoa.altura);

    return 0;
}