<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Execução do Programa</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <main>
        <?php 
            $nome = $_POST["nome"];
            $idade = $_POST["idade"];
            $city = $_POST["city"];
            
            echo "Nome: <strong> $nome </strong> <br>";
            echo "Idade: <strong> $idade </strong> <br>";
            echo "Cidade: <strong> $city </strong> <br>"; 

            $estadosSelecionados = $_POST['estados'];
                foreach ($estadosSelecionados as $estado) {
                    echo "UF: <strong>" . ($estado) . "</strong><br>";
            }
             
        ?>
    </main>
</body>
</html>
