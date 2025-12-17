#include <stdio.h>

#define TAMANHO 5

typedef struct {
    int itens[TAMANHO];
    int topo;
} PilhaCircular;

// Inicializa a pilha 
void inicializarPilha(PilhaCircular *pilha) {
    pilha->topo = -1;
    for (int i = 0; i < TAMANHO; i++) { 
        pilha->itens[i] = -1;  // Inicializa posições como vazias
    }
}

// Verifica se a pilha está vazia 
int pilhaVazia(PilhaCircular *pilha) { 
    return (pilha->topo == -1);
}

// Verifica se a pilha está cheia 
int pilhaCheia(PilhaCircular *pilha) { 
    return ((pilha->topo + 1) % TAMANHO == pilha->itens[0]);
}


// Empilhar na pilha circular 
void empilhar(PilhaCircular *pilha, int valor) { 
    if (pilhaCheia(pilha)) { 
        printf("Pilha cheia!\n");
    } else {
        pilha->topo = (pilha->topo + 1) % TAMANHO; 
        pilha->itens[pilha->topo] = valor; 
        printf("Empilhado: %d\n", valor);
    }
}

// Desempilhar na pilha circular
int desempilhar(PilhaCircular *pilha) { 
    if (pilhaVazia(pilha)) {
        printf("Pilha vazia!\n");
        return -1;
    } else {
        int valor = pilha->itens[pilha->topo];
        // Para indicar posição vazia
        pilha->itens[pilha->topo] = -1;
        pilha->topo = (pilha->topo - 1 + TAMANHO) % TAMANHO;
        return valor;
    }
}

//Consultar o topo da pilha
int consultarTopo(PilhaCircular *pilha) {
    if (pilhaVazia(pilha)) {
        printf("Pilha vazia!\n");
        return -1;
    } else {
        return pilha->itens[pilha->topo];
    }
}

int main() {
    PilhaCircular pilha;
    inicializarPilha(&pilha);

    empilhar(&pilha, 10);
    empilhar(&pilha, 20); 
    empilhar(&pilha, 30);

    printf("Topo da pilha: %d\n", consultarTopo(&pilha));

    desempilhar(&pilha); 
    
    printf("Topo apos desempilhar: %d\n", consultarTopo(&pilha));

    return 0;
}