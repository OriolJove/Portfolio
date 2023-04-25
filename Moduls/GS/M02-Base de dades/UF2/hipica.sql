drop database disparadors3;
create database disparadors3;
use disparadors3;
create table CARRERAS(
CodCarrera varchar(4) primary key,
fechaHora date,
Nombre varchar (20),
Importe_Premio int (6),
ApuestaLimite numeric (6,2)
);
create table PARTICIPACIONES(
CodCaballo varchar(4) primary key,
CodCarrera varchar(4),
Dorsal int (2),
Jockey varchar(10),
PosicionFinal int (2)
);
create table APUESTAS(
DNICliente varchar(10) primary key,
CodCaballo varchar(4),
CodCarrera varchar(4),
Importe int (6),
Tantoporuno numeric (4,2)
);

delimiter //
create trigger carrera_caballo before insert on APUESTAS for each row
begin	
	if((new.Importe > (select ApuestaLimite from CARRERAS c where c.CodCarrera = new.CodCarrera))or (new.CodCaballo not in (select CodCaballo from PARTICIPACIONES where CodCarrera = new.CodCarrera))) then 
		call raise_error_application("Importe limtite superado");
    end if;
end //
delimiter ;
delimiter //
create trigger premio after insert on APUESTAS for each row
begin	
    if(new.CodCarrera = (select CodCarrera from CARRERAS where CodCarrera = new.CodCarrera)) then 
		update CARRERAS set Importe_Premio = sum((select Importe from APUESTAS where CodCarrera = new.CodCarrera));
    end if;
end //
delimiter ;
insert into CARRERAS values ("3","2021-03-08","Carmen",34,1000.00);
insert into APUESTAS values ("49722157K","14","3",300,4.5);
insert into PARTICIPACIONES values ("14","3",5,"89",7);
insert into CARRERAS values ("5","2021-01-03","Mario",24,400.00);
insert into APUESTAS values ("11111111G","24","5",500,3.5);
select *from CARRERAS;
select *from APUESTAS;
select *from PARTICIPACIONES;
