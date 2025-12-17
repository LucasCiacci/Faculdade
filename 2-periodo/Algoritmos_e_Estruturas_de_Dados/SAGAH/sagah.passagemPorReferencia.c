#include <stdio.h>
#include <unistd.h> //-> função sleep() -> aguardo de segundos


//Definindo cores ANSI
#define RED    "\033[31m" //Vermelho
#define GREEN  "\033[32m" //Verde
#define YELLOW "\033[33m" //Amarelo
#define RESET  "\033[0m"  //Resetar para cor padrão

//Procedimento para mostrar a cor atual
void mostrar_cor(int cor) {
    if (cor == 1) {
        printf(RED "Vermelho\n" RESET);
    } else if (cor == 2) {
        printf(GREEN "Verde\n" RESET);
    } else if (cor == 3) {
        printf(YELLOW "Amarelo\n" RESET);
    }   
}

//Função parta mudar a cor
int mudar_cor(int cor) {
    if (cor == 1) {
        sleep(5);
        return 2; //Vermelho -> Verde
    } else if (cor == 2) {
        sleep(4);
        return 3; //Verde -> Amarelo
    } else if (cor == 3) {
        sleep(2);
        return 1; // Amarelo -> Vermelho
    } else {
        return 1;
    }
}

//Programa Principal 
int main() {
    int cor = 1; //Inicializa com a cor vermelha (1)

    //Repetição infinita das cores
    while (1) { 
        mostrar_cor(cor); //Exibe a cor atual
        cor = mudar_cor(cor); //Muda para a próxima cor
    }
    
    return 0;
}
