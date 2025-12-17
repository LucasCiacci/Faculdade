#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    int escolhaJogador, escolhaComputador;

    // Inicializa o gerador de números aleatórios
    srand(time(NULL));
    
    //Exibe as opções para o jogador
    printf("Bem-vindo ao Jogo Pedra-Papel-Tesoura\n");
    printf("Escolha sua jogada:\n ");
    printf("0 - Pedra\n");
    printf("1 - Papel\n");
    printf("2 - Tesoura\n");
    printf("Digite o numero correspondente a sua escolha: ");
    scanf("%d", &escolhaJogador);
    
    //Gera a jogada do computador (0 a 2)
    escolhaComputador = rand() % 3;

    //Exibe a jogada do computador
    printf("Computador escolheu: ");
    switch (escolhaComputador) {
    case 0:
        printf("Pedra\n");
        break;
    case 1:
        printf("Papel\n");
        break;
    case 2:
        printf("Tesoura\n");
        break;
    }

    //Determina o resultado do jogo
    if (escolhaJogador == escolhaComputador) {
        printf("Empate!\n");
    } else if ( (escolhaJogador == 0 && escolhaComputador == 2) ||  //Pedra vs Tesoura
                (escolhaJogador == 1 && escolhaComputador == 0) ||  //Papel vs Pedra
                (escolhaJogador == 2 && escolhaComputador == 1) ) { //Tesoura vs Papel
        printf("Voce venceu!\n");
    } else {
        printf("Computador venceu!\n");
    }
    
    return 0;
}