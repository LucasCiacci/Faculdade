#include <stdio.h>

//Programa principal:
int main(){
    float f, c; //c=celsius|f=fahrenheit

    //Capturando a temperatura em graus Fahrenheit:
    printf("Digite uma temperatura em graus Fahrenheit: ");
    scanf("%f", &f);

    //Calculando a temperatura em graus celsius:
    c = (f-32) * 5 / 9;

    //Exibindo o resultado:
    printf("A temperatura em graus celsius e de: %.2f\n", c);

    return 0;
}