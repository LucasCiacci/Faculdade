public class VeiculoDePassageiro extends Veiculo {
    private int numeroPassageiros;
    private String[] opcionais;

    public VeiculoDePassageiro(String placa, String marca, String modelo, int anoModelo, int anoFabricacao, String chassi, String renavam, String procedencia, String corExterna, String corInterna, String tipoCombustivel, String motor, int quilometragem, double consumoMedio, int numeroPortas, int numeroPassageiros, String[] opcionais) {
        super(placa, marca, modelo, anoModelo, anoFabricacao, chassi, renavam, procedencia, corExterna, corInterna, tipoCombustivel, motor, quilometragem, consumoMedio, numeroPortas);
        this.numeroPassageiros = numeroPassageiros;
        this.opcionais = opcionais;
    }

    public void setNumeroPassageiros (int numeroPassageiros){
        this.numeroPassageiros = numeroPassageiros;
    }

    public int getNumeroPassageiros() {
        return numeroPassageiros;
    }

    public void setOpcionais (String opcionais) {
        this.opcionais = opcionais;
    }

    public String getOpcionais () {
        return opcionais;
    }
}