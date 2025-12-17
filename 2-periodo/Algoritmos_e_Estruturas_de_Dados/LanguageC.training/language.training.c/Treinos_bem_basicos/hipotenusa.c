#include <stdio.h>
#include <math.h> //para usar a função da raiz quadrada

//Programa principal:
int main(){
    float c1, c2, h;

    //Capturando o valor dos catetos:
    printf("Informe o primeiro cateto: ");
    scanf("%f", &c1);

    printf("Informe o segundo cateto: ");
    scanf("%f", &c2);

    //Calculando a hipotenusa:
    //h^2 = c1^2 + c2^2
    h = sqrt((c1*c1) + (c2*c2));

    //Exibindo o resultado:
    printf("O valor da hipotenusa e: %.2f\n", h);

    return 0;
}