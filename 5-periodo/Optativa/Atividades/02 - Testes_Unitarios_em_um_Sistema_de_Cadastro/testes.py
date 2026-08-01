import unittest
from sistema import cadastrarAluno, emails_cadastrados

class TestCadastroAluno(unittest.TestCase):
    def setUp(self):
        emails_cadastrados.clear()

    def test_cadastro_valido_completo(self):
        aluno = cadastrarAluno("Joao", 20, "joao@email.com", 8)
        self.assertEqual(aluno["status"], "Aprovado")


    def test_email_duplicado(self):
        cadastrarAluno("Joao", 20, "teste@email.com", 8)
        with self.assertRaises(ValueError):
            cadastrarAluno("Maria", 20, "teste@email.com", 8)


    def test_nome_vazio(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("", 20, "joaovazio@email.com", 8)
    def test_nome_menos_3(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("JP", 20, "joaomenos3@email.com", 8)


    def test_idade_menor_16(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("Joao", 10, "joaomenor16@email.com", 8)
    def test_idade_maior_100(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("Joao", 200, "joaomaior100@email.com", 8)


    def test_email_sem_arroba(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("Joao", 20, "joaosemarrobaemail.com", 8)
    def test_email_sem_ponto(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("Joao", 20, "joaosemponto@emailcom", 8)


    def test_nota_menor_0(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("Joao", 20, "joaomenor0@email.com", -1)
    def test_nota_maior_10(self):
        with self.assertRaises(ValueError):
            cadastrarAluno("Joao", 20, "joaomaior10@email.com", 11)


    def test_status_nota_7(self):
        aluno = cadastrarAluno("Joao", 20, "joaonota7@email.com", 7)
        self.assertEqual(aluno["status"], "Aprovado")
    def test_status_nota_10(self):
        aluno = cadastrarAluno("Joao", 20, "joaonota10@email.com", 10)
        self.assertEqual(aluno["status"], "Aprovado")
    def test_status_nota_6_9(self):
        aluno = cadastrarAluno("Joao", 20, "joaonota6.9@email.com", 6.9)
        self.assertEqual(aluno["status"], "Reprovado")
    def test_status_nota_0(self):
        aluno = cadastrarAluno("Joao", 20, "joaonota0@email.com", 0)
        self.assertEqual(aluno["status"], "Reprovado")


#PROGRAMA PRINCIPAL:
if __name__ == "__main__":
    unittest.main()
