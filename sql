/* =========================================================
   AUTOTECHNOLOGY EXPRESS
   BANCO DE DADOS DE OFICINA MECÂNICA
   ========================================================= */


/* =========================
   DDL - CRIAÇÃO DO BANCO
   ========================= */

CREATE DATABASE oficina_mecanica_db;
GO

USE oficina_mecanica_db;
GO


CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(80) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(9) NOT NULL
);
GO


CREATE TABLE Veiculo (
    id_veiculo INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL,
    chassi VARCHAR(30) NOT NULL UNIQUE,
    placa VARCHAR(10) NOT NULL UNIQUE,

    CONSTRAINT FK_Veiculo_Cliente
        FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
);
GO


CREATE TABLE Mecanico (
    id_mecanico INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    funcao VARCHAR(100) NOT NULL
);
GO


CREATE TABLE Ordem_Servico (
    id_ordem_servico INT IDENTITY(1,1) PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_mecanico INT NOT NULL,
    data_abertura DATETIME NOT NULL,
    estimativa_entrega DATETIME NOT NULL,
    descricao_servicos VARCHAR(500) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT FK_OS_Veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES Veiculo(id_veiculo),

    CONSTRAINT FK_OS_Mecanico
        FOREIGN KEY (id_mecanico)
        REFERENCES Mecanico(id_mecanico)
);
GO


/* =========================
   DML - CLIENTES
   ========================= */

INSERT INTO Cliente
(nome, cpf, telefone, email, logradouro, numero, complemento,
 bairro, cidade, estado, cep)
VALUES
('João da Silva','123.456.789-00','(14) 99876-1234',
 'joao.silva@email.com','Rua das Flores','100',NULL,
 'Centro','Botucatu','SP','18600-000');

SELECT * FROM Cliente;
GO

INSERT INTO Cliente
(nome, cpf, telefone, email, logradouro, numero, complemento,
 bairro, cidade, estado, cep)
VALUES
('Mariana de Oliveira','987.654.321-00','(14) 99123-4567',
 'mariana.oliveira@email.com','Rua São Paulo','250',NULL,
 'Vila Nova','Pardinho','SP','18640-000');

SELECT * FROM Cliente;
GO

INSERT INTO Cliente
(nome, cpf, telefone, email, logradouro, numero, complemento,
 bairro, cidade, estado, cep)
VALUES
('Carlos Menezes','321.987.654-11','(14) 99654-3210',
 'carlos.mennezis@email.com','Avenida Brasil','350',NULL,
 'Centro','São Manuel','SP','18650-000');

SELECT * FROM Cliente;
GO

INSERT INTO Cliente
(nome, cpf, telefone, email, logradouro, numero, complemento,
 bairro, cidade, estado, cep)
VALUES
('Ana Beatriz de Souza','456.789.123-22','(14) 99444-8899',
 'ana.souza@email.com','Rua das Acácias','450',NULL,
 'Jardim Paraíso','Botucatu','SP','18600-000');

SELECT * FROM Cliente;
GO


/* =========================
   DML - VEÍCULOS
   ========================= */

INSERT INTO Veiculo
(id_cliente, marca, modelo, ano_fabricacao, chassi, placa)
VALUES
(1,'Fiat','Uno',2015,'9BWZZZ377VT004251','ABC1A23');

SELECT * FROM Veiculo;
GO

INSERT INTO Veiculo
(id_cliente, marca, modelo, ano_fabricacao, chassi, placa)
VALUES
(2,'Chevrolet','Onix',2020,'9BG116GW04C400001','XYZ9Z99');

SELECT * FROM Veiculo;
GO

INSERT INTO Veiculo
(id_cliente, marca, modelo, ano_fabricacao, chassi, placa)
VALUES
(3,'Toyota','Corolla',2018,'8AJZZZ123J1234567','JKL3D45');

SELECT * FROM Veiculo;
GO

INSERT INTO Veiculo
(id_cliente, marca, modelo, ano_fabricacao, chassi, placa)
VALUES
(4,'Honda','Fit',2017,'93HGE8850EZ500123','QWE7E77');

SELECT * FROM Veiculo;
GO


/* =========================
   DML - MECÂNICOS
   ========================= */

INSERT INTO Mecanico
(nome, cpf, telefone, email, data_contratacao, funcao)
VALUES
('Rafael dos Santos','888.999.000-11','(14) 99777-1234',
 'rafael.santos@autotechnology.com','2025-01-01','Mecânico Geral');

SELECT * FROM Mecanico;
GO

INSERT INTO Mecanico
(nome, cpf, telefone, email, data_contratacao, funcao)
VALUES
('Luciana Fernandes','777.888.999-22','(14) 99666-4567',
 'luciana.fernandes@autotechnology.com','2025-06-15',
 'Especialista em Freios');

SELECT * FROM Mecanico;
GO

INSERT INTO Mecanico
(nome, cpf, telefone, email, data_contratacao, funcao)
VALUES
('Pedro Almeida','666.777.888-33','(14) 99555-7890',
 'pedro.almeida@autotechnology.com','2023-09-10',
 'Eletricista Automotivo');

SELECT * FROM Mecanico;
GO

INSERT INTO Mecanico
(nome, cpf, telefone, email, data_contratacao, funcao)
VALUES
('Carla Monteiro','555.666.777-44','(14) 99444-3210',
 'carla.monteiro@autotechnology.com','2024-06-01',
 'Mecânica de Veículos Leves');

SELECT * FROM Mecanico;
GO


/* =========================
   DML - ORDENS DE SERVIÇO
   ========================= */

INSERT INTO Ordem_Servico
(id_veiculo,id_mecanico,data_abertura,estimativa_entrega,
 descricao_servicos,valor_total,status)
VALUES
(1,1,'2025-09-20 08:30:00','2025-09-21 08:30:00',
 'Troca de óleo e filtro',150.00,'Concluída');

SELECT * FROM Ordem_Servico;
GO

INSERT INTO Ordem_Servico
(id_veiculo,id_mecanico,data_abertura,estimativa_entrega,
 descricao_servicos,valor_total,status)
VALUES
(2,2,'2025-09-21 10:00:00','2025-09-23 10:00:00',
 'Substituição de pastilhas de freio dianteiras',
 300.00,'Em Andamento');

SELECT * FROM Ordem_Servico;
GO

INSERT INTO Ordem_Servico
(id_veiculo,id_mecanico,data_abertura,estimativa_entrega,
 descricao_servicos,valor_total,status)
VALUES
(3,3,'2025-09-22 14:15:00','2025-09-23 08:00:00',
 'Diagnóstico de falha no sistema elétrico',
 120.00,'Aberta');

SELECT * FROM Ordem_Servico;
GO

INSERT INTO Ordem_Servico
(id_veiculo,id_mecanico,data_abertura,estimativa_entrega,
 descricao_servicos,valor_total,status)
VALUES
(4,4,'2025-09-23 09:45:00','2025-09-24 09:45:00',
 'Alinhamento e balanceamento',
 100.00,'Cancelada');

SELECT * FROM Ordem_Servico;
GO


/* =========================
   ATUALIZAÇÕES
   ========================= */

UPDATE Veiculo
SET modelo = 'Civic'
WHERE placa = 'QWE7E77';

SELECT * FROM Veiculo;
GO


UPDATE Cliente
SET email = 'carlos.menezes@email.com'
WHERE cpf = '321.987.654-11';

SELECT * FROM Cliente;
GO


/* =========================
   EXCLUSÃO
   ========================= */

DELETE FROM Ordem_Servico
WHERE id_veiculo = (
    SELECT id_veiculo
    FROM Veiculo
    WHERE placa = 'QWE7E77'
);

SELECT * FROM Ordem_Servico;
GO
