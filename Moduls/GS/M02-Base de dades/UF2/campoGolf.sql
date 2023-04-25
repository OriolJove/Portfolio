/*La base de dades guarda les dades dels socis del club de golf, el material que hi ha al camp y que pot alquilar qualsevol soci, els treballador dels camps amb les hores extra, 
els forats que hi ha al camp amb lña distancia i els obstacles. Per cada empleat que sigui entrenador pot estar amb un soci, i per cada soci la reserva que fa i els jugadors que son i el forats que juguen*/ 
drop database campogolf;
create database campogolf;
use campogolf; 
create table socios(
DNI char (10) unique not null primary key,
nom char (15),
cognoms char,
dataNaixement date,
provincia char,
idEmpleat int,
foreign key (idEmpleat) references empleats(idEmpleat)
);
create table material(
codMaterial int primary key unique,
nombrePalo char (15) unique,
cantidadPalos int,
cantidadPelotas int,
colorPelotas char (10),
carritos char
);
create table empleats(
idEmpleat int primary key,
DNI char (10),
nom char (15),
cognoms char,
carrec char,
horaExtra DECIMAL(8,2)
);
create table hoyos(
idHoyo int primary key,
distancia int,
par  smallint,
cantidadObstaculoAgua int,
cantidadBunkerArena int
);
create table reserva (
idHoyo int,
DNI char (10) unique not null,
primary key (idHoyo,DNI),
numerojugadores int,
diaReserva date,
foreign key (idHoyo) references hoyos(idHoyo),
foreign key (DNI) references socios(DNI)
);
create table alquiler (
DNI char (10) not null,
codMaterial int,
primary key (DNI,codMaterial),
foreign key (DNI) references socios(DNI),
foreign key (codMaterial) references material(codMaterial)
);

alter table socios modify cognoms char (9);
alter table socios modify provincia char (20);
alter table material modify carritos int;
#socios
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('12345678J','pablo','motos','1990-03-1','Barcelona');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('28567194S', 'Maria', 'Gomez','1979-2-20','Tarragona');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('43658976L', 'Pedro', 'Jové','1950-12-13','Barcelona');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('33337777H', 'Alberto', 'Esteban','1981-05-01','Lleida');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('88888888C', 'Berrta', 'Zamora','1968-01-30','Tarragona');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('68263642G', 'Alex', 'Garcia','1979-07-21','Lleida');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('47981868R', 'Manel', 'Sanchez','1990-08-08','Barcelona');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('42434249V', 'Carlos', 'Fernandez','1985-11-30','Barcelona');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('66573653A', 'Nuria', 'Prats','1980-04-24','Lleida');
insert into socios (DNI,nom,cognoms,dataNaixement,provincia) values ('15887324P', 'Teodoro', 'Garcia','1981-01-04','tarragona');

update socios set idEmpleat = 1 where DNI = '12345678J';
update socios set idEmpleat = 3 where DNI = '43658976L';
update socios set idEmpleat = 2 where DNI = '88888888C';
update socios set idEmpleat = 3 where DNI = '28567194S';
update socios set nom = 'Berta' where DNI = '88888888C';
select *from socios;
#material
insert into material (codMaterial,nombrePalo,cantidadPalos,carritos) values (1,'Hierros',7,2);
insert into material (codMaterial,cantidadPelotas,colorPelotas) values (2,20,'amarillas');
insert into material (codMaterial,nombrePalo,cantidadPalos,cantidadPelotas,colorPelotas,carritos) values (3,'Wedge',8,16,'blancas',1);
insert into material (codMaterial,nombrePalo,cantidadPalos,carritos) values (4,'Maderas',4,1);
insert into material (codMaterial,cantidadPelotas,colorPelotas) values (5,25,'negras');
#empleats
alter table empleats modify cognoms char (15);
alter table empleats modify carrec char (30);
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec) values (1,'22222222K','Gerard','Martinez','Entrenador');
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec,horaExtra) values (4, '11112222G', 'Marc','Garcia','Limpiaor',2);
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec,horaExtra) values (5, '22221111F', 'Alex','Garcia','Limpiaor',0);
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec,horaExtra) values (2,'76821247J','Gabi','Lopez','Entrenador',3);
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec) values (3,'44441111B','Joel','Sanchez','Entrenador');
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec,horaExtra) values (6,'41766455T','Toni','Romero','Entrenador',2);
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec,horaExtra) values (7,'81517393L','Pau','Gonzalez','Entrenador',1);
insert into empleats (idEmpleat,DNI,nom,cognoms,carrec) values (8,'31543451M','Paula','Gomez','Entrenador');
update empleats set carrec = 'Limpiador' where idEmpleat = 4;
update empleats set carrec = 'Limpiador' where idEmpleat = 5;
#hoyos
alter table hoyos modify distancia varchar (10);
insert into hoyos (idHoyo,distancia,par,cantidadObstaculoAgua,cantidadBunkerArena) values (1,'28m',3,2,1);
insert into hoyos (idHoyo,distancia,par,cantidadObstaculoAgua,cantidadBunkerArena) values (2,'12m',2,1,1);
insert into hoyos (idHoyo,distancia,par,cantidadObstaculoAgua,cantidadBunkerArena) values (3,'42m',4,1,3);
insert into hoyos (idHoyo,distancia,par,cantidadObstaculoAgua,cantidadBunkerArena) values (4,'34m',5,4,4);
insert into hoyos (idHoyo,distancia,par,cantidadObstaculoAgua,cantidadBunkerArena) values (5,'61m',6,3,2);

#reserva
insert into reserva (idHoyo,DNI,diaReserva) values (1,'12345678J','2018-01-09');
insert into reserva (idHoyo,DNI,diaReserva) values (4,'43658976L','2020-08-17');
insert into reserva (idHoyo,DNI,diaReserva) values (2,'28567194S','2019-11-19');
insert into reserva (idHoyo,DNI,diaReserva) values (3,'33337777H','2022-03-06');
insert into reserva (idHoyo,DNI,diaReserva) values (5,'88888888C','2021-04-24');
insert into reserva (idHoyo,DNI,diaReserva) values (3,'42434249V','2021-05-14');
insert into reserva (idHoyo,DNI,diaReserva) values (1,'66573653A','2019-12-10');
insert into reserva (idHoyo,DNI,diaReserva) values (2,'68263642G','2022-02-20');

update reserva set numerojugadores = 3 where DNI = '12345678J';
update reserva set numerojugadores = 6 where DNI = '28567194S';
update reserva set numerojugadores = 2 where DNI = '33337777H';
update reserva set numerojugadores = 8 where DNI = '88888888C';
update reserva set numerojugadores = 4 where DNI = '43658976L';

select *from reserva;

#alquiler
insert into alquiler (DNI,codMaterial) values ('12345678J',1);
insert into alquiler (DNI,codMaterial) values ('88888888C',1);
insert into alquiler (DNI,codMaterial) values ('43658976L',1);
insert into alquiler (DNI,codMaterial) values ('33337777H',1);
insert into alquiler (DNI,codMaterial) values ('28567194S',1);
update alquiler set codMaterial = 1 where DNI = '12345678J';
update alquiler set codMaterial = 2 where DNI = '88888888C';
update alquiler set codMaterial = 3 where DNI = '43658976L';
update alquiler set codMaterial = 4 where DNI = '33337777H';
update alquiler set codMaterial = 5 where DNI = '28567194S';
select *from alquiler;
#consultas 
#Muestra el total de pelotas y palos que hay para alquilar y que socios las han usado
select sum(m.cantidadPalos) , sum(m.cantidadPelotas), s.nom from material m, socios s, alquiler a where s.DNI = a.DNI and a.codMaterial = m.codMaterial group by s.nom;
#Mustra el nombre de los socios que han reservado en el año 2021
select s.nom,s.cognoms, r.diaReserva from socios s, reserva r where year(r.diaReserva) = 2021 and r.DNI = s.DNI;
#Muestra el hoyo con el par mas bajo
select idHoyo, par from hoyos order by par asc limit 1;
#Muestra los hoyos que más se hayan jugado
select count(idHoyo) as cantidad_hoyos, idHoyo from reserva group by idHoyo having count(idHoyo) = (select count(*) from reserva  group by idHoyo order by count(*) desc limit 1);
#Muestra la provincia la cual vienen más socios
select count(provincia) as cantidad_socios, provincia from socios group by provincia having count(provincia) = (select count(*) from socios  group by provincia order by count(*) desc limit 1);
#Muestra el nombre del empleado que este a cargo de socios y lugo muestra los que son impiadores
select e.nom, e.cognoms,'Entrenador' from empleats e, socios s where s.idEmpleat is not null and s.idEmpleat = e.idEmpleat union (select e.nom, e.cognoms, 'Limpiador' from empleats e, socios s where e.carrec = 'Limpiador');
#Mostrar el número de carritos de golf alquilados por socio
select DNI, sum(carritos) from alquiler a, material m where a.codMaterial = m.codMaterial group by DNI;
#Muestra el hoyo más jugado
select count(idHoyo),idHoyo from reserva group by idHoyo having count(idHoyo) = (select count(idHoyo)from reserva group by idHoyo order by count(*) desc limit 1);
#Muestra el empleado con más horas extra acumuladas
select nom, cognoms, sum(horaExtra) as totalHorasExtra from empleats group by nom order by totalHorasExtra desc limit 1;
#Muestra los socios que empiecen por M y sean de tarragona
select nom, cognoms from socios where provincia = 'Tarragona' and nom like '%M%';