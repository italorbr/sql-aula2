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
    salario decimal(9,2),
    nascimento date,
    telCel char(10),
    primary key (codFunc)
);