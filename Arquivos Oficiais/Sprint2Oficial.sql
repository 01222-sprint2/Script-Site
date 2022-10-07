create database Sprint2Oficial;

use Sprint2Oficial;

create table empresa (idEmpresa int primary key auto_increment, nomeEmpresa varchar(45),
cnpj varchar(14), telefoneUm varchar(11),  telefoneDois varchar(11), emailEmpresa varchar(45),
senha varchar(12), quatidaddeHectares decimal, dataContrato datetime);

create table hectares (idhectares int primary key, localizacaoHectare varchar(45), fkEmpresa int,
constraint foreign key fkEmp (fkEmpresa) references empresa (idempresa));


create table endereço (idEndereco int, rua varchar(45), cep varchar(10), bairro varchar(45),
complemento  varchar (10), estado varchar(45), cidade varchar(45), fkEmpresa int, fkHectares int,
constraint foreign key fkEmpre (fkEmpresa) references empresa (idempresa),
constraint foreign key fkHec (fkHectares) references Hectares (idhectares));



create table sensor (idsensor int primary key auto_increment, statusSensor varchar(45), fkHectares int,
constraint foreign key fkHect (fkHectares) references hectares (idhectares));

create table dadosSensor (idDadosSensor int primary key auto_increment, umidade double, temperatura double,
dataDado datetime, fkSensor int, constraint foreign key Sen (fkSensor) references sensor (idsensor));

insert into empresa values
(null,'MaisAgro', 01937635000182, '9999-9999', '1111-1111','agro@gmail.com','agro1234',12, '2022-04-15'),
(null,'Embrapa', 03342589000190, '3333-3333 ','5555-5555','empraba@outlook', 'embra123',6, '2022-12-12');

insert into hectares values
(1, 'LadoA', 1),
(2,'LadoB',1),
(3,'LadoA',2);

insert into endereço values 
(1,'Rua das pitangas','07897-012','Bairro Vergueiro','3400', 'SP','Guaianases',1,1),
(1,'Rua das laranjeiras','04324-059','Bairro Vergueiro', '1200','MA','Imperatriz',1,2),
(2,'Rua Denise', '08967-034','Bairro Lutania', '1353','SC','Gramado',2,2);

insert into sensor values
(null, 'Ativo', 1),
(null, 'Ativo', 2),
(null,'Ativo', 3);


insert into dadosSensor values 
(null, 123.98, 22.5, '2022-09-12 12:34', 1),
(null, 231.90, 20.9, '2022-11-10 14:56', 2),
(null, 342.89, 18.2, '2022-10-14 14:34', 3);

select * from empresa;
select * from endereço;
select * from hectares;
select * from sensor;
select * from dadosSensor;


select * from endereço join empresa on fkEmpresa = idempresa join
hectares on  fkHectares = idhectares;

select sensor.idsensor, sensor.statusSensor, hectares.idhectares , empresa.nomeEmpresa from sensor join hectares on fkHectares = idhectares
join empresa on fkEmpresa = idempresa;


drop database Sprint2Oficial;
