#include <stdio.h>

#define PI 3

//Área da circunferência:
float area_circunferencia(float raio_circunferencia) {
    return PI * raio_circunferencia * raio_circunferencia;
}

//Área do quadrado e retângulo:
float area_quadrado_retangulo(float lado) {
    return lado * lado;
}

//Volume do cubo:
float volume_cubo(float aresta) {
    return aresta * aresta * aresta;
}

//Volume da esfera: 
float volume_esfera(float raio_esfera) {
    return (4 * PI * (raio_esfera * raio_esfera * raio_esfera)) / 3;
}

//Programa Principal
int main() {
    
    //Exibindo circunferencia
    float raio_fixo = 3;
    float r1;
    r1 = area_circunferencia(raio_fixo);
    printf("A area da circunferencia eh: %.2f\n", r1);

    //Exibindo area_quadrado_retangulo
    float lado_fixo = 3;
    float r2;
    r2 = area_quadrado_retangulo(lado_fixo);
    printf("A area do quadrado/retangulo eh: %.2f\n", r2);

    //Exibindo volume_cubo
    float aresta_fixa = 3;
    float r3;
    r3 = volume_cubo(aresta_fixa);
    printf("O volume do cubo eh: %.2f\n", r3);

    //Exibindo volume_esfera
    float raio_fixo2 = 3;
    float r4;
    r4 = volume_esfera(raio_fixo2);
    printf("O volume da esfera eh: %.2f\n", r4);

    return 0;
}
