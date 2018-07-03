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

-- Alice
INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Alice'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Organizado(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Alice'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Altruísta'));									   

-- Sophia
INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES 
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Pontual')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Observadora')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Desobediente')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Egoísta')),
((SELECT Id FROM Alunos WHERE Nome = 'Sophia'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Sensível'));									   

-- Miguel
INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Miguel'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Criativo(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Miguel'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Intolerante'));									   

-- Heitor
INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Egoísta')),
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Proativo(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Indelicado(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Heitor'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Egoísta'));									   

-- Valentina
INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Valentina'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Pessimista'));									   

-- Joaquim
INSERT INTO CaracteristicasAluno (IdAluno, IdCaracteristica) VALUES
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Flexível')),
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Paciente')),
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Empático(a)')),
((SELECT Id FROM Alunos WHERE Nome = 'Joaquim'),(SELECT Id FROM Caracteristicas WHERE Nome = 'Altruísta'));						  


SELECT a.Nome, a.Idade, c.Nome 'Características'
FROM Alunos a
LEFT JOIN CaracteristicasAluno ca
ON ca.IdAluno = a.Id
LEFT JOIN Caracteristicas c
ON ca.IdCaracteristica = c.Id ORDER BY a.Nome;