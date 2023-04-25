DROP DATABASE IF EXISTS plantes;
CREATE DATABASE plantes;
USE plantes;

CREATE TABLE estacio
      	(nom_estacio     	CHAR(9) 	PRIMARY KEY       
      	)ENGINE = InnoDB
	;

CREATE TABLE metode_reproduccio
	(nom_metode		CHAR(20)	PRIMARY KEY
	)ENGINE = InnoDB
	;	

CREATE TABLE firma_comercial
	(nom_firma		CHAR(20)	PRIMARY KEY
	)ENGINE = InnoDB
	;

CREATE TABLE adob
	(nom_adob		CHAR(20)		PRIMARY KEY,
	nom_firma		CHAR(20)		NOT NULL,
	tipus_adob		ENUM('LLD','AI')        NOT NULL,
	FOREIGN KEY (nom_firma) REFERENCES firma_comercial(nom_firma)
	)ENGINE = InnoDB
	;

CREATE TABLE planta
	(nom_cientific		CHAR(20)	PRIMARY KEY,
	nom_popular		CHAR(20),
	floracio		CHAR(9),
	FOREIGN KEY (floracio) REFERENCES estacio(nom_estacio)
      	)ENGINE = InnoDB
	;

CREATE TABLE planta_interior
	(nom_planta		CHAR(20)	PRIMARY KEY,
	ubicacio		CHAR(20),
	temperatura		INTEGER,
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;

CREATE TABLE planta_exterior
	(nom_planta		CHAR(20)	PRIMARY KEY,
	tipus_planta		ENUM('T','P'),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;

CREATE TABLE exemplar_planta 
	(nom_planta		CHAR(20)	NOT NULL,
	num_exemplar		INTEGER		NOT NULL,
	PRIMARY KEY(nom_planta,num_exemplar),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;

CREATE TABLE dosi_adob
	(nom_planta		CHAR(20)	NOT NULL,
	nom_estacio		CHAR(9)		NOT NULL,
	nom_adob		CHAR(20)	NOT NULL,
	quantitat_adob		INTEGER		CHECK ((quantitat_adob>=20) AND (quantitat_adob<100)),
	PRIMARY KEY(nom_planta,nom_estacio,nom_adob),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific),
	FOREIGN KEY (nom_estacio) REFERENCES estacio(nom_estacio),
	FOREIGN KEY (nom_adob) REFERENCES adob(nom_adob)
	)ENGINE = InnoDB
	;	

CREATE TABLE reproduccio
	(nom_planta		CHAR(20)	NOT NULL REFERENCES planta,
	metode_reproduccio	CHAR(20)	NOT NULL REFERENCES metode_reproduccio,
	grau_exit		ENUM('Mitjà','Alt','Baix'),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific),
	FOREIGN KEY (metode_reproduccio) REFERENCES metode_reproduccio(nom_metode)
	)ENGINE = InnoDB
	;

INSERT INTO estacio VALUES ('Estiu');
INSERT INTO estacio VALUES ('Hivern');
INSERT INTO estacio VALUES ('Primavera');
INSERT INTO estacio VALUES ('Tardor');

INSERT INTO metode_reproduccio VALUES ('Bulbs');
INSERT INTO metode_reproduccio VALUES ('Capficats');
INSERT INTO metode_reproduccio VALUES ('Esqueix');
INSERT INTO metode_reproduccio VALUES ('Estaques');
INSERT INTO metode_reproduccio VALUES ('Estolons');
INSERT INTO metode_reproduccio VALUES ('Llavors');
	
INSERT INTO firma_comercial VALUES ('CIRSADOB');
INSERT INTO firma_comercial VALUES ('PRISADOB');
INSERT INTO firma_comercial VALUES ('TIRSADOB');
INSERT INTO firma_comercial VALUES ('UOCADOB');
	
INSERT INTO adob VALUES ('Plantavit','UOCADOB','LLD');
INSERT INTO adob VALUES ('Vitaplant','TIRSADOB','AI');
INSERT INTO adob VALUES ('Nutreplant','CIRSADOB','LLD');
INSERT INTO adob VALUES ('Creixplant','PRISADOB','AI');
INSERT INTO adob VALUES ('Casadob','TIRSADOB','AI');
INSERT INTO adob VALUES ('Plantadob','PRISADOB','LLD');
INSERT INTO adob VALUES ('Superplant','CIRSADOB','AI');
INSERT INTO adob VALUES ('Sanexplant','UOCADOB','LLD');

INSERT INTO planta VALUES ('Geranium','Gerani','Primavera');
INSERT INTO planta VALUES ('Begonia rex','Begònia','Estiu');
INSERT INTO planta VALUES ('Camellia','Camèlia','Primavera');
INSERT INTO planta VALUES ('Cyclamen','Ciclamen','Hivern');
INSERT INTO planta VALUES ('Rosa','Roser','Primavera');
INSERT INTO planta VALUES ('Polystichum','Falguera',null);
INSERT INTO planta VALUES ('Tulipa','Tulipa','Primavera');
INSERT INTO planta VALUES ('Chrysanthemum','Crisantem','Estiu');
INSERT INTO planta VALUES ('Philodendron','Potus',null);
INSERT INTO planta VALUES ('Chlorophytum','Cintes',null);
INSERT INTO planta VALUES ('Euphorbia','Poinsetia','Hivern');
INSERT INTO planta VALUES ('Hedera','Heura',null);
INSERT INTO planta VALUES ('Ficus','Ficus Benjamina',null);
INSERT INTO planta VALUES ('Codiaeum','Croton',null);

INSERT INTO planta_interior VALUES ('Philodendron','Llum directa',15);
INSERT INTO planta_interior VALUES ('Euphorbia','Llum indirecta',18);
INSERT INTO planta_interior VALUES ('Ficus','Llum indirecta',19);
INSERT INTO planta_interior VALUES ('Codiaeum','No corrents',17);

INSERT INTO planta_exterior VALUES ('Geranium','P');
INSERT INTO planta_exterior VALUES ('Begonia rex','P');
INSERT INTO planta_exterior VALUES ('Camellia','P');
INSERT INTO planta_exterior VALUES ('Cyclamen','P');
INSERT INTO planta_exterior VALUES ('Rosa','P');
INSERT INTO planta_exterior VALUES ('Polystichum','P');
INSERT INTO planta_exterior VALUES ('Tulipa','T');
INSERT INTO planta_exterior VALUES ('Chrysanthemum','T');
INSERT INTO planta_exterior VALUES ('Chlorophytum','P');
INSERT INTO planta_exterior VALUES ('Hedera','P');

INSERT INTO exemplar_planta VALUES ('Geranium',1);
INSERT INTO exemplar_planta VALUES ('Geranium',2);
INSERT INTO exemplar_planta VALUES ('Geranium',3);
INSERT INTO exemplar_planta VALUES ('Geranium',4);
INSERT INTO exemplar_planta VALUES ('Geranium',5);
INSERT INTO exemplar_planta VALUES ('Geranium',6);
INSERT INTO exemplar_planta VALUES ('Begonia rex',1);
INSERT INTO exemplar_planta VALUES ('Begonia rex',2);
INSERT INTO exemplar_planta VALUES ('Begonia rex',3);
INSERT INTO exemplar_planta VALUES ('Begonia rex',4);
INSERT INTO exemplar_planta VALUES ('Rosa',1);
INSERT INTO exemplar_planta VALUES ('Rosa',2);
INSERT INTO exemplar_planta VALUES ('Rosa',3);
INSERT INTO exemplar_planta VALUES ('Hedera',1);
INSERT INTO exemplar_planta VALUES ('Hedera',2);
INSERT INTO exemplar_planta VALUES ('Hedera',3);
INSERT INTO exemplar_planta VALUES ('Hedera',4);
INSERT INTO exemplar_planta VALUES ('Ficus',1);
INSERT INTO exemplar_planta VALUES ('Ficus',2);
INSERT INTO exemplar_planta VALUES ('Codiaeum',1);
INSERT INTO exemplar_planta VALUES ('Codiaeum',2);
INSERT INTO exemplar_planta VALUES ('Codiaeum',3);
INSERT INTO exemplar_planta VALUES ('Euphorbia',1);
INSERT INTO exemplar_planta VALUES ('Euphorbia',2);
INSERT INTO exemplar_planta VALUES ('Cyclamen',1);
INSERT INTO exemplar_planta VALUES ('Cyclamen',2);

INSERT INTO dosi_adob VALUES ('Geranium','Primavera','Casadob',30);
INSERT INTO dosi_adob VALUES ('Geranium','Hivern','Vitaplant',20);
INSERT INTO dosi_adob VALUES ('Begonia rex','Estiu','Casadob',25);
INSERT INTO dosi_adob VALUES ('Camellia','Hivern','Plantavit',50);
INSERT INTO dosi_adob VALUES ('Camellia','Primavera','Casadob',75);
INSERT INTO dosi_adob VALUES ('Cyclamen','Tardor','Casadob',30);
INSERT INTO dosi_adob VALUES ('Chrysanthemum','Primavera','Casadob',45);
INSERT INTO dosi_adob VALUES ('Begonia rex','Primavera','Nutreplant',50);
INSERT INTO dosi_adob VALUES ('Rosa','Primavera','Casadob',30);
INSERT INTO dosi_adob VALUES ('Rosa','Primavera','Creixplant',50);
INSERT INTO dosi_adob VALUES ('Polystichum','Primavera','Casadob',40);
INSERT INTO dosi_adob VALUES ('Polystichum','Tardor','Plantadob',20);
INSERT INTO dosi_adob VALUES ('Tulipa','Hivern','Casadob',40);
INSERT INTO dosi_adob VALUES ('Philodendron','Primavera','Casadob',40);
INSERT INTO dosi_adob VALUES ('Chlorophytum','Tardor','Casadob',30);
INSERT INTO dosi_adob VALUES ('Chlorophytum','Hivern','Superplant',40);
INSERT INTO dosi_adob VALUES ('Euphorbia','Hivern','Casadob',50);
INSERT INTO dosi_adob VALUES ('Euphorbia','Hivern','Sanexplant',40);
INSERT INTO dosi_adob VALUES ('Hedera','Primavera','Casadob',45);
INSERT INTO dosi_adob VALUES ('Codiaeum','Primavera','Casadob',50);
INSERT INTO dosi_adob VALUES ('Codiaeum','Estiu','Casadob',60);
INSERT INTO dosi_adob VALUES ('Geranium','Estiu','Sanexplant',40);
INSERT INTO dosi_adob VALUES ('Ficus','Primavera','Casadob',50);

INSERT INTO reproduccio VALUES ('Geranium','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Begonia rex','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Begonia rex','Capficats','Alt');
INSERT INTO reproduccio VALUES ('Begonia rex','Llavors','Baix');
INSERT INTO reproduccio VALUES ('Rosa','Estaques','Mitjà');
INSERT INTO reproduccio VALUES ('Rosa','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Chlorophytum','Estolons','Alt');
INSERT INTO reproduccio VALUES ('Cyclamen','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Cyclamen','Capficats','Mitjà');
INSERT INTO reproduccio VALUES ('Philodendron','Capficats','Alt');
INSERT INTO reproduccio VALUES ('Philodendron','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Tulipa','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Ficus','Estaques','Baix');
INSERT INTO reproduccio VALUES ('Ficus','Capficats','Baix');
INSERT INTO reproduccio VALUES ('Ficus','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Codiaeum','Esqueix','Baix');
INSERT INTO reproduccio VALUES ('Codiaeum','Capficats','Mitjà');
INSERT INTO reproduccio VALUES ('Codiaeum','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Polystichum','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Hedera','Esqueix','Mitjà');
INSERT INTO reproduccio VALUES ('Chrysanthemum','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Camellia','Estaques','Alt');
INSERT INTO reproduccio VALUES ('Hedera','Capficats','Alt');
INSERT INTO reproduccio VALUES ('Euphorbia','Llavors','Baix');
INSERT INTO reproduccio VALUES ('Euphorbia','Esqueix','Baix');
INSERT INTO reproduccio VALUES ('Euphorbia','Estaques','Alt');
#DML
#23
select nom_cientific,nom_popular from  planta where floracio = "estiu";
#24
select nom_planta from dosi_adob where nom_adob = "Casadob";
#25
select nom_adob,tipus_adob from adob where nom_firma = "PRISADOB";
#26
select nom_planta from planta_interior where temperatura > 16;
#27
select sum(quantitat_adob) from dosi_adob;
#28
select nom_planta from dosi_adob where (quantitat_adob >= 40) AND (quantitat_adob <= 50);
#29
select nom_planta from dosi_adob where nom_estacio = ("Hivern") or (nom_estacio = "Tardor");
#30
select avg(quantitat_adob) from dosi_adob where nom_adob = "Casadob";
#31
select nom_cientific,nom_popular from planta where (nom_popular like "%i%");
#32
select avg(temperatura) from planta_interior;
#33
select nom_adob,tipus_adob,nom_firma from adob where nom_firma = "CIRSADOB" or nom_firma = "TIRSADOB";
#34
select distinct count(num_exemplar) from exemplar_planta;
#35
select min(quantitat_adob),max(quantitat_adob) from dosi_adob;
#36
select max(temperatura) from planta_interior;
#37
select nom_planta from dosi_adob where (nom_adob = "Casadob") and (quantitat_adob > 40);
#38
select nom_planta from exemplar_planta where num_exemplar > 4;
#39
select sum(quantitat_adob) from dosi_adob where nom_planta = "Euphorbia";
#40
select nom_planta from dosi_adob where nom_estacio = "Primavera" or nom_adob = "Sanexplant";
#41
select nom_planta from reproduccio where metode_reproduccio = "Esqueix" and grau_exit = "Alt";
#42
select sum(grau_exit) from reproduccio where grau_exit = "Mitjà";
#43
select nom_popular from planta,exemplar_planta where floracio = "Estiu" and nom_cientific = nom_planta;
#44
select nom_cientific, tipus_planta from planta, planta_exterior where floracio = "Primavera" and nom_cientific = nom_planta;
#45
select p.nom_cientific,a.nom_adob from planta p,planta_exterior pe, adob a, dosi_adob da where a.nom_firma = "CIRSADOB" and p.nom_cientific = da.nom_planta and pe.nom_planta = p.nom_cientific and p.nom_cientific = da.nom_planta and da.nom_adob = a.nom_adob;
#46
select distinct r.metode_reproduccio from reproduccio r, exemplar_planta ep, planta p where p.nom_cientific = ep.nom_planta and r.nom_planta = p.nom_cientific;
#47
select concat(p.nom_popular, '(',quantitat_adob,')') from planta p, dosi_adob da, adob a where nom_firma = "UOCADOB" and p.nom_cientific = da.nom_planta and da.nom_adob = a.nom_adob;
#48
select p.nom_popular, r.metode_reproduccio from planta p, reproduccio r where p.floracio = "Hivern" and p.nom_cientific = r.nom_planta;
#49
select distinct left (p.nom_popular,"5"), p.nom_cientific from planta p, planta_exterior pe, reproduccio r, planta_interior ip where (r.metode_reproduccio = "Esqueix" and p.nom_cientific = pe.nom_planta and r.nom_planta = p.nom_cientific) or (r.grau_exit = "Baix" and p.nom_cientific = ip.nom_planta  and r.nom_planta = p.nom_cientific);
#50
select p.nom_popular, p.floracio from planta p, dosi_adob da where quantitat_adob > 40 and p.nom_cientific = da.nom_planta;
#51
select distinct p.nom_popular from planta p, planta_interior ip,planta_exterior pe where (ubicacio = "Llum indirecta" and p.nom_cientific = ip.nom_planta) or (pe.tipus_planta = "T" and p.nom_cientific = pe.nom_planta);
#52
select distinct p.nom_cientific, e.nom_estacio from planta p, exemplar_planta ep, estacio e where num_exemplar > 0 and ep.nom_planta = p.nom_cientific;
#53
select distinct a.nom_adob, a.nom_firma from adob a,dosi_adob da where (da.quantitat_adob >= 20) and (da.quantitat_adob <= 40) and da.nom_adob = a.nom_adob;
#54
select distinct upper(p.nom_popular) from adob a, planta p, exemplar_planta ep,dosi_adob da where a.tipus_adob = 'AI' and da.nom_adob = a.nom_adob and p.nom_cientific = ep.nom_planta;
#55
select distinct p.nom_popular, ip.ubicacio  from planta_interior ip, planta p, exemplar_planta ep where ep.nom_planta = p.nom_cientific and p.nom_cientific = ip.nom_planta;
#56
select distinct p.nom_popular, da.nom_adob, (da.quantitat_adob) + 10 from planta p, dosi_adob da, adob a where p.nom_cientific = da.nom_planta and da.nom_adob = a.nom_adob and (a.nom_firma = 'PRISADOB' or da.quantitat_adob <= 30);
#57
select  distinct nom_popular from planta p, adob a, dosi_adob da where tipus_adob = 'AI' and floracio = 'Primavera' and p.nom_cientific = da.nom_planta and da.nom_adob = a.nom_adob;
#58
select distinct p.nom_cientific, r.metode_reproduccio from planta p, dosi_adob da, reproduccio r where nom_adob <> 'Casadob' and p.nom_cientific = da.nom_planta and p.nom_cientific = r.nom_planta;
#59
select  floracio from planta, exemplar_planta where nom_cientific = nom_planta;
#60
select p.nom_popular, r.metode_reproduccio, left(grau_exit,'1') from planta p, reproduccio r where grau_exit <> 'Alt' and p.nom_cientific = r.nom_planta;
#61
#select distinct da.nom_planta from dosi_adob da, adob a, planta p where p.floracio = da.nom_estacio and da.nom_planta = p.nom_cientific;
#62
#select distinct lower(p.nom_cientific) from planta p, planta_exterior pe, planta_interior ip, dosi_adob da, reproduccio r where (da.nom_adob = 'CIRSADOB' and p.nom_cientific = pe.nom_planta and p.nom_cientific = da.nom_planta) or (r.metode_reproduccio = 'capficats' and p.nom_cientific = r.nom_planta and p.nom_cientific = ip.nom_planta);
#63
select nom_cientific,upper(nom_popular), 'exterior' from planta_exterior pe, planta p,reproduccio r, planta_interior ip where r.metode_reproduccio = 'Esqueix' and p.nom_cientific = pe.nom_planta and r.nom_planta = p.nom_cientific union
(select nom_cientific,upper(nom_popular), 'interior' from planta_exterior pe, planta p,reproduccio r, planta_interior ip where grau_exit = 'Baix' and r.nom_planta = p.nom_cientific and ip.nom_planta = p.nom_cientific);
#64
select nom_planta, temperatura from planta_interior where temperatura >= (select max(temperatura) from planta_interior)-1 order by temperatura desc;
#65
#68
select distinct nom_popular, quantitat_adob from planta p, dosi_adob da where quantitat_adob <(select max(quantitat_adob)from dosi_adob) and quantitat_adob > (select min(quantitat_adob)from dosi_adob) and nom_planta = nom_cientific order by quantitat_adob;
#69
select nom_cientific from planta p, dosi_adob da where (nom_popular like "%C%") and nom_estacio = 'Primavera'and nom_cientific = nom_planta;
#70
select nom_planta from exemplar_planta where nom_planta not in (select distinct(nom_planta)from dosi_adob where nom_adob = 'Casadob'); 
#alicia1
select nom_planta from dosi_adob where nom_planta not in (select distinct (nom_planta) from dosi_adob where nom_estacio = 'Primavera');
#alicia2
select nom_popular from planta p, dosi_adob da where nom_cientific = nom_planta and nom_planta not in (select distinct (nom_planta) from dosi_adob where nom_estacio = 'Primavera');
#alicia3
select nom_planta from dosi_adob where quantitat_adob > (select (avg(quantitat_adob)) from dosi_adob);
#alicia4
select nom_popular from planta, dosi_adob where quantitat_adob = (select avg(quantitat_adob) from dosi_adob);
#allicia5
select nom_popular from planta, exemplar_planta where nom_cientific = nom_planta and num_exemplar = (select distinct max(num_exemplar) from exemplar_planta);
#ejemplo
select nom_planta, sum(quantitat_adob) from dosi_adob where quantitat_adob > 20 group by nom_planta having sum(quantitat_adob) > 50;
#72
select count(da.nom_planta), a.nom_firma from adob a, dosi_adob da where da.nom_adob = a.nom_adob group by nom_firma;
#73
select p.nom_popular, count(da.nom_estacio) from planta p, dosi_adob da where da.nom_planta = p.nom_cientific group by da.nom_planta having count(da.nom_planta) >= 3 order by count(nom_planta) >= 3, nom_popular;
#74
select nom_planta, sum(quantitat_adob) from dosi_adob where quantitat_adob between 60 and 90 group by nom_planta order by sum(quantitat_adob) desc;
#75
select nom_cientific, floracio, sum(quantitat_adob) from planta p, dosi_adob da where nom_adob = 'Casadob' and nom_cientific = nom_planta group by nom_cientific order by nom_cientific;
#76
select nom_cientific, floracio, sum(quantitat_adob) from planta, dosi_adob where nom_cientific in (select(nom_planta) from dosi_adob where nom_adob = 'Casadob') and nom_planta = nom_cientific group by nom_cientific order by nom_cientific;