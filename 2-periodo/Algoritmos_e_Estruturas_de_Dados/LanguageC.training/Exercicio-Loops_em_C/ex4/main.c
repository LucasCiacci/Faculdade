#include <stdio.h>

//Ex4: Estrutura: switch-case
int main(void) {
    int numero;
    printf("Digite um numero de 1 a 7: ");
    scanf("%d", &numero);

    switch (numero) {
        case 1: printf("Domingo\n"); break;

        case 2: printf("Segunda-Feira\n"); break;

        case 3: printf("Terca-Feira\n"); break;

        case 4: printf("Quarta-Feira\n"); break;

        case 5: printf("Quinta-Feira\n"); break;

        case 6: printf("Sexta-Feira\n"); break;

        case 7: printf("Sabado\n"); break;

        default:
            printf("Numero invalido, Por favor digite um numero de 1 a 7!!\n");

            return 0;
    }
}