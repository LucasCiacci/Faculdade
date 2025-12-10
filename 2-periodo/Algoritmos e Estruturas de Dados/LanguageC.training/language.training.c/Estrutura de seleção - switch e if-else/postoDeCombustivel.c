#include <stdio.h>

//Treinando as estruturas de seleção switch e if-else
int main(){
	float litros,valoraserpago;
	int tipo;
	printf("Tipo de combustivel\n");
	printf("1 - Gasolina\n");
	printf("2 - Alcool\n");
	scanf("%d",&tipo);
	switch(tipo){
		case 1: 
			printf("Valor em litros do abastecimento: ");
			scanf("%f",&litros);
			if(litros<=25){
				valoraserpago= 3*litros;
				valoraserpago=valoraserpago-0.07*valoraserpago;
				printf("Valor a ser pago: %.2f\n", valoraserpago);
			}
			else{
				valoraserpago= 3*litros;
				valoraserpago=valoraserpago-0.09*valoraserpago;
				printf("Valor a ser pago: %.2f\n", valoraserpago);
			}
			break;


		case 2:
			printf("Valor em litros do abastecimento: ");
			scanf("%f",&litros);
			if(litros<=25){
				valoraserpago= 2*litros;
				valoraserpago=valoraserpago-0.05*valoraserpago;
				printf("Valor a ser pago: %.2f\n", valoraserpago);
			}
			else{
				valoraserpago= 2*litros;
				valoraserpago=valoraserpago-0.75*valoraserpago;
				printf("Valor a ser pago: %.2f\n", valoraserpago);
			}
			break;

		default:
			printf("Tipo de combustivel invalido!!!!!\n");
	}
		
	return 0;
}