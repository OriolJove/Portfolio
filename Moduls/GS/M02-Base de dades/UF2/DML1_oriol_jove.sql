#entregable1
select distinct nom_popular from planta p, exemplar_planta where num_exemplar = (select(count(num_exemplar)) from exemplar_planta where num_exemplar = 1);
#entregable2
select nom_popular from planta, exemplar_planta where nom_cientific = nom_planta and num_exemplar not in (select(num_exemplar) from exemplar_planta where num_exemplar >= 1);
#entregable3
select nom_estacio,count(quantitat_adob) from dosi_adob group by nom_estacio;
#entregable4
select nom_planta from dosi_adob where nom_planta not in (select distinct (nom_planta) from dosi_adob where nom_estacio = 'Primavera');
#entregable5
select nom_planta,count(metode_reproduccio) from reproduccio group by nom_planta;
#entregable6
select nom_planta,count(metode_reproduccio) from reproduccio where  grau_exit = 'alt' group by nom_planta;
#entregable7
select distinct nom_planta from reproduccio where metode_reproduccio not in (select(metode_reproduccio) from reproduccio where metode_reproduccio = 'Esqueix' );
#entregable8 
select ip.nom_planta from planta_interior ip, planta p where floracio = 'Primavera' and nom_planta = nom_cientific;
#entregable9
select count(nom_adob) from adob group by nom_firma;