-- apagando banco de dados 
drop database dbCantina;
-- criando novamente o banco 
create database dbCantina;
-- acessando banco de dados 
use dbCantina;
-- criando tabela
create table tbFuncionarios(
    codFunc int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) unique,
    cpf char(14) not null unique,
    sexo char(1) default "F" check(sexo in('F' , 'M')), -- default é pra colocar algo caso deixem vazio o check é pra entrar so f ou m 
    salario decimal(9,2) default 0 check(salario >= 0),
    nascimento date,
    telCel char(10),
    primary key (codFunc)
);

create table tbFornecedores(
    codForn int not null auto_increment,
    nome varchar(100) not null,
    cnpj char(18) not null unique,
    email varchar(100) not null,
    primary key (codForn)
);

create table tbClientes(
    codCli int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100),
    telCel char(10),
    primary key (codCli)
);

create table tbUsuarios(
    codUsu int not null auto_increment,
    nome varchar(25) not null unique,
    senha varchar(10) not null unique,
    codFunc int not null, -- ** essa chave aqui
    primary key(codUsu),
    foreign key(codFunc) references tbFuncionarios(codFunc) -- chave estrangeira, tem que ter uma chave de msm nome ja criada **
);


create table tbProdutos(
    codProd int not null auto_increment,
    descricao varchar(100),
    quantidade int,
    valor decimal(9,2),
    validade date,
    dataEntrada date,
    horaEntrada time,
    codForn int not null,
    primary key (codProd),
    foreign key(codForn) references tbFornecedores(codForn)
);

create table tbVendas(
    codVenda int not null auto_increment,
    dataVenda date,
    horaVenda time,
    quantidade int,
    codUsu int not null,
    codCli int not null,
    codProd int not null,
    primary key (codVenda),
    foreign key(codUsu)references tbUsuarios(codUsu),
    foreign key(codCli)references tbClientes(codCli),
    foreign key(codProd)references tbProdutos(codProd)
);

-- visualizando tabelas
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

--inserindo valores nas tabelas 

INSERT INTO tbFuncionarios(nome, email, cpf, sexo, salario, nascimento, telCel) 
VALUES ('italo','italo@email.com','123.123.123.12','M',1000,'1998-01-08','98782-5038');
INSERT INTO tbFuncionarios(nome, email, cpf, sexo, salario, nascimento, telCel) 
VALUES ('carlos','carlos@email.com','123.123.123.22','F',1000,'1998-01-10','98782-0000');

INSERT INTO tbFornecedores(nome,cnpj,email)
VALUES('fornecedor1','12.345.678/0001-00','fornecedor1@mail.com');
INSERT INTO tbFornecedores(nome,cnpj,email)
VALUES('fornecedor2','12.345.678/0222-01','fornecedor2@mail.com');


INSERT INTO tbClientes(nome,email,telCel)
VALUES('Bianca','bianca@email.com','99525-5214');
INSERT INTO tbClientes(nome,email,telCel)
VALUES('Ronaldo','ronaldo@email.com','99999-9999');
INSERT INTO tbClientes(nome,email,telCel)
VALUES('Jorge','jorge@email.com','91010-1010');

INSERT INTO tbUsuarios(nome,senha,codFunc)
VALUES('italo','0123456789',1);
INSERT INTO tbUsuarios(nome,senha,codFunc)
VALUES('carlos','0123456780',2);

INSERT INTO tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)
VALUES('Mesa martinelli',15,850.00,'2030-06-25','2024-08-16','19:50:55',1);
INSERT INTO tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)
VALUES('Pamonha',150,2.50,'2024-08-20','2024-08-16','19:53:55',2);
INSERT INTO tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)
VALUES('Bolo de morango',20,33.00,'2024-08-19','2024-08-16','19:54:00',2);
INSERT INTO tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)
VALUES('Cadeira',50,1550.00,'2030-06-25','2024-08-16','20:00:55',1);


INSERT INTO tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)
VALUES('2024/08/16','19:54:00',2,1,2,4);
INSERT INTO tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)
VALUES('2024/08/16','21:54:00',12,1,2,1);
INSERT INTO tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)
VALUES('2024/08/16','22:00:00',1,2,1,2);


select * from tbFuncionarios;
select* from tbFornecedores;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;