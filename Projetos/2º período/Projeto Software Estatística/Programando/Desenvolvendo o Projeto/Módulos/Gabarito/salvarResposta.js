function salvarResposta(questao, proximaPagina, finalizar = false, grupo = 'Grupo1.1') {
    const respostaSelecionada = document.querySelector(`input[name="${questao}"]:checked`);

    if (!respostaSelecionada) {
        alert("Por favor, selecione uma resposta antes de continuar.");
        return;
    }

    // Obter respostas específicas para o grupo
    let respostasJSON = JSON.parse(localStorage.getItem(`respostas${grupo}`)) || {};
    
    // Atualizar com a nova resposta
    respostasJSON[questao] = respostaSelecionada.value;
    localStorage.setItem(`respostas${grupo}`, JSON.stringify(respostasJSON));

    if (finalizar) {
        // Preencher o campo oculto e enviar o formulário
        const respostas = localStorage.getItem(`respostas${grupo}`);
        document.getElementById('respostas').value = respostas || '{}';
        document.getElementById('questionario').submit();
    } else if (proximaPagina) {
        // Redirecionar para a próxima página
        window.location.href = proximaPagina;
    }
}

function limparRespostas(grupo) {
    localStorage.removeItem(`respostas${grupo}`);
}
