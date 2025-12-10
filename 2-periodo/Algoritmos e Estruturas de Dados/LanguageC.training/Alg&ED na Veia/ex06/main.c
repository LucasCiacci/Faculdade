#include <stdio.h>

int main() {
    int matriz[2][2];


    //Valores para cada posição da matriz:
    printf("Digite valores para cada posicao da matriz. \n");
    
    printf("Posicao 1x1: \n");
    scanf("%d", &matriz[0][0]);

    printf("Posicao 1x2: \n");
    scanf("%d", &matriz[0][1]);

    printf("Posicao 2x1: \n");
    scanf("%d", &matriz[1][0]);

    printf("Posicao 2x2: \n");
    scanf("%d", &matriz[1][1]);
    
    //Mostrando a matriz:
    for (int i = 0; i < 2; ++i) {
        for (int j = 0; j < 2; ++j) {
            printf("| %d ", matriz[i][j]);
        }
        printf("| \n");
    }

    return 0;
}
