#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define elementos 10

//Programa Principal:
int main(){
    int posicao, vetor[elementos], maior = 0;

    //Incluindo elementos no vetor utilizando o la�o for:
    for(posicao = 0; posicao < elementos; posicao++){
        vetor[posicao] = posicao;
    }

    //Mostrando os elementos:
    printf("O vetor criado contem os seguintes elementos: \n\n| ");
    for (posicao = 0; posicao < elementos; posicao++) {
        printf("%d | ", vetor[posicao]);
    }

    //Mostrando os elementos ao contr�rio:
    printf("\n\nExibindo ao contrario, os elementos do vetor sao: \n\n| ");
    for (posicao = 9; posicao >= 0; posicao--) {
        printf("%d | ", vetor[posicao]);
    }

    //Mostrando somente os elementos pares:
    printf("\n\nOs elementos pares do vetor sao: \n\n| ");
    for (posicao = 0; posicao < elementos; posicao++) {
        if ((vetor[posicao] % 2) == 0) {
            printf("%d | ", vetor[posicao]);
        }
    }

    //Mostrando somente o maior elemento:
    printf("\n\nO maior elemento do vetor e: ");
    for (posicao = 0; posicao < elementos; posicao++) {
        if (vetor[posicao] > maior) {
            maior = vetor[posicao];
        }
    }
    printf("| %d | ", maior);

    return 0;
}
