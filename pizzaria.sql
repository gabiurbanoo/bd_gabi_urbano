-- Gabrielle Urbano Azevedo
use pizzaria;
create table clientes (
id_cliente varchar(10),
nome_cliente varchar(25),
cpf_cliente varchar(11),
endereco_cliente varchar(45),
telefone_cliente varchar(11),
primary key (id_cliente)
);

create table pizzas (
id_pizza varchar(2),
sabores varchar(25),
primary key (id_pizza)
);

create table fornecedores (
cnpj varchar(14),
nome_empresa varchar(30),
telefone_empresa varchar(11),
endereco_empresa varchar(45),
primary key (cnpj)
);

create table funcionarios (
id_funcionario varchar(5),
nome_funcionario varchar(25),
endereco_funcionario varchar(45),
telefone_funcionario varchar(11),
cargo varchar(35),
idade varchar(2),
primary key (id_funcionario)
);

create table pedidos (
id_pedido varchar(3),
observacoes varchar(100),
id_cliente varchar(10),
id_funcionario varchar(5),
id_pizza varchar(2),
primary key (id_pedido),
foreign key (id_cliente) references clientes (id_cliente),
foreign key (id_funcionario) references funcionarios (id_funcionario),
foreign key (id_pizza) references pizzas (id_pizza)
);
