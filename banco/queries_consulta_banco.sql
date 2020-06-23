-- valida acesso do usuario no sistema
select * from alunos where SENHA = '123456' AND EMAIL_USUARIO = 'jsnogueira.web@gmail.com';

-- recuperar a senha a partir do email
select SENHA from alunos where EMAIL_USUARIO = 'jsnogueira.web@gmail.com';

-- busca cursos ordenados e o nome da categoria, ordenados pela categoria
select CATEGORIA_ID_CATEGORIA as ID, c.NOME, DESCRICAO, FOTO, cat.NOME CATEGORIA from cursos c inner join categorias cat on c.CATEGORIA_ID_CATEGORIA = cat.ID_CATEGORIA order by CATEGORIA_ID_CATEGORIA;

-- busca aulas de um curso pelo ID do curso 
select ID_AULA, TITULO, DESCRICAO from aulas WHERE CURSO_ID_CURSO = 2;

-- busca aulas de um curso pelo Id do curso e mostra se o usuario ja fez a aula
select ID_AULA, TITULO, DESCRICAO, pa.DATA_PROGRESSO as DATA_REALIZACAO from aulas a LEFT JOIN progresso_aulas pa on a.ID_AULA = pa.AULAS_ID_AULA AND pa.cadastro_ID_USUARIO = 2 WHERE a.CURSO_ID_CURSO = 2;

-- busca conteudo da aula pelo id da aula
select ID_AULA, TITULO, DESCRICAO, CONTEUDO_AULA from aulas WHERE ID_AULA = 1;

-- busca progresso do aluno em um curso pelo ID do aluno e Id do curso (ex: aluno 2 e curso 2)
select 
	(select count(*) as progresso from progresso_aulas pa inner join aulas a on pa.AULAS_ID_AULA = a.ID_AULA WHERE a.CURSO_ID_CURSO = 2 AND pa.cadastro_ID_USUARIO = 2) / 
	(select count(*)  from aulas a WHERE a.CURSO_ID_CURSO = 2) * 100 as PROGRESSO
    
    
-- consulta questionario de avaliacao de um curso

-- consultar alternativas de uma questão
    
-- consulta se aluno passou na prova
    