#include <stdio.h>

int main() {
    int num;
    int votos[6] = {0}; // Vetor para armazenar os votos para cada opção
    int totalVotos = 0;
        
    printf("Enquete: Qual o melhor sistema operacional para uso em servidores?\n");

    printf("1 - Windows Server.\n");
    printf("2 - Unix.\n");
    printf("3 - Linux.\n");
    printf("4 - Netware.\n");
    printf("5 - Mac OS.\n");
    printf("6 - Outro.\n");
    printf("Digite 0 para encerrar a enquete.\n");

    // Loop que lê os números até o usuário digitar 0
    do {
        printf("Escolha um numero de 1 a 6 (0 para sair): ");
        scanf("%d", &num);

        switch (num) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            votos[num - 1]++; // Incrementa o voto correspondente
            totalVotos++; // Incrementa o total de votos
            break;
        case 0:
            //Não faz nada, apenas encerra o loop
            break;
        default:
            printf("Opcao invalida! Tente novamente.\n");    
        }

    } while (num != 0);

    //Exibindo os resultado
    printf("\nResultados da enquete:\n");

    const char *sistemas[] = {
        "Windows Server", "Unix", "Linux", "Netware", "Mac OS", "Outro" 
    };

    for (int i = 0; i < 6; i++) {
        if (totalVotos > 0) {
            //Calculando o percentual de votos
            float percentual = (votos[i] / (float)totalVotos) * 100; 
            printf("%s: %d votos (%.2f%%)\n", sistemas[i], votos[i], percentual);
        } else {
            printf("%s: %d votos (0%%)\n", sistemas[i], votos[i]);
        }
    }

    return 0;
}
