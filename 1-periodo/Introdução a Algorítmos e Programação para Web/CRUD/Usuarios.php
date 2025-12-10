<?php 

require_once("conexao.php");

//Criando a classe Usuarios
class Usuarios {
    private PDO $pdo;

    // Criando o método construtor
    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    
    //Criando as funções:

    //Função listarTodos (Listar usuarios)
    public function listarTodos () {
        //Comando sql
        $sql = "SELECT * from usuarios"; 
        
        //prepare
        $stmt = $this->pdo->prepare($sql);
        
        $stmt->execute(); //executando

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    
    //Função inserir (Cadastrar novo usuário)
    public function inserir ($nome, $email, $senha) {
        //Comando sql
        $sql = "INSERT INTO usuarios (id, nome, email, senha) VALUES (NULL, :nome, :email, :senha)";
        
        //prepare
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':email', $email);

        $sha1 = sha1($senha); //sha1 para a senha
        $stmt->bindParam(':senha', $sha1);

        $stmt->execute(); //executando

        return $this->pdo->lastInsertId();
    }


    //Função atualizar (Editar usuário)
    public function atualizar ($id, $nome, $email, $senha) {
        //Comando sql
        $sql = "UPDATE usuarios SET nome = :nome, email = :email, senha = :senha WHERE id = :id";  
        
        //prepare
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':email', $email);
        
        $sha1 = sha1($senha); //sha1 para a senha
        $stmt->bindParam(':senha', $sha1);
        
        $stmt->execute(); //executando

        return $stmt->rowCount();
    }


    //Função excluir (Excluir usuario)
    public function excluir ($id) {
        //Comando sql
        $sql = "DELETE from usuarios WHERE id = :id";
        
        //prepare
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);

        $stmt->execute(); //executando

        return $stmt->rowCount();
    }
}