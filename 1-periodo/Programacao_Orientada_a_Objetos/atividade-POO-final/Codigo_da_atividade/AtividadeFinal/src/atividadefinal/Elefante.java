package atividadefinal;

//Herança e interface: Elefante estende Animal e implementa Exibivel
public class Elefante extends Animal implements Exibivel {
    private double peso;

    //Método construtor
    public Elefante(String nome, int idade, double peso) {
        super(nome, idade, "Elefante");
        this.peso = peso;
    }
    
    //Polimorfismo
    @Override
    public void exibirInformacoes() {
        System.out.println("Nome: " + getNome());
        System.out.println("Idade: " + getIdade());
        System.out.println("Espécie: " + getEspecie());
        System.out.println("Peso: " + peso + " kg");
    }
}
