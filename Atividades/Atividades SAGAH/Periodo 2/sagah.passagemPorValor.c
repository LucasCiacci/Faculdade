#include <stdio.h>

void calcularIngredientes(int quantidadeBrigadeiros) {
    //Quantidade considerando 30 brigadeiros
    float leiteCondensado = 1.0; //lata
    float manteiga = 1.0; //colher de sopa
    float achocolatado = 4.0; //colheres de sopa

    //Proporção calculada de acordo com 30 brigadeiros
    float proporcao = quantidadeBrigadeiros/30.0;

    //Calculando a quantidade de cada ingrediente
    float leiteCondensado_necessario = leiteCondensado * proporcao;
    float manteiga_necessaria = manteiga * proporcao;
    float achocolatado_necessario = achocolatado * proporcao;

    //Mostrando as quantidades calculadas
    printf("Para fazer %d brigadeiros, você precisará de: \n", quantidadeBrigadeiros);
    printf("- %.2f lata(s) de leite condensado\n", leiteCondensado_necessario);
    printf("- %.2f colher(es) de manteiga\n", manteiga_necessaria);
    printf("- %.2f colher(es) de achocolatado em pó\n", achocolatado_necessario);
}

//Programa Principal
int main() {
    int quantidadeBrigadeiros;

    //Pedindo ao usuário para digitar a quantidade de brigadeiros a se fazer
    printf("Digite a quantidade de brigadeiros que deseja fazer: ");
    scanf("%d", &quantidadeBrigadeiros);

    //Função que calcula os ingredientes 
    calcularIngredientes(quantidadeBrigadeiros);

    return 0;
}
