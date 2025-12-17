-- 1. Listar todos os livros reservados por alunos e a data da reserva.
select a.nome as aluno, l.titulo as livro, r.data_reserva
from dbo.Alunos as a 
join dbo.Reservas as r
on a.id_aluno = r.id_aluno
join dbo.Livros as l
on l.id_livro = r.id_livro;


-- 2. Mostrar os cursos disponíveis com a sua duração.
select nome as nome_curso, duracao_anos from dbo.Cursos;


-- 3. Quantos alunos estão matriculados em cada curso?
select c.nome as curso, count(a.id_aluno) as qtd_alunos
from dbo.Alunos as a 
right join dbo.Cursos as c
on a.id_curso = c.id_curso
group by c.nome;


-- 4. Quais funcionários foram contratados antes de 2020?
select nome, data_contratacao from dbo.Funcionarios
where data_contratacao < '2020-01-01';


-- 5. Listar os livros que foram emprestados mas já foram devolvidos.
select a.nome as aluno, l.titulo as livro, e.data_emprestimo, e.data_devolucao
from dbo.Alunos as a
join dbo.Emprestimos as e
on a.id_aluno = e.id_aluno
join dbo.Livros as l
on l.id_livro = e.id_livro
where e.data_devolucao is not null;


-- 6. Inserir um novo aluno no curso de ADS com matrícula fictícia -> 
-- (-> NÃO É CONSULTA)


-- 7. Atualizar o nome do livro 'Banco de Dados: Projeto e Implementação' para incluir (2ª Edição)
-- (-> NÃO É CONSULTA)


-- 8. Excluir as reservas feitas antes do dia 16/10/2025
-- (-> NÃO É CONSULTA)


-- 9. Listar os alunos que reservaram e também emprestaram.
select a.nome as aluno
from dbo.Alunos as a
join dbo.Emprestimos as e
on a.id_aluno = e.id_aluno
join dbo.Reservas as r
on a.id_aluno = r.id_aluno;


-- 10. Mostrar o título dos livros e quantas vezes cada um foi emprestado.
select l.titulo, count(e.id_livro) as qtd_emprestimo
from dbo.Livros as l
left join dbo.Emprestimos as e
on l.id_livro = e.id_livro
group by l.titulo;


-- 11. Listar todos os alunos cadastrados.
select * from dbo.Alunos;


-- 12. Mostrar os títulos dos livros disponíveis para empréstimo.
select titulo from dbo.Livros
where disponibilidade = 1;


-- 13. Quais alunos pegaram livros emprestados e ainda não devolveram?
select a.nome as aluno, l.titulo as livro, e.data_emprestimo, e.data_devolucao
from dbo.Alunos as a
join dbo.Emprestimos as e
on a.id_aluno = e.id_aluno
join dbo.Livros as l
on l.id_livro = e.id_livro
where e.data_devolucao is NULL;


-- 14. Quantos livros estão emprestados atualmente?
select count(*) as qtd_livros
from dbo.Livros as l
join dbo.Emprestimos as e
on l.id_livro = e.id_livro
where data_devolucao is NULL;


-- 15. Lista de cursos com número de alunos cadastrados.
select c.nome as curso, count(a.id_aluno) as qtd_alunos
from dbo.Alunos as a 
right join dbo.Cursos as c
on a.id_curso = c.id_curso
group by c.nome;


-- 16. Atualizar a disponibilidade de um livro devolvido.
-- (-> NÃO É CONSULTA)


-- 17. Listar os alunos que nunca fizeram empréstimos.
select a.nome as aluno, e.id_emprestimo
from dbo.Alunos as a
left join dbo.Emprestimos as e
on a.id_aluno = e.id_aluno
where e.id_emprestimo is NULL;

-- 18. Criar uma view para facilitar a visualização de todos os empréstimos ativos.
-- (-> NÃO É CONSULTA)


-- 19. Excluir alunos que se formaram há mais de 5 anos (ano_ingresso < 2020).
-- (-> NÃO É CONSULTA)