# Tarea3 Sqlite3


## Consultas


#### Muestra el nombre de todos los empleados en Mayuscula

```SQL
select nombre, UPPER(nombre) as nombre_mayusculas from empleados;
+-----------+-------------------+
|  nombre   | nombre_mayusculas |
+-----------+-------------------+
| Juan      | JUAN              |
| María     | MARíA             |
| Carlos    | CARLOS            |
| Ana       | ANA               |
| Pedro     | PEDRO             |
| Laura     | LAURA             |
| Javier    | JAVIER            |
| Carmen    | CARMEN            |
| Miguel    | MIGUEL            |
| Elena     | ELENA             |
| Diego     | DIEGO             |
| Sofía     | SOFíA             |
| Andrés    | ANDRéS            |
| Isabel    | ISABEL            |
| Raúl      | RAúL              |
| Patricia  | PATRICIA          |
| Alejandro | ALEJANDRO         |
| Natalia   | NATALIA           |
| Roberto   | ROBERTO           |
| Beatriz   | BEATRIZ           |
+-----------+-------------------+
```

#### Calcula el valor absoluto de todos los empleados del salario de todos los empleados

```SQL
select abs(salario) as Salario_Absoluto from empleados;
+------------------+
| Salario_Absoluto |
+------------------+
| 50000.0          |
| 60000.0          |
| 55000.0          |
| 48000.0          |
| 70000.0          |
| 52000.0          |
| 48000.0          |
| 65000.0          |
| 51000.0          |
| 55000.0          |
| 72000.0          |
| 49000.0          |
| 60000.0          |
| 53000.0          |
| 68000.0          |
| 47000.0          |
| 71000.0          |
| 54000.0          |
| 49000.0          |
| 63000.0          |
+------------------+
```

#### Muestra la fecha actual

```SQL
select current_date;
+--------------+
| current_date |
+--------------+
| 2024-01-17   |
+--------------+
```

#### Calcula el promedio del salario de todos los empleados

```SQL
select avg(salario) from empleados;
+--------------+
| avg(salario) |
+--------------+
| 57000.0      |
+--------------+
```
#### Convierte la cadena 123 en un valor entero

```SQL
select cast('123' as integer) as cast_function;
+---------------+
| cast_function |
+---------------+
| 123           |
+---------------+
```

#### Concatena el nombre y el departamento de cada empleado con un guión como separador

```SQL
select nombre || "-" || departamento as nombre_departamento from empleados;
+---------------------------+
|    nombre_departamento    |
+---------------------------+
| Juan-Ventas               |
| María-TI                  |
| Carlos-Ventas             |
| Ana-Recursos Humanos      |
| Pedro-TI                  |
| Laura-Ventas              |
| Javier-Recursos Humanos   |
| Carmen-TI                 |
| Miguel-Ventas             |
| Elena-Recursos Humanos    |
| Diego-TI                  |
| Sofía-Ventas              |
| Andrés-Recursos Humanos   |
| Isabel-TI                 |
| Raúl-Ventas               |
| Patricia-Recursos Humanos |
| Alejandro-TI              |
| Natalia-Ventas            |
| Roberto-Recursos Humanos  |
| Beatriz-TI                |
+---------------------------+
```

#### Categoriza a los empleados por su salario

```SQL
SELECT nombre,CASE WHEN salario > 50000 THEN 'Alto' ELSE 'Bajo' END AS rango_salario FROM empleados;
+-----------+---------------+                                                                                           |  nombre   | rango_salario |                                                                                           +-----------+---------------+                                                                                           | Juan      | Bajo          |                                                                                           | María     | Alto          |                                                                                           | Carlos    | Alto          |                                                                                           | Ana       | Bajo          |                                                                                           | Pedro     | Alto          |                                                                                           | Laura     | Alto          |                                                                                           | Javier    | Bajo          |                                                                                           | Carmen    | Alto          |                                                                                           | Miguel    | Alto          |                                                                                           | Elena     | Alto          |                                                                                           | Diego     | Alto          |                                                                                           | Sofía     | Bajo          |                                                                                           | Andrés    | Alto          |                                                                                           | Isabel    | Alto          |                                                                                           | Raúl      | Alto          |                                                                                           | Patricia  | Bajo          |                                                                                           | Alejandro | Alto          |                                                                                           | Natalia   | Alto          |                                                                                           | Roberto   | Bajo          |                                                                                           | Beatriz   | Alto          |                                                                                           +-----------+---------------+
```

#### Calcula la suma total del salario de todos los empleados

```SQL
Select sum(salario) as salario_total from empleados;
+---------------+
| salario_total |
+---------------+
| 1140000.0     |
+---------------+
```

#### Redondea el salario de todos los empleados a dos decimales

```SQL
select round(salario, 2) as Salario_Redondeado from empleados;
+--------------------+
| Salario_Redondeado |
+--------------------+
| 50000.0            |
| 60000.0            |
| 55000.0            |
| 48000.0            |
| 70000.0            |
| 52000.0            |
| 48000.0            |
| 65000.0            |
| 51000.0            |
| 55000.0            |
| 72000.0            |
| 49000.0            |
| 60000.0            |
| 53000.0            |
| 68000.0            |
| 47000.0            |
| 71000.0            |
| 54000.0            |
| 49000.0            |
| 63000.0            |
+--------------------+
```

#### Muestra la longitud del nombre de cada empleado

```SQL
select length(nombre) as longitud_nombre from empleados;
+-----------------+
| longitud_nombre |
+-----------------+
| 4               |
| 5               |
| 6               |
| 3               |
| 5               |
| 5               |
| 6               |
| 6               |
| 6               |
| 5               |
| 5               |
| 5               |
| 6               |
| 6               |
| 4               |
| 8               |
| 9               |
| 7               |
| 7               |
| 7               |
+-----------------+
```

#### Cuenta el numero total de empleados en cada departamento

```SQL
select departamento,count(*) from empleados group by departamento;                                              +------------------+----------+                                                                                         |   departamento   | count(*) |                                                                                         +------------------+----------+                                                                                         | Recursos Humanos | 6        |                                                                                         | TI               | 7        |                                                                                         | Ventas           | 7        |                                                                                         +------------------+----------+
```

#### Muestra la hora actual

```SQL
select current_time;
+--------------+
| current_time |
+--------------+
| 19:47:36     |
+--------------+
```

#### Convierte el salario a un valor de punto flotante

```SQL
select CAST(salario as float) as Salario_flotante from empleados;
+------------------+
| Salario_flotante |
+------------------+
| 50000.0          |
| 60000.0          |
| 55000.0          |
| 48000.0          |
| 70000.0          |
| 52000.0          |
| 48000.0          |
| 65000.0          |
| 51000.0          |
| 55000.0          |
| 72000.0          |
| 49000.0          |
| 60000.0          |
| 53000.0          |
| 68000.0          |
| 47000.0          |
| 71000.0          |
| 54000.0          |
| 49000.0          |
| 63000.0          |
+------------------+
```

#### Muestra los 3 primeros carácteres del nombre de cada empleado

```SQL
select SUBSTR(nombre, 1, 3)  as Primeros_Tres_Carácteres from empleados;+--------------------------+
| Primeros_Tres_Carácteres |
+--------------------------+
| Jua                      |
| Mar                      |
| Car                      |
| Ana                      |
| Ped                      |
| Lau                      |
| Jav                      |
| Car                      |
| Mig                      |
| Ele                      |
| Die                      |
| Sof                      |
| And                      |
| Isa                      |
| Raú                      |
| Pat                      |
| Ale                      |
| Nat                      |
| Rob                      |
| Bea                      |
+--------------------------+
```

#### Empleados en el departamento de 'Ventas' con salarios superiores a 52000.

```SQL
select * from empleados where departamento like 'Ventas' and salario > 52000;
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 3  | Carlos  | 55000.0 | Ventas       |
| 15 | Raúl    | 68000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+
```

#### Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

```SQL
select * from empleados where nombre like '%a%' order by salario asc;
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 12 | Sofía     | 49000.0 | Ventas           |
| 1  | Juan      | 50000.0 | Ventas           |
| 6  | Laura     | 52000.0 | Ventas           |
| 14 | Isabel    | 53000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 3  | Carlos    | 55000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 2  | María     | 60000.0 | TI               |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |
| 8  | Carmen    | 65000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 17 | Alejandro | 71000.0 | TI               |
+----+-----------+---------+------------------+
```

#### Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.

```SQL
select * from empleados where departamento like 'Recursos Humanos' and salario between 45000 and 55000 ;
+----+----------+---------+------------------+
| id |  nombre  | salario |   departamento   |
+----+----------+---------+------------------+
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 7  | Javier   | 48000.0 | Recursos Humanos |
| 10 | Elena    | 55000.0 | Recursos Humanos |
| 16 | Patricia | 47000.0 | Recursos Humanos |
| 19 | Roberto  | 49000.0 | Recursos Humanos |
+----+----------+---------+------------------+
```

#### Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.

```SQL
select nombre, salario from empleados order by salario desc limit 5;                                            +-----------+---------+                                                                                                 |  nombre   | salario |                                                                                                 +-----------+---------+                                                                                                 | Diego     | 72000.0 |                                                                                                 | Alejandro | 71000.0 |                                                                                                 | Pedro     | 70000.0 |                                                                                                 | Raúl      | 68000.0 |                                                                                                 | Carmen    | 65000.0 |                                                                                                 +-----------+---------+
```

#### Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.

```SQL
select * from empleados where nombre like 'M%' or nombre like 'N%' and salario > 50000;
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 2  | María   | 60000.0 | TI           |
| 9  | Miguel  | 51000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+

```

#### Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.

```SQL
select * from empleados where departamento like 'TI' or departamento like 'Ventas' order by nombre;
+----+-----------+---------+--------------+
| id |  nombre   | salario | departamento |
+----+-----------+---------+--------------+
| 17 | Alejandro | 71000.0 | TI           |
| 20 | Beatriz   | 63000.0 | TI           |
| 3  | Carlos    | 55000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |
| 11 | Diego     | 72000.0 | TI           |
| 14 | Isabel    | 53000.0 | TI           |
| 1  | Juan      | 50000.0 | Ventas       |
| 6  | Laura     | 52000.0 | Ventas       |
| 2  | María     | 60000.0 | TI           |
| 9  | Miguel    | 51000.0 | Ventas       |
| 18 | Natalia   | 54000.0 | Ventas       |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 12 | Sofía     | 49000.0 | Ventas       |
+----+-----------+---------+--------------+
```

#### Empleados con salarios únicos (eliminando duplicados) en orden ascendente.

```SQL
select distinct salario from empleados order by salario;                                                        +---------+                                                                                                             | salario |                                                                                                             +---------+                                                                                                             | 47000.0 |                                                                                                             | 48000.0 |                                                                                                             | 49000.0 |                                                                                                             | 50000.0 |                                                                                                             | 51000.0 |                                                                                                             | 52000.0 |                                                                                                             | 53000.0 |                                                                                                             | 54000.0 |                                                                                                             | 55000.0 |                                                                                                             | 60000.0 |                                                                                                             | 63000.0 |                                                                                                             | 65000.0 |                                                                                                             | 68000.0 |                                                                                                             | 70000.0 |                                                                                                             | 71000.0 |                                                                                                             | 72000.0 |                                                                                                             +---------+
```

#### Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.

```SQL
select nombre, departamento from empleados where (departamento like 'Ventas') and (nombre like '%o' or nombre like '%a');                                                                                                               +---------+--------------+                                                                                              | nombre  | departamento |                                                                                              +---------+--------------+                                                                                              | Laura   | Ventas       |                                                                                              | Sofía   | Ventas       |                                                                                              | Natalia | Ventas       |                                                                                              +---------+--------------+
```

#### Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.

```SQL
select * from empleados where salario not between 55000 and 70000 order by departamento;                        +----+-----------+---------+------------------+                                                                         | id |  nombre   | salario |   departamento   |                                                                         +----+-----------+---------+------------------+                                                                         | 4  | Ana       | 48000.0 | Recursos Humanos |                                                                         | 7  | Javier    | 48000.0 | Recursos Humanos |                                                                         | 16 | Patricia  | 47000.0 | Recursos Humanos |                                                                         | 19 | Roberto   | 49000.0 | Recursos Humanos |                                                                         | 11 | Diego     | 72000.0 | TI               |                                                                         | 14 | Isabel    | 53000.0 | TI               |                                                                         | 17 | Alejandro | 71000.0 | TI               |                                                                         | 1  | Juan      | 50000.0 | Ventas           |                                                                         | 6  | Laura     | 52000.0 | Ventas           |                                                                         | 9  | Miguel    | 51000.0 | Ventas           |                                                                         | 12 | Sofía     | 49000.0 | Ventas           |                                                                         | 18 | Natalia   | 54000.0 | Ventas           |                                                                         +----+-----------+---------+------------------+
```

#### Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.

```SQL
select nombre, departamento from empleados where departamento = 'Recursos Humanos' and nombre not like '%e%' and nombre not like '%é%';                                                                                                 +----------+------------------+                                                                                         |  nombre  |   departamento   |                                                                                         +----------+------------------+                                                                                         | Ana      | Recursos Humanos |                                                                                         | Patricia | Recursos Humanos |                                                                                         +----------+------------------+
```
