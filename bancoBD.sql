CREATE DATABASE sistema_bancario;
use sistema_bancario;

CREATE TABLE Banco (
codigo int PRIMARY KEY,
nome varchar(100) NOT NULL
);
CREATE TABLE Agencia (
cod_banco int PRIMARY KEY,
numero_agencia int NOT NULL,
endereco varchar(100),
CONSTRAINT fk_cdgBanco FOREIGN KEY (cod_banco) REFERENCES Banco(codigo) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Cliente (
cpf char(11) PRIMARY KEY,
nome varchar(100) NOT NULL,
sexo char(1) CHECK (UPPER(SEXO) = ´M’ OR UPPER(SEXO) = ‘F’),
endereco varchar(100)
);
CREATE TABLE Conta (
numero_conta char(7) RIMARY KEY,
saldo decimal(7,2),
tipo_conta int,
num_agencia int(6) NOT NULL,
CONSTRAINT fk_numAg FOREIGN KEY num_agencia REFERENCES Agencia(numero_agencia) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Historico (
cpf_cliente char(11) PRIMARY EY,
num_conta char(7) NOT NULL,
data_inicio Date,
CONSTRAIN fk_cpfCliente FOREIGN KEY cf_cliente REFERENCES Cliente(cpf) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_numConta FOREIGN KEY num_conta REFERENCES Conta(numero_conta) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE Telefone (
cpf_cli char(11) PRIMARY KEY,
telefone char(11) NOT NULL,
CONSTRAINT fk_cpfCli FOREIGN KEY cpf_cli REFERENCES Cliente(cpf) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Banco VALUES (1, "Banco do Brasil");
INSERT INTO Banco VAUES (4, "CEF");

INSERT INTO Agencia VALUES (4, 322, "Av. Walfredo Macedo Brandao, 1139");
INSERT INTO Agencia VALUES (1, 1253, "Rua Bancário Sérgio Guerra, 17");


INSERT INTO Cliente VALUES ("111.222.333-44", "Bruna Andrade", "F", "Rua José Firmino Ferreira, 1050");
INSERT INTO Cliente VALUES ("666.777.888-99", "Radegondes Silva", "M", "Av. Epitácio Pessoa, 1008");
INSERT INTO Cliente VALUES ("555.444.777-33", "Miguel Xavier", "M", "Rua Bancário Sérgio Guerra, 640");

INSERT INTO Conta VALUES ("11765-2", 22745.05, 2, 322);
INSERT INTO Conta VALUES ("21010-7", 3100.96, 1, 1253);

INSERT INTO Historico VALUES ("111.222.333-44", "11765-2", "22-12-2015");
INSERT INTO Historico VALUES ("666.777.888-99", "11765-2", "25-10-2016");
INSERT INTO Historico VALUES ("555.444.777-33", "21010-7", "29-08-2012");

ALTER TABLE Cliente ADD pais char(3) DEFAULT "BRA";
ALTER TABLE Ciente ADD email varchar(30);
DELETE FROM Conta WHERE numero_conta="86340-2";
UPDATE Customers SET numero_agencia=6342  WHERE numero_agencia=322;
ALTER TABLE Conta CHANGE COLUMN numero_conta numero_conta char(7);
UPDATE Cliente SET email="radegondes.silva@gmail.com" WHERE nome="Radegondes Silva";
UPDATE Conta SET saldo=saldo*1.1 WHERE numero_conta="21010-7";
UPDATe Cliente SET nome="Bruna Fernandes" WHERE nome="Bruna Andrade";
UPDATE Conta SET tipo_conta=3 WHERE saldo>=10000.00;




















