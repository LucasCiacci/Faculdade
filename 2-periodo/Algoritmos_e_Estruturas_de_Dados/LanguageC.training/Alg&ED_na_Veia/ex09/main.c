#include <stdio.h>

int main() {
    //Entrada:
    int num, tabuada;
    printf("Digite um numero para fazer a tabuada: ");
    scanf("%d", &num);

    //Processamento:
    for (tabuada = 0; tabuada<=10; tabuada++){
        printf("%d x %d = %d\n", num, tabuada, num*tabuada);
    }

    return 0;
}