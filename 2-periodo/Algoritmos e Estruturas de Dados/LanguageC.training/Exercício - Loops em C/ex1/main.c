#include <stdio.h>

//Ex1: Conditional: if-else
int main() {
    int idade;

    printf("Diga a sua idade: ");
    scanf("%d", &idade);

    if(idade < 18) {
        printf("Menor de idade\n");
    } else if (idade >= 18 && idade < 60) {
        printf("Adulto\n");
    } else if (idade >= 60) {
        printf("Idoso");
    }

    return 0;
}
