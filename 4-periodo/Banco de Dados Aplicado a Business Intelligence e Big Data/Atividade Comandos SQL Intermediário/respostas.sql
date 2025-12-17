
-- 1. Exibir o nome dos alunos e o nome do curso em que estão matriculados.
select a.nome as aluno, c.nome as curso 
from dbo.Alunos as a
join dbo.Cursos as c
on a.id_curso = c.id_curso;


-- 2. Mostrar o total de livros emprestados por curso.
select c.nome as curso, count(*) as qtd_livros
from dbo.Livros as l
join dbo.Emprestimos as e
on l.id_livro = e.id_livro
join dbo.Alunos as a
on e.id_aluno = a.id_aluno
join dbo.Cursos as c
on a.id_curso = c.id_curso
group by c.nome;


-- 3. Exibir os alunos que fizeram mais de um empréstimo.
select a.nome as aluno, count(*) as qtd_emprestimo
from dbo.Alunos as a
join dbo.Emprestimos as e
on a.id_aluno = e.id_aluno
group by a.nome
having count(*) > 1;


-- 4. Mostrar os livros que nunca foram emprestados.
select l.titulo as livro, e.id_emprestimo as emprestimo
from dbo.Livros as l
full join dbo.Emprestimos as e
on l.id_livro = e.id_livro
where e.id_emprestimo is NULL;


-- 5. Exibir o nome dos alunos que fizeram reserva, mas não têm empréstimos.
select a.nome as aluno, r.id_reserva as reserva, e.id_emprestimo as emprestimo
from dbo.Alunos as a
join dbo.Reservas as r
on a.id_aluno = r.id_aluno
full join dbo.Emprestimos as e
on a.id_aluno = e.id_aluno
where e.id_emprestimo is NULL;


-- 6. Mostrar o livro mais recentemente publicado da biblioteca.
select * 
from dbo.Livros
where ano_publicacao = (select max(ano_publicacao) from dbo.Livros);


-- 7. Calcular a média de duração dos cursos disponíveis.
select avg(duracao_anos) as media_duracao_cursos 
from dbo.Cursos;


-- 8. Exibir o total de reservas feitas em cada dia.
select data_reserva, count(*) as tot_reservas 
from dbo.Reservas
group by data_reserva;


-- 9. Mostrar o aluno com o empréstimo mais recente.
select a.nome as aluno, e.data_emprestimo 
from dbo.Alunos as a
join dbo.Emprestimos as e
on a.id_aluno = e.id_aluno
where e.data_emprestimo = (select max(data_emprestimo) from dbo.Emprestimos);


-- 10. Exibir os cinco livros mais emprestados.
select top 5 l.titulo as livro, count(*) as qtd_emprestimos
from dbo.Livros as l
join dbo.Emprestimos as e
on l.id_livro = e.id_livro
group by l.titulo
order by qtd_emprestimos desc;


-- 11. Mostrar o percentual de livros atualmente disponíveis para empréstimo.
select 
    round(
        (cast(sum(case when disponibilidade = 1 then 1 else 0 end) as float) / count(*)) * 100, 2) as Percentual_Livros_Disponiveis
from dbo.Livros;

-- 12. Exibir os alunos e a quantidade de reservas que cada um fez (mesmo que zero).
select a.nome as aluno, count(r.id_reserva) as qtd_reservas
from dbo.Alunos as a
left join dbo.Reservas as r
on a.id_aluno = r.id_aluno
group by a.id_aluno, a.nome
order by qtd_reservas desc;


-- 13. Listar o nome do curso e o aluno mais antigo (menor ano_ingresso) de cada curso.
select c.nome as curso, a.nome as aluno_mais_antigo, a.ano_ingresso
from dbo.Cursos c
left join dbo.Alunos a
on a.id_curso = c.id_curso
where a.ano_ingresso = (select min(ano_ingresso) from dbo.Alunos where id_curso = c.id_curso);


-- 14. Exibir a quantidade de funcionários contratados por ano.
select year(data_contratacao) as ano_contratacao, count(*) as qtd_funcionarios 
from dbo.Funcionarios
group by year(data_contratacao)
order by ano_contratacao;


-- 15. Exibir, para cada aluno, o número de livros que ele pegou emprestado e o número de reservas realizadas.
SELECT
    a.id_aluno,
    a.nome,
    COUNT(DISTINCT e.id_emprestimo) AS total_emprestimos,
    COUNT(DISTINCT r.id_reserva) AS total_reservas
FROM dbo.Alunos AS a
LEFT JOIN dbo.Emprestimos AS e 
    ON a.id_aluno = e.id_aluno
LEFT JOIN dbo.Reservas AS r
    ON a.id_aluno = r.id_aluno
GROUP BY 
    a.id_aluno,
    a.nome
ORDER BY 
    a.id_aluno;