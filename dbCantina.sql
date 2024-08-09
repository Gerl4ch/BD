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

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cnpj char(17) not null unique,
primary key(codForn));

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key(codCli));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(50) not null,
codFunc int not null,
primary key (codUsu),
foreign key (codFunc)references tbFuncionarios(codFunc));

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2),
validade date,
dataEntrada date,
horaEntrada time,
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));

create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
codUsu int not null,
codCli int not null,
codProd int not null,
primary key(codVenda),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli),
foreign key(codProd)references tbProdutos(codProd));
-- Visualizando as estruturas da tabelas 

desc tbFuncionarios;
desc tbUsuarios;
desc tbProdutos;
desc tbFornecedores;
desc tbClientes;
desc tbVendas;