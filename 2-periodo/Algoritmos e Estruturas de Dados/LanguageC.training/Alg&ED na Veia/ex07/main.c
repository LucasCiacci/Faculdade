#include <stdio.h>

//Função maior
void maior(int x, int y) {
    if(x > y) {
        printf("%d eh maior que %d", x, y);
    } else if (y > x) {
        printf("%d eh maior que %d", y, x);
    }
}

//Programa Principal
int main (){
    int a, b;
    printf ("Digite um numero: ");
    scanf ("%d", &a);
    printf("Digite um numero: ");
    scanf ("%d", &b);

    maior(a, b);
    return 0;
}
