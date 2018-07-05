/*
DROP TABLE Celulares;
DROP TABLE Emails;
DROP TABLE Clientes;
DROP TABLE ContasPagar;
DROP TABLE ContasReceber;
*/

CREATE TABLE Clientes(Id INT IDENTITY, 
					  Nome TEXT NOT NULL, 
					  Sexo CHAR(1) NOT NULL);

ALTER TABLE Clientes ADD CONSTRAINT PKCliente PRIMARY KEY(Id);

CREATE TABLE Celulares(Id INT IDENTITY NOT NULL,
					   IdCliente INT NOT NULL, 
					   Valor TEXT NOT NULL, 
					   Ativo BIT DEFAULT 1);

ALTER TABLE Celulares ADD CONSTRAINT PKCelular PRIMARY KEY(Id);

CREATE TABLE Emails(Id INT IDENTITY NOT NULL, 
					IdCliente INT NOT NULL, 
					Valor TEXT NOT NULL, 
					Ativo BIT DEFAULT 1);

ALTER TABLE Emails ADD CONSTRAINT PKEmail PRIMARY KEY(Id);

CREATE TABLE ContasPagar(Id INT IDENTITY NOT NULL, 
						 IdCliente INT NOT NULL, 
						 Valor DECIMAL(8,2), 
						 DataVencimento DATE NOT NULL, 
						 ValorPago DECIMAL(8,2) DEFAULT 0, 
						 Status TEXT DEFAULT 'Pagar', 
						 Ativo BIT DEFAULT 1);

ALTER TABLE ContasPagar ADD CONSTRAINT PKContasPagar PRIMARY KEY(Id);

CREATE TABLE ContasReceber(Id INT IDENTITY NOT NULL,
						   IdCliente INT NOT NULL,
						   ValorReceber DECIMAL(8,2),
						   DataPagamento DATE,
						   ValorRecebido DECIMAL(8,2) DEFAULT 0,
						   DataRecebimento DATE,
						   Status TEXT DEFAULT 'Receber',
						   Ativo BIT DEFAULT 1);

ALTER TABLE ContasReceber ADD CONSTRAINT PKContasReceber PRIMARY KEY(Id);

ALTER TABLE Celulares ADD CONSTRAINT FKClienteCell FOREIGN KEY(IdCliente) REFERENCES Clientes(Id);
ALTER TABLE Emails ADD CONSTRAINT FKClienteEmail FOREIGN KEY(IdCliente) REFERENCES Clientes(Id);
ALTER TABLE ContasPagar ADD CONSTRAINT FKClienteContasP FOREIGN KEY(IdCliente) REFERENCES Clientes(Id);
ALTER TABLE ContasReceber ADD CONSTRAINT FKClienteContasR FOREIGN KEY(IdCliente) REFERENCES Clientes(Id);

INSERT INTO Clientes VALUES('Germana', 'F'),
						   ('Salvador', 'M'),
						   ('Úrsula', 'F'),
						   ('Aluísio', 'M');						   

INSERT INTO Celulares (IdCliente, Valor) VALUES
(1, '(79) 99973-5114'),
(2, '(27) 98390-6475'),
(1, '(55) 98587-4266'),
(4, '(14) 98387-5333'),
(3, '(92) 98983-2809'),
(4, '(55) 98616-2303');

INSERT INTO Emails (IdCliente, Valor) VALUES
(2, 'bernardodiegoalves-77@vianetfone.com.br'),
(1, 'a68341ef3b@emailna.life'),
(3, 'zpgkmkem@boximail.com'),
(1, 'ger@bol.com'),
(2, 'gabrieldiegofernandodarocha_@uoul.com'),
(3, 'iancauearaujo_@10clic.com.br'),
(1, 'germana@gmail.com'),
(2, 'salvador@hotmail.com');

/* Deu ruim, Tipo TEXT de Nome Clientes
INSERT INTO ContasReceber(IdCliente, DataRecebimento, ValorRecebido) VALUES 
((SELECT Id FROM Clientes WHERE Nome = 'Germana'), '2018-06-15', 500.00),
((SELECT Id FROM Clientes WHERE Nome = 'Salvador'), '2018-06-29', 320.50),
((SELECT Id FROM Clientes WHERE Nome = 'Úrsula'), '2018-06-07', 450.00),
((SELECT Id FROM Clientes WHERE Nome = 'Aluísio'), '2018-08-27', 1300.00),
((SELECT Id FROM Clientes WHERE Nome = 'Aluísio'), '2018-10-10', 777.00),
((SELECT Id FROM Clientes WHERE Nome = 'Úrsula'), '2018-10-14', 8001.00),
((SELECT Id FROM Clientes WHERE Nome = 'Salvador'), '2018-11-25', 232.12),
((SELECT Id FROM Clientes WHERE Nome = 'Úrsula'), '2018-09-13', 104.23),
((SELECT Id FROM Clientes WHERE Nome = 'Germana'), '2018-076-17', 65.00),
((SELECT Id FROM Clientes WHERE Nome = 'Aluísio'), '2018-10-06', 98.83),
((SELECT Id FROM Clientes WHERE Nome = 'Salvador'), '2018-12-12', 12.17),
((SELECT Id FROM Clientes WHERE Nome = 'Salvador'), '2018-12-23', 6.25);
INSERT INTO ContasReceber(IdCliente, DataRecebimento, ValorRecebido) VALUES
((SELECT Id FROM Clientes WHERE Nome = 'Úrsula'), '2018-12-08', 78.97),
((SELECT Id FROM Clientes WHERE Nome = 'Salvador'), '2018-11-24', 700.00),
((SELECT Id FROM Clientes WHERE Nome = 'Germana'), '2018-10-09', 45.87),
((SELECT Id FROM Clientes WHERE Nome = 'Germana'), '2019-04-01', 39.50),
((SELECT Id FROM Clientes WHERE Nome = 'Aluísio'), '2018-11-30', 123.45),
((SELECT Id FROM Clientes WHERE Nome = 'Úrsula'), '2018-09-07', 987.65),
((SELECT Id FROM Clientes WHERE Nome = 'Salvador'), '2018-07-06', 456.00);
*/