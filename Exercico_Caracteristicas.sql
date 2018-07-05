----CARACTERISTICAS-----


/*ALTER TABLE CaracteristicasAluno DROP CONSTRAINT FKCaracteristica;
ALTER TABLE CaracteristicasAluno DROP CONSTRAINT FKAluno;
DROP TABLE CaracteristicasAluno;
DROP TABLE Caracteristicas;
DROP TABLE Alunos;*/

CREATE TABLE Alunos(Id INT IDENTITY, Nome VARCHAR(200), Idade TINYINT);
ALTER TABLE Alunos ADD CONSTRAINT PKAlunos PRIMARY KEY(Id);

CREATE TABLE Caracteristicas(Id INT IDENTITY, Nome VARCHAR(150));
ALTER TABLE Caracteristicas ADD CONSTRAINT PKCaracteristica PRIMARY KEY(Id);

CREATE TABLE CaracteristicasAluno(Id INT IDENTITY, IdCaracteristica INT NOT NULL, IdAluno INT NOT NULL);
ALTER TABLE CaracteristicasAluno ADD CONSTRAINT PKCaracteristicasAluno PRIMARY KEY(Id);

ALTER TABLE CaracteristicasAluno ADD CONSTRAINT FKCaracteristica FOREIGN KEY(IdCaracteristica) REFERENCES Caracteristicas(Id);
ALTER TABLE CaracteristicasAluno ADD CONSTRAINT FKAluno FOREIGN KEY(IdAluno) REFERENCES Alunos(Id);

INSERT INTO Caracteristicas VALUES ('Egoísta'),
								   ('Organizado(a)'),
								   ('Pontual'),
								   ('Criativo(a)'),
								   ('Proativo(a)'),
								   ('Altruísta'),
								   ('Pessimista'),
								   ('Flexível'),
								   ('Observadora'),
								   ('Paciente'),
								   ('Indelicado(a)'),
								   ('Desobediente'),
								   ('Intolerante'),
								   ('Empático(a)'),
								   ('Sensível');

INSERT INTO Alunos (Nome, Idade) VALUES ('Alice', 18),
									    ('Sophia', 4),
									    ('Miguel', 9),
									    ('Heitor', 23),
									    ('Valentina', 15),
									    ('Joaquim', 49);										


INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Alice'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Organizado(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Alice'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Altruísta'));									   

INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES 
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Pontual')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Observadora')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Desobediente')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Egoísta')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Sensível'));									   

INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Miguel'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Criativo(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Miguel'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Intolerante'));									   

INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Egoísta')),
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Proativo(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Indelicado(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Egoísta'));									   

INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Valentina'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Pessimista'));									   

INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Flexível')),
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Paciente')),
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Empático(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Altruísta'));						  


/*Execute os seguintes comandos abaixo:
Selecione o nome do aluno e as características;
Selecione a quantidade de alunos que que são altruístas;
Selecione a quantidade de alunos para cada categoria,
agrupando pela categoria;
Selecione as características da aluna Sophia.*/




SELECT 
name 'Nome', categories.name 'Categoria' 
FROM Alunos
JOIN categorias ON (Caracteristicas.id = Alunos.idCaracteristicas)
WHERE name = '' AND caracteristicas = ''
ORDER BY Nome DESC;

SELECT a.Nome, a.Idade, c.Nome 'Características'
FROM Alunos a
LEFT JOIN CaracteristicasAluno ca
ON ca.IdAluno = a.Id
LEFT JOIN Caracteristicas c
ON ca.IdCaracteristica = c.Id ORDER BY a.Nome;

SELECT a.Nome,'Nome'
FROM Alunos a
LEFT JOIN Alunos ca
ON ca.IdAluno = a.Id
LEFT JOIN Altruístas 
ON ca.IdNames = c.Id ORDER BY a.Nome;

SELECT Alunos, COUNT (Nome.id) 'Quantidade de Alunos'
FROM Alunos
JOIN Alunos ON(Alunos.idCategorias = Categorias.id)
GROUP BY  Categorias.name
ORDER BY COUNT (Alunos.id)DESC;

SELECT COUNT (Nomes.id) 'Caracteristicas da aluna Sophia '
FROM Alunos
JOIN Alunos ON(Alunos.idCategoria = IdNome)
WHERE categories.name = 'Sophia';

