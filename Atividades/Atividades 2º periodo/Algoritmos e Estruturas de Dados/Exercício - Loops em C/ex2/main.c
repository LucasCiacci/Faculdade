#include <stdio.h>

//ex2: laço: for
int main() {
    int n, i;
    int soma = 0;

    // Solicita ao usuário que insira um número inteiro positivo
    printf("Digite um numero inteiro positivo: ");
    scanf("%d", &n);


    if (n <= 0) {
        printf("O numero deve ser positivo.\n");
        return 1;
    }

    for (i = 1; i <= n; i++) {
        soma += i;
    }

    // Exibe o resultado da soma
    printf("A soma de todos os numeros de 1 ate %d eh %d.\n", n, soma);

    return 0;
}