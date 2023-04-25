create database EXERCICI1; 
use EXERCICI1;
create table treball (
nom char (20),
edat integer,
càrrec char (50),
primary key (nom)
);
create table ciutat (
nom char (25) NOT NULL,
comarca char (25) NOT NULL,
provincia char (25) NOT NULL,
habitants INTEGER,
primary key (nom)
);
create table client (
idClient INTEGER auto_increment,
nom char,
cognom char,
dataNaixement date,
tipus char default ('Habitual'),
primary key (idClient)
);
DROP table client;
create table departement (
numero TINYINT (2),
nom char (9),
localització char (10),
primary key (nom)
);




