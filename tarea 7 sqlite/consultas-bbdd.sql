-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
select cl.nombre, ch.modelo, ch.precio from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche;
/**
+-----------------+----------------+---------+
|     nombre      |     modelo     | precio  |
+-----------------+----------------+---------+
| Juan Pérez      | Sedán 2022     | 25000.0 |
| María Gómez     | Hatchback 2021 | 22000.0 |
| Carlos López    | SUV 2023       | 30000.0 |
| Ana Martínez    | Coupé 2022     | 28000.0 |
| Pedro Rodríguez | Camioneta 2023 | 32000.0 |
| Laura Sánchez   | Compacto 2021  | 20000.0 |
| Miguel González | Híbrido 2022   | 27000.0 |
| Isabel Díaz     | Deportivo 2023 | 35000.0 |
| Elena Torres    | Eléctrico 2021 | 40000.0 |
+-----------------+----------------+---------+
**/



  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?


-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
select cl.* from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and ch.precio > (select avg(precio) from coches);
/**
+------------+-----------------+------+----------------+
| id_cliente |     nombre      | edad |   direccion    |
+------------+-----------------+------+----------------+
| 3          | Carlos López    | 35   | Calle C #789   |
| 5          | Pedro Rodríguez | 40   | Calle E #234   |
| 8          | Isabel Díaz     | 38   | Avenida H #111 |
| 10         | Elena Torres    | 29   | Avenida J #333 |
+------------+-----------------+------+----------------+
**/

  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
select modelo, precio from coches where id_coche not in (select id_coche from ventas);
/**
+-------------+---------+
|   modelo    | precio  |
+-------------+---------+
| Pickup 2022 | 31000.0 |
+-------------+---------+
**/

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas

-- Calcular el total gastado por todos los clientes en coches:
select sum(precio) as dinero_gastado_total from coches where id_coche in (select id_coche from ventas);
/**
+----------------------+
| dinero_gastado_total |
+----------------------+
| 259000.0             |
+----------------------+
**/

  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
select cl.nombre, ch.modelo, v.fecha_venta from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche order by v.fecha_venta desc;
/**
+-----------------+----------------+-------------+
|     nombre      |     modelo     | fecha_venta |
+-----------------+----------------+-------------+
| Elena Torres    | Eléctrico 2021 | 2023-10-05  |
| Isabel Díaz     | Deportivo 2023 | 2023-08-25  |
| Miguel González | Híbrido 2022   | 2023-07-20  |
| Laura Sánchez   | Compacto 2021  | 2023-06-15  |
| Pedro Rodríguez | Camioneta 2023 | 2023-05-05  |
| Ana Martínez    | Coupé 2022     | 2023-04-10  |
| Carlos López    | SUV 2023       | 2023-03-25  |
| María Gómez     | Hatchback 2021 | 2023-02-20  |
| Juan Pérez      | Sedán 2022     | 2023-01-15  |
+-----------------+----------------+-------------+
**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

-- Encontrar el modelo de coche más caro que ha sido reparado al menos una vez.

/**
Consulta


**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.

/**
Consulta


**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
elect cl.* from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and ch.marca regexp '^Toyota$';
/**
+------------+------------+------+--------------+
| id_cliente |   nombre   | edad |  direccion   |
+------------+------------+------+--------------+
| 1          | Juan Pérez | 30   | Calle A #123 |
+------------+------------+------+--------------+
**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.


/**
Consulta


**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
select ch.modelo, ch.precio from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and cl.edad > 30;
/**
+----------------+---------+
|     modelo     | precio  |
+----------------+---------+
| SUV 2023       | 30000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Deportivo 2023 | 35000.0 |
+----------------+---------+
**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.

/**

**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
select ch.* from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and ch.precio > (select avg(ch.precio) from coches as ch,
clientes as cl, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and cl.edad < 30);
/**
+----------+----------------+--------+------+---------+
| id_coche |     modelo     | marca  | año  | precio  |
+----------+----------------+--------+------+---------+
| 3        | SUV 2023       | Ford   | 2023 | 30000.0 |
| 5        | Camioneta 2023 | Nissan | 2023 | 32000.0 |
| 8        | Deportivo 2023 | Mazda  | 2023 | 35000.0 |
| 10       | Eléctrico 2021 | Tesla  | 2021 | 40000.0 |
+----------+----------------+--------+------+---------+
**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:

/**
Consulta


**/

  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
