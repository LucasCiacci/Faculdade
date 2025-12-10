#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


// JOGO DA FORCA 
// Treinando FUNÇÕES em C 


// Função para imprimir o estado atual da palavra
void imprimir_palavra(char palavra[], int tamanho, int letras_acertadas[]) {
    for (int i = 0; i < tamanho; i++) {
        if (letras_acertadas[i]) {
            printf("%c ", palavra[i]);
        } else {
            printf("_ ");
        }
    }
    printf("\n");
}


// Função principal do jogo
void jogar_forca(char palavra[]) {
    int tamanho = strlen(palavra);
    int letras_acertadas[tamanho];
    for (int i = 0; i < tamanho; i++) {
        letras_acertadas[i] = 0;
    }

    int tentativas = 6;
    int acertos = 0;
    char letra;

    while (tentativas > 0 && acertos < tamanho) {
        printf("\nVoce tem %d tentativas restantes.\n", tentativas);
        imprimir_palavra(palavra, tamanho, letras_acertadas);

        printf("Digite uma letra: ");
        scanf(" %c", &letra);
        letra = tolower(letra); // Garantir que a letra seja minúscula

        int acertou = 0;
        for (int i = 0; i < tamanho; i++) {
            if (tolower(palavra[i]) == letra && !letras_acertadas[i]) {
                letras_acertadas[i] = 1;
                acertos++;
                acertou = 1;
            }
        }

        if (!acertou) {
            printf("Letra incorreta!\n");
            tentativas--;
        }
    }

    if (acertos == tamanho) {
        printf("\nParabens! Voce acertou a palavra: %s\n", palavra);
    } else {
        printf("\nVoce perdeu! A palavra era: %s\n", palavra);
    }
}

// Função main
int main() {
    char palavras[5][20] = {
            "hidrogenio", "oxigenio", "carbono", "nitrogenio", "ferro"
    };
    int opcao;
    do {
        printf("\n--- Menu ---\n");
        printf("1. Iniciar Jogo\n");
        printf("2. Sair\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);

        if (opcao == 1) {
            // Escolhendo uma palavra aleatória da lista
            int indice = rand() % 5;
            jogar_forca(palavras[indice]);
        } else if (opcao != 2) {
            printf("Opcao invalida! Tente novamente.\n");
        }

    } while (opcao != 2);
    printf("Obrigado por jogar!\n");

    return 0;
}