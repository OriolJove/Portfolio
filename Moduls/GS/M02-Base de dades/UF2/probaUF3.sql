drop database exUF3;
create database exUF3;
use exUF3;
CREATE TABLE Alumne(
CodiAlum INT PRIMARY KEY,
Nom VARCHAR(30)
);
CREATE TABLE Assignatura(
CodiAssig VARCHAR(3) PRIMARY KEY,
Nom VARCHAR(20)
);
CREATE TABLE Examen(
CodiExam INT PRIMARY KEY,
CodiAssig VARCHAR(3),
CodiAlum INT,
Nota INT, 
foreign key (CodiAssig) references Assignatura (CodiAssig),
foreign key (CodiAlum) references Alumne (CodiAlum)
);
CREATE TABLE Expedient(
CodiAssig VARCHAR(3),
CodiAlum INT,
Convocatories INT,
PRIMARY KEY (CodiAssig, CodiAlum),
foreign key (CodiAssig) references Assignatura (CodiAssig),
foreign key (CodiAlum) references Alumne (CodiAlum)
);
#1Creeu un disparador per controlar que un alumne, abans de presentar-se a un Examen, no tingui aquesta assignatura ja aprovada, i a més a més, que no hagi exhaurit les convocatòries per assignatura (màxim 4).
delimiter //
create trigger presentacio_examen before insert on Examen for each row
begin
	if((Select nota from Examen where new.CodiExam = CodiExam and new.CodiAlum = CodiAlum ) >=  5) then
		call raise_error_application("Ja esta aprovada");
    end if;
	if((Select count(*) from Examen where new.CodiExam = CodiExam and new.CodiAlum = CodiAlum ) >= 4) then
		call raise_error_application("Has superat el numero de convocatories");
    end if;
end //
delimiter ;
insert into Alumne values(1,"Alberto");
insert into Alumne values(2,"Alex");
insert into Alumne values(3,"Toni");
insert into Alumne values(4,"Marina");
insert into Assignatura values("M02","Base de datos");
insert into Assignatura values("M03","Programació");
insert into Assignatura values("M01","Sistemes");
insert into Assignatura values("M04","Llenguatge marques");
insert into Examen values(1,"M03",2,5);
insert into Examen values(1,"M03",2,5);
insert into Examen values(2,"M03",1,3);
delete from Assignatura;
select * from Alumne;
select * from Assignatura;
select * from Examen;
#2 Creeu els disparadors (insert i delete) perquè un cop un alumne aprovi una assignatura, s’actualitzi a la taula Expedient.
delimiter //
create trigger expedient after insert on Examen for each row
begin
	if((Select new.nota from Examen where new.CodiExam = CodiExam and new.CodiAlum = CodiAlum ) >=  5) then
		insert into Expedient values (new.CodiAssig,new.CodiAlum,(Select count(*) from examen where new.CodiExam = CodiExam and new.CodiAlum = CodiAlum));
    end if;
end //
delimiter ;
delimiter //
create trigger borrar_expedient after delete on Examen for each row
begin
	if((select count(*) from Examen where CodiAlum = old.CodiAlum) = 0) then
		delete from Expedient where CodiAlum = old.CodiAlum;
    end if;
end //
delimiter ;