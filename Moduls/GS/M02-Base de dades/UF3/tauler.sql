drop database Tauler;
CREATE DATABASE Tauler;
use Tauler;

CREATE TABLE situacio (
idFigura INT PRIMARY KEY,
xCoord INT,
yCoord INT
) ENGINE=INNODB;

INSERT INTO situacio VALUES (1, 3, 5);
INSERT INTO situacio VALUES (2, 3, 7);
INSERT INTO situacio VALUES (3, 5, 4);

DELIMITER //
Create function alumne (nom varchar(15), cognom varchar(15)) returns varchar(10)
	begin
		return concat(nom,' ',cognom);
end //
delimiter ;
