public abstract class Veiculo {
    private String placa;
    private String marca;
    private String modelo;
    private int anoModelo;
    private int anoFabricacao;
    private String chassi;
    private String renavam;
    private String procedencia;
    private String corExterna;
    private String corInterna;
    private String tipoCombustivel;
    private String motor;
    private int quilometragem;
    private double consumoMedio;
    private int numeroPortas;

    public Veiculo(String placa, String marca, String modelo, int anoModelo, int anoFabricacao, String chassi, String renavam, String procedencia, String corExterna, String corInterna, String tipoCombustivel, String motor, int quilometragem, double consumoMedio, int numeroPortas) {
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.anoModelo = anoModelo;
        this.anoFabricacao = anoFabricacao;
        this.chassi = chassi;
        this.renavam = renavam;
        this.procedencia = procedencia;
        this.corExterna = corExterna;
        this.corInterna = corInterna;
        this.tipoCombustivel = tipoCombustivel;
        this.motor = motor;
        this.quilometragem = quilometragem;
        this.consumoMedio = consumoMedio ;
        this.numeroPortas = numeroPortas;
    }

    //Getters e Setters

    //placa
    public void setPlaca(String placa) {
        this.placa = placa;
    }
        
    public String getPlaca(){
        return placa;
    }
    
    //marca
    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getMarca(){
        return marca;
    }
    
    //modelo
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
        
    public String getModelo() {
        return modelo;
    }

    //anoModelo
    public void setAnoModelo(int anoModelo) {
        this.anoModelo = anoModelo;
    }
        
    public int getAnoModelo() {
        return anoModelo;
    }

    //anoFabricacao
    public void setAnoFabricacao(int anoFabricacao) {
        this.anoFabricacao = anoFabricacao;
    }
        
    public int getAnoFabricacao() {
        return anoFabricacao;
    }

    //chassi
    public void setChassi(String chassi) {
        this.chassi = chassi;
    }
        
    public String getChassi(){
        return chassi;
    }

    //renavam
    public void setRenavam(String renavam) {
        this.renavam = renavam;
    }
        
    public String getRenavam(){
        return renavam;
    }

    //procedencia
    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }
        
    public String getProcedencia(){
        return procedencia;
    }

    //corExterna
    public void setCorExterna(String corExterna) {
        this.corExterna = corExterna;
    }
        
    public String getCorExterna(){
        return corExterna;
    }

    //corInterna
    public void setCorInterna(String corInterna) {
        this.corInterna = corInterna;
    }
        
    public String getCorInterna(){
        return corInterna;
    }

    //tipoCombustivel
    public void setTipoCombustivel(String tipoCombustivel) {
        this.tipoCombustivel = tipoCombustivel;
    }
        
    public String getTipoCombustivel(){
        return tipoCombustivel;
    }

    //motor
    public void setMotor(String motor) {
        this.motor = motor;
    }
        
    public String getMotor(){
        return motor;
    }

    //quilometragem
    public void setQuilometragem(int quilometragem) {
        this.quilometragem = quilometragem;
    }
        
    public int getQuilometragem() {
        return quilometragem;
    }

    //consumoMedio
    public void setConsumoMedio(double consumoMedio) {
        this.consumoMedio = consumoMedio;
    }
        
    public double getConsumoMedio() {
        return consumoMedio;
    }

    //numeroPortas
    public void setNumeroPortas(int numeroPortas) {
        this.numeroPortas = numeroPortas;
    }
        
    public int getNumeroPortas() {
        return numeroPortas;
    }
}