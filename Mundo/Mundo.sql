create database mundo;
use mundo;


create table pais
(
id_pais int,
primary key (id_pais),
Nome_pais varchar(35), 
Continente varchar(35), 
Pop real, 
PIB real,
Expec_vida real
);

create table Cidade
(
id_cidade int primary key,
Nome varchar(35), 
Pais varchar(35), 
Pop real, 
Capital enum ('S' ,'N'),
id_pais int,
foreign key (id_pais)
references pais (id_pais)
);

-- drop table cidade;
create table Rio
(
id_rio int primary key,
Nome varchar(35),
Origem varchar(35),
nome_pais varchar(35),
Comprimento integer
);
-- drop table rio;

create table cidade_pais
(
id_pais int,
id_cidade int,
foreign key(id_pais)
references pais (id_pais),

foreign key(id_cidade)
references cidade (id_cidade)
);

create table rio_cidade
(
id_rio int,
id_cidade int,

foreign key (id_rio)
references rio (id_rio),

foreign key (id_cidade)
references cidade (id_cidade)
);

create table rio_pais
(
id_rio int,
id_pais int,
foreign key (id_rio)
references rio (id_rio),

foreign key (id_pais)
references pais (id_pais)
);







insert into pais values
(1,'canada','Am.Norte',30.1,658 ,77.09),
(2,'México','Am.Norte',107.5,694,69.1),
(3,'Brasil','Am.Sul',183.3,10004,65.2),
(4,'USA','Am.Norte',270.0 ,8003 ,75.5);
-- select*from pais;

insert into cidade values
(1,'Whashington','USA',3.3,'s',4),
(2,'Monterrey','Mexico',2.0,'n',2),
(3,'Brasilia','Brasil',1.5,'s',3),
(4,'São Paulo','Brasil',15.0,'n',3),
(5,'Ottawa','Canada',0.8,'s',1),
(6,'Cid.Mexico','Mexico',14.1,'s',2);

insert into rio values
(1,'St.Lawrence','USA','USA',3.3),
(2,'Grande','USA','Mexico',2.0),
(3,'Parana','Brasil','Brasil',1.5),
(4,'Mississipi','USA','USA',15.0);

SELECT cidade.nome, pais.nome_pais
FROM cidade
INNER JOIN pais
ON cidade.id_pais = pais.id_pais;

select nome from cidade
where capital = 'S';

select*from pais
where Expec_vida < 70 ;

select cidade.nome , pais.pop
from cidade
inner join pais
on cidade.id_pais = pais.id_pais
where PIB > 1000; 

select cidade.Nome , cidade.Pop	
from cidade
inner join rio
on rio.id_rio = cidade.id_cidade
where rio.Nome = 'St.Lawrence';

select avg(Pop)
from cidade
where Capital = 'N';

select Continente , avg(PIB)
from pais
group by Continente;


select pais.Nome , rio.Nome
from pais
inner join rio
on rio.id_rio = pais.id_pais;
 


select Nome_pais
from pais
where PIB > 658;

