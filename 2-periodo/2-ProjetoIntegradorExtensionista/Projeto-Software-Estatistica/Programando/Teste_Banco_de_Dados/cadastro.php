<?php
require_once 'BancoDeDados/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim($_POST['nome']);
    $email = trim($_POST['email']);
    $senha = password_hash(trim($_POST['senha']), PASSWORD_DEFAULT);

    try {
        $stmt = $pdo->prepare("INSERT INTO users (nome, email, senha) VALUES (?, ?, ?)");
        $stmt->execute([$nome, $email, $senha]);
        header("Location: login.html?success=1");
        exit;
    } catch (Exception $e) {
        header("Location: cadastro.html?error=E-mail já cadastrado.");
        exit;
    }
}
?>
