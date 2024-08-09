-- Apagando BD
drop database dbCantina;

-- Criando BD
create database dbCantina;

-- Acessando BD
use dbCantina;

-- Criando as Tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) unique,
cpf char(14) not null unique,
sexo char(1) default "F" check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario>=0),
nascimento date,
telCelular char(10) unique,
primary key (codFunc));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(50) not null,
codFunc int not null,
primary key (codUsu),
foreign key (codFunc)references tbFuncionarios(codFunc));


-- Visualizando as estruturas da tabelas 

desc tbFuncionarios;
desc tbUsuarios;