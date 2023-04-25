drop database agenda;
create database agenda;
use agenda;

#Exercici 23:
DELIMITER //
Create procedure taula (in parametre char)
	begin
		if (parametre = 'T') then
			Create table diari(
			codi int primary key auto_increment,
			data date,
			hora time,
			event varchar(40)
			);
		else if  (parametre = 'E') then
			drop table diari;
	  end if;
	  end  if;
end //
delimiter ;
CALL taula('T');
#Exercici 24
DELIMITER //
Create procedure inser (in data2 date, in hora2 time, in event2 varchar(40))
	begin
		insert into diari values (null,data2,hora2,event2);
end //
delimiter ;
 CALL inser('2011/05/25','12:00','Reunió de direcció');
 CALL inser('2011/05/23','12:00','Reunió de direcció');
 CALL inser('2011/05/21','12:00','Reunió de direcció');
 CALL inser('2011/05/28','12:00','Reunió de direcció');
 #Exercici 25
 DELIMITER //
Create procedure elim (in data2 date, in data3 date)
	begin
		if(data2 < data3) then
			delete from diari where data between data2 and data3;
		else if (data2 > data3) then
			delete from diari where data between data2 and data3;
		else if(data2 is null and data3 is not null) then
			delete from diari where data < data3;
		else if (data2 is not null and data3 is null) then
			delete from diari where data > data2;
	end if;
    end if;
    end if;
    end if;
end //
delimiter ;

CALL elim(NULL,'2011/05/25');
select * from diari;
#Exercici 26
DELIMITER //
Create procedure posposar (in data2 date)
	begin
		update diari set data = concat(year(data2),'-',month(data2) + 1,'-',day(data2)) where data = data2;
end //
delimiter ;
 CALL posposar('2011/05/25');
select * from diari;
#Exercici 27
DELIMITER //
Create procedure dietari (in data2 date, in opcio char)
	begin
		if(upper(opcio) = 'A') then
        select date from diari where data = day(data2);
        else if (upper(opcio) = 'B') then
        select date from diari where yearweek(data) = yearweek(data2) and year(data) = year(data2);
        else if (upper(opcio) = 'C')then
        select date from diari where mounth(data) = month(data2) and year(data) = year(data2);
        end if;
        end if;
        end if;
end //
delimiter ;
CALL dietari('2011/05/25','A');
select * from diari;
#Exercici 28
DELIMITER //
Create procedure inser_rep (in data2 date, in data3 date, in hora2 time, in event2 varchar(40) ,in freqüencia char)
	begin
        while(data2 < data3) do
        insert into diari (data,hora,event) values (date2,hora2,event2);
			if(freqüencia = 'D') then
				set data2 = date_add(data2, interval 1 day);
			else if (freqüencia = 'S') then
				set data2 = date_add(data2, interval 1 week);
			else if (freqüencia = 'M') then
				set data2 = date_add(data2, interval 1 month);
		end if;
        end if;
        end if;
        end while;
end //
delimiter ;