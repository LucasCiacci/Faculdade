package atividadefinal;

import java.util.ArrayList;
import java.util.List;

//Classe Zoológico
public class Zoologico {
    private List<Animal> animais;
    private List<Cuidador> cuidadores;
    
    //Método construtor: quando abrir uma intãncia de zoologico, já vai criar as listas. 
    public Zoologico() {
        animais = new ArrayList<>();
        cuidadores = new ArrayList<>();
    }
    
    //Método adicionar um animal
    public void adicionarAnimal (Animal animal) {
        animais.add(animal);
    }
    
    //Método adicionar um cuidador
    public void adicionarCuidador (Cuidador cuidador) {
        cuidadores.add(cuidador);
    }
    
    //Método para exibir as informações dos animais
    public void exibirInformacoes() {
        for (Animal animal : animais) {
            animal.exibirInformacoes();
            System.out.println();
        }
    }
    
    //Método para listar os cuidadores 
    public void listarCuidadores() {
        for (Cuidador cuidador : cuidadores) {
            System.out.println("Cuidador: " + cuidador.getNome() + ", Experiência: " + cuidador.getExperiencia() + " anos");
        }
    }
}
