DROP DATABASE IF EXISTS Restaurante; 

CREATE DATABASE Restaurante; 

USE Restaurante; 

-- Tabela de 
CREATE TABLE IF NOT EXISTS Clientes( 
	ID_cliente int(8) AUTO_INCREMENT, 
	CPF varchar(11) not null, 
	Nome varchar(255),
	Sexo varchar(255),
	Idade varchar(3),
	Endereco varchar(255), 
	Email varchar(255), 
	Telefone varchar(12),
	Data_cadastro datetime, 
	PRIMARY KEY (ID_cliente) 
);

-- Tabela de Clientes 
CREATE TABLE IF NOT EXISTS Filiais( 
	ID_filial int(3) AUTO_INCREMENT, 
	Endereco varchar(255), 
	Email varchar(255), 
	Telefone varchar(12), 
	Quant_mesas int(3), 
	Avaliacao decimal(4,2), 
	PRIMARY KEY (ID_filial) 
);

-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS Funcionarios( 
	ID_func int(5) AUTO_INCREMENT, 
	CPF varchar(11) not null, 
	Nome varchar(255),
	Sexo varchar(255),
	Idade varchar(3),
	Endereco varchar(255), 
	Email varchar(255), 
	Telefone varchar(12), 
	ID_filial int(3),
	Cargo varchar(255),
	Data_contatacao datetime,
	PRIMARY KEY (ID_func), 
	FOREIGN KEY (ID_filial) REFERENCES Filiais(ID_filial)
); 

-- Tabela de Reservas
CREATE TABLE IF NOT EXISTS Reservas(
	ID_reserva int(5) AUTO_INCREMENT not null,
	Data_reserva datetime, 
	ID_cliente int(8), 
	Mesa varchar(2),
	ID_filial int(3),
	Capacidade varchar(2),
	PRIMARY KEY (ID_reserva),
	FOREIGN KEY (ID_cliente) REFERENCES Clientes (ID_cliente),
	FOREIGN KEY (ID_filial) REFERENCES Filiais(ID_filial)
); 

-- Tabela de Fornecedores
CREATE TABLE IF NOT EXISTS Fornecedores(
	Nome varchar(255),
	ID_fornecedor int(5) AUTO_INCREMENT, 
	CNPJ varchar(14),
	Tipo_material varchar(255),
	Email varchar(255), 
	Telefone varchar(12), 
	Valor_material decimal(8,2), 
	PRIMARY KEY (ID_fornecedor) 
); 

-- Tabela de Estoque
CREATE TABLE IF NOT EXISTS Estoque( 
	ID_fornecedor int(5), 
	ID_materia varchar(6) AUTO_INCREMENT, 
	Quantidade int(5),
	ID_filial int(3),
	PRIMARY KEY (ID_materia), 
	FOREIGN KEY (ID_fornecedor) REFERENCES Fornecedores (ID_fornecedor),
	FOREIGN KEY (ID_filial) REFERENCES Filiais(ID_filial)
);  

-- Tabela de Pratos
CREATE TABLE IF NOT EXISTS Pratos( 
	ID_prato int(3) AUTO_INCREMENT,
	Nome varchar(255),
	Descricao varchar(255),
	Valor decimal(5,2),
	PRIMARY KEY (ID_prato) 
); 

-- Tabela de Bebidas
CREATE TABLE IF NOT EXISTS Bebidas( 
	ID_bebida int(3) AUTO_INCREMENT,
	Nome varchar(255),
	Descricao varchar(255),
	Valor decimal (4,2), 
	PRIMARY KEY (ID_bebida) 
); 

-- Tabela de Ingredientes
CREATE TABLE IF NOT EXISTS Ingredientes(
	ID_ingrediente int(3) AUTO_INCREMENT,
	Unidade_medida Varchar(255),
	ID_prato int(3),
	ID_bebida int(3),
	PRIMARY KEY (ID_ingrediente),
	FOREIGN KEY (ID_prato) REFERENCES Pratos(ID_prato),
	FOREIGN KEY (ID_bebida) REFERENCES Bebidas(ID_bebida)
);

-- Tabela de Pedidos
CREATE TABLE IF NOT EXISTS Pedidos( 
	ID_pedido int(8) AUTO_INCREMENT, 
	ID_cliente int(8), 
	ID_prato int(2), 
	ID_bebida int(3), 
	Valor decimal(4,2),
	Tipo_pagamento varchar(255),
	Endereco varchar(255),
	Data_pedido datetime,
	PRIMARY KEY (ID_pedido), 
	FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente), 
	FOREIGN KEY (ID_prato) REFERENCES Pratos (ID_prato), 
	FOREIGN KEY (ID_bebida) REFERENCES Bebidas (ID_bebida) 
); 

-- Insert

-- Tabela de Entregas
CREATE TABLE IF NOT EXISTS Entregas( 
	ID_entrega int(5) AUTO_INCREMENT,
	Endereco varchar(255),
	ID_pedido int(8),
	Data_entrega datetime,
	PRIMARY KEY (ID_entrega), 
	FOREIGN KEY (ID_pedido) REFERENCES Pedidos (ID_pedido) 
); 

-- Inserir Clientes
INSERT INTO Clientes (CPF, Nome, Sexo, Idade, Endereco, Email, Telefone, Data_cadastro)
VALUES 
('12345678901', 'Maria Silva', 'Feminino', '30', 'Rua A, 123', 'maria@example.com', '123456789', NOW()),
('98765432109', 'João Santos', 'Masculino', '25', 'Rua B, 456', 'joao@example.com', '987654321', NOW()),
('45678901234', 'Ana Oliveira', 'Feminino', '40', 'Rua C, 789', 'ana@example.com', '456789012', NOW()),
('32109876543', 'Pedro Souza', 'Masculino', '35', 'Rua D, 987', 'pedro@example.com', '321098765', NOW()),
('78901234567', 'Carla Costa', 'Feminino', '28', 'Rua E, 654', 'carla@example.com', '789012345', NOW());

-- Inserir Filial
INSERT INTO Filiais (Endereco, Email, Telefone, Quant_mesas, Avaliacao)
VALUES 
('Av. Principal, 100', 'filial@example.com', '987654321', 20, 4.5);

-- Inserir Funcionarios
INSERT INTO Funcionarios (CPF, Nome, Sexo, Idade, Endereco, Email, Telefone, ID_filial, Cargo, Data_contatacao)
VALUES 
('11122233344', 'Carlos Oliveira', 'Masculino', '32', 'Rua X, 789', 'carlos@example.com', '111222333', 1, 'Garçom', NOW()),
('22233344455', 'Ana Santos', 'Feminino', '28', 'Rua Y, 456', 'ana_santos@example.com', '222333444', 1, 'Cozinheiro', NOW()),
('33344455566', 'Lucas Silva', 'Masculino', '35', 'Rua Z, 123', 'lucas@example.com', '333444555', 1, 'Garçom', NOW()),
('44455566677', 'Mariana Costa', 'Feminino', '29', 'Rua W, 321', 'mariana@example.com', '444555666', 1, 'Gerente', NOW()),
('55566677788', 'Pedro Santos', 'Masculino', '26', 'Rua V, 654', 'pedro_santos@example.com', '555666777', 1, 'Atendente', NOW());

-- Inserir Prato
INSERT INTO Pratos (Nome, Descricao, Valor)
VALUES 
('Feijoada', 'Prato típico brasileiro', 25.00);

-- Inserir Fornecedores
INSERT INTO Fornecedores (Nome, CNPJ, Tipo_material, Email, Telefone, Valor_material)
VALUES 
('Fornecedor A', '12345678901234', 'Feijão', 'fornecedor_a@example.com', '111222333', 5.00),
('Fornecedor B', '98765432109876', 'Carne', 'fornecedor_b@example.com', '999888777', 10.00);

-- Inserir Reservas
INSERT INTO Reservas (Data_reserva, ID_cliente, Mesa, ID_filial, Capacidade)
VALUES 
(NOW(), 1, '01', 1, '4 pessoas'),
(NOW(), 2, '02', 1, '6 pessoas'),
(NOW(), 3, '03', 1, '2 pessoas');

-- Inserir Ingredientes no Estoque
INSERT INTO Estoque (ID_fornecedor, Quantidade, ID_filial)
SELECT ID_fornecedor, 50, 1 FROM Fornecedores WHERE Tipo_material = 'Feijão';
INSERT INTO Estoque (ID_fornecedor, Quantidade, ID_filial)
SELECT ID_fornecedor, 20, 1 FROM Fornecedores WHERE Tipo_material = 'Carne';

-- Inserir Bebidas
INSERT INTO Bebidas (Nome, Descricao, Valor)
VALUES 
('Skol', 'Bebida alcoólica', 5.00),
('Coca-cola', 'Bebida não alcoólica', 3.00);

-- Inserir Pedidos
INSERT INTO Pedidos (ID_cliente, ID_prato, ID_bebida, Valor, Tipo_pagamento, Endereco, Data_pedido)
VALUES 
(1, 1, 1, 30.00, 'Cartão', 'Rua A, 123', NOW()),
(2, 1, 2, 28.00, 'Dinheiro', 'Rua B, 456', NOW()),
(3, 1, 1, 35.00, 'Cartão', 'Rua C, 789', NOW()),
(4, 1, 2, 30.00, 'Dinheiro', 'Rua D, 987', NOW()),
(5, 1, 1, 32.00, 'Cartão', 'Rua E, 654', NOW());

-- Inserir Entregas
INSERT INTO Entregas (Endereco, ID_pedido, Data_entrega)
VALUES 
('Rua A, 123', 1, NOW()),
('Rua B, 456', 2, NOW()),
('Rua C, 789', 3, NOW());
