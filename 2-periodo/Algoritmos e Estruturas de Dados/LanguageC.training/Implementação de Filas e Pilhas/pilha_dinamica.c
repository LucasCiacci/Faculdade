#include <stdio.h>
#include <stdlib.h>

typedef struct No
{
    int valor;
    struct No *proximo;
} No;

typedef struct
{
    No *topo;
} Pilha;

// Inicializa a pilha
void inicializarPilha(Pilha *pilha)
{
    pilha->topo = NULL;
}

// Verifica se a pilha está vazia
int pilhaVazia(Pilha *pilha)
{
    return (pilha->topo == NULL);
}

// Empilhar (push)
void empilhar(Pilha *pilha, int valor) {
    No *novoNo = (No *)malloc(sizeof(No));
    if (!novoNo) {
        printf("Erro de memoria!\n");
        return;
    }
    novoNo->valor = valor;
    novoNo->proximo = pilha->topo;
    pilha->topo = novoNo;
    printf("Empilhado: %d\n", valor);
}

// Desempilhar (pop)
int desempilhar(Pilha * pilha) {
    if (pilhaVazia(pilha)) {
        printf("Pilha vazia!\n");
        return -1;
    } else {
        No *temp = pilha->topo;
        int valor = temp->valor;
        pilha->topo = temp->proximo;
        free(temp);
        return valor;
    }
}

// Consultar o topo (peek)
int consultarTopo (Pilha *pilha) {
    if (pilhaVazia(pilha)) {
        printf("Pilha vazia!\n");
        return -1;
    } else {
        return pilha->topo->valor;
    }
}

int main() {
    Pilha pilha;
    inicializarPilha(&pilha);
    
    empilhar(&pilha, 10); 
    empilhar(&pilha, 20); 
    empilhar(&pilha, 30);

    printf("Topo da pilha: %d\n", consultarTopo(&pilha));

    desempilhar(&pilha); 
    
    printf("Topo apos desempilhar: %d\n", consultarTopo(&pilha));

    return 0;

}