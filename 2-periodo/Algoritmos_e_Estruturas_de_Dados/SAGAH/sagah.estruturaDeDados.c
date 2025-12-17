#include <stdio.h>

//Programa principal
int main() {
    float matriz[3][2];
    float vetor[3];
    
    matriz[0][0] = 15.00;
    matriz[0][1] = 12.50;
    matriz[1][0] = 13.00;
    matriz[1][1] = 7.50;
    matriz[2][0] = 100.00;
    matriz[2][1] = 97.00;

    vetor[0] = (matriz[0][0] + matriz[0][1]) / 2;
    vetor[1] = (matriz[1][0] + matriz[1][1]) / 2;
    vetor[2] = (matriz[2][0] + matriz[2][1]) / 2;

    printf("Lista de precos de uma papelaria:\n");
    printf("|  Material   |  Preco[0] |  Preco[1] |\n");
    printf("|-------------|-----------|-----------|\n");
    printf("| Material[0] |  %7.2f  |  %7.2f  |\n", matriz[0][0], matriz[0][1]);
    printf("| Material[1] |  %7.2f  |  %7.2f  |\n", matriz[1][0], matriz[1][1]);
    printf("| Material[2] |  %7.2f  |  %7.2f  |\n", matriz[2][0], matriz[2][1]);
    
    printf("\nMedia de precos por produto:\n");
    printf("|  Material   |    Media    |\n");
    printf("|-------------|-------------|\n");
    printf("| Material[0] |   %7.2f   |\n", vetor[0]);
    printf("| Material[1] |   %7.2f   |\n", vetor[1]);
    printf("| Material[2] |   %7.2f   |\n", vetor[2]);
        
    return 0;
}



// //Outra resposta possível:

// #include <stdio.h>

// int main() {
//     //Declarando matrizes em preços
//     float precos[3][2] = {
//         {15.00, 12.50}, {13.00, 7.50}, {100.00, 97.00}
//     };

//     //Declarando o vetor em média
//     float medias[3];

//     //Calculando as médias
//     for (int i = 0; i < 3; i++) {
//         printf("| %.2f ", medias[i]);
//     }
//     printf("|\n");
    
//     return 0;
// }

