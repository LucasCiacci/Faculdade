#include <stdio.h>

//Função principal do programa:
int main(){
    int numero, antecessor, sucessor;

    //Pedindo ao usuário para inserir um número:
    printf("Digite um numero: ");
    scanf("%d", &numero);

    //Calculando o antecessor e sucessor:
    antecessor = numero - 1; 
    //ou: numero--
    sucessor = numero + 1;
    //ou: numero++

    //Exibindo o antecessor e sucessor::
    printf("Antecessor: %d\n", antecessor);
    printf("Sucessor: %d\n", sucessor);

    //Mostrando a tabuada de multiplicação do numero:
    printf("Tabuada de multiplicacao do numero %d:\n", numero);
    for (int i = 1; i <= 10; i++) {
        printf("%d x %d = %d\n", numero, i, numero * i);
    }
    
    //Exibindo os próximos 3 números contando de 2 em 2:
    printf("Os proximos 3 numeros contando de 2 em 2 sao: %d %d %d\n", numero + 2, numero + 4, numero + 6);

    return 0;
}