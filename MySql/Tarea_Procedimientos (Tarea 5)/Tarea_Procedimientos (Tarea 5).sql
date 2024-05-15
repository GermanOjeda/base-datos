
-- Procedimiento_base

DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);

-- Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().

DELIMITER //

CREATE PROCEDURE my_loop1(IN iterations INT, IN nombre VARCHAR(100), IN sueldo_base INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    
    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT(nombre, RAND()), FLOOR(RAND() * (sueldo_base - 2000 + 1)) + 2000);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

select * from empleados;
/**
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
**/

call my_loop1(5, 'Pablo', 10000);

select * from empleados;
/**
+----+-------------------------+---------+
| id | nombre                  | salario |
+----+-------------------------+---------+
|  1 | Juan                    | 3000.00 |
|  2 | María                   | 3500.00 |
|  3 | Pedro                   | 3200.00 |
|  4 | Pablo0.8410593204582663 | 5216.00 |
|  5 | Pablo0.4870825051209726 | 3834.00 |
|  6 | Pablo0.6850339897768889 | 7899.00 |
|  7 | Pablo0.6319035362749393 | 9579.00 |
|  8 | Pablo0.8408615578346528 | 4899.00 |
+----+-------------------------+---------+
**/

-- Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID().

DELIMITER //

CREATE PROCEDURE my_loop2(IN iterations INT, IN sueldo_base INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (UUID(), FLOOR(RAND() * (sueldo_base - 2000 + 1)) + 2000);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

select * from empleados;
/**
+----+-------------------------+---------+
| id | nombre                  | salario |
+----+-------------------------+---------+
|  1 | Juan                    | 3000.00 |
|  2 | María                   | 3500.00 |
|  3 | Pedro                   | 3200.00 |
|  4 | Pablo0.8410593204582663 | 5216.00 |
|  5 | Pablo0.4870825051209726 | 3834.00 |
|  6 | Pablo0.6850339897768889 | 7899.00 |
|  7 | Pablo0.6319035362749393 | 9579.00 |
|  8 | Pablo0.8408615578346528 | 4899.00 |
+----+-------------------------+---------+
**/

call my_loop2(3, 10000);

select * from empleados;
/**
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Pablo0.8410593204582663              | 5216.00 |
|  5 | Pablo0.4870825051209726              | 3834.00 |
|  6 | Pablo0.6850339897768889              | 7899.00 |
|  7 | Pablo0.6319035362749393              | 9579.00 |
|  8 | Pablo0.8408615578346528              | 4899.00 |
|  9 | 006e6622-12eb-11ef-8115-080027077231 | 4314.00 |
| 10 | 00705f11-12eb-11ef-8115-080027077231 | 4873.00 |
| 11 | 00719dd0-12eb-11ef-8115-080027077231 | 9423.00 |
+----+--------------------------------------+---------+
**/

-- Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

DELIMITER //

CREATE PROCEDURE my_loop3(IN iterations INT, IN nombre VARCHAR(100), IN sueldo_base INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT(nombre, RAND()), FLOOR(RAND() * (sueldo_base - 2000 + 1)) + 2000
        FROM (SELECT 1 UNION SELECT 2) AS sub
        ORDER BY RAND()
        LIMIT 1;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

select * from empleados;
/**
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Pablo0.8410593204582663              | 5216.00 |
|  5 | Pablo0.4870825051209726              | 3834.00 |
|  6 | Pablo0.6850339897768889              | 7899.00 |
|  7 | Pablo0.6319035362749393              | 9579.00 |
|  8 | Pablo0.8408615578346528              | 4899.00 |
|  9 | 006e6622-12eb-11ef-8115-080027077231 | 4314.00 |
| 10 | 00705f11-12eb-11ef-8115-080027077231 | 4873.00 |
| 11 | 00719dd0-12eb-11ef-8115-080027077231 | 9423.00 |
+----+--------------------------------------+---------+
**/

call my_loop3(2, 'Martin', 50000);

select * from empleados;
/**
+----+--------------------------------------+----------+
| id | nombre                               | salario  |
+----+--------------------------------------+----------+
|  1 | Juan                                 |  3000.00 |
|  2 | María                                |  3500.00 |
|  3 | Pedro                                |  3200.00 |
|  4 | Pablo0.8410593204582663              |  5216.00 |
|  5 | Pablo0.4870825051209726              |  3834.00 |
|  6 | Pablo0.6850339897768889              |  7899.00 |
|  7 | Pablo0.6319035362749393              |  9579.00 |
|  8 | Pablo0.8408615578346528              |  4899.00 |
|  9 | 006e6622-12eb-11ef-8115-080027077231 |  4314.00 |
| 10 | 00705f11-12eb-11ef-8115-080027077231 |  4873.00 |
| 11 | 00719dd0-12eb-11ef-8115-080027077231 |  9423.00 |
| 12 | Martin0.2621826150102379             | 48357.00 |
| 13 | Martin0.024472385667704405           | 23009.00 |
+----+--------------------------------------+----------+
**/

-- Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).
DELIMITER //

CREATE PROCEDURE my_loop4(IN iterations INT, IN sueldo_base INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (sueldo_base - 2000 + 1)) + 2000);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

select * from empleados;
/**
+----+--------------------------------------+----------+
| id | nombre                               | salario  |
+----+--------------------------------------+----------+
|  1 | Juan                                 |  3000.00 |
|  2 | María                                |  3500.00 |
|  3 | Pedro                                |  3200.00 |
|  4 | Pablo0.8410593204582663              |  5216.00 |
|  5 | Pablo0.4870825051209726              |  3834.00 |
|  6 | Pablo0.6850339897768889              |  7899.00 |
|  7 | Pablo0.6319035362749393              |  9579.00 |
|  8 | Pablo0.8408615578346528              |  4899.00 |
|  9 | 006e6622-12eb-11ef-8115-080027077231 |  4314.00 |
| 10 | 00705f11-12eb-11ef-8115-080027077231 |  4873.00 |
| 11 | 00719dd0-12eb-11ef-8115-080027077231 |  9423.00 |
| 12 | Martin0.2621826150102379             | 48357.00 |
| 13 | Martin0.024472385667704405           | 23009.00 |
+----+--------------------------------------+----------+
**/

call my_loop4(4, 7000);

select * from empleados;
/**
+----+--------------------------------------+----------+
| id | nombre                               | salario  |
+----+--------------------------------------+----------+
|  1 | Juan                                 |  3000.00 |
|  2 | María                                |  3500.00 |
|  3 | Pedro                                |  3200.00 |
|  4 | Pablo0.8410593204582663              |  5216.00 |
|  5 | Pablo0.4870825051209726              |  3834.00 |
|  6 | Pablo0.6850339897768889              |  7899.00 |
|  7 | Pablo0.6319035362749393              |  9579.00 |
|  8 | Pablo0.8408615578346528              |  4899.00 |
|  9 | 006e6622-12eb-11ef-8115-080027077231 |  4314.00 |
| 10 | 00705f11-12eb-11ef-8115-080027077231 |  4873.00 |
| 11 | 00719dd0-12eb-11ef-8115-080027077231 |  9423.00 |
| 12 | Martin0.2621826150102379             | 48357.00 |
| 13 | Martin0.024472385667704405           | 23009.00 |
| 14 | 080027077231                         |  4893.00 |
| 15 | 080027077231                         |  6463.00 |
| 16 | 080027077231                         |  5633.00 |
| 17 | 080027077231                         |  6775.00 |
+----+--------------------------------------+----------+
**/

-- Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

DELIMITER //

CREATE PROCEDURE my_loop5(IN iterations INT, IN semilla INT, IN nombre VARCHAR(100), IN sueldo_base INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT(nombre, RAND(semilla)), FLOOR(RAND(1) * (sueldo_base - 2000 + 1)) + 2000);

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

select * from empleados;
/**
+----+--------------------------------------+----------+
| id | nombre                               | salario  |
+----+--------------------------------------+----------+
|  1 | Juan                                 |  3000.00 |
|  2 | María                                |  3500.00 |
|  3 | Pedro                                |  3200.00 |
|  4 | Pablo0.8410593204582663              |  5216.00 |
|  5 | Pablo0.4870825051209726              |  3834.00 |
|  6 | Pablo0.6850339897768889              |  7899.00 |
|  7 | Pablo0.6319035362749393              |  9579.00 |
|  8 | Pablo0.8408615578346528              |  4899.00 |
|  9 | 006e6622-12eb-11ef-8115-080027077231 |  4314.00 |
| 10 | 00705f11-12eb-11ef-8115-080027077231 |  4873.00 |
| 11 | 00719dd0-12eb-11ef-8115-080027077231 |  9423.00 |
| 12 | Martin0.2621826150102379             | 48357.00 |
| 13 | Martin0.024472385667704405           | 23009.00 |
| 14 | 080027077231                         |  4893.00 |
| 15 | 080027077231                         |  6463.00 |
| 16 | 080027077231                         |  5633.00 |
| 17 | 080027077231                         |  6775.00 |
+----+--------------------------------------+----------+
**/

call my_loop5(6, 4, 'Carla', 100000);

select * from empleados;
/**
+----+--------------------------------------+----------+
| id | nombre                               | salario  |
+----+--------------------------------------+----------+
|  1 | Juan                                 |  3000.00 |
|  2 | María                                |  3500.00 |
|  3 | Pedro                                |  3200.00 |
|  4 | Pablo0.8410593204582663              |  5216.00 |
|  5 | Pablo0.4870825051209726              |  3834.00 |
|  6 | Pablo0.6850339897768889              |  7899.00 |
|  7 | Pablo0.6319035362749393              |  9579.00 |
|  8 | Pablo0.8408615578346528              |  4899.00 |
|  9 | 006e6622-12eb-11ef-8115-080027077231 |  4314.00 |
| 10 | 00705f11-12eb-11ef-8115-080027077231 |  4873.00 |
| 11 | 00719dd0-12eb-11ef-8115-080027077231 |  9423.00 |
| 12 | Martin0.2621826150102379             | 48357.00 |
| 13 | Martin0.024472385667704405           | 23009.00 |
| 14 | 080027077231                         |  4893.00 |
| 15 | 080027077231                         |  6463.00 |
| 16 | 080027077231                         |  5633.00 |
| 17 | 080027077231                         |  6775.00 |
| 18 | Carla0.15595286540310166             | 41729.00 |
| 19 | Carla0.15595286540310166             | 41729.00 |
| 20 | Carla0.15595286540310166             | 41729.00 |
| 21 | Carla0.15595286540310166             | 41729.00 |
| 22 | Carla0.15595286540310166             | 41729.00 |
| 23 | Carla0.15595286540310166             | 41729.00 |
+----+--------------------------------------+----------+
**/