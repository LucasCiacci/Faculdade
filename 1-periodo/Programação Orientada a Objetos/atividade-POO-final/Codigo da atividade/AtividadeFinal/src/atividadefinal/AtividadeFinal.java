package atividadefinal;

//Classe para testar o código
public class AtividadeFinal {

    public static void main(String[] args) {
       Zoologico zoologico = new Zoologico();
       
       //Criando instâncias de animal
       Animal leao = new Leao("Simba", 5, "África");
       Animal elefante = new Elefante("Dumbo", 10, 1200.5);
       Animal macaco = new Macaco("George", 3, "Banana e Maçã");
       
       //Criando instâncias de cuidadores
       Cuidador c1 = new Cuidador("João", 8);
       Cuidador c2 = new Cuidador("Maria", 5);
       Cuidador c3 = new Cuidador("Pedro", 6);
       
       //Adicionando as instâncias de animais criados
       zoologico.adicionarAnimal(leao);
       zoologico.adicionarAnimal(elefante);
       zoologico.adicionarAnimal(macaco);
       
       
       //Adicionando as intâncias de criadores criados
       zoologico.adicionarCuidador(c1);
       zoologico.adicionarCuidador(c2);
       zoologico.adicionarCuidador(c3);
       
       
        //Exibindo as informações de animais
        System.out.println("Informações dos Animais:");
        zoologico.exibirInformacoes();
        
        //Exibindo as informações de criadores
        System.out.println("Lista de Cuidadores:");
        zoologico.listarCuidadores();
        
        //Linha em branco
        System.out.println();
        
        
        //Relacionando o cuidador ao animal
        c1.cuidarAnimal(leao);
        c2.cuidarAnimal(elefante);
        c3.cuidarAnimal(macaco);
    }
    
}
