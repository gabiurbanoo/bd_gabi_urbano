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
	PRIMARY KEY (ID_func) 
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

-- Tabela de Entregas
CREATE TABLE IF NOT EXISTS Entregas( 
	ID_entrega int(5) AUTO_INCREMENT,
	Endereco varchar(255),
	ID_pedido int(8),
	Data_entrega datetime,
	PRIMARY KEY (ID_entrega), 
	FOREIGN KEY (ID_pedido) REFERENCES Pedidos (ID_pedido) 
); 