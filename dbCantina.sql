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
cnpj char(18) not null unique,
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

insert into tbVendas(dataVenda,horaVenda,codUsu,codCli,codProd)values('2024/08/15','12:25:00',1,1,3)

-- Visualizando as estruturas da tabelas 

desc tbFuncionarios;
desc tbUsuarios;
desc tbProdutos;
desc tbFornecedores;
desc tbClientes;
desc tbVendas;

-- inserindo registros nas tabelas

insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Leonardo Gerlach', 'leonardohg2005@gmail.com',
 '100.000.000-00', 'M', 1500.50, '2005/12/10', '11966066023');
insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Anderson Silva', 'anderson.silva@gmail.com',
 '100.280.000-00', 'M', 5000.00, '1998/07/05', '11945678945');


insert into tbFornecedores(nome,email,cnpj)values('Lucius Blaque', 'LuciusBlaque@gmail.com',
 '10.000.000/0001-00');
insert into tbFornecedores(nome,email,cnpj)values('Elvis Presley', 'elvis123@gmail.com',
 '10.234.000/0001-00');


insert into tbClientes(nome,email,telCelular)values('Luisa Hartman', 'luisahart@gmail.com',
 '11910235678');
insert into tbClientes(nome,email,telCelular)values('Mariana Hartman', 'Marihart@gmail.com',
 '11910235432');


insert into tbUsuarios(nome,senha,codFunc)values('Michael Jackson','musica123',1);
insert into tbUsuarios(nome,senha,codFunc)values('Guilherme Lima','yone321',1);


insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Computador Gamer',1,4000.00,'2026/12/01','2024/08/16','18:45:00',1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Cadeira Gamer',1,2500.00,'2028/05/01','2024/08/16','20:00:00',2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Fone Gamer',1,500.00,'2027/08/01','2024/08/16','21:30:00',2);


insert into tbVendas(dataVenda,horaVenda,codUsu,codCli,codProd)values('2024/08/15','12:25:00',2,1,3);
insert into tbVendas(dataVenda,horaVenda,codUsu,codCli,codProd)values('2024/08/15','12:25:00',1,2,1);

-- visualizando os registros das tabelas

select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;

-- alterando os registro das tabelas

update tbProdutos set descricao = 'Mouse Gamer', valor = 200.00 where codProd = 2;
update tbProdutos set descricao = 'Teclado Gamer', valor = 350.00 where codProd = 1;

-- visualizando depois das alterações

select * from tbProdutos;

-- Integridade e concistencia

select prod.descricao as "Nome do produto", 
forn.nome as "Nome do fornecedor"
from tbProdutos as prod
inner join tbFornecedores as forn
on prod.codForn = forn.codForn;
  
select usu.nome as "Nome do Usuário",prod.descricao as "Nome do Produto",cli.nome as "Nome do Cliente"
from tbVendas as vend
inner join tbUsuarios as usu
on vend.codUsu = usu.codUsu
inner join tbProdutos as prod
on vend.codProd = prod.codProd
inner join tbClientes as cli
on vend.codCli = cli.codCli;

-- Perguntando para a tabela de usuário 
-- nome do usuario 
-- nome do Funcionario ligado a esse usuario

select usu.nome as "Nome do Usuário", func.nome as "Nome do Funcionário"
from tbUsuarios as usu 
inner join tbFuncionarios as func 
on usu.codFunc = func.codFunc;