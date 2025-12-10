#include <stdio.h>

//Treinando a estrutura de repetição while
int main(){
	float populacaoA = 80000;
	float populacaoB = 200000;
	float taxaCrescA = 0.03;
	float taxaCrescB = 0.015;
	int anos = 1;
    
    //while (populacaoA != populacaoB) -> errado!
    //loop só pararia se eles se igualassem, algo muito dificil de occorrer
	
    //forma correta abaixo:
    while (populacaoA < populacaoB){
		populacaoA = populacaoA*(1 + taxaCrescA);
   		populacaoB = populacaoB*(1 + taxaCrescB);
    	anos = anos + 1;
    }
 	printf("Populacao A: %.2f\n", populacaoA);
 	printf("Populacao B: %.2f\n", populacaoB);
 	printf("Anos: %d\n", anos);

 	return 0;
   
} 
