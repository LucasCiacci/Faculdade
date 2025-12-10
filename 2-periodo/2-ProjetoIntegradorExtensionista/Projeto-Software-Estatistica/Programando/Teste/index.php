<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercícios Práticos</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<?php
// Verifica qual questão está sendo respondida (1 ou 2)
$questao = isset($_GET['questao']) ? (int)$_GET['questao'] : 1;
?>

<div class="container">
    <h1>Exercício Prático</h1>

    <?php if ($questao == 1): ?>
        <!-- Questão 1 -->
        <h2>Questão 1</h2>
        <p>Fernando está avaliando o preço médio de sua tarifa de energia elétrica nos cinco primeiros meses do ano. A planilha mostra os valores por mês, de janeiro a maio.</p>
        <table>
            <tr>
                <th>Janeiro</th>
                <th>Fevereiro</th>
                <th>Março</th>
                <th>Abril</th>
                <th>Maio</th>
            </tr>
            <tr>
                <td>R$ 173,00</td>
                <td>R$ 113,58</td>
                <td>R$ 145,67</td>
                <td>R$ 98,50</td>
                <td>R$ 123,60</td>
            </tr>
        </table>
        <p>Sua meta é fechar o semestre com um preço médio de R$ 130,00. Para alcançar a meta, o maior preço possível a pagar na tarifa do mês de junho, será de:</p>

        <form method="GET" action="index.php">
            <input type="hidden" name="questao" value="2"> <!-- Vai para a questão 2 -->
            <label><input type="radio" name="resposta1" value="a"> a) R$ 109,05</label><br>
            <label><input type="radio" name="resposta1" value="b"> b) R$ 125,65</label><br>
            <label><input type="radio" name="resposta1" value="c"> c) R$ 130,87</label><br>
            <label><input type="radio" name="resposta1" value="d"> d) R$ 98,55</label><br>
            <button type="submit">Próximo</button>
        </form>

    <?php elseif ($questao == 2): ?>
        <!-- Questão 2 -->
        <h2>Questão 2</h2>
        <p>Em uma escola de Ensino Fundamental um concurso estabelece regras para conceder uma bolsa de estudos para o Ensino Médio. As notas dos quatro alunos finalistas são:</p>
        <table>
            <tr>
                <th></th>
                <th>1º Bimestre</th>
                <th>2º Bimestre</th>
                <th>3º Bimestre</th>
                <th>4º Bimestre</th>
            </tr>
            <tr>
                <td>Aluno A</td>
                <td>75</td>
                <td>86</td>
                <td>83</td>
                <td>91</td>
            </tr>
            <tr>
                <td>Aluno B</td>
                <td>78</td>
                <td>98</td>
                <td>67</td>
                <td>99</td>
            </tr>
            <tr>
                <td>Aluno C</td>
                <td>83</td>
                <td>84</td>
                <td>89</td>
                <td>87</td>
            </tr>
            <tr>
                <td>Aluno D</td>
                <td>98</td>
                <td>65</td>
                <td>87</td>
                <td>77</td>
            </tr>
        </table>
        <p>O aluno que ganhou a bolsa de estudos foi:</p>

        <form method="GET" action="index.php">
            <label><input type="radio" name="resposta2" value="a"> a) o aluno A.</label><br>
            <label><input type="radio" name="resposta2" value="b"> b) o aluno B.</label><br>
            <label><input type="radio" name="resposta2" value="c"> c) o aluno C.</label><br>
            <label><input type="radio" name="resposta2" value="d"> d) o aluno D.</label><br>
            <button type="submit">Enviar Resposta</button>
        </form>

    <?php endif; ?>
</div>

</body>
</html>
