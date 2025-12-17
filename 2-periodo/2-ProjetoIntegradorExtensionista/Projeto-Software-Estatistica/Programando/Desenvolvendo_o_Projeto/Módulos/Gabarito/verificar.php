<?php
$gabarito = json_decode(file_get_contents('gabarito.json'), true);
$acertos = 0;
$erros = 0;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $respostasUsuario = json_decode($_POST['respostas'], true);

    if (is_array($respostasUsuario)) {
        foreach ($respostasUsuario as $questao => $resposta) {
            if (isset($gabarito[$questao]) && $gabarito[$questao] === $resposta) {
                $acertos++;
            } else {
                $erros++;
            }
        }
    }
}

$total = $acertos + $erros;

$grupo = $_POST['grupo'] ?? 'Grupo1';
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado Final</title>
    <link rel="stylesheet" href="resultado.css">
</head>
<body>
    <div class="resultado-container">
        <h1 class="titulo">PARABÉNS POR CONCLUIR!</h1>
        <div class="resultado-detalhes">
            <div class="card">
                <p>Total de Questões</p>
                <span class="numero"><?php echo $total; ?></span>
            </div>
            <div class="card">
                <p><span style="color: #27AE60;">Acertos</span></p>
                <span class="numero acertos"><?php echo $acertos; ?></span>
            </div>
            <div class="card">
                <p><span style="color: #E74C3C;">Erros</span></p>
                <span class="numero erros"><?php echo $erros; ?></span>
            </div>
        </div>
        <a href="../../Início, Mapa, Perfil e Sobre/mapa.html" class="botao-retorno" onclick="limparRespostas('<?php echo $grupo; ?>')">VOLTAR AO MAPA</a>

    </div>
</body>
</html>

