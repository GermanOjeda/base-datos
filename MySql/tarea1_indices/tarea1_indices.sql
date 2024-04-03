--Se pide:


--Elimine la tabla "alumno" si existe.
--Nota:Muestra el comando y la salida.
drop table if exists alumno;
/**
Query OK, 0 rows affected (0,01 sec)
**/

--Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).
--Nota:Muestra el comando y la salida.
CREATE TABLE alumno (
    inscripcion int not null,
    numero int not null,
    nombre varchar(50),
    documento char(8) not null,
    domicilio varchar(100),
    ciudad varchar(50),
    provincia varchar(50),
    PRIMARY KEY (inscripcion, numero)
);

/**
Query OK, 0 rows affected (0,05 sec)
**/

--Define los siguientes indices:


--Un índice único por el campo "documento" y un índice común por ciudad y provincia.
--Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.
create index idx_documento on alumno(documento);
create index idx_ciudad_provincia on alumno(ciudad, provincia);
/**
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY              |            1 | inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY              |            2 | numero      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

--Vea los índices de la tabla.
--Nota:Muestra el comando y la salida "show index".
show index from alumno;
/**
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY              |            1 | inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY              |            2 | numero      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

--Intente ingresar un alumno con clave primaria repetida.
--Nota:Muestra el comando y la salida.
insert into alumno (inscripcion, numero, nombre, documento, domicilio, ciudad, provincia) values 
('1', '1', 'Pablo', '473672F', 'Domicilio A', 'Ciudad A', 'Provincia A'), 
('1', '1', 'Pepe','478659P', 'Domicilio B', 'Ciudad B', 'Provincia B');
/**
ERROR 1062 (23000): Duplicate entry '1-1' for key 'alumno.PRIMARY'
**/

--Intente ingresar un alumno con documento repetido.
--Nota:Muestra el comando y la salida.
insert into alumno (inscripcion, numero, nombre, documento, domicilio, ciudad, provincia) values 
('1', '1', 'Pablo', '473672F', 'Domicilio A', 'Ciudad A', 'Provincia A'), 
('2', '2', 'Pepe', '473672F', 'Domicilio B', 'Ciudad B', 'Provincia B');
/**
Query OK, 2 rows affected (0,02 sec)
Records: 2  Duplicates: 0  Warnings: 0
**/

--Ingrese varios alumnos de la misma ciudad y provincia.
--Nota:Muestra el comando y la salida.
insert into alumno (inscripcion, numero, nombre, documento, domicilio, ciudad, provincia) values 
('3', '3', 'Petra', '234625Q', 'Domicilio C', 'Ciudad C', 'Provincia C'), 
('4', '4', 'Poncio', '234876X', 'Domicilio D', 'Ciudad C', 'Provincia C');
/**
Query OK, 2 rows affected (0,01 sec)
Records: 2  Duplicates: 0  Warnings: 0
**/

--Elimina los indices creados, y muestra que ya no se encuentran.
--Nota:Muestra el comando y la salida.
drop index idx_documento on alumno;
drop index idx_ciudad_provincia on alumno;
/**
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | numero      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/
