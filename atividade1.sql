-- Aluno: Gabriel Dantas Santos de Azevêdo
-- Curso: Sistemas Para Internet
create database loja;
use loja;

-- Questão 1
CREATE TABLE Cliente (
	codigo int PRIMARY KEY,
	nome varchar(30),
	endereco varchar(100),
	cpf char(11) NOT NULL,
	telefone char(11)
);

CREATE TABLE Vendedor (
	codigo int PRIMARY KEY,
	nome VARCHAR(50),
	salario decimal(7,2)
);

CREATE TABLE Produto (
	id int PRIMARY KEY,
	unidade char(3),
	descricao varchar(50),
	valorUnitario decimal(7,2)
);

CREATE TABLE Pedido (
	numPedido int PRIMARY KEY,
	prazoEntrega date,
	codigoCliente int,
	codigoVendedor int,
	CONSTRAINT  fk_codCli FOREIGN KEY (codigoCliente) REFERENCES Cliente(codigo),
    CONSTRAINT  fk_codVen FOREIGN KEY (codigoVendedor) REFERENCES Vendedor(codigo)
);

CREATE TABLE ItemPedido (
	numeroPedido int,
	idProduto int,
	quantidade int,
    PRIMARY KEY (numeroPedido, idProduto),
	CONSTRAINT  fk_numPedido FOREIGN KEY (numeroPedido) REFERENCES Pedido(numPedido),
	CONSTRAINT  fk_idProd FOREIGN KEY (idProduto) REFERENCES Produto(id)
);

-- Questão 2
ALTER TABLE Cliente ADD COLUMN tipo varchar(40);
ALTER TABLE Cliente CHANGE nome nome varchar(100);

ALTER TABLE Vendedor CHANGE codigo id int;
ALTER TABLE Vendedor ADD telefone char(11);

ALTER TABLE Pedido DROP COLUMN prazoEntrega;
ALTER TABLE Pedido ADD COLUMN tipo varchar(40);
ALTER TABLE Pedido ADD COLUMN dataEmbarque date;
ALTER TABLE Pedido ADD COLUMN dataEntrega date;
ALTER TABLE Pedido ADD COLUMN valorTotal decimal(7,2);
ALTER TABLE Pedido ADD COLUMN desconto decimal(7,2);

ALTER TABLE Produto CHANGE id codigo int;
ALTER TABLE Produto DROP COLUMN unidade;
ALTER TABLE Produto CHANGE descricao nome varchar(40);
ALTER TABLE Produto CHANGE valorUnitario preco decimal(7,2);

ALTER TABLE Produto ADD COLUMN id_fabricante int;

CREATE TABLE FABRICANTE (
	id int PRIMARY KEY,
	nome varchar(40),
	cnpj char(14),
	receita decimal(7,2)
);

ALTER TABLE Produto ADD CONSTRAINT fk_fabricante FOREIGN KEY (id_fabricante) REFERENCES FABRICANTE(id);


























