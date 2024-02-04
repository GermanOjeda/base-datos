-- Obtener todos los clientes.
select * from clientes;
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener la cantidad total de productos en todos los pedidos
select SUM(cantidad) as cantidad_total_pedidos from pedidos;
/**
+------------------------+
| cantidad_total_pedidos |
+------------------------+
| 54                     |
+------------------------+
**/

-- Obtener el precio promedio de los productos:
select avg(precio) as precio_promedio from productos;
/**
+------------------+
| precio_promedio  |
+------------------+
| 188.294285714286 |
+------------------+
**/

-- Obtener los clientes que tienen un email válido (contiene '@'):
select * from clientes where email regexp '@';
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener el producto más caro.
select id, nombre, max(precio) as precio_maximo from productos;
/**
+----+--------+---------------+
| id | nombre | precio_maximo |
+----+--------+---------------+
| 1  | Laptop | 1200.0        |
+----+--------+---------------+
**/

-- Obtener los pedidos realizados en febrero de 2024.
select * from pedidos where fecha_pedido regexp '^2024-02';
/**
+-----------+------------+-------------+----------+--------------+
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
+-----------+------------+-------------+----------+--------------+
| 1         | 1          | 1           | 2        | 2024-02-01   |
| 2         | 2          | 2           | 1        | 2024-02-02   |
| 3         | 3          | 3           | 3        | 2024-02-03   |
| 4         | 4          | 4           | 1        | 2024-02-04   |
| 5         | 5          | 5           | 2        | 2024-02-05   |
| 6         | 6          | 6           | 1        | 2024-02-06   |
| 7         | 7          | 7           | 3        | 2024-02-07   |
| 8         | 8          | 8           | 2        | 2024-02-08   |
| 9         | 9          | 9           | 1        | 2024-02-09   |
| 10        | 10         | 10          | 2        | 2024-02-10   |
| 11        | 11         | 11          | 1        | 2024-02-11   |
| 12        | 12         | 12          | 3        | 2024-02-12   |
| 13        | 13         | 13          | 1        | 2024-02-13   |
| 14        | 14         | 14          | 2        | 2024-02-14   |
| 15        | 15         | 15          | 1        | 2024-02-15   |
| 16        | 16         | 16          | 3        | 2024-02-16   |
| 17        | 17         | 17          | 2        | 2024-02-17   |
| 18        | 18         | 18          | 1        | 2024-02-18   |
| 19        | 19         | 19          | 2        | 2024-02-19   |
| 20        | 20         | 20          | 1        | 2024-02-20   |
| 21        | 21         | 21          | 3        | 2024-02-21   |
| 22        | 22         | 22          | 1        | 2024-02-22   |
| 23        | 23         | 23          | 2        | 2024-02-23   |
| 24        | 24         | 24          | 1        | 2024-02-24   |
| 25        | 25         | 25          | 3        | 2024-02-25   |
| 26        | 26         | 26          | 2        | 2024-02-26   |
| 27        | 27         | 27          | 1        | 2024-02-27   |
| 28        | 28         | 28          | 2        | 2024-02-28   |
| 29        | 29         | 29          | 1        | 2024-02-29   |
+-----------+------------+-------------+----------+--------------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto.
select pr.nombre, pd.cantidad from productos as pr, pedidos as pd where pr.id = pd.id_producto;
/**
+-----------------------------------+----------+
|              nombre               | cantidad |
+-----------------------------------+----------+
| Laptop                            | 2        |
| Smartphone                        | 1        |
| TV LED                            | 3        |
| Tablet                            | 1        |
| Auriculares Bluetooth             | 2        |
| Impresora                         | 1        |
| Cámara Digital                    | 3        |
| Reproductor de Audio              | 2        |
| Altavoces Inalámbricos            | 1        |
| Reloj Inteligente                 | 2        |
| Teclado Inalámbrico               | 1        |
| Ratón Óptico                      | 3        |
| Monitor LED                       | 1        |
| Mochila para Portátil             | 2        |
| Disco Duro Externo                | 1        |
| Router Wi-Fi                      | 3        |
| Lámpara LED                       | 2        |
| Batería Externa                   | 1        |
| Estuche para Auriculares          | 2        |
| Tarjeta de Memoria                | 1        |
| Cargador Inalámbrico              | 3        |
| Kit de Limpieza para Computadoras | 1        |
| Funda para Tablet                 | 2        |
| Soporte para Teléfono             | 1        |
| Hub USB                           | 3        |
| Webcam HD                         | 2        |
| Funda para Laptop                 | 1        |
| Adaptador HDMI                    | 2        |
+-----------------------------------+----------+
**/

-- Obtener los clientes que han realizado más de un pedido.
select c.* from clientes as c, pedidos as pd where c.id = pd.id_cliente and pd.cantidad > 1;
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 3  | Carlos López    | carlos@example.com        |
| 5  | Luisa Martínez  | luisa@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 10 | David Torres    | david@example.com         |
| 12 | Javier López    | javier@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 19 | Marina Díaz     | marina@example.com        |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 28 | Roberto Ruiz    | roberto@example.com       |
+----+-----------------+---------------------------+
**/

-- Obtener los productos que tienen un precio registrado.
select * from productos where precio is not null;
/**
+----+-----------------------------------+--------+
| id |              nombre               | precio |
+----+-----------------------------------+--------+
| 1  | Laptop                            | 1200.0 |
| 2  | Smartphone                        | 699.99 |
| 3  | TV LED                            | 799.5  |
| 4  | Tablet                            | 299.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 6  | Impresora                         | 199.99 |
| 7  | Cámara Digital                    | 499.99 |
| 8  | Reproductor de Audio              | 149.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 10 | Reloj Inteligente                 | 249.99 |
| 11 | Teclado Inalámbrico               | 59.99  |
| 12 | Ratón Óptico                      | 29.99  |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 15 | Disco Duro Externo                | 89.99  |
| 16 | Router Wi-Fi                      | 69.99  |
| 17 | Lámpara LED                       | 39.99  |
| 18 | Batería Externa                   | 19.99  |
| 19 | Estuche para Auriculares          | 14.99  |
| 20 | Tarjeta de Memoria                | 24.99  |
| 21 | Cargador Inalámbrico              | 34.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 23 | Funda para Tablet                 | 19.99  |
| 24 | Soporte para Teléfono             | 14.99  |
| 25 | Hub USB                           | 29.99  |
| 26 | Webcam HD                         | 59.99  |
| 27 | Funda para Laptop                 | 29.99  |
| 28 | Adaptador HDMI                    | 12.99  |
+----+-----------------------------------+--------+
**/

-- Obtener la fecha del primer pedido realizado:
select fecha_pedido from pedidos where id_pedido = 1;
/**
+--------------+
| fecha_pedido |
+--------------+
| 2024-02-01   |
+--------------+
**/

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':
select * from productos where nombre regexp '^A|^B';
/**
+----+------------------------+--------+
| id |         nombre         | precio |
+----+------------------------+--------+
| 5  | Auriculares Bluetooth  | 79.99  |
| 9  | Altavoces Inalámbricos | 129.99 |
| 18 | Batería Externa        | 19.99  |
| 28 | Adaptador HDMI         | 12.99  |
+----+------------------------+--------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente. 
select c.nombre, pr.nombre, pd.cantidad from clientes as c, productos as pr, pedidos as pd where c.id = pd.id_cliente and pr.id = pd.id_producto order by c.nombre;
/**
+-----------------+-----------------------------------+----------+
|     nombre      |              nombre               | cantidad |
+-----------------+-----------------------------------+----------+
| Alejandro Muñoz | Router Wi-Fi                      | 3        |
| Ana Rodríguez   | Tablet                            | 1        |
| Andrés Martínez | Soporte para Teléfono             | 1        |
| Antonio Jiménez | Tarjeta de Memoria                | 1        |
| Beatriz Romero  | Cargador Inalámbrico              | 3        |
| Carlos Gómez    | Kit de Limpieza para Computadoras | 1        |
| Carlos López    | TV LED                            | 3        |
| Carmen Vargas   | Monitor LED                       | 1        |
| Clara Sánchez   | Funda para Tablet                 | 2        |
| Daniel Muñoz    | Mochila para Portátil             | 2        |
| David Torres    | Reloj Inteligente                 | 2        |
| Elena González  | Altavoces Inalámbricos            | 1        |
| Eva Torres      | Funda para Laptop                 | 1        |
| Francisco Mora  | Batería Externa                   | 1        |
| Isabel Serrano  | Disco Duro Externo                | 1        |
| Javier López    | Ratón Óptico                      | 3        |
| Juan Pérez      | Laptop                            | 2        |
| Laura García    | Cámara Digital                    | 3        |
| Lucía Díaz      | Hub USB                           | 3        |
| Luisa Martínez  | Auriculares Bluetooth             | 2        |
| Marina Díaz     | Estuche para Auriculares          | 2        |
| Mario Serrano   | Webcam HD                         | 2        |
| María Gómez     | Smartphone                        | 1        |
| Miguel Martín   | Reproductor de Audio              | 2        |
| Pedro Sánchez   | Impresora                         | 1        |
| Raquel Herrera  | Lámpara LED                       | 2        |
| Roberto Ruiz    | Adaptador HDMI                    | 2        |
| Sofía Ruiz      | Teclado Inalámbrico               | 1        |
+-----------------+-----------------------------------+----------+
**/

-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.
select c.* from clientes as c, pedidos as pd where c.id = pd.id_cliente and pd.cantidad > 1 and fecha_pedido regexp '^2024-02';
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 3  | Carlos López    | carlos@example.com        |
| 5  | Luisa Martínez  | luisa@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 10 | David Torres    | david@example.com         |
| 12 | Javier López    | javier@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 19 | Marina Díaz     | marina@example.com        |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 28 | Roberto Ruiz    | roberto@example.com       |
+----+-----------------+---------------------------+
**/

-- Obtener los productos con precio entre 100 y 500.
select * from productos where precio between 100 and 500;
/**
+----+------------------------+--------+
| id |         nombre         | precio |
+----+------------------------+--------+
| 4  | Tablet                 | 299.99 |
| 6  | Impresora              | 199.99 |
| 7  | Cámara Digital         | 499.99 |
| 8  | Reproductor de Audio   | 149.99 |
| 9  | Altavoces Inalámbricos | 129.99 |
| 10 | Reloj Inteligente      | 249.99 |
| 13 | Monitor LED            | 349.99 |
+----+------------------------+--------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.
select c.nombre, pr.nombre, pd.cantidad from clientes as c, productos as pr, pedidos as pd where c.id = pd.id_cliente and pr.id = pd.id_producto order by pd.cantidad desc;
/**
+-----------------+-----------------------------------+----------+
|     nombre      |              nombre               | cantidad |
+-----------------+-----------------------------------+----------+
| Carlos López    | TV LED                            | 3        |
| Laura García    | Cámara Digital                    | 3        |
| Javier López    | Ratón Óptico                      | 3        |
| Alejandro Muñoz | Router Wi-Fi                      | 3        |
| Beatriz Romero  | Cargador Inalámbrico              | 3        |
| Lucía Díaz      | Hub USB                           | 3        |
| Juan Pérez      | Laptop                            | 2        |
| Luisa Martínez  | Auriculares Bluetooth             | 2        |
| Miguel Martín   | Reproductor de Audio              | 2        |
| David Torres    | Reloj Inteligente                 | 2        |
| Daniel Muñoz    | Mochila para Portátil             | 2        |
| Raquel Herrera  | Lámpara LED                       | 2        |
| Marina Díaz     | Estuche para Auriculares          | 2        |
| Clara Sánchez   | Funda para Tablet                 | 2        |
| Mario Serrano   | Webcam HD                         | 2        |
| Roberto Ruiz    | Adaptador HDMI                    | 2        |
| María Gómez     | Smartphone                        | 1        |
| Ana Rodríguez   | Tablet                            | 1        |
| Pedro Sánchez   | Impresora                         | 1        |
| Elena González  | Altavoces Inalámbricos            | 1        |
| Sofía Ruiz      | Teclado Inalámbrico               | 1        |
| Carmen Vargas   | Monitor LED                       | 1        |
| Isabel Serrano  | Disco Duro Externo                | 1        |
| Francisco Mora  | Batería Externa                   | 1        |
| Antonio Jiménez | Tarjeta de Memoria                | 1        |
| Carlos Gómez    | Kit de Limpieza para Computadoras | 1        |
| Andrés Martínez | Soporte para Teléfono             | 1        |
| Eva Torres      | Funda para Laptop                 | 1        |
+-----------------+-----------------------------------+----------+
**/

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
select * from clientes where nombre regexp 'a';
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/


-- Obtener el precio máximo de los productos.
select max(precio) as precio_maximo from productos;
/**
+---------------+
| precio_maximo |
+---------------+
| 1200.0        |
+---------------+
**/

-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
select pd.* from pedidos as pd, clientes as c where c.id = pd.id_cliente and c.id = 1 and fecha_pedido regexp '^2024-02';
/**
select pd.* from pedidos as pd, clientes as c where c.id = pd.id_cliente and c.id = 1 and fecha_pedido regexp '^2024-02';
+-----------+------------+-------------+----------+--------------+
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
+-----------+------------+-------------+----------+--------------+
| 1         | 1          | 1           | 2        | 2024-02-01   |
+-----------+------------+-------------+----------+--------------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.
select pr.nombre, pd.cantidad from productos as pr, pedidos as pd where pr.id = pd.id_producto order by pr.nombre desc;
/**
+-----------------------------------+----------+
|              nombre               | cantidad |
+-----------------------------------+----------+
| Webcam HD                         | 2        |
| Teclado Inalámbrico               | 1        |
| Tarjeta de Memoria                | 1        |
| Tablet                            | 1        |
| TV LED                            | 3        |
| Soporte para Teléfono             | 1        |
| Smartphone                        | 1        |
| Router Wi-Fi                      | 3        |
| Reproductor de Audio              | 2        |
| Reloj Inteligente                 | 2        |
| Ratón Óptico                      | 3        |
| Monitor LED                       | 1        |
| Mochila para Portátil             | 2        |
| Lámpara LED                       | 2        |
| Laptop                            | 2        |
| Kit de Limpieza para Computadoras | 1        |
| Impresora                         | 1        |
| Hub USB                           | 3        |
| Funda para Tablet                 | 2        |
| Funda para Laptop                 | 1        |
| Estuche para Auriculares          | 2        |
| Disco Duro Externo                | 1        |
| Cámara Digital                    | 3        |
| Cargador Inalámbrico              | 3        |
| Batería Externa                   | 1        |
| Auriculares Bluetooth             | 2        |
| Altavoces Inalámbricos            | 1        |
| Adaptador HDMI                    | 2        |
+-----------------------------------+----------+
**/

-- Obtener los productos que no tienen un precio registrado.
select * from productos where precio is null;
/**
No da resultado
**/

-- Obtener la fecha del último pedido realizado.
select max(id_producto) as ultimo_pedido, fecha_pedido from pedidos;
/**
+---------------+--------------+
| ultimo_pedido | fecha_pedido |
+---------------+--------------+
| 30            | 2024-03-01   |
+---------------+--------------+
**/

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
select * from clientes where nombre regexp '.....';
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
select * from productos where nombre regexp 'o';
/**
+----+-----------------------------------+--------+
| id |              nombre               | precio |
+----+-----------------------------------+--------+
| 1  | Laptop                            | 1200.0 |
| 2  | Smartphone                        | 699.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 6  | Impresora                         | 199.99 |
| 8  | Reproductor de Audio              | 149.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 10 | Reloj Inteligente                 | 249.99 |
| 11 | Teclado Inalámbrico               | 59.99  |
| 12 | Ratón Óptico                      | 29.99  |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 15 | Disco Duro Externo                | 89.99  |
| 16 | Router Wi-Fi                      | 69.99  |
| 20 | Tarjeta de Memoria                | 24.99  |
| 21 | Cargador Inalámbrico              | 34.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 24 | Soporte para Teléfono             | 14.99  |
| 27 | Funda para Laptop                 | 29.99  |
| 28 | Adaptador HDMI                    | 12.99  |
+----+-----------------------------------+--------+
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
select c.nombre, pr.nombre, pd.cantidad from clientes as c, productos as pr, pedidos as pd where c.id = pd.id_cliente and pr.id = pd.id_producto order by c.nombre;
/**
+-----------------+-----------------------------------+----------+
|     nombre      |              nombre               | cantidad |
+-----------------+-----------------------------------+----------+
| Alejandro Muñoz | Router Wi-Fi                      | 3        |
| Ana Rodríguez   | Tablet                            | 1        |
| Andrés Martínez | Soporte para Teléfono             | 1        |
| Antonio Jiménez | Tarjeta de Memoria                | 1        |
| Beatriz Romero  | Cargador Inalámbrico              | 3        |
| Carlos Gómez    | Kit de Limpieza para Computadoras | 1        |
| Carlos López    | TV LED                            | 3        |
| Carmen Vargas   | Monitor LED                       | 1        |
| Clara Sánchez   | Funda para Tablet                 | 2        |
| Daniel Muñoz    | Mochila para Portátil             | 2        |
| David Torres    | Reloj Inteligente                 | 2        |
| Elena González  | Altavoces Inalámbricos            | 1        |
| Eva Torres      | Funda para Laptop                 | 1        |
| Francisco Mora  | Batería Externa                   | 1        |
| Isabel Serrano  | Disco Duro Externo                | 1        |
| Javier López    | Ratón Óptico                      | 3        |
| Juan Pérez      | Laptop                            | 2        |
| Laura García    | Cámara Digital                    | 3        |
| Lucía Díaz      | Hub USB                           | 3        |
| Luisa Martínez  | Auriculares Bluetooth             | 2        |
| Marina Díaz     | Estuche para Auriculares          | 2        |
| Mario Serrano   | Webcam HD                         | 2        |
| María Gómez     | Smartphone                        | 1        |
| Miguel Martín   | Reproductor de Audio              | 2        |
| Pedro Sánchez   | Impresora                         | 1        |
| Raquel Herrera  | Lámpara LED                       | 2        |
| Roberto Ruiz    | Adaptador HDMI                    | 2        |
| Sofía Ruiz      | Teclado Inalámbrico               | 1        |
+-----------------+-----------------------------------+----------+
**/

-- Obtener los clientes cuyos nombres no contienen la letra 'i':
select * from clientes where nombre not regexp 'i';
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 9  | Elena González  | elena@example.com         |
| 13 | Carmen Vargas   | carmen@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
+----+-----------------+---------------------------+
**/

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
select pd.* from pedidos as pd, clientes as c where c.id = pd.id_cliente and c.id = 2;
/**
+-----------+------------+-------------+----------+--------------+
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
+-----------+------------+-------------+----------+--------------+
| 2         | 2          | 2           | 1        | 2024-02-02   |
+-----------+------------+-------------+----------+--------------+
**/

-- Obtener el precio mínimo de los productos.
select min(precio) as precio_minimo from productos;
/**
+---------------+
| precio_minimo |
+---------------+
| 9.99          |
+---------------+
**/

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
select c.* from clientes as c, pedidos as pd where c.id = pd.id_cliente and pd.cantidad > 0 and fecha_pedido regexp '^2024-02';
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener la fecha del último pedido realizado por el cliente con ID 3.
select pd.id_cliente, pd.fecha_pedido from pedidos as pd, clientes as c where c.id = pd.id_cliente and pd.id_cliente = 3;
/**
+------------+--------------+
| id_cliente | fecha_pedido |
+------------+--------------+
| 3          | 2024-02-03   |
+------------+--------------+
**/

-- Obtener los productos que tienen una 'a' al final del nombre.
select * from productos where nombre regexp 'a$';
/**
+----+--------------------+--------+
| id |       nombre       | precio |
+----+--------------------+--------+
| 6  | Impresora          | 199.99 |
| 18 | Batería Externa    | 19.99  |
| 20 | Tarjeta de Memoria | 24.99  |
+----+--------------------+--------+
**/

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
select * from clientes where nombre regexp '[aeiouAEIOU]+{4}';
/**
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
**/

-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
select * from productos where precio regexp '[0-9]{4}';
/**
+----+--------+--------+
| id | nombre | precio |
+----+--------+--------+
| 1  | Laptop | 1200.0 |
+----+--------+--------+
**/

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
select * from clientes where nombre regexp 'ae{1,}';
/**
No da resultado
**/

-- Obtener los productos cuyos nombres terminan con una consonante.
select * from productos where nombre not regexp '[aeiouAEIOU]$';
/**
+----+-----------------------------------+--------+
| id |              nombre               | precio |
+----+-----------------------------------+--------+
| 1  | Laptop                            | 1200.0 |
| 3  | TV LED                            | 799.5  |
| 4  | Tablet                            | 299.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 7  | Cámara Digital                    | 499.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 17 | Lámpara LED                       | 39.99  |
| 19 | Estuche para Auriculares          | 14.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 23 | Funda para Tablet                 | 19.99  |
| 25 | Hub USB                           | 29.99  |
| 26 | Webcam HD                         | 59.99  |
| 27 | Funda para Laptop                 | 29.99  |
+----+-----------------------------------+--------+
**/

-- Obtener los productos cuyos nombres empiezan con una vocal.
select * from productos where nombre regexp '^[aeiouAEIOU]';
/**
+----+--------------------------+--------+
| id |          nombre          | precio |
+----+--------------------------+--------+
| 5  | Auriculares Bluetooth    | 79.99  |
| 6  | Impresora                | 199.99 |
| 9  | Altavoces Inalámbricos   | 129.99 |
| 19 | Estuche para Auriculares | 14.99  |
| 28 | Adaptador HDMI           | 12.99  |
+----+--------------------------+--------+
**/
