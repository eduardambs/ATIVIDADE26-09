/* laboratório 3*/

create database if not exists academico_2023;
use academico_2023;

create table if not exists curso
(idCurso        char(3)      not null,
 nome           varchar(30)  not null,
 coordenador    Varchar(20)  not null,
 primary key(idCurso));


create table if not exists aluno
(prontuario     char(8)      not null,
 nome           varchar(30)  not null,
 endereco       Varchar(30)  not null,
 RG             char(11)     not null,
 idCurso        char(3)      not null,
 primary key(prontuario),
 foreign key (idCurso) references curso(idCurso));


create table if not exists disciplina
(idDisciplina   integer      not null,
 idCurso        char(3)      not null,
 nomeDis        varchar(30)  not null,
 numCreditos    integer      not null,
 primary key(idDisciplina),
 foreign key (idCurso) references curso(idCurso));

create table if not exists boletim
(idDisciplina   integer      not null,
 prontuario     char(8)      not null,
 nota           decimal(4,2)  not null,
 primary key (idDisciplina,prontuario),
 foreign key(idDisciplina) references disciplina(idDisciplina),
 foreign key(prontuario) references aluno(prontuario));
 
insert into CURSO
values ('ADS', 'Analise de Sistemas','Antonio'),
       ('MSI','Informatica','Rubens');

/* inserir dados na tabela aluno*/
insert into ALUNO
values ('12345678','Maria das Dores','Rua das Flores,100','010101','ADS'),
       ('12345677','Joao do Pulo','Rua das Flores,200','02020202','MSI'),
       ('12345688','Almerinda de Jesus','Rua das Orquideas,500','303030','ADS');

/* inserir dados na tabela disciplina*/
insert into DISCIPLINA
values (1,'ADS','Banco de Dados',5),
       (2,'ADS','Lógica de Programação',5),
       (3,'ADS','Informática',3),
       (4,'ADS','Engenharia de Software',5);

/* inserir dados na tabela boletim*/
insert into BOLETIM
values (1,'12345678',6.0),
       (1,'12345677',8.0),
       (1,'12345688',2.3),
       (2,'12345678',5.0),
       (2,'12345677',10.0),
       (3,'12345688',2.3);
       
# Listar todos os alunos cadastrados na tabela ALUNO
SELECT * FROM ALUNO;

# Listar da tabela CURSO, o IDCURSO e o nome
SELECT IDCURSO, nome FROM CURSO;

# Selecionar todos os alunos com prontuário diferente de 12345678
SELECT * FROM ALUNO WHERE PRONTUARIO <> 12345678;

# Selecionar todos os alunos com nota>6 da disciplina banco de dados
SELECT * FROM BOLETIM, ALUNO WHERE NOTA >6 AND IDDISCIPLINA=1;

# Verificar o que acontece se tentar inserir um aluno com os seguintes dados.
DESC ALUNO;
INSERT INTO ALUNO VALUES
(232323, 'Marcos Santos', null, '66666', 'MSI');
ALTER TABLE ALUNO MODIFY ENDERECO VARCHAR(30) NULL;
INSERT INTO ALUNO VALUES (232323, 'Marcos Santos', NULL, '66666', 'MSI');
SELECT * FROM ALUNO;

# Selecionar os alunos cujo nomes comecem com “M”
SELECT * FROM ALUNO WHERE NOME LIKE 'M%';

# Inserir dados no boletim para o aluno Marcos Santos sendo
INSERT INTO BOLETIM VALUES 
(1, 232323, 8.5),
(2,232323, 7.3);

# Mostrar os alunos cujas notas sejam maiores que 4 e menores que 6. 
SELECT * FROM BOLETIM WHERE NOTA>4 AND NOTA<6;

# Selecionar os alunos cujos nomes não comecem com M
SELECT * FROM ALUNO WHERE NOME NOT LIKE 'M%';

# Exibir os alunos com endereço nulo. 
SELECT * FROM ALUNO WHERE ENDERECO IS NULL;

# Calcular a média das notas de todos os alunos que frequentaram a disciplina de Lógica. Exibir o título da coluna como ‘média notas’ e usar a nota com 1 casa decimal. 
SELECT FORMAT (AVG(NOTA), 1) AS 'MÉDIA NOTA' FROM BOLETIM WHERE IDDISCIPLINA=2;

# Contar quantos alunos estão cadastrados. 
SELECT COUNT(*) FROM ALUNO;

/*----------------------AGRUPAMENTO-------------------*/
# Exibir a nota média por disciplina; 
