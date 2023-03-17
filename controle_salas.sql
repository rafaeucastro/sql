create database controle_salas;
show databases;
use controle_salas;

create TABLE professores(
    id int PRIMARY KEY auto_increment,
    nome varchar(50) not null
);

show columns from professores;

create TABLE salas(
    id varchar(4) PRIMARY KEY,
    descricao varchar(50),
    esta_livre boolean not null default 1,
    professor_responsavel int,
    FOREIGN key(professor_responsavel) REFERENCES professores(id)
);

ALTER TABLE salas ADD COLUMN disponivel varchar(4);

-- TRIGGERS
create trigger tr_sala_disponivel
before insert on salas
for each row
begin
	if new.esta_livre = TRUE then
		set new.disponivel = 'Sim';
		set new.professor_responsavel = null;
	else
		set new.disponivel = 'Não';
	end if;
end

create trigger tr_sala_disponivel_update
before update on salas
for each row
BEGIN
	if new.esta_livre = TRUE then
		set new.disponivel = 'Sim';
		set new.professor_responsavel = null;
	else
		set new.disponivel = 'Não';
		
	end if;
end

INSERT INTO professores(nome) values ("Alex Lacerda");
INSERT INTO professores(nome) values ("Diana Mabel");
INSERT INTO professores(nome) values ("Manoel Lopes");

INSERT INTO salas(id, descricao, esta_livre) values ("B1S2", "Sala de aula", TRUE);
INSERT INTO salas(id, descricao, esta_livre, professor_responsavel) values ("B1S3", "Laboratório de Redes", FALSE, 1);
INSERT INTO salas(id, descricao, esta_livre, professor_responsavel) values ("B1S1", "Laboratório de informática", FALSE, 3);

CREATE VIEW vw_salas_livres AS
SELECT s.id AS "Código",
s.descricao AS "Descrição",
s.esta_livre AS "Está livre",
p.nome AS "Professor responsável"
FROM salas AS s
inner JOIN professores AS p
ON s.professor_responsavel = p.id;

select * from vw_salas_livres;

ALTER VIEW vw_salas_livres AS
SELECT s.id AS "Código",
s.descricao AS "Descrição",
s.disponivel AS "Está disponível",
p.nome AS "Professor responsável"
FROM salas AS s
inner JOIN professores AS p
ON s.professor_responsavel = p.id;

select * from vw_salas_livres;

-- Atualizando status da sala
update salas set esta_livre = true where professor_responsavel = 1; 

select * from vw_salas_livres;