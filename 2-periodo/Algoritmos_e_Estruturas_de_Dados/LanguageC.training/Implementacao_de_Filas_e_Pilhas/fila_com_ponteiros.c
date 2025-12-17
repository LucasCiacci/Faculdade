#include <stdio.h>
#include <stdlib.h>

typedef struct No {
    int valor;
    struct No *proximo;
} No;

typedef struct {
    No *inicio;
    No *fim;
} Fila;

//Inicializando a fila
void inicializarFila(Fila *fila) {
    fila->inicio = NULL;
    fila->fim = NULL;
}

//Verificando se a fila está vazia
int filaVazia(Fila *fila) {
    return (fila->inicio == NULL);
}

//Enfileirando na fila
void enfileirar(Fila *fila, int valor) {
    No *novoNo = (No *)malloc(sizeof(No));
    if (!novoNo) {
        printf("Erro de memoria!\n");
        return;
    }
    novoNo->valor = valor;
    novoNo->proximo = NULL;

    if (filaVazia(fila)) {
        fila->inicio = novoNo;
    } else {
        fila->fim->proximo = novoNo;
    }
    fila->fim = novoNo;
    printf("Enfileirado: %d\n", valor);    
}

//Desenfileirando da fila
int desenfileirar(Fila *fila) {
    if (filaVazia(fila)) {
        printf("Fila vazia!\n");
        return -1;
    }

    int valor = fila->inicio->valor;
    No *temp = fila->inicio;
    fila->inicio = fila->inicio->proximo;

    if (fila->inicio == NULL) {
        fila->fim = NULL;
    }

    free(temp);
    return valor;    
}

//Consultar o início da fila
int consultar(Fila *fila) {
    if (filaVazia(fila)) {
        printf("Fila vazia!\n");
        return -1;
    }
    return fila->inicio->valor;    
}

//Testando o código
int main() {
    //Crio a fila e inicializo
    Fila fila;
    inicializarFila(&fila);

    //Depois coloco elementos na fila
    enfileirar(&fila, 1);
    enfileirar(&fila, 2);
    enfileirar(&fila, 3);

    //Consultando o início dela
    printf("Inicio da fila: %d\n", consultar(&fila)); //no caso aparece o valor 1

    //Removendo um elemento da fila
    //Sempre será o primeiro -> FIFO
    desenfileirar(&fila);

    //Novo início
    printf("Inicio apos desenfileirar: %d\n", consultar(&fila)); //agora vai aparecer o 2

    return 0;
}

