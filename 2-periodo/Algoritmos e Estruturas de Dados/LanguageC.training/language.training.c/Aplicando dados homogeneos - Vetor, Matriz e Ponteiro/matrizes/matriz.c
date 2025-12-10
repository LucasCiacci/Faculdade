#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define linhas 4
#define colunas 8

//Programa Principal: 
int main() {
    int posicao_linha = 0, posicao_coluna = 0; 
    int matriz[linhas][colunas]; 
    int valor = 0, maior = 0;

    //Inserindo valores nas posições da matriz:
    for (posicao_linha = 0; posicao_linha < linhas; posicao_linha++) {
        for (posicao_coluna = 0; posicao_coluna < colunas; posicao_coluna++) {
            valor = posicao_linha + posicao_coluna;
            matriz[posicao_linha][posicao_coluna] = valor;
        }
    }

    //Mostrando os elementos da matriz:
    printf("A matriz criada contem os seguintes elementos: \n\n ");
    for (posicao_linha = 0; posicao_linha < linhas; posicao_linha++) {
        for (posicao_coluna = 0; posicao_coluna < colunas; posicao_coluna++) {
            printf("| %2d", matriz[posicao_linha][posicao_coluna]);
        }
        printf("|\n ");
    }

    //Mostrando apenas o maior elemento dessa matriz: 
    printf("\n O maior elemento da matriz e: ");
    for (posicao_linha = 0; posicao_linha < linhas; posicao_linha++) {
        for (posicao_coluna = 0; posicao_coluna < colunas; posicao_coluna++) {
            if (matriz[posicao_linha][posicao_coluna] > maior) {
                maior = matriz[posicao_linha][posicao_coluna];
            }
        }
    }

    printf("| %d | ", maior);

    return 0;
}