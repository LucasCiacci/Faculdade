package atividadefinal;

//Classe Cuidador
public class Cuidador {
    
    //Atributos
    private String nome;
    private int experiencia;

    //Método construtor 
    public Cuidador(String nome, int experiencia) {
        this.nome = nome;
        this.experiencia = experiencia;
    }

    //Getters 
    public String getNome() {
        return nome;
    }

    public int getExperiencia() {
        return experiencia;
    }
    
    //Método para relacionar o Animal a algum Cuidador
    public void cuidarAnimal(Animal animal) {
        System.out.println(nome + " está cuidando do animal: " + animal.getNome());
    }    
}
