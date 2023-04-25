drop database disparador1;
create database disparador1;
use disparador1;
CREATE TABLE prova (codi INT);
CREATE TABLE suma (suma INT);
CREATE TABLE suma_text (suma VARCHAR(200));
create table prova_log (
hora_data datetime,
usuari varchar(200),
accio varchar (20)
);
create table suma_valors(
codi int,
vegades int
);
create table prova_puntuacio (lletra ENUM('A','B','C','D','E'), puntuacio enum('1','2','3','4','5','6','7','8','9','10'));
create table prova_puntuacio_seg (lletra char, puntuacio int);
select * from suma_valors;
delimiter //
create trigger ex52 after insert on prova for each row
begin
delete from suma;
insert into suma values(new.codi);
end //
delimiter ;
delimiter //
create trigger ex53 after update on prova for each row
begin
delete from suma;
insert into suma values ((select count(*) from prova));
end //
delimiter ;
delimiter //
create trigger ex53_B after DELETE on prova for each row
begin
	if((select count(*) from suma)= 0) then
	insert into suma values((select count(*)from prova));
	else
	update suma set suma = (select count(*) from prova);
	end if;
end //
delimiter ;
delimiter //
create trigger ex53_c after delete on  prova for each row
begin
	if ((select count(*) from suma) = 0) then
    delete from suma;
    else
    update suma set suma =  (select count(*) from prova);
    end if;
end //
delimiter ;
delimiter //
create trigger ex54 before insert on  prova for each row
begin
	if ((select count(*)from prova)= 0) then
    insert into suma_text values(new.codi);
    else
	update suma_text set suma = concat (suma,'+', new.codi);
    end if;
    end //
delimiter ;
delimiter //
create trigger ex55 after insert on  prova for each row
begin
		insert into prova_log values(now(), user(),concat('Inserció:', new.codi));
    end //
delimiter ;
delimiter //
create trigger ex55_b after delete on  prova for each row
begin
		insert into prova_log values(now(), user(),concat('Eliminació:', old.codi));
    end //
delimiter ;
delimiter //
create trigger ex55_c after update on  prova for each row
begin
	   insert into prova_log values(now(), user(),concat('Canvi:', old.codi, '>'));
	end //
delimiter ;
delimiter //
create trigger ex56 after insert on prova for each row
begin
	if ((select count(*) from suma_valors where codi = new.codi) = 0) then
		insert into suma_valors values(new.codi, (select count(*) from prova where codi = new.codi));	
	else
		update suma_valors set vegades = (select count(*) from prova where codi = new.codi) where codi = new.codi;
	end if;
	end //
delimiter ;
delimiter //
create trigger ex56_b after delete on prova for each row
begin
	if ((select count(*) from prova where codi = old.codi) = 0) then
		delete from suma_valors where codi = old.codi;
	else
		update suma_valors set vegades = (select count(*) from prova where codi = old.codi) where codi = old.codi;
	end if;
	end //
delimiter ;

delimiter //
create trigger ex56_c after update on prova for each row
begin
	if ((select count(*) from suma_valors where codi = new.codi) = 0) then
		insert into suma_valors values(new.codi, (select count(*) from prova where codi = new.codi));	
	else
		update suma_valors set vegades = (select count(*) from prova where codi = new.codi) where codi = new.codi;
	end if;
    if ((select count(*) from prova where codi = old.codi) = 0) then
		delete from suma_valors where codi = old.codi;
	else
		update suma_valors set vegades = (select count(*) from prova where codi = old.codi) where codi = old.codi;
	end if;
	end //
delimiter ;
show triggers;
insert into prova values(3);
insert into prova values(4);
insert into prova values(4);
select * from prova;
select * from suma_valors;
delete from prova limit 1;
update prova set codi = 2 where codi = 3;
drop trigger ex56;
delimiter //
create trigger ex57 after insert on prova for each row
begin
	if ((select count(*) from prova) <= 10) then
		insert into suma values (new.codi);
	else
		delete from suma limit 1;
        insert into suma values (new.codi);
	end if;
	end //
delimiter ;
delete from prova;
delete from suma;
drop trigger ex57;
insert into prova values(0);
insert into prova values(1);
insert into prova values(2);
insert into prova values(3);
insert into prova values(4);
insert into prova values(5);
insert into prova values(6);
insert into prova values(7);
insert into prova values(8);
insert into prova values(9);
insert into prova values(10);
select * from suma;
select * from prova;
delimiter //
create trigger ex58 after insert on prova for each row
begin
	
	end //
delimiter ;