#include <stdio.h>

//Programa principal
int main () {
    float n1, n2, media;

    //Pedindo para digitar as duas notas
    printf("Digite a primeira nota:");
    scanf("%f", &n1);

    printf("Digite a segunda nota:");
    scanf("%f", &n2);

    //Calculando a media
    media = (n1 + n2)/2;

    //Exibindo a media
    printf("A sua media e: %.2f\n", media);

    return 0;
}