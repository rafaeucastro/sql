CREATE database darmlabs;

use darmlabs;

CREATE TABLE funcoes(
	id int PRIMARY KEY auto_increment,
	nome varchar(50) NOT NULL,
	valor_bolsa float NOT NULL
);

CREATE TABLE bolsistas(
	id int PRIMARY KEY auto_increment,
	nome_aluno varchar(100) NOT NULL,
	nome_curso varchar(50) NOT null,
	id_funcao int,
	tem_experiencia tinyint,
	foreign key(id_funcao) references funcoes(id)
);

INSERT INTO funcoes(nome, valor_bolsa) VALUES ("Programador Web", 1900);
INSERT INTO funcoes(nome, valor_bolsa) VALUES ("Mobile Dev", 1500);
INSERT INTO funcoes(nome, valor_bolsa) VALUES ("Programador IA", 2000);
INSERT INTO funcoes(nome, valor_bolsa) VALUES ("UX/UI", 1750);
INSERT INTO funcoes(nome, valor_bolsa) VALUES ("GP", 100);

INSERT into bolsistas(nome_aluno, nome_curso, tem_experiencia) VALUES ("Rafael", "ADS", 1);
INSERT into bolsistas(nome_aluno, nome_curso, tem_experiencia, id_funcao) VALUES ("João", "ADS", 0, 4);
INSERT into bolsistas(nome_aluno, nome_curso, tem_experiencia, id_funcao) VALUES ("Pedro", "Redes", 1, 2);
INSERT into bolsistas(nome_aluno, nome_curso, tem_experiencia, id_funcao) VALUES ("Marcelo", "Redes", 1, 3);
INSERT into bolsistas(nome_aluno, nome_curso, tem_experiencia, id_funcao) VALUES ("Roberto", "Eletronica", 0, 2);
INSERT into bolsistas(nome_aluno, nome_curso, tem_experiencia, id_funcao) VALUES ("Sarah", "Eletronica", 1, 1);
INSERT into bolsistas(nome_aluno, nome_curso, tem_experiencia, id_funcao) VALUES ("Manu", "ADS", 1, 2);

select b.nome_aluno as aluno, b.nome_curso as curso, f.nome as funcao, f.valor_bolsa, b.tem_experiencia from bolsistas as b inner join funcoes as f on f.id = b.id_funcao;
select b.nome_aluno as aluno, b.nome_curso as curso, f.nome as funcao, f.valor_bolsa, b.tem_experiencia from bolsistas as b left join funcoes as f on f.id = b.id_funcao;

select nome_curso, count(id) from bolsistas group by nome_curso;

select min(valor_bolsa) from funcoes;
select max(valor_bolsa) from funcoes;
select sum(valor_bolsa) from funcoes;
select avg(valor_bolsa) from funcoes;

select * from funcoes where valor_bolsa = (select max(valor_bolsa) from funcoes);

select * from funcoes order by nome desc;