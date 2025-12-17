#include <stdio.h>

int main() {
    int N1;

    printf("Informe os numeros: ");
    scanf("%d", &N1);

    if (N1 % 2 == 0) {
        printf("====  O numero e par  ====", N1);
    } else {
        printf("====  O numero e impar  ====", N1);
    }

    return 0;
}