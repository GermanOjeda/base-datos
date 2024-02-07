-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
select cl.nombre, cl.edad from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and ch.marca regexp '^Toyota$';
/**
+------------+------+
|   nombre   | edad |
+------------+------+
| Juan Pérez | 30   |
+------------+------+
**/

-- Consulta para calcular el precio promedio de los coches vendidos.
select avg(ch.precio) as precio_promedio_de_coches_vendidos from coches as ch, ventas as v where ch.id_coche = v.id_coche;
/**
+------------------------------------+
| precio_promedio_de_coches_vendidos |
+------------------------------------+
| 28777.7777777778                   |
+------------------------------------+
**/

-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
select ch.modelo, ch.marca from coches as ch, ventas as v, clientes as cl where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and cl.edad < 30;
/**
+----------------+-----------+
|     modelo     |   marca   |
+----------------+-----------+
| Hatchback 2021 | Honda     |
| Coupé 2022     | Chevrolet |
| Híbrido 2022   | Hyundai   |
| Eléctrico 2021 | Tesla     |
+----------------+-----------+
**/

-- Consulta para contar el número de coches vendidos de cada marca.

/**

**/

-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
select cl.nombre, cl.direccion from clientes as cl, coches as ch, reparacion as re where cl.id_cliente = re.id_cliente and ch.id_coche = re.id_coche and fecha_reparación regexp '^2024';
/**
+-----------------+----------------+
|     nombre      |   direccion    |
+-----------------+----------------+
| Francisco Ruiz  | Calle I #222   |
| Elena Torres    | Avenida J #333 |
| Juan Pérez      | Calle A #123   |
| María Gómez     | Avenida B #456 |
| Carlos López    | Calle C #789   |
| Ana Martínez    | Avenida D #101 |
| Pedro Rodríguez | Calle E #234   |
| Laura Sánchez   | Avenida F #567 |
| Miguel González | Calle G #890   |
| Isabel Díaz     | Avenida H #111 |
| Francisco Ruiz  | Calle I #222   |
| Elena Torres    | Avenida J #333 |
+-----------------+----------------+
**/

-- Consulta para calcular el total gastado en reparaciones por cada cliente.

/**

**/

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
select cl.nombre, cl.edad from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and ch.precio > 30000;
/**
+-----------------+------+
|     nombre      | edad |
+-----------------+------+
| Pedro Rodríguez | 40   |
| Isabel Díaz     | 38   |
| Elena Torres    | 29   |
+-----------------+------+
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023.
select avg(ch.precio) as precio_medio_2023 from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and v.fecha_venta regexp '^2023';
/**
+-------------------+
| precio_medio_2023 |
+-------------------+
| 28777.7777777778  |
+-------------------+
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
select cl.nombre, cl.direccion from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and ch.marca regexp '^Ford$';
/**
+--------------+--------------+
|    nombre    |  direccion   |
+--------------+--------------+
| Carlos López | Calle C #789 |
+--------------+--------------+
**/

-- Consulta para contar el número de coches vendidos por año.
select count(id_venta) coches_vendidos_por_año from ventas order by fecha_venta;
/**
+-------------------------+
| coches_vendidos_por_año |
+-------------------------+
| 9                       |
+-------------------------+
**/

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
select cl.nombre, cl.edad from clientes as cl, coches as ch, reparacion as re where cl.id_cliente = re.id_cliente and ch.id_coche = re.id_coche and ch.precio > 30000;
/**
+-----------------+------+
|     nombre      | edad |
+-----------------+------+
| Carlos López    | 35   |
| Isabel Díaz     | 38   |
| Francisco Ruiz  | 33   |
| Elena Torres    | 29   |
| Ana Martínez    | 28   |
| Laura Sánchez   | 32   |
| Miguel González | 27   |
+-----------------+------+
**/

-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
select sum(ch.precio) as precio_total from coches as ch, clientes as cl, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and cl.edad < 30;
/**
+--------------+
| precio_total |
+--------------+
| 117000.0     |
+--------------+
**/

-- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
select ch.modelo, ch.año from coches as ch, ventas as v, reparacion as re where ch.id_coche = v.id_coche and ch.id_coche = re.id_coche and v.fecha_venta regexp '^2023';
/**
+----------------+------+
|     modelo     | año  |
+----------------+------+
| Sedán 2022     | 2022 |
| Sedán 2022     | 2022 |
| Hatchback 2021 | 2021 |
| Hatchback 2021 | 2021 |
| SUV 2023       | 2023 |
| SUV 2023       | 2023 |
| SUV 2023       | 2023 |
| Coupé 2022     | 2022 |
| Coupé 2022     | 2022 |
| Coupé 2022     | 2022 |
| Camioneta 2023 | 2023 |
| Camioneta 2023 | 2023 |
| Compacto 2021  | 2021 |
| Compacto 2021  | 2021 |
| Híbrido 2022   | 2022 |
| Deportivo 2023 | 2023 |
| Deportivo 2023 | 2023 |
| Eléctrico 2021 | 2021 |
| Eléctrico 2021 | 2021 |
+----------------+------+
**/

-- Consulta para contar el número de coches vendidos por cliente.
select count(v.id_coche) as coches_vendidos from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche order by v.id_cliente;
/**
+-----------------+
| coches_vendidos |
+-----------------+
| 9               |
+-----------------+
**/

-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
select cl.nombre, ch.precio from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and cl.edad > 35;
/**
+-----------------+---------+
|     nombre      | precio  |
+-----------------+---------+
| Pedro Rodríguez | 32000.0 |
| Isabel Díaz     | 35000.0 |
+-----------------+---------+
**/

-- Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
select sum(ch.precio) as precio_total from clientes as cl, coches as ch, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and cl.direccion regexp 'Calle';
/**
+--------------+
| precio_total |
+--------------+
| 114000.0     |
+--------------+
**/

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
select cl.nombre, cl.direccion from clientes as cl, coches as ch, ventas as v, reparacion as re where cl.id_cliente = v.id_cliente and cl.id_cliente = re.id_cliente and ch.id_coche = v.id_coche and ch.id_coche = re.id_coche
and ch.precio > 30000 and re.fecha_reparación regexp '2024';
/**
+--------------+----------------+
|    nombre    |   direccion    |
+--------------+----------------+
| Elena Torres | Avenida J #333 |
+--------------+----------------+
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
select avg(ch.precio) as precio_medio from clientes as cl, coches as ch, ventas as v, reparacion as re where cl.id_cliente = v.id_cliente and cl.id_cliente = re.id_cliente and ch.id_coche = v.id_coche and ch.id_coche = re.id_coche
and v.fecha_venta regexp '2023' and cl.edad < 30;
/**
+--------------+
| precio_medio |
+--------------+
| 31000.0      |
+--------------+
**/

-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
select ch.modelo, ch.año from coches as ch, clientes as cl, ventas as v where cl.id_cliente = v.id_cliente and ch.id_coche = v.id_coche and cl.direccion regexp 'Avenida';
/**
+----------------+------+
|     modelo     | año  |
+----------------+------+
| Hatchback 2021 | 2021 |
| Coupé 2022     | 2022 |
| Compacto 2021  | 2021 |
| Deportivo 2023 | 2023 |
| Eléctrico 2021 | 2021 |
+----------------+------+
**/

-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.

/**

**/



