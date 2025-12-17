#include <stdio.h>

#define TAMANHO 5

typedef struct {
    int itens[TAMANHO];
    int inicio, fim;
} Fila;

//Inicializando a fila
void inicializarFila (Fila *fila) {
    fila->inicio = -1;
    fila->fim = -1;
}

//Verificando se a fila está vazia
int filaVazia(Fila *fila) {
    return (fila->inicio == -1);
}

//Verificando se a fila está cheia
int filaCheia(Fila *fila) {
    return ((fila->fim + 1) % TAMANHO == fila->inicio);
}

//Enfileirando em uma fila circular
void enfileirar(Fila *fila, int valor) {
    if (filaCheia(fila)) {
        printf("Fila cheia!\n");;
    } else {
        if (filaVazia(fila)) {
            fila->inicio = 0;
        } 
        fila->fim = (fila->fim + 1) % TAMANHO;
        fila->itens[fila->fim] = valor;
        printf("Enfileirado: %d\n", valor);
    }    
}

//Desenfileirar da fila circular
int desenfileirar(Fila *fila) {
    int valor;
    if (filaVazia(fila)) {
        printf("Fila vazia!\n");
        return -1;
    } else {
        valor = fila->itens[fila->inicio];
        if (fila->inicio == fila->fim) {
            //Resetar a fila
            fila->inicio = fila->fim = -1;
        } else {
            fila->inicio = (fila->inicio + 1) % TAMANHO;
        }
        return valor;        
    }    
}

//Testando o código
int main() {
    //Crio a fila e inicializo
    Fila fila;
    inicializarFila(&fila);

    //Depois coloco elementos na fila
    enfileirar(&fila, 100);
    enfileirar(&fila, 200);
    enfileirar(&fila, 300);
    enfileirar(&fila, 400);
    enfileirar(&fila, 500);
    //Temos 5 elementos já enfileirados na fila

    //Desenfileirando um elemento -> no caso será o 100
    printf("Desenfileirado: %d\n", desenfileirar(&fila));
    
    enfileirar(&fila, 600);

    return 0;
}
