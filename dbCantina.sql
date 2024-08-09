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
-- visualizando tabelas
desc tbFuncionarios;

create table tbUsuarios(
    codUsu int not null auto_increment,
    nome varchar(25) not null unique,
    senha varchar(10) not null unique,
    codFunc int not null, -- ** essa chave aqui
    primary key(codUsu),
    foreign key(codFunc) references tbFuncionarios(codFunc) -- chave estrangeira, tem que ter uma chave de msm nome ja criada **
);

desc tbUsuarios;