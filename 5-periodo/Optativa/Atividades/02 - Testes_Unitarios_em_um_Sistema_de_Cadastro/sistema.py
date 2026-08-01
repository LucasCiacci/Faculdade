emails_cadastrados = []

def cadastrarAluno(nome, idade, email, nota_final):
    if email in emails_cadastrados:
        raise ValueError("Email já cadastrado!")

    if len(nome) < 3 or nome == "":
        raise ValueError("Nome inválido!")

    if not(16 <= idade <= 100):
        raise ValueError("Idade inválida!")

    if "@" not in email or "." not in email:
        raise ValueError("Email inválido!")

    if not(0 <= nota_final <= 10):
        raise ValueError("Nota inválida!")

    if nota_final >= 7:
        status = "Aprovado"
    else:
        status = "Reprovado"

    emails_cadastrados.append(email)

    return {
        "nome": nome,
        "idade": idade,
        "email": email,
        "nota_final": nota_final,
        "status": status
    }







