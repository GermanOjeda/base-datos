-- Crea la bbdd. _ Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos._

/** 
 CREATE DATABASE IF NOT EXISTS SimpleDB;
 
 USE SimpleDB;
 
 CREATE TABLE IF NOT EXISTS Users (
     UserID INT AUTO_INCREMENT PRIMARY KEY,
     UserName VARCHAR(50) NOT NULL,
     Email VARCHAR(100) NOT NULL
 );
 
 CREATE TABLE IF NOT EXISTS Products (
     ProductID INT AUTO_INCREMENT PRIMARY KEY,
     ProductName VARCHAR(100) NOT NULL,
     Price DECIMAL(10, 2) NOT NULL
 );
**/

--  Realiza la inserción de algunos datos de prueba.

/**
        INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
        INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
        INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');
        INSERT INTO Users (UserName, Email) VALUES ('Manuel', 'manuel@example.com');
        INSERT INTO Users (UserName, Email) VALUES ('Carla', 'carla@example.com');
        INSERT INTO Users (UserName, Email) VALUES ('Cristina', 'cristina@example.com');
        
        INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
        INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
        INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);
        INSERT INTO Products (ProductName, Price) VALUES ('Producto 4', 72.35);
        INSERT INTO Products (ProductName, Price) VALUES ('Producto 5', 1.27);
        INSERT INTO Products (ProductName, Price) VALUES ('Producto 6', 23.93);
**/

--  Nota: Realizar la inserción de al menos 3 elementos más en cada tabla.

--  Crea procedimientos almacenados para realizar operaciones como insertar un nuevo usuario, actualizar el nombre de un usuario, etc.

--  Procedimiento para insertar un nuevo usuario.

/**

delimiter //
create procedure user_insert(in nombre varchar(50), in mail varchar(50))
begin
insert into Users (UserName, Email) values (nombre, mail); 
end //
delimiter ;

**/

/**
call user_insert('Manolo', 'manolo@example.com');//
**/

/**
+--------+----------+----------------------+
| UserID | UserName | Email                |
+--------+----------+----------------------+
|      1 | Juan     | juan@example.com     |
|      2 | María    | maria@example.com    |
|      3 | Pedro    | pedro@example.com    |
|      4 | Manuel   | manuel@example.com   |
|      5 | Carla    | carla@example.com    |
|      6 | Cristina | cristina@example.com |
|      7 | Manolo   | manolo@example.com   |
+--------+----------+----------------------+
**/
--  Procedimiento para actualizar el nombre de un usuario.

/**

delimiter //
create procedure name_update(in target_name varchar(50), in name varchar(50))
begin
update Users set UserName = name where UserName = target_name;
end //
delimiter ;

**/

/**
call name_update('Manolo', 'Pablo');
**/

/**
+--------+----------+----------------------+
| UserID | UserName | Email                |
+--------+----------+----------------------+
|      1 | Juan     | juan@example.com     |
|      2 | María    | maria@example.com    |
|      3 | Pedro    | pedro@example.com    |
|      4 | Manuel   | manuel@example.com   |
|      5 | Carla    | carla@example.com    |
|      6 | Cristina | cristina@example.com |
|      7 | Pablo    | manolo@example.com   |
+--------+----------+----------------------+
**/

--  Nota: Realiza la invocación y la verificación de que ha funcionado correctamente.

--  Implementa funciones para realizar cálculos o consultas:

--  Función para calcular el precio total de un conjunto de productos.

/**

delimiter //
create function total_price() returns real deterministic
begin
declare result real;
select sum(Price) as Precio_Total from Products into result;
return result;
end //
delimiter ;

**/

/**
select total_price();
**/

/**
+---------------+
| total_price() |
+---------------+
|        144.79 |
+---------------+

**/

--  Función para contar el número de usuarios.

/**

delimiter //
create function total_users() returns integer deterministic
begin
declare result integer;
select count(UserID) from Users into result;
return result;
end //
delimiter ;

**/

--  Nota: Realiza la invocación y la verificación de que ha funcionado correctamente.
