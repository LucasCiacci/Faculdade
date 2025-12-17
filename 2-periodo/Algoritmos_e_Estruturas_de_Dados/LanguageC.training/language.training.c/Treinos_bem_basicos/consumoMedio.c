#include <stdio.h>

//Programa principal
int main(){
    float distancia, litros, consumo_medio;

    //Distância:
    printf("Qual a distancia percorrida(em km)?");
    scanf("%f", &distancia);

    //Litros:
    printf("Qual a quantidade de litros de combustivel gasto?");
    scanf("%f", &litros);

    //Calculando o consumo médio:
    consumo_medio = distancia / litros;

    //Exibindo o resultado, no caso o consumo médio:
    printf("O consumo medio foi de: %.2f km/l.\n", consumo_medio);
    
    return 0;
}