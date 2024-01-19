# Tarea 4 sqlite

## Tabla Productos y Ventas
---
Productos:
```SQL
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 1  | Arroz              | Alimentos | 2.5    |
| 2  | Leche              | Lácteos   | 1.8    |
| 3  | Pan                | Panadería | 1.2    |
| 4  | Manzanas           | Frutas    | 3.0    |
| 5  | Pollo              | Carnes    | 5.5    |
| 6  | Huevos             | Lácteos   | 1.0    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 8  | Tomates            | Verduras  | 2.2    |
| 9  | Queso              | Lácteos   | 4.0    |
| 10 | Cereal             | Desayuno  | 3.5    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 14 | Galletas           | Snacks    | 1.7    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 16 | Café               | Bebidas   | 5.0    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 18 | Jabón de Baño      | Higiene   | 1.2    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
+----+--------------------+-----------+--------+
```
Ventas:
```SQL
+----+-------------+----------+------------+
| id | id_producto | cantidad |   fecha    |
+----+-------------+----------+------------+
| 1  | 1           | 5        | 2024-01-17 |
| 2  | 2           | 3        | 2024-01-17 |
| 3  | 4           | 2        | 2024-01-17 |
| 4  | 5           | 1        | 2024-01-17 |
| 5  | 6           | 10       | 2024-01-18 |
| 6  | 8           | 4        | 2024-01-18 |
| 7  | 10          | 2        | 2024-01-18 |
| 8  | 14          | 7        | 2024-01-19 |
| 9  | 16          | 3        | 2024-01-19 |
| 10 | 18          | 6        | 2024-01-20 |
+----+-------------+----------+------------+
```


## Consultas

#### Mostrar todos los productos de la categoría "Bebidas".

```SQL
select * from productos where categoria = 'Bebidas';
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 16 | Café             | Bebidas   | 5.0    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |
+----+------------------+-----------+--------+
```

#### Listar los productos ordenados por precio de forma descendente.

```SQL
select * from productos order by precio desc;
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 5  | Pollo              | Carnes    | 5.5    |
| 16 | Café               | Bebidas   | 5.0    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 9  | Queso              | Lácteos   | 4.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
| 10 | Cereal             | Desayuno  | 3.5    |
| 4  | Manzanas           | Frutas    | 3.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 1  | Arroz              | Alimentos | 2.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 8  | Tomates            | Verduras  | 2.2    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 2  | Leche              | Lácteos   | 1.8    |
| 14 | Galletas           | Snacks    | 1.7    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 3  | Pan                | Panadería | 1.2    |
| 18 | Jabón de Baño      | Higiene   | 1.2    |
| 6  | Huevos             | Lácteos   | 1.0    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
+----+--------------------+-----------+--------+
```

#### Calcular el precio total de todos los productos en la tabla "productos".

```SQL
select SUM(precio) as precio_total from productos;
+--------------+
| precio_total |
+--------------+
| 52.5         |
+--------------+
```

#### Encontrar los productos con un nombre que contenga la letra 'a'.

```SQL
select * from productos where nombre like '%a%';
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 1  | Arroz            | Alimentos | 2.5    |
| 3  | Pan              | Panadería | 1.2    |
| 4  | Manzanas         | Frutas    | 3.0    |
| 8  | Tomates          | Verduras  | 2.2    |
| 10 | Cereal           | Desayuno  | 3.5    |
| 11 | Papel Higiénico  | Hogar     | 1.5    |
| 14 | Galletas         | Snacks    | 1.7    |
| 15 | Aceite de Oliva  | Cocina    | 4.5    |
| 16 | Café             | Bebidas   | 5.0    |
| 17 | Sopa enlatada    | Conservas | 2.3    |
| 18 | Jabón de Baño    | Higiene   | 1.2    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |
+----+------------------+-----------+--------+
```

#### Obtener la cantidad total de productos vendidos en todas las fechas.

```SQL
select fecha, sum(cantidad) as Cantidad_Total_Vendida from ventas group by fecha;
+------------+------------------------+
|   fecha    | Cantidad_Total_Vendida |
+------------+------------------------+
| 2024-01-17 | 11                     |
| 2024-01-18 | 16                     |
| 2024-01-19 | 10                     |
| 2024-01-20 | 6                      |
+------------+------------------------+

```

#### Encontrar el producto más caro en cada categoría.

```SQL
select distinct id, nombre, precio, categoria from productos group by categoria;
+----+--------------------+--------+-----------+
| id |       nombre       | precio | categoria |
+----+--------------------+--------+-----------+
| 1  | Arroz              | 2.5    | Alimentos |
| 16 | Café               | 5.0    | Bebidas   |
| 5  | Pollo              | 5.5    | Carnes    |
| 15 | Aceite de Oliva    | 4.5    | Cocina    |
| 17 | Sopa enlatada      | 2.3    | Conservas |
| 10 | Cereal             | 3.5    | Desayuno  |
| 4  | Manzanas           | 3.0    | Frutas    |
| 12 | Cepillo de Dientes | 2.0    | Higiene   |
| 11 | Papel Higiénico    | 1.5    | Hogar     |
| 13 | Detergente         | 2.8    | Limpieza  |
| 2  | Leche              | 1.8    | Lácteos   |
| 3  | Pan                | 1.2    | Panadería |
| 14 | Galletas           | 1.7    | Snacks    |
| 8  | Tomates            | 2.2    | Verduras  |
+----+--------------------+--------+-----------+
```

#### Listar los productos que no han sido vendidos.

```SQL
select * from productos where id not in(select p.id from productos as p, ventas as v where p.id = v.id_producto);
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 3  | Pan                | Panadería | 1.2    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 9  | Queso              | Lácteos   | 4.0    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
+----+--------------------+-----------+--------+
```

#### Calcular el precio promedio de los productos en la categoría "Snacks".

```SQL
select avg(precio) as promedio_precio_snacks from productos where categoria = 'Snacks';
+------------------------+
| promedio_precio_snacks |
+------------------------+
| 1.7                    |
+------------------------+
```

#### Encontrar los productos que han sido vendidos más de 5 veces.

```SQL
select p.nombre, v.cantidad from productos as p, ventas as v where p.id = v.id_producto and v.cantidad > 5; 
+---------------+----------+
|    nombre     | cantidad |
+---------------+----------+
| Huevos        | 10       |
| Galletas      | 7        |
| Jabón de Baño | 6        |
+---------------+----------+
```

#### Mostrar la fecha y la cantidad de ventas para cada producto.

```SQL
select p.nombre, v.cantidad, v.fecha from productos as p, ventas as v where p.id = v.id_producto;
+---------------+----------+------------+
|    nombre     | cantidad |   fecha    |
+---------------+----------+------------+
| Arroz         | 5        | 2024-01-17 |
| Leche         | 3        | 2024-01-17 |
| Manzanas      | 2        | 2024-01-17 |
| Pollo         | 1        | 2024-01-17 |
| Huevos        | 10       | 2024-01-18 |
| Tomates       | 4        | 2024-01-18 |
| Cereal        | 2        | 2024-01-18 |
| Galletas      | 7        | 2024-01-19 |
| Café          | 3        | 2024-01-19 |
| Jabón de Baño | 6        | 2024-01-20 |
+---------------+----------+------------+
```

#### Encontrar los productos que tienen un precio menor o igual a 2.

```SQL
select * from productos where id not in(select p.id from productos as p, ventas as v where p.id = v.id_producto);
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 3  | Pan                | Panadería | 1.2    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 9  | Queso              | Lácteos   | 4.0    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
+----+--------------------+-----------+--------+
```

#### Calcular la cantidad total de ventas para cada fecha.

```SQL

```

#### Listar los productos cuyo nombre comienza con la letra 'P'.

```SQL
select * from productos where nombre like 'P%';
+----+-----------------+-----------+--------+
| id |     nombre      | categoria | precio |
+----+-----------------+-----------+--------+
| 3  | Pan             | Panadería | 1.2    |
| 5  | Pollo           | Carnes    | 5.5    |
| 11 | Papel Higiénico | Hogar     | 1.5    |
+----+-----------------+-----------+--------+
```

#### Obtener el producto más vendido en términos de cantidad.

```SQL
select p.id, p.nombre, max(v.cantidad) as cantidad_maxima from productos as p, ventas as v where p.id = v.id_producto;
+----+--------+-----------------+
| id | nombre | cantidad_maxima |
+----+--------+-----------------+
| 6  | Huevos | 10              |
+----+--------+-----------------+
```

#### Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

```SQL
select p.id, p.nombre, v.fecha from productos as p, ventas as v where v.fecha = '2024-01-18' and p.id = v.id_producto;
+----+---------+------------+
| id | nombre  |   fecha    |
+----+---------+------------+
| 6  | Huevos  | 2024-01-18 |
| 8  | Tomates | 2024-01-18 |
| 10 | Cereal  | 2024-01-18 |
+----+---------+------------+
```

#### Calcular el total de ventas para cada producto.

```SQL

```

#### Encontrar los productos con un precio entre 3 y 4.

```SQL
select * from productos where precio between 3 and 4;
+----+----------+-----------+--------+
| id |  nombre  | categoria | precio |
+----+----------+-----------+--------+
| 4  | Manzanas | Frutas    | 3.0    |
| 9  | Queso    | Lácteos   | 4.0    |
| 10 | Cereal   | Desayuno  | 3.5    |
| 20 | Cerveza  | Bebidas   | 3.8    |
+----+----------+-----------+--------+
```

#### Listar los productos y sus categorías ordenados alfabéticamente por categoría.

```SQL
select nombre, categoria from productos order by categoria;
+--------------------+-----------+
|       nombre       | categoria |
+--------------------+-----------+
| Arroz              | Alimentos |
| Café               | Bebidas   |
| Botellas de Agua   | Bebidas   |
| Cerveza            | Bebidas   |
| Pollo              | Carnes    |
| Aceite de Oliva    | Cocina    |
| Sopa enlatada      | Conservas |
| Cereal             | Desayuno  |
| Manzanas           | Frutas    |
| Cepillo de Dientes | Higiene   |
| Jabón de Baño      | Higiene   |
| Papel Higiénico    | Hogar     |
| Detergente         | Limpieza  |
| Leche              | Lácteos   |
| Huevos             | Lácteos   |
| Yogurt             | Lácteos   |
| Queso              | Lácteos   |
| Pan                | Panadería |
| Galletas           | Snacks    |
| Tomates            | Verduras  |
+--------------------+-----------+
```

#### Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

```SQL
select p.id, p.nombre, p.precio * v.cantidad as precio_total, v.fecha from productos as p, ventas as v where p.id = v.id_producto and fecha = "2024-01-19";
+----+----------+--------------+------------+
| id |  nombre  | precio_total |   fecha    |
+----+----------+--------------+------------+
| 14 | Galletas | 11.9         | 2024-01-19 |
| 16 | Café     | 15.0         | 2024-01-19 |
+----+----------+--------------+------------+
```

#### Mostrar los productos que no pertenecen a la categoría "Higiene".

```SQL
select * from productos where categoria not like "Higiene";
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 1  | Arroz            | Alimentos | 2.5    |
| 2  | Leche            | Lácteos   | 1.8    |
| 3  | Pan              | Panadería | 1.2    |
| 4  | Manzanas         | Frutas    | 3.0    |
| 5  | Pollo            | Carnes    | 5.5    |
| 6  | Huevos           | Lácteos   | 1.0    |
| 7  | Yogurt           | Lácteos   | 2.0    |
| 8  | Tomates          | Verduras  | 2.2    |
| 9  | Queso            | Lácteos   | 4.0    |
| 10 | Cereal           | Desayuno  | 3.5    |
| 11 | Papel Higiénico  | Hogar     | 1.5    |
| 13 | Detergente       | Limpieza  | 2.8    |
| 14 | Galletas         | Snacks    | 1.7    |
| 15 | Aceite de Oliva  | Cocina    | 4.5    |
| 16 | Café             | Bebidas   | 5.0    |
| 17 | Sopa enlatada    | Conservas | 2.3    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |
+----+------------------+-----------+--------+
```

#### Encontrar la cantidad total de productos en cada categoría.

```SQL
+-----------+-----------------------+
| categoria | cantidad_de_productos |
+-----------+-----------------------+
| Alimentos | 1                     |
| Bebidas   | 3                     |
| Carnes    | 1                     |
| Cocina    | 1                     |
| Conservas | 1                     |
| Desayuno  | 1                     |
| Frutas    | 1                     |
| Higiene   | 2                     |
| Hogar     | 1                     |
| Limpieza  | 1                     |
| Lácteos   | 4                     |
| Panadería | 1                     |
| Snacks    | 1                     |
| Verduras  | 1                     |
+-----------+-----------------------+
```

#### Listar los productos que tienen un precio igual a la media de precios.

```SQL
select * from productos as p where p.precio = (select avg(precio) from productos);
```

#### Calcular el precio total de los productos vendidos en cada fecha.

```SQL

```

#### Mostrar los productos con un nombre que termina con la letra 'o'.

```SQL
select * from productos where nombre like "%o";
+----+-----------------+-----------+--------+
| id |     nombre      | categoria | precio |
+----+-----------------+-----------+--------+
| 5  | Pollo           | Carnes    | 5.5    |
| 9  | Queso           | Lácteos   | 4.0    |
| 11 | Papel Higiénico | Hogar     | 1.5    |
| 18 | Jabón de Baño   | Higiene   | 1.2    |
+----+-----------------+-----------+--------+
```

#### Encontrar los productos que han sido vendidos en más de una fecha.

```SQL

```

#### Listar los productos cuya categoría comienza con la letra 'L'.

```SQL
select * from productos where categoria like "L%";
+----+------------+-----------+--------+
| id |   nombre   | categoria | precio |
+----+------------+-----------+--------+
| 2  | Leche      | Lácteos   | 1.8    |
| 6  | Huevos     | Lácteos   | 1.0    |
| 7  | Yogurt     | Lácteos   | 2.0    |
| 9  | Queso      | Lácteos   | 4.0    |
| 13 | Detergente | Limpieza  | 2.8    |
+----+------------+-----------+--------+
```

#### Calcular el total de ventas para cada producto en la fecha '2024-01-17'.

```SQL
select p.id, p.nombre, p.precio * v.cantidad as total_ventas from productos as p, ventas as v where p.id = v.id_producto and fecha = "2024-01-17";
+----+----------+--------------+
| id |  nombre  | total_ventas |
+----+----------+--------------+
| 1  | Arroz    | 12.5         |
| 2  | Leche    | 5.4          |
| 4  | Manzanas | 6.0          |
| 5  | Pollo    | 5.5          |
+----+----------+--------------+
```

#### Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

```SQL
select * from productos where length(nombre) >= 5;
+----+--------------------+-----------+--------+
| id |       nombre       | categoria | precio |
+----+--------------------+-----------+--------+
| 1  | Arroz              | Alimentos | 2.5    |
| 2  | Leche              | Lácteos   | 1.8    |
| 4  | Manzanas           | Frutas    | 3.0    |
| 5  | Pollo              | Carnes    | 5.5    |
| 6  | Huevos             | Lácteos   | 1.0    |
| 7  | Yogurt             | Lácteos   | 2.0    |
| 8  | Tomates            | Verduras  | 2.2    |
| 9  | Queso              | Lácteos   | 4.0    |
| 10 | Cereal             | Desayuno  | 3.5    |
| 11 | Papel Higiénico    | Hogar     | 1.5    |
| 12 | Cepillo de Dientes | Higiene   | 2.0    |
| 13 | Detergente         | Limpieza  | 2.8    |
| 14 | Galletas           | Snacks    | 1.7    |
| 15 | Aceite de Oliva    | Cocina    | 4.5    |
| 17 | Sopa enlatada      | Conservas | 2.3    |
| 18 | Jabón de Baño      | Higiene   | 1.2    |
| 19 | Botellas de Agua   | Bebidas   | 1.0    |
| 20 | Cerveza            | Bebidas   | 3.8    |
+----+--------------------+-----------+--------+
```

#### Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".

```SQL
select * from productos where precio > (select max(precio) from productos);
```
