#include <stdio.h>

//Ex3: Laço: while
int main() {
    int num, soma = 0;

    //Loop que lê os números até o usuário digitar 0
    do {
        printf("Digite um numero inteiro (0 para sair): ");
        scanf("%d", &num);
        soma += num; //Faz com que o novo numero seja adicionado a soma
    } while (num != 0);

    //Exibindo a soma total
    printf("A soma de todos os numeros digitados eh: %d\n", soma);

    return 0;    
}
