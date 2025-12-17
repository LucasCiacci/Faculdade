#include <stdio.h>

int main() {
    int x, y;

    printf("Digite o primeiro numero: \n");
    scanf("%d", &x);
    printf("Digite o segundo numero: \n");
    scanf("%d", &y);

    if (x > y) {
        printf("%d eh maior que %d", x, y);
    } else if (y > x) {
        printf("%d eh maior que %d", y, x);
    }

    return 0;
}