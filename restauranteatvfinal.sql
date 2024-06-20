DROP DATABASE restaurante;
CREATE DATABASE restaurante;

USE restaurante;
-- Questão 1) email e uma senha;
-- Questão 2) Nome, email, endereço, telefone, CPF e a criação de um ID para login

-- Tabela de clientes (cadastro)
CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(35),
    emailCliente VARCHAR(50),
    enderecoCliente VARCHAR(75),
    telefoneCliente VARCHAR(11),
    cpfCliente VARCHAR(11)
);

-- Tabela de login
CREATE TABLE Login (
    idLogin INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    senha VARCHAR(15),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Tabela de funcionários
CREATE TABLE Funcionarios (
    idFunc INT AUTO_INCREMENT PRIMARY KEY,
    nomeFunc VARCHAR(35),
    emailFunc VARCHAR(50),
    enderecoFunc VARCHAR(75),
    telefoneFunc VARCHAR(11),
    cpfFunc VARCHAR(11),
    rg VARCHAR(10),
    cargo VARCHAR(25),
    idade INT(2),
    idFilial VARCHAR(2),
    FOREIGN KEY (idFilial) REFERENCES Filiais(idFilial)
);

-- Tabela de filiais
CREATE TABLE Filiais (
    idFilial VARCHAR(2) PRIMARY KEY,
    nomeFilial VARCHAR(20),
    cnpj VARCHAR(14),
    enderecoFilial VARCHAR(75),
    emailFilial VARCHAR(50),
    telefoneFilial VARCHAR(11)
);

-- Insert de dados na tabela de clientes
INSERT INTO Clientes (nomeCliente, emailCliente, enderecoCliente, telefoneCliente, cpfCliente)
VALUES
('João da Silva', 'joao.silva@example.com', 'Rua das Flores, 123', '11999991111', '12345678901'),
('Maria de Oliveira', 'maria.oliveira@example.com', 'Avenida Atlântica, 456', '11988882222', '23456789012'),
('Carlos dos Santos', 'carlos.santos@example.com', 'Praça da Liberdade, 789', '11977773333', '34567890123'),
('Tatiana Medeiros', 'tatiana.medeiros@example.com', 'Avenida João XXIII, 992', '11933335555', '55502934511'),
('Ana Silva', 'ana.silva@example.com', 'Rua das Acácias, 789', '11966667777', '78901234567');

-- Insert de dados na tabela de login
INSERT INTO Login (idCliente, senha)
VALUES
(LAST_INSERT_ID(), 'senhaJoao123!'),
(LAST_INSERT_ID(), 'senhaMaria456!'),
(LAST_INSERT_ID(), 'senhaCarlos789!'),
(LAST_INSERT_ID(), 'senhaTati789!'),
(LAST_INSERT_ID(), 'senhaAna789!');

-- Insert de dados na tabela de filiais
INSERT INTO Filiais (idFilial, nomeFilial, cnpj, enderecoFilial, emailFilial, telefoneFilial)
VALUES
('F1', 'Filial Central', '12345678000199', 'Avenida Paulista, 1000, São Paulo, SP', 'central@example.com', '1133334444'),
('F2', 'Filial Norte', '23456789000188', 'Rua das Palmeiras, 200, Manaus, AM', 'norte@example.com', '923334444'),
('F3', 'Filial Sul', '34567890000177', 'Rua das Hortências, 300, Porto Alegre, RS', 'sul@example.com', '5133344444');

-- Insert de dados na tabela de funcionários
INSERT INTO Funcionarios (nomeFunc, emailFunc, enderecoFunc, telefoneFunc, cpfFunc, rg, cargo, idade, idFilial)
VALUES
('Ana Paula', 'ana.paula@example.com', 'Rua das Rosas, 100, São Paulo, SP', '11987654321', '45678901234', 'MG1234567', 'Gerente', 35, 'F1'),
('Pedro Henrique', 'pedro.henrique@example.com', 'Avenida Amazonas, 200, Manaus, AM', '92987654321', '56789012345', 'AM2345678', 'Atendente', 28, 'F2'),
('Fernanda Lima', 'fernanda.lima@example.com', 'Rua das Margaridas, 300, Porto Alegre, RS', '51987654321', '67890123456', 'RS3456789', 'Cozinheira', 32, 'F3'),
('Lucas Souza', 'lucas.souza@example.com', 'Rua das Violetas, 400, Belo Horizonte, MG', '31987654321', '89012345678', 'MG4567890', 'Atendente', 25, 'F1'),
('Mariana Santos', 'mariana.santos@example.com', 'Avenida das Palmeiras, 500, Brasília, DF', '61987654321', '90123456789', 'DF1234567', 'Garçom', 27, 'F2');
-- Questão 3)
SELECT * FROM Funcionarios WHERE idFilial = 'F1';
SELECT * FROM Funcionarios WHERE idFilial = 'F2';
SELECT * FROM Funcionarios WHERE idFilial = 'F3';

-- Questão 4)
SELECT * FROM Clientes
