-- Venda de carros --

DROP TABLE carros; -- Para apagar determinados dados
DROP TABLE pessoas;

-- Criação das tabelas

CREATE TABLE Pessoas(Id INT IDENTITY, 
Nome			VARCHAR(200), 
Cpf				VARCHAR(15));

ALTER TABLE Pessoas ADD CONSTRAINT PKPesoas PRIMARY KEY(Id);

CREATE TABLE Carros(Id INT IDENTITY, 
IdPessoa			INT, 
Marca				VARCHAR(150) NOT NULL, 
Modelo				VARCHAR(150) NOT NULL, 
AnoLancamento		INT NOT NULL, 
AnoFabricacao		INT NOT NULL,
Motor				VARCHAR(30),
Cor					VARCHAR(100),
Preco				DECIMAL(9,2));

ALTER TABLE Carros ADD CONSTRAINT PKCarros PRIMARY KEY(Id);
ALTER TABLE Carros ADD CONSTRAINT FKPessoas FOREIGN KEY(IdPessoa) REFERENCES Pessoas(Id);

INSERT INTO Pessoas VALUES
('Abraão Nobre', '952.328.294-83'),
('Severino Braga', '876.770.333-00'),
('Samuel Faria', '989.272.034-29'),
('Florêncio Robalo', '362.635.174-25');

INSERT INTO Carros(IdPessoa, Marca, Modelo, AnoLancamento, AnoFabricacao, Motor, Cor, Preco)VALUES
((SELECT Id FROM Pessoas WHERE Nome = 'Abraão Nobre'), 'Volkswagen', 'Gol', 2010, 2009, '8v Power Flex', 'Vermelho', 18000.00);

INSERT INTO Carros(IdPessoa, Marca, Modelo, AnoLancamento, AnoFabricacao, Motor, Cor, Preco)VALUES
((SELECT Id FROM Pessoas WHERE Nome = 'Severino Braga'), 'Fiat', 'Bravo', 2000, 1999, 'SX 1.6 16V', 'Cinza', 9000.00);

INSERT INTO Carros(IdPessoa, Marca, Modelo, AnoLancamento, AnoFabricacao, Motor, Cor, Preco)VALUES
((SELECT Id FROM Pessoas WHERE Nome = 'Samuel Faria'), 'Renault', 'Clio', 1997, 1996, '1.0 8v', 'Verde', 5500.00);

INSERT INTO Carros(IdPessoa, Marca, Modelo, AnoLancamento, AnoFabricacao, Motor, Cor, Preco)VALUES
((SELECT Id FROM Pessoas WHERE Nome = 'Florêncio Robalo'), 'Volkswagen', 'Golf', 1994, 1994, '2.0 120cv', 'Azul', 17000.00);

SELECT * FROM Carros;
SELECT * FROM Pessoas;


