package atividadefinal;

//Herança e interface: Leão estende Animal e implementa Exibivel
public class Leao extends Animal implements Exibivel {
    private String origem;

    //Método construtor
    public Leao(String nome, int idade, String origem) {
        super(nome, idade, "Leão");
        this.origem = origem;
    }
    
    //Polimorfismo
    @Override
    public void exibirInformacoes(){
        System.out.println("Nome: " + getNome());
        System.out.println("Idade: " + getIdade());
        System.out.println("Espécie: " + getEspecie());
        System.out.println("Origem: " + origem);
    }
}
