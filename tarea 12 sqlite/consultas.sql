--Consultas sobre una tabla


-- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedido order by fecha desc;
/**
+----+---------+------------+------------+--------------+
| id |  total  |   fecha    | id_cliente | id_comercial |
+----+---------+------------+------------+--------------+
| 15 | 370.85  | 2019-03-11 | 1          | 5            |
| 16 | 2389.23 | 2019-03-11 | 1          | 5            |
| 13 | 545.75  | 2019-01-25 | 6          | 1            |
| 8  | 1983.43 | 2017-10-10 | 4          | 6            |
| 1  | 150.5   | 2017-10-05 | 5          | 2            |
| 3  | 65.26   | 2017-10-05 | 2          | 1            |
| 5  | 948.5   | 2017-09-10 | 5          | 2            |
| 12 | 3045.6  | 2017-04-25 | 2          | 1            |
| 14 | 145.82  | 2017-02-02 | 6          | 1            |
| 9  | 2480.4  | 2016-10-10 | 8          | 3            |
| 2  | 270.65  | 2016-09-10 | 1          | 5            |
| 4  | 110.5   | 2016-08-17 | 8          | 3            |
| 11 | 75.29   | 2016-08-17 | 3          | 7            |
| 6  | 2400.6  | 2016-07-27 | 7          | 1            |
| 7  | 5760.0  | 2015-09-10 | 2          | 1            |
| 10 | 250.45  | 2015-06-27 | 8          | 2            |
+----+---------+------------+------------+--------------+
**/

-- Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido where total > 3000;
/**
+----+--------+------------+------------+--------------+
| id | total  |   fecha    | id_cliente | id_comercial |
+----+--------+------------+------------+--------------+
| 7  | 5760.0 | 2015-09-10 | 2          | 1            |
| 12 | 3045.6 | 2017-04-25 | 2          | 1            |
+----+--------+------------+------------+--------------+
**/

-- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct(cl.id) from cliente as cl, pedido as p where cl.id = p.id_cliente;
/**
+----+
| id |
+----+
| 5  |
| 1  |
| 2  |
| 8  |
| 7  |
| 4  |
| 3  |
| 6  |
+----+
**/

-- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
select * from pedido where fecha regexp '2017' and total > 500;
/**
+----+---------+------------+------------+--------------+
| id |  total  |   fecha    | id_cliente | id_comercial |
+----+---------+------------+------------+--------------+
| 5  | 948.5   | 2017-09-10 | 5          | 2            |
| 8  | 1983.43 | 2017-10-10 | 4          | 6            |
| 12 | 3045.6  | 2017-04-25 | 2          | 1            |
+----+---------+------------+------------+--------------+
**/

-- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
select nombre, apellido1, apellido2 from comercial where categoria between 0.05 and 0.11;
/**
+---------+-----------+-----------+
| nombre  | apellido1 | apellido2 |
+---------+-----------+-----------+
| Diego   | Flores    | Salas     |
| Antonio | Vega      | Hernández |
| Alfredo | Ruiz      | Flores    |
+---------+-----------+-----------+
**/

-- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select max(categoria) as comision_maxima from comercial;
/**
+-----------------+
| comision_maxima |
+-----------------+
| 0.15            |
+-----------------+
**/

-- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1 from cliente where apellido1 is not null order by apellido1, nombre;
/**
+----+-----------+-----------+
| id |  nombre   | apellido1 |
+----+-----------+-----------+
| 5  | Marcos    | Loyola    |
| 9  | Guillermo | López     |
| 1  | Aarón     | Rivero    |
| 3  | Adolfo    | Rubio     |
| 8  | Pepe      | Ruiz      |
| 7  | Pilar     | Ruiz      |
| 2  | Adela     | Salas     |
| 10 | Daniel    | Santana   |
| 6  | María     | Santana   |
| 4  | Adrián    | Suárez    |
+----+-----------+-----------+
**/

-- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
select * from cliente where nombre regexp '^[Aa]' and nombre regexp 'n$' or nombre regexp '^[Pp]' order by nombre;
/**
+----+--------+-----------+-----------+---------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+--------+-----------+-----------+---------+-----------+
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 4  | Adrián | Suárez    |           | Jaén    | 300       |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       |
+----+--------+-----------+-----------+---------+-----------+
**/

-- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
select * from cliente where nombre not regexp '^[Aa]' order by nombre;
/**
+----+-----------+-----------+-----------+---------+-----------+
| id |  nombre   | apellido1 | apellido2 | ciudad  | categoria |
+----+-----------+-----------+-----------+---------+-----------+
| 10 | Daniel    | Santana   | Loyola    | Sevilla | 125       |
| 9  | Guillermo | López     | Gómez     | Granada | 225       |
| 5  | Marcos    | Loyola    | Méndez    | Almería | 200       |
| 6  | María     | Santana   | Moreno    | Cádiz   | 100       |
| 8  | Pepe      | Ruiz      | Santana   | Huelva  | 200       |
| 7  | Pilar     | Ruiz      |           | Sevilla | 300       |
+----+-----------+-----------+-----------+---------+-----------+
**/

-- Devuelve un listado con los nombres de los comerciales que terminan por o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
select distinct(nombre) from comercial where nombre regexp 'o$';
/**
+---------+
| nombre  |
+---------+
| Diego   |
| Antonio |
| Alfredo |
+---------+
**/



-- Consultas multitabla

-- Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.


-- Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct(cl.id), cl.nombre, cl.apellido1, cl.apellido2 from cliente as cl join pedido as p on cl.id=p.id_cliente order by cl.nombre;
/**
+----+--------+-----------+-----------+
| id | nombre | apellido1 | apellido2 |
+----+--------+-----------+-----------+
| 1  | Aarón  | Rivero    | Gómez     |
| 2  | Adela  | Salas     | Díaz      |
| 3  | Adolfo | Rubio     | Flores    |
| 4  | Adrián | Suárez    |           |
| 5  | Marcos | Loyola    | Méndez    |
| 6  | María  | Santana   | Moreno    |
| 8  | Pepe   | Ruiz      | Santana   |
| 7  | Pilar  | Ruiz      |           |
+----+--------+-----------+-----------+
**/

-- Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
select p.*, cl.* from pedido as p join cliente as cl on p.id_cliente=cl.id order by cl.nombre;
/**
+----+---------+------------+------------+--------------+----+--------+-----------+-----------+---------+-----------+
| id |  total  |   fecha    | id_cliente | id_comercial | id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+---------+------------+------------+--------------+----+--------+-----------+-----------+---------+-----------+
| 2  | 270.65  | 2016-09-10 | 1          | 5            | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 15 | 370.85  | 2019-03-11 | 1          | 5            | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 16 | 2389.23 | 2019-03-11 | 1          | 5            | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       |
| 3  | 65.26   | 2017-10-05 | 2          | 1            | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 7  | 5760.0  | 2015-09-10 | 2          | 1            | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 12 | 3045.6  | 2017-04-25 | 2          | 1            | 2  | Adela  | Salas     | Díaz      | Granada | 200       |
| 11 | 75.29   | 2016-08-17 | 3          | 7            | 3  | Adolfo | Rubio     | Flores    | Sevilla |           |
| 8  | 1983.43 | 2017-10-10 | 4          | 6            | 4  | Adrián | Suárez    |           | Jaén    | 300       |
| 1  | 150.5   | 2017-10-05 | 5          | 2            | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
| 5  | 948.5   | 2017-09-10 | 5          | 2            | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
| 13 | 545.75  | 2019-01-25 | 6          | 1            | 6  | María  | Santana   | Moreno    | Cádiz   | 100       |
| 14 | 145.82  | 2017-02-02 | 6          | 1            | 6  | María  | Santana   | Moreno    | Cádiz   | 100       |
| 4  | 110.5   | 2016-08-17 | 8          | 3            | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 9  | 2480.4  | 2016-10-10 | 8          | 3            | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 10 | 250.45  | 2015-06-27 | 8          | 2            | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       |
| 6  | 2400.6  | 2016-07-27 | 7          | 1            | 7  | Pilar  | Ruiz      |           | Sevilla | 300       |
+----+---------+------------+------------+--------------+----+--------+-----------+-----------+---------+-----------+
**/

-- Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
select p.*, cm.* from pedido as p join comercial as cm on p.id_comercial=cm.id order by cm.nombre;
/**
+----+---------+------------+------------+--------------+----+---------+-----------+-----------+-----------+
| id |  total  |   fecha    | id_cliente | id_comercial | id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+------------+------------+--------------+----+---------+-----------+-----------+-----------+
| 2  | 270.65  | 2016-09-10 | 1          | 5            | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 11 | 75.29   | 2016-08-17 | 3          | 7            | 7  | Antonio | Vega      | Hernández | 0.11      |
| 15 | 370.85  | 2019-03-11 | 1          | 5            | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 16 | 2389.23 | 2019-03-11 | 1          | 5            | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 3  | 65.26   | 2017-10-05 | 2          | 1            | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | 2400.6  | 2016-07-27 | 7          | 1            | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 7  | 5760.0  | 2015-09-10 | 2          | 1            | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 12 | 3045.6  | 2017-04-25 | 2          | 1            | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 13 | 545.75  | 2019-01-25 | 6          | 1            | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 14 | 145.82  | 2017-02-02 | 6          | 1            | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 4  | 110.5   | 2016-08-17 | 8          | 3            | 3  | Diego   | Flores    | Salas     | 0.11      |
| 9  | 2480.4  | 2016-10-10 | 8          | 3            | 3  | Diego   | Flores    | Salas     | 0.11      |
| 1  | 150.5   | 2017-10-05 | 5          | 2            | 2  | Juan    | Gómez     | López     | 0.13      |
| 5  | 948.5   | 2017-09-10 | 5          | 2            | 2  | Juan    | Gómez     | López     | 0.13      |
| 10 | 250.45  | 2015-06-27 | 8          | 2            | 2  | Juan    | Gómez     | López     | 0.13      |
| 8  | 1983.43 | 2017-10-10 | 4          | 6            | 6  | Manuel  | Domínguez | Hernández | 0.13      |
+----+---------+------------+------------+--------------+----+---------+-----------+-----------+-----------+
**/

-- Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
select cl.*, cm.*, p.* from pedido as p join comercial as cm on p.id_comercial=cm.id join cliente as cl on p.id_cliente=cl.id;
/**
+----+--------+-----------+-----------+---------+-----------+----+---------+-----------+-----------+-----------+----+---------+------------+------------+--------------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id | nombre  | apellido1 | apellido2 | categoria | id |  total  |   fecha    | id_cliente | id_comercial |
+----+--------+-----------+-----------+---------+-----------+----+---------+-----------+-----------+-----------+----+---------+------------+------------+--------------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 2  | Juan    | Gómez     | López     | 0.13      | 1  | 150.5   | 2017-10-05 | 5          | 2            |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 5  | Antonio | Carretero | Ortega    | 0.12      | 2  | 270.65  | 2016-09-10 | 1          | 5            |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 1  | Daniel  | Sáez      | Vega      | 0.15      | 3  | 65.26   | 2017-10-05 | 2          | 1            |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 3  | Diego   | Flores    | Salas     | 0.11      | 4  | 110.5   | 2016-08-17 | 8          | 3            |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 2  | Juan    | Gómez     | López     | 0.13      | 5  | 948.5   | 2017-09-10 | 5          | 2            |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 1  | Daniel  | Sáez      | Vega      | 0.15      | 6  | 2400.6  | 2016-07-27 | 7          | 1            |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 1  | Daniel  | Sáez      | Vega      | 0.15      | 7  | 5760.0  | 2015-09-10 | 2          | 1            |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 6  | Manuel  | Domínguez | Hernández | 0.13      | 8  | 1983.43 | 2017-10-10 | 4          | 6            |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 3  | Diego   | Flores    | Salas     | 0.11      | 9  | 2480.4  | 2016-10-10 | 8          | 3            |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 2  | Juan    | Gómez     | López     | 0.13      | 10 | 250.45  | 2015-06-27 | 8          | 2            |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 7  | Antonio | Vega      | Hernández | 0.11      | 11 | 75.29   | 2016-08-17 | 3          | 7            |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 1  | Daniel  | Sáez      | Vega      | 0.15      | 12 | 3045.6  | 2017-04-25 | 2          | 1            |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 1  | Daniel  | Sáez      | Vega      | 0.15      | 13 | 545.75  | 2019-01-25 | 6          | 1            |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 1  | Daniel  | Sáez      | Vega      | 0.15      | 14 | 145.82  | 2017-02-02 | 6          | 1            |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 5  | Antonio | Carretero | Ortega    | 0.12      | 15 | 370.85  | 2019-03-11 | 1          | 5            |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 5  | Antonio | Carretero | Ortega    | 0.12      | 16 | 2389.23 | 2019-03-11 | 1          | 5            |
+----+--------+-----------+-----------+---------+-----------+----+---------+-----------+-----------+-----------+----+---------+------------+------------+--------------+
**/

-- Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
select cl.* from pedido as p join cliente as cl on p.id_cliente=cl.id where p.fecha regexp '2017' and p.total between 300 and 1000;
/**
+----+--------+-----------+-----------+---------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+--------+-----------+-----------+---------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
+----+--------+-----------+-----------+---------+-----------+
**/

-- Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
select cm.nombre, cm.apellido1, cm.apellido2 from pedido as p join comercial as cm on p.id_comercial=cm.id join cliente as cl on p.id_cliente=cl.id where cl.nombre = 'María' and cl.apellido1 = 'Santana' and cl.apellido2 = 'Moreno';
/**
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Daniel | Sáez      | Vega      |
| Daniel | Sáez      | Vega      |
+--------+-----------+-----------+
**/

-- Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
select cl.nombre, cl.apellido1, cl.apellido2 from pedido as p join comercial as cm on p.id_comercial=cm.id join cliente as cl on p.id_cliente=cl.id where cm.nombre = 'Daniel' and cm.apellido1 = 'Sáez' and cm.apellido2 = 'Vega';
/**
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Adela  | Salas     | Díaz      |
| Pilar  | Ruiz      |           |
| Adela  | Salas     | Díaz      |
| Adela  | Salas     | Díaz      |
| María  | Santana   | Moreno    |
| María  | Santana   | Moreno    |
+--------+-----------+-----------+
**/

 
 
-- Consultas resumen (Funciones)


-- Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(total) as Total from pedido;
/**
+----------+
|  Total   |
+----------+
| 20992.83 |
+----------+
**/

-- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(total) as Total from pedido;
/**
+-------------+
|    Total    |
+-------------+
| 1312.051875 |
+-------------+
**/

-- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(distinct(id)) as comerciales_distintos from comercial;
/**
+-----------------------+
| comerciales_distintos |
+-----------------------+
| 8                     |
+-----------------------+
**/

-- Calcula el número total de clientes que aparecen en la tabla cliente.
select count(id) as total_clientes from cliente;
/**
+----------------+
| total_clientes |
+----------------+
| 10             |
+----------------+
**/

-- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(total) as cantidad_maxima from pedido;
/**
+-----------------+
| cantidad_maxima |
+-----------------+
| 5760.0          |
+-----------------+
**/

-- Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(total) as cantidad_minima from pedido;
/**
+-----------------+
| cantidad_minima |
+-----------------+
| 65.26           |
+-----------------+
**/

-- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select ciudad, max(categoria) as categoria_maxima from cliente group by ciudad;
/**
+---------+------------------+
| ciudad  | categoria_maxima |
+---------+------------------+
| Almería | 200              |
| Cádiz   | 100              |
| Granada | 225              |
| Huelva  | 200              |
| Jaén    | 300              |
| Sevilla | 300              |
+---------+------------------+
**/

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.fecha, max(p.total) as maximo_total_pagado from cliente as cl join pedido as p on cl.id=p.id_cliente group by fecha;
/**
+----+--------+-----------+-----------+------------+---------------------+
| id | nombre | apellido1 | apellido2 |   fecha    | maximo_total_pagado |
+----+--------+-----------+-----------+------------+---------------------+
| 8  | Pepe   | Ruiz      | Santana   | 2015-06-27 | 250.45              |
| 2  | Adela  | Salas     | Díaz      | 2015-09-10 | 5760.0              |
| 7  | Pilar  | Ruiz      |           | 2016-07-27 | 2400.6              |
| 8  | Pepe   | Ruiz      | Santana   | 2016-08-17 | 110.5               |
| 1  | Aarón  | Rivero    | Gómez     | 2016-09-10 | 270.65              |
| 8  | Pepe   | Ruiz      | Santana   | 2016-10-10 | 2480.4              |
| 6  | María  | Santana   | Moreno    | 2017-02-02 | 145.82              |
| 2  | Adela  | Salas     | Díaz      | 2017-04-25 | 3045.6              |
| 5  | Marcos | Loyola    | Méndez    | 2017-09-10 | 948.5               |
| 5  | Marcos | Loyola    | Méndez    | 2017-10-05 | 150.5               |
| 4  | Adrián | Suárez    |           | 2017-10-10 | 1983.43             |
| 6  | María  | Santana   | Moreno    | 2019-01-25 | 545.75              |
| 1  | Aarón  | Rivero    | Gómez     | 2019-03-11 | 2389.23             |
+----+--------+-----------+-----------+------------+---------------------+
**/

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.fecha, max(p.total) as maximo_total_pagado from cliente as cl join pedido as p on cl.id=p.id_cliente where p.total > 2000 group by fecha;
/**
+----+--------+-----------+-----------+------------+---------------------+
| id | nombre | apellido1 | apellido2 |   fecha    | maximo_total_pagado |
+----+--------+-----------+-----------+------------+---------------------+
| 2  | Adela  | Salas     | Díaz      | 2015-09-10 | 5760.0              |
| 7  | Pilar  | Ruiz      |           | 2016-07-27 | 2400.6              |
| 8  | Pepe   | Ruiz      | Santana   | 2016-10-10 | 2480.4              |
| 2  | Adela  | Salas     | Díaz      | 2017-04-25 | 3045.6              |
| 1  | Aarón  | Rivero    | Gómez     | 2019-03-11 | 2389.23             |
+----+--------+-----------+-----------+------------+---------------------+
**/

-- Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, max(p.total) as maximo_total from comercial as cl join pedido as p on cl.id=p.id_comercial where p.fecha = '2016-08-17' group by cl.id;
/**
+----+---------+-----------+-----------+--------------+
| id | nombre  | apellido1 | apellido2 | maximo_total |
+----+---------+-----------+-----------+--------------+
| 3  | Diego   | Flores    | Salas     | 110.5        |
| 7  | Antonio | Vega      | Hernández | 75.29        |
+----+---------+-----------+-----------+--------------+
**/

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(p.id_cliente) as numero_de_pedidos from cliente as cl join pedido as p on cl.id=p.id_cliente group by cl.id;
/**
+----+--------+-----------+-----------+-------------------+
| id | nombre | apellido1 | apellido2 | numero_de_pedidos |
+----+--------+-----------+-----------+-------------------+
| 1  | Aarón  | Rivero    | Gómez     | 3                 |
| 2  | Adela  | Salas     | Díaz      | 3                 |
| 3  | Adolfo | Rubio     | Flores    | 1                 |
| 4  | Adrián | Suárez    |           | 1                 |
| 5  | Marcos | Loyola    | Méndez    | 2                 |
| 6  | María  | Santana   | Moreno    | 2                 |
| 7  | Pilar  | Ruiz      |           | 1                 |
| 8  | Pepe   | Ruiz      | Santana   | 3                 |
+----+--------+-----------+-----------+-------------------+
**/

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(p.id_cliente) as numero_de_pedidos from cliente as cl join pedido as p on cl.id=p.id_cliente where fecha regexp '2017' group by cl.id;
/**
+----+--------+-----------+-----------+-------------------+
| id | nombre | apellido1 | apellido2 | numero_de_pedidos |
+----+--------+-----------+-----------+-------------------+
| 2  | Adela  | Salas     | Díaz      | 2                 |
| 4  | Adrián | Suárez    |           | 1                 |
| 5  | Marcos | Loyola    | Méndez    | 2                 |
| 6  | María  | Santana   | Moreno    | 1                 |
+----+--------+-----------+-----------+-------------------+
**/

-- Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, max(p.total) as maxima_cantidad_pagada from cliente as cl join pedido as p on cl.id=p.id_cliente group by cl.id;
/**
+----+--------+-----------+-----------+------------------------+
| id | nombre | apellido1 | apellido2 | maxima_cantidad_pagada |
+----+--------+-----------+-----------+------------------------+
| 1  | Aarón  | Rivero    | Gómez     | 2389.23                |
| 2  | Adela  | Salas     | Díaz      | 5760.0                 |
| 3  | Adolfo | Rubio     | Flores    | 75.29                  |
| 4  | Adrián | Suárez    |           | 1983.43                |
| 5  | Marcos | Loyola    | Méndez    | 948.5                  |
| 6  | María  | Santana   | Moreno    | 545.75                 |
| 7  | Pilar  | Ruiz      |           | 2400.6                 |
| 8  | Pepe   | Ruiz      | Santana   | 2480.4                 |
+----+--------+-----------+-----------+------------------------+
**/

-- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select substr(fecha, 0, 5) as anyo, max(total) as valor_maximo from pedido group by anyo;
/**
+------+--------------+
| anyo | valor_maximo |
+------+--------------+
| 2015 | 5760.0       |
| 2016 | 2480.4       |
| 2017 | 3045.6       |
| 2019 | 2389.23      |
+------+--------------+
**/

-- Devuelve el número total de pedidos que se han realizado cada año.
select substr(fecha, 0, 5) as anyo, count(id_cliente) as cantidad_pedidos from pedido group by anyo;
/**
+------+------------------+
| anyo | cantidad_pedidos |
+------+------------------+
| 2015 | 2                |
| 2016 | 5                |
| 2017 | 6                |
| 2019 | 3                |
+------+------------------+
**/



-- Subconsultas 

-- Con operadores básicos de comparación


-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select p.* from pedido as p, cliente as cl where p.id_cliente = cl.id and p.id_cliente = (select cl.id from cliente as cl where cl.nombre = 'Adela' and cl.apellido1 = 'Salas' and cl.apellido2 = 'Díaz');
/**
+----+--------+------------+------------+--------------+
| id | total  |   fecha    | id_cliente | id_comercial |
+----+--------+------------+------------+--------------+
| 3  | 65.26  | 2017-10-05 | 2          | 1            |
| 7  | 5760.0 | 2015-09-10 | 2          | 1            |
| 12 | 3045.6 | 2017-04-25 | 2          | 1            |
+----+--------+------------+------------+--------------+
**/

-- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select count(p.id_comercial) as pedidos from pedido as p, comercial as cm where p.id_comercial = cm.id and cm.id = (select cm.id from comercial where cm.nombre = 'Daniel' and cm.apellido1 = 'Sáez' and cm.apellido2 = 'Vega');
/**
+---------+
| pedidos |
+---------+
| 6       |
+---------+
**/

-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
select cl.* from cliente as cl, pedido as p where p.id_cliente = cl.id and p.total = (select max(p.total) from pedido as p where fecha regexp '^2019');

/**
+----+--------+-----------+-----------+---------+-----------+------+-----------------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | anyo | cantidad_maxima |
+----+--------+-----------+-----------+---------+-----------+------+-----------------+
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2019 | 2389.23         |
+----+--------+-----------+-----------+---------+-----------+------+-----------------+
**/

-- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
select p.fecha, p.total from pedido as p, cliente as cl where cl.id = p.id_cliente and p.total = (select min(p.total) from pedido as p, cliente as cl where cl.nombre = 'Pepe' and cl.apellido1 = 'Ruiz' and cl.apellido2 = 'Santana');
/**
+------------+-------+
|   fecha    | total |
+------------+-------+
| 2017-10-05 | 65.26 |
+------------+-------+
**/

-- Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
select cl.*, p.* from cliente as cl, pedido as p where cl.id = p.id_cliente and p.fecha regexp '^2017' and p.total >= (select avg(p.total) from pedido as p where p.fecha regexp '^2017');
/**
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+------------+--------------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_cliente | id_comercial |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+------------+--------------+
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2017-10-10 | 4          | 6            |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2017-04-25 | 2          | 1            |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+------------+--------------+
**/


-- Subconsultas con IN y NOT IN


-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select cl.* from cliente as cl, pedido as p where cl.id = p.id_cliente and cl.id not in (select id_cliente from pedido);
/**
No devuelve tabla
**/

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select cm.* from comercial as cm, pedido as p where cm.id = p.id_comercial and cm.id not in (select id_comercial from pedido);
/**
No devuelve tabla
**/



-- Subconsultas con EXISTS y NOT EXISTS


-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select cl.* from cliente as cl, pedido as p where cl.id = p.id_cliente and not exists (select id_cliente from pedido);
/**
No devuelve tabla
**/

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select cm.* from comercial as cm, pedido as p where cm.id = p.id_comercial and not exists (select id_comercial from pedido);
/**
No devuelve tabla
**/

