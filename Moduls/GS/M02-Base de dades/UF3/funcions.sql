drop database funcions;
create database funcions;
use funcions;

DELIMITER //
Create function apte (nota int) returns varchar(10)
	begin
		if(nota < 5) then
			return "no apte";
		else if (nota >= 5) then
			return "apte";
	end if;
    end if;
end //
delimiter ;
select apte(3);
#Exercici DCL_48
DELIMITER //
Create function torn (hora time) returns varchar(10)
	begin
		if (hora between '08:00' and '15:00') then
			return "matí";
		else if (hora between '15:00' and '22:00') then
            return "tarda";
		else
			return "-";
		end if;
        end if;
end //
delimiter ;
Select torn('8:00');
#Exercici DCL_49
DELIMITER //
Create function alumne (nom varchar(15), cognom varchar(15)) returns varchar(10)
	begin
		return concat(nom,' ',cognom);
end //
delimiter ;
select alumne('Pere','Plaza');