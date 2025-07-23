public class VeiculoDeCarga extends Veiculo{
    private double capacidadeMaximaCarga;
    private double altura;
    private double largura;
    private double profundidade;

    public VeiculoDeCarga (String placa, String marca, String modelo, int anoModelo, int anoFabricacao, String chassi, String renavam, String procedencia, String corExterna, String corInterna, String tipoCombustivel, String motor, int quilometragem, double consumoMedio, int numeroPortas, double capacidadeMaximaCarga, double altura, double largura, double profundidade) {
        super(placa, marca, modelo, anoModelo, anoFabricacao, chassi, renavam, procedencia, corExterna, corInterna, tipoCombustivel, motor, quilometragem, consumoMedio, numeroPortas);
        this.capacidadeMaximaCarga = capacidadeMaximaCarga;
        this.altura = altura;
        this.largura = largura;
        this.profundidade = profundidade;
    }

    public void setCapacidadeMaximaCarga (double capacidadeMaximaCarga) {
        this.capacidadeMaximaCarga = capacidadeMaximaCarga;
    }

    public double getCapacidadeMaximaCarga () {
        return capacidadeMaximaCarga;
    }

    public void setAltura (double altura) {
        this.altura = altura;
    }
    
    public double getAltura () {
        return altura;
    }

    public void setLargura (double largura) {
        this.largura = largura;
    }
    
    public double getLargura () {
        return largura;
    }

    public void setProfundidade (double profundidade) {
        this.profundidade = profundidade;
    }
    
    public double getProfundidade () {
        return profundidade;
    }
}