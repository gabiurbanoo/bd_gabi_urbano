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
	ID_materia int(6) AUTO_INCREMENT, 
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
	Nome varchar(255),
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

-- Inserir dados na tabela Clientes
INSERT INTO Clientes (CPF, Nome, Sexo, Idade, Endereco, Email, Telefone, Data_cadastro) VALUES 
('12345678901', 'Maria Silva', 'Feminino', '25', 'Rua A, 123', 'maria.silva@gmail.com', '9876543210', '2023-01-01 10:00:00'),
('23456789012', 'João Souza', 'Masculino', '30', 'Rua B, 456', 'joao.souza@gmail.com', '9876543211', '2023-01-02 11:00:00'),
('34567890123', 'Ana Pereira', 'Feminino', '22', 'Rua C, 789', 'ana.pereira@gmail.com', '9876543212', '2023-01-03 12:00:00'),
('45678901234', 'Carlos Santos', 'Masculino', '28', 'Rua D, 101', 'carlos.santos@gmail.com', '9876543213', '2023-01-04 13:00:00'),
('56789012345', 'Julia Oliveira', 'Feminino', '26', 'Rua E, 202', 'julia.oliveira@gmail.com', '9876543214', '2023-01-05 14:00:00'),
('67890123456', 'Pedro Lima', 'Masculino', '29', 'Rua F, 303', 'pedro.lima@gmail.com', '9876543215', '2023-01-06 15:00:00'),
('78901234567', 'Mariana Costa', 'Feminino', '27', 'Rua G, 404', 'mariana.costa@gmail.com', '9876543216', '2023-01-07 16:00:00'),
('89012345678', 'Lucas Almeida', 'Masculino', '24', 'Rua H, 505', 'lucas.almeida@gmail.com', '9876543217', '2023-01-08 17:00:00'),
('90123456789', 'Larissa Carvalho', 'Feminino', '23', 'Rua I, 606', 'larissa.carvalho@gmail.com', '9876543218', '2023-01-09 18:00:00'),
('01234567890', 'Ricardo Araújo', 'Masculino', '31', 'Rua J, 707', 'ricardo.araujo@gmail.com', '9876543219', '2023-01-10 19:00:00'),
('11234567890', 'Sofia Ribeiro', 'Feminino', '25', 'Rua K, 808', 'sofia.ribeiro@gmail.com', '9876543220', '2023-01-11 20:00:00'),
('21234567890', 'Felipe Martins', 'Masculino', '30', 'Rua L, 909', 'felipe.martins@gmail.com', '9876543221', '2023-01-12 21:00:00'),
('31234567890', 'Bruna Mendes', 'Feminino', '22', 'Rua M, 101', 'bruna.mendes@gmail.com', '9876543222', '2023-01-13 22:00:00'),
('41234567890', 'Gabriel Lima', 'Masculino', '28', 'Rua N, 202', 'gabriel.lima@gmail.com', '9876543223', '2023-01-14 23:00:00'),
('51234567890', 'Carolina Rocha', 'Feminino', '26', 'Rua O, 303', 'carolina.rocha@gmail.com', '9876543224', '2023-01-15 10:00:00');

-- Inserir dados na tabela Filiais
INSERT INTO Filiais (Endereco, Email, Telefone, Quant_mesas, Avaliacao) VALUES 
('Avenida Principal, 100', 'filial1@restaurante.com', '3216549870', 20, 4.5),
('Rua das Flores, 200', 'filial2@restaurante.com', '3216549871', 15, 4.2),
('Avenida Brasil, 300', 'filial3@restaurante.com', '3216549872', 25, 4.8),
('Rua das Árvores, 400', 'filial4@restaurante.com', '3216549873', 18, 4.0),
('Avenida Central, 500', 'filial5@restaurante.com', '3216549874', 30, 4.7),
('Rua do Comércio, 600', 'filial6@restaurante.com', '3216549875', 22, 4.3),
('Avenida Rio, 700', 'filial7@restaurante.com', '3216549876', 28, 4.6),
('Rua do Sol, 800', 'filial8@restaurante.com', '3216549877', 16, 4.1),
('Avenida Mar, 900', 'filial9@restaurante.com', '3216549878', 20, 4.4),
('Rua da Paz, 1000', 'filial10@restaurante.com', '3216549879', 25, 4.9),
('Avenida Esperança, 1100', 'filial11@restaurante.com', '3216549880', 15, 4.2),
('Rua da Alegria, 1200', 'filial12@restaurante.com', '3216549881', 18, 4.0),
('Avenida Felicidade, 1300', 'filial13@restaurante.com', '3216549882', 30, 4.7),
('Rua da Harmonia, 1400', 'filial14@restaurante.com', '3216549883', 22, 4.3),
('Avenida Serenidade, 1500', 'filial15@restaurante.com', '3216549884', 28, 4.6);

-- Inserir dados na tabela Funcionarios
INSERT INTO Funcionarios (CPF, Nome, Sexo, Idade, Endereco, Email, Telefone, ID_filial, Cargo, Data_contatacao) VALUES 
('09876543210', 'Fernando Gonçalves', 'Masculino', '35', 'Rua P, 404', 'fernando.goncalves@restaurante.com', '9876543215', 1, 'Garçom', '2023-02-01 10:00:00'),
('98765432109', 'Bianca Ferreira', 'Feminino', '28', 'Rua Q, 505', 'bianca.ferreira@restaurante.com', '9876543216', 2, 'Cozinheira', '2023-02-02 11:00:00'),
('87654321098', 'Lucas Barbosa', 'Masculino', '32', 'Rua R, 606', 'lucas.barbosa@restaurante.com', '9876543217', 3, 'Gerente', '2023-02-03 12:00:00'),
('76543210987', 'Carla Lima', 'Feminino', '27', 'Rua S, 707', 'carla.lima@restaurante.com', '9876543218', 4, 'Atendente', '2023-02-04 13:00:00'),
('65432109876', 'Marcos Silva', 'Masculino', '30', 'Rua T, 808', 'marcos.silva@restaurante.com', '9876543219', 5, 'Chef de Cozinha', '2023-02-05 14:00:00'),
('54321098765', 'Renata Souza', 'Feminino', '26', 'Rua U, 909', 'renata.souza@restaurante.com', '9876543220', 6, 'Garçonete', '2023-02-06 15:00:00'),
('43210987654', 'João Vieira', 'Masculino', '29', 'Rua V, 101', 'joao.vieira@restaurante.com', '9876543221', 7, 'Auxiliar de Cozinha', '2023-02-07 16:00:00'),
('32109876543', 'Mariana Araújo', 'Feminino', '25', 'Rua W, 202', 'mariana.araujo@restaurante.com', '9876543222', 8, 'Recepcionista', '2023-02-08 17:00:00'),
('21098765432', 'Rafael Carvalho', 'Masculino', '31', 'Rua X, 303', 'rafael.carvalho@restaurante.com', '9876543223', 9, 'Gerente de Filial', '2023-02-09 18:00:00'),
('10987654321', 'Patrícia Nunes', 'Feminino', '33', 'Rua Y, 404', 'patricia.nunes@restaurante.com', '9876543224', 10, 'Cozinheira', '2023-02-10 19:00:00'),
('09876543211', 'Ricardo Silva', 'Masculino', '30', 'Rua Z, 505', 'ricardo.silva@restaurante.com', '9876543225', 11, 'Garçom', '2023-02-11 20:00:00'),
('87654321087', 'Juliana Lima', 'Feminino', '28', 'Rua AA, 606', 'juliana.lima@restaurante.com', '9876543226', 12, 'Garçonete', '2023-02-12 21:00:00'),
('65432109865', 'Rodrigo Martins', 'Masculino', '29', 'Rua BB, 707', 'rodrigo.martins@restaurante.com', '9876543227', 13, 'Atendente', '2023-02-13 22:00:00'),
('43210987643', 'Camila Oliveira', 'Feminino', '27', 'Rua CC, 808', 'camila.oliveira@restaurante.com', '9876543228', 14, 'Auxiliar de Cozinha', '2023-02-14 23:00:00'),
('21098765421', 'André Gomes', 'Masculino', '32', 'Rua DD, 909', 'andre.gomes@restaurante.com', '9876543229', 15, 'Chef de Cozinha', '2023-02-15 10:00:00');

-- Inserir dados na tabela Reservas
INSERT INTO Reservas (Data_reserva, ID_cliente, Mesa, ID_filial, Capacidade) VALUES 
('2023-03-01 19:00:00', 1, 'A1', 1, '4'),
('2023-03-02 20:00:00', 2, 'B2', 2, '2'),
('2023-03-03 18:00:00', 3, 'C3', 3, '6'),
('2023-03-04 21:00:00', 4, 'D4', 4, '4'),
('2023-03-05 19:30:00', 5, 'E5', 5, '2'),
('2023-03-06 20:30:00', 6, 'F6', 6, '6'),
('2023-03-07 18:30:00', 7, 'G7', 7, '4'),
('2023-03-08 21:30:00', 8, 'H8', 8, '2'),
('2023-03-09 19:45:00', 9, 'I9', 9, '6'),
('2023-03-10 20:45:00', 10, 'J10', 10, '4'),
('2023-03-11 18:15:00', 11, 'K11', 11, '2'),
('2023-03-12 21:15:00', 12, 'L12', 12, '6'),
('2023-03-13 19:15:00', 13, 'M13', 13, '4'),
('2023-03-14 20:15:00', 14, 'N14', 14, '2'),
('2023-03-15 18:45:00', 15, 'O15', 15, '6');

-- Inserir dados na tabela Fornecedores
INSERT INTO Fornecedores (Nome, CNPJ, Tipo_material, Email, Telefone, Valor_material) VALUES 
('Fornecedor A', '12345678000101', 'Legumes', 'fornecedora@gmail.com', '3216549870', 500.00),
('Fornecedor B', '23456789000112', 'Carnes', 'fornecedorb@gmail.com', '3216549871', 800.00),
('Fornecedor C', '34567890000123', 'Bebidas', 'fornecedorc@gmail.com', '3216549872', 300.00),
('Fornecedor D', '45678901000134', 'Laticínios', 'fornecedord@gmail.com', '3216549873', 400.00),
('Fornecedor E', '56789012000145', 'Grãos', 'fornecedore@gmail.com', '3216549874', 200.00),
('Fornecedor F', '67890123000156', 'Especiarias', 'fornecedorf@gmail.com', '3216549875', 150.00),
('Fornecedor G', '78901234000167', 'Verduras', 'fornecedorg@gmail.com', '3216549876', 450.00),
('Fornecedor H', '89012345000178', 'Massas', 'fornecedorh@gmail.com', '3216549877', 350.00),
('Fornecedor I', '90123456000189', 'Frutas', 'fornecedori@gmail.com', '3216549878', 600.00),
('Fornecedor J', '01234567000190', 'Pães', 'fornecedorj@gmail.com', '3216549879', 250.00),
('Fornecedor K', '12345678000191', 'Bebidas Alcoólicas', 'fornecedork@gmail.com', '3216549880', 700.00),
('Fornecedor L', '23456789000192', 'Doces', 'fornecedorl@gmail.com', '3216549881', 100.00),
('Fornecedor M', '34567890000193', 'Frutos do Mar', 'fornecedorm@gmail.com', '3216549882', 900.00),
('Fornecedor N', '45678901000194', 'Temperos', 'fornecedorn@gmail.com', '3216549883', 50.00),
('Fornecedor O', '56789012000195', 'Bebidas Não Alcoólicas', 'fornecedoro@gmail.com', '3216549884', 300.00);

-- Inserir dados na tabela Estoque
INSERT INTO Estoque (ID_fornecedor, Quantidade, ID_filial) VALUES 
(1, 100, 1),
(2, 50, 2),
(3, 200, 3),
(4, 150, 4),
(5, 80, 5),
(6, 60, 6),
(7, 120, 7),
(8, 90, 8),
(9, 110, 9),
(10, 70, 10),
(11, 130, 11),
(12, 40, 12),
(13, 140, 13),
(14, 30, 14),
(15, 160, 15);

-- Inserir dados na tabela Pratos
INSERT INTO Pratos (Nome, Descricao, Valor) VALUES 
('Bife à Parmegiana', 'Bife empanado com molho de tomate e queijo', 25.90),
('Lasanha de Frango', 'Lasanha recheada com frango desfiado', 22.50),
('Spaghetti Carbonara', 'Macarrão com molho à base de ovos e bacon', 20.00),
('Salmão Grelhado', 'Filé de salmão grelhado com ervas', 30.90),
('Frango à Milanesa', 'Filé de frango empanado e frito', 18.90),
('Feijoada', 'Prato típico brasileiro com feijão preto e carnes', 35.00),
('Arroz de Polvo', 'Arroz com pedaços de polvo e temperos', 28.50),
('Risoto de Camarão', 'Risoto cremoso com camarão', 32.00),
('Filé Mignon', 'Filé de carne bovina grelhado', 40.00),
('Moqueca de Peixe', 'Peixe cozido com leite de coco e dendê', 27.50),
('Escondidinho de Carne', 'Carne desfiada coberta com purê de batata', 19.90),
('Picanha na Brasa', 'Picanha assada na churrasqueira', 45.00),
('Camarão à Baiana', 'Camarão cozido com temperos baianos', 33.90),
('Ravioli de Ricota', 'Massa recheada com ricota e espinafre', 21.50),
('Pizza Marguerita', 'Pizza com molho de tomate, queijo e manjericão', 29.00);

-- Inserir dados na tabela Bebidas
INSERT INTO Bebidas (Nome, Descricao, Valor) VALUES 
('Refrigerante', 'Bebida gaseificada', 5.00),
('Suco de Laranja', 'Suco natural de laranja', 7.00),
('Água Mineral', 'Água engarrafada sem gás', 3.00),
('Cerveja', 'Bebida alcoólica fermentada', 8.00),
('Vinho Tinto', 'Vinho produzido a partir de uvas tintas', 20.00),
('Caipirinha', 'Coquetel de cachaça com limão', 15.00),
('Whisky', 'Bebida alcoólica destilada de grãos', 25.00),
('Café Expresso', 'Café feito sob pressão', 4.00),
('Chá Gelado', 'Bebida refrescante de chá', 6.00),
('Milkshake', 'Bebida gelada à base de sorvete', 10.00),
('Energético', 'Bebida estimulante', 12.00),
('Limonada', 'Suco de limão com água e açúcar', 5.00),
('Mojito', 'Coquetel de rum com hortelã e limão', 18.00),
('Gin Tônica', 'Coquetel de gin com água tônica', 20.00),
('Vodka', 'Bebida alcoólica destilada', 22.00);

-- Inserir dados na tabela Ingredientes
INSERT INTO Ingredientes (Nome, Unidade_medida, ID_prato, ID_bebida) VALUES 
('Tomate', 'Kg', 1, NULL),
('Frango', 'Kg', 2, NULL),
('Bacon', 'Kg', 3, NULL),
('Salmão', 'Kg', 4, NULL),
('Farinha de Rosca', 'Kg', 5, NULL),
('Feijão Preto', 'Kg', 6, NULL),
('Polvo', 'Kg', 7, NULL),
('Camarão', 'Kg', 8, NULL),
('Carne Bovina', 'Kg', 9, NULL),
('Peixe', 'Kg', 10, NULL),
('Purê de Batata', 'Kg', 11, NULL),
('Picanha', 'Kg', 12, NULL),
('Camarão', 'Kg', 13, NULL),
('Ricota', 'Kg', 14, NULL),
('Molho de Tomate', 'L', 15, NULL),
('Gás Carbônico', 'L', NULL, 1),
('Laranja', 'Unidade', NULL, 2),
('Água', 'L', NULL, 3),
('Malte', 'Kg', NULL, 4),
('Uva', 'Kg', NULL, 5),
('Cachaça', 'L', NULL, 6),
('Cevada', 'Kg', NULL, 7),
('Café', 'Kg', NULL, 8),
('Chá', 'Kg', NULL, 9),
('Sorvete', 'L', NULL, 10),
('Cafeína', 'g', NULL, 11),
('Limão', 'Unidade', NULL, 12),
('Rum', 'L', NULL, 13),
('Gin', 'L', NULL, 14),
('Vodka', 'L', NULL, 15);

-- Inserir dados na tabela Pedidos
INSERT INTO Pedidos (ID_cliente, ID_prato, ID_bebida, Valor, Tipo_pagamento, Endereco, Data_pedido) VALUES 
(1, 1, 1, 30.90, 'Cartão de Crédito', 'Rua A, 123', '2023-04-01 19:00:00'),
(2, 2, 2, 29.50, 'Dinheiro', 'Rua B, 456', '2023-04-02 20:00:00'),
(3, 3, 3, 23.00, 'Cartão de Débito', 'Rua C, 789', '2023-04-03 18:00:00'),
(4, 4, 4, 38.90, 'Cartão de Crédito', 'Rua D, 101', '2023-04-04 21:00:00'),
(5, 5, 5, 33.90, 'Dinheiro', 'Rua E, 202', '2023-04-05 19:30:00'),
(6, 6, 6, 50.00, 'Cartão de Débito', 'Rua F, 303', '2023-04-06 20:30:00'),
(7, 7, 7, 28.50, 'Cartão de Crédito', 'Rua G, 404', '2023-04-07 18:30:00'),
(8, 8, 8, 38.00, 'Dinheiro', 'Rua H, 505', '2023-04-08 21:30:00'),
(9, 9, 9, 47.90, 'Cartão de Débito', 'Rua I, 606', '2023-04-09 19:45:00'),
(10, 10, 10, 31.50, 'Cartão de Crédito', 'Rua J, 707', '2023-04-10 20:45:00'),
(11, 11, 11, 24.90, 'Dinheiro', 'Rua K, 808', '2023-04-11 18:15:00'),
(12, 12, 12, 51.00, 'Cartão de Débito', 'Rua L, 909', '2023-04-12 21:15:00'),
(13, 13, 13, 52.90, 'Cartão de Crédito', 'Rua M, 101', '2023-04-13 19:15:00'),
(14, 14, 14, 41.50, 'Dinheiro', 'Rua N, 202', '2023-04-14 20:15:00'),
(15, 15, 15, 51.00, 'Cartão de Débito', 'Rua O, 303', '2023-04-15 18:45:00');

-- Inserir dados na tabela Entregas
INSERT INTO Entregas (Endereco, ID_pedido, Data_entrega) VALUES 
('Rua A, 123', 1, '2023-05-01 20:00:00'),
('Rua B, 456', 2, '2023-05-02 21:00:00'),
('Rua C, 789', 3, '2023-05-03 19:00:00'),
('Rua D, 101', 4, '2023-05-04 22:00:00'),
('Rua E, 202', 5, '2023-05-05 20:30:00'),
('Rua F, 303', 6, '2023-05-06 21:30:00'),
('Rua G, 404', 7, '2023-05-07 19:30:00'),
('Rua H, 505', 8, '2023-05-08 22:30:00'),
('Rua I, 606', 9, '2023-05-09 20:45:00'),
('Rua J, 707', 10, '2023-05-10 21:45:00'),
('Rua K, 808', 11, '2023-05-11 19:15:00'),
('Rua L, 909', 12, '2023-05-12 22:15:00'),
('Rua M, 101', 13, '2023-05-13 20:15:00'),
('Rua N, 202', 14, '2023-05-14 21:15:00'),
('Rua O, 303', 15, '2023-05-15 19:45:00');

SELECT * FROM Ingredientes;