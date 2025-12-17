<?php 
    global $pdo;
    require_once ("conexao.php");
    require_once ("Usuarios.php");

    $usuario = new Usuarios($pdo);

    // Obtém o ID do usuário a partir da URL
    $id = $_GET['id'];

    // Exclui o usuário
    $deletar = $usuario->excluir($id);
    
    // Verifica se a exclusão foi bem-sucedida
    if ($deletar) {
        header('Location: index.php'); // Redireciona para a página inicial
        exit(); // Encerra o código
    } else {
        echo "Erro ao excluir o usuário.";
    }


   