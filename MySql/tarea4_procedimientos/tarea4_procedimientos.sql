CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);


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

-- Realiza:

--   Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla empleados_destiono.

--   Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.

DELIMITER //
CREATE PROCEDURE aumentar_salarios()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_salario DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT id, salario FROM empleados WHERE nombre regexp 'a';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE empleados SET salario = salario + salario * 0.1 WHERE id = emp_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

call aumentar_salario();

/**
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
**/

--   Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.

DELIMITER //
CREATE PROCEDURE contar_empleados_por_rango_id(IN id_minimo DECIMAL(10,2), IN id_maximo DECIMAL(10,2))
BEGIN
    DECLARE emp_count INT DEFAULT 0;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_salario;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF emp_salario >= salario_minimo AND emp_salario <= salario_maximo THEN
            SET emp_count = emp_count + 1;
        END IF;
    END LOOP;
    CLOSE cur;

    SELECT CONCAT('Número de empleados con salario entre ', salario_minimo, ' y ', salario_maximo, ': ', emp_count) AS resultado;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE empleados_en_rango_id(IN id_minimo DECIMAL(10,2), IN id_maximo DECIMAL(10,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE cur CURSOR FOR SELECT id FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        select * from empleados where id between id_minimo and id_maximo;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

--   Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.

--   Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.