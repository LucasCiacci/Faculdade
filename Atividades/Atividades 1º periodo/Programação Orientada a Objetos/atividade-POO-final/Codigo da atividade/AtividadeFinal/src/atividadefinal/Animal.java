package atividadefinal;

//Classe Abstrata Animal
public abstract class Animal {
    
    //Atributos
    private String nome;
    private int idade;
    private String especie;

    //Método Construtor
    public Animal(String nome, int idade, String especie) {
        this.nome = nome;
        this.idade = idade;
        this.especie = especie;
    }
    
    //Getters
    public String getNome() {
        return nome;
    }

    public int getIdade() {
        return idade;
    }

    public String getEspecie() {
        return especie;
    }
    
    //Método exibir informações
    public abstract void exibirInformacoes();
    
}
