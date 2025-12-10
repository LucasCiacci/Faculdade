#include <stdio.h>

//Função para contar
int tamanhoPalavra(char string[]){
    int numCaracteres = 0;
    while(string[numCaracteres] != '\0'){
        ++numCaracteres;
    }
    return numCaracteres;
}

//Programa Principal
int main() {
    char palavra[255];
    printf("Digite uma palavra: \n");
    scanf("%s", &palavra);

    int num = tamanhoPalavra(palavra);

    printf("A palavra %s possui %i caracteres.\n", palavra, num);

    return 0;
}
