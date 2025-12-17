#include <stdio.h>

//Programa principal:
int main(){
    char caractere;

    //Capturando o caracter passado pelo usuário:
    printf("Digite um caracter: ");
    scanf("%c", &caractere);

    //Exibindo os códigos ASCII:
    printf("Codigo ASCII de '%c' em decimal: %d\n", caractere, caractere);
    printf("Codigo ASCII de '%c' em hexadecimal: %X\n", caractere, caractere);

    return 0;
}