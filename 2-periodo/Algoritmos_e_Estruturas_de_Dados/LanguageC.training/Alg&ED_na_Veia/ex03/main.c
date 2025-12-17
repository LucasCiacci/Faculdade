#include <stdio.h>

int main() {
    //Declarar as variáveis:
    float num1, num2, num3, media;

    //Determinar os números:
    printf("Digite o primeiro numero: ");
    scanf("%f", &num1);

    printf("Digite o segundo numero: ");
    scanf("%f", &num2);

    printf("Digite o terceiro numero: ");
    scanf("%f", &num3);

    //Conta:
    media = (num1 + num2 + num3)/3;

    //Saída:
    printf("Media dos 3 numeros: %.2f\n", media);

    return 0;

}