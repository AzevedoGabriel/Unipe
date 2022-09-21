CREATE DATABASE fazenda;
use fazenda;

CREATE TABLE canteiro (
canteiroid INT NOT NULL AUTO_INCREMENT,
nome CHAR(20) DEFAULT NULL,
luzdiaria INT(2) DEFAULT NULL,
agua INT(3) DEFAULT NULL,
PRIMARY KEY (`canteiroid`),
UNIQUE KEY canteiroid (`canteiroid`));

CREATE TABLE funcionario (
funcid INT(11) NOT NULL AUTO_INCREMENT,
nome CHAR(80) NOT NULL DEFAULT 'Gabriel',
idade INTEGER(2) DEFAULT NULL,
PRIMARY KEY (funcid),
UNIQUE KEY funcid (`funcid`));

CREATE TABLE planta (
ID INT(11) NOT NULL AUTO_INCREMENT,
nome CHAR(20) NOT NULL DEFAULT '',
luzdiaria INTEGER(2) DEFAULT NULL,
agua INTEGER(2) DEFAULT NULL,
peso INTEGER(2) DEFAULT NULL,
PRIMARY KEY (`ID`),
UNIQUE KEY ID (`ID`));

CREATE TABLE plantio (
plantioID INT(11) NOT NULL AUTO_INCREMENT,
plantaID INT(11) NOT NULL,
funcID INT(11) NOT NULL ,
canteiroID INT(11) NOT NULL,
Data DATE DEFAULT NULL,
sementes INT(4) DEFAULT 0 NOT NULL,
PRIMARY KEY (`plantioID`),
FOREIGN KEY(`plantaID`) REFERENCES planta(ID),
FOREIGN KEY(`funcID`) REFERENCES funcionario(funcID),
FOREIGN KEY(`canteiroID`) REFERENCES canteiro(canteiroID),
UNIQUE KEY `ID` (`plantioID`));

CREATE TABLE `colhido` (
colhidoID INT(11) NOT NULL AUTO_INCREMENT,
plantaID INT(11) NOT NULL,
funcID INT(11) NOT NULL ,
canteiroID INT(11) NOT NULL,
data DATE DEFAULT NULL,
quantidade INTEGER(4) DEFAULT 0 NOT NULL,
peso DOUBLE(4,3) DEFAULT 0 NOT NULL,
PRIMARY KEY (`colhidoID`),
FOREIGN KEY(`plantaID`) REFERENCES planta(ID),
FOREIGN KEY(`funcID`) REFERENCES funcionario(funcID),
FOREIGN KEY(`canteiroID`) REFERENCES canteiro(canteiroID),
UNIQUE KEY `ID` (`colhidoID`));


INSERT INTO canteiro VALUES (7, "Rosa", 10, 120);
INSERT INTO canteiro (nome, luzdiaria, agua) VALUES ("Margarida", 12, 150);
INSERT INTO canteiro (nome, luzdiaria, agua) VALUES ("Lotus", 30, 140);


INSERT INTO funcionario VALUES (12, "Jett Wind", 17);
INSERT INTO funcionario (nome, idade) VALUES ("Raze Rocket", 23);
INSERT INTO funcionario (nome, idade) VALUES ( "Chamber Sniper", 28);

INSERT INTO planta VALUES (19, "Macieira", 50, 47, 99);
INSERT INTO planta (nome, luzdiaria, agua, peso) VALUES ("Musgo", 12, 13, 79);
INSERT INTO planta (nome, luzdiaria, agua, peso) VALUES ("Bambu", 23, 87, 14);

INSERT INTO plantio VALUES (12, 19, 12, 7, "2022/09/21", 10);
INSERT INTO plantio (plantaID, funcID, canteiroID, data, sementes) VALUES (20, 13, 8, "2022/08/11", 20);
INSERT INTO plantio (plantaID, funcID, canteiroID, data, sementes) VALUES (21, 14, 9, "2022/07/02", 30);

INSERT INTO `colhido` VALUES (24, 19, 12, 7, "2023/01/08", 1000, 8.575);
INSERT INTO `colhido` (plantaID, funcID, canteiroID, Data, quantidade, peso) VALUES (20, 13, 8, "2023/08/16", 1550, 5.812);
INSERT INTO `colhido` (plantaID, funcID, canteiroID, Data, quantidade, peso) VALUES (21, 14, 9, "2023/12/13", 1800, 9.422);

