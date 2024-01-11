

## Consultas
### Seleccionar todos los propietarios
Tabla Propietarios
```SQL
+----+----------+-----------+-----------+
| ID |  nombre  | apellido  |    DNI    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```
### Listar todos los vehículos
Tabla Vehiculos
```SQL
+----+------------+------------+------+----------------+
| ID |   marca    |   modelo   | anio | ID_Propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2020 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+
```

### Listar Nombre y apellidos de los Propietarios

```SQL
+----------+-----------+
|  nombre  | apellido  |
+----------+-----------+
| Juan     | Perez     |
| Maria    | Lopez     |
| Carlos   | Ruiz      |
| Laura    | Gomez     |
| Pedro    | Martinez  |
| Ana      | Fernandez |
| Diego    | Sanchez   |
| Sofia    | Torres    |
| Javier   | Leon      |
| Lucia    | Castillo  |
| Luis     | Gonzalez  |
| Marta    | Diaz      |
| Victor   | Vargas    |
| Elena    | Castro    |
| Roberto  | Blanco    |
| Natalia  | Paredes   |
| Fernando | Herrera   |
| Clara    | Soto      |
| Sergio   | Mendoza   |
| Patricia | Navarro   |
+----------+-----------+
```

### Listar marcas y modelos de los vehículos

```SQL
+------------+------------+
|   marca    |   modelo   |
+------------+------------+
| Ford       | Fiesta     |
| Toyota     | Corolla    |
| Nissan     | Sentra     |
| Chevrolet  | Spark      |
| Honda      | Civic      |
| Ford       | Mustang    |
| Toyota     | RAV4       |
| Volkswagen | Golf       |
| Honda      | CR-V       |
| Nissan     | Altima     |
| Chevrolet  | Malibu     |
| Toyota     | Camry      |
| Honda      | Accord     |
| Ford       | Explorer   |
| Nissan     | Rogue      |
| Volkswagen | Jetta      |
| Chevrolet  | Equinox    |
| Toyota     | Highlander |
| Honda      | Odyssey    |
| Nissan     | Murano     |
+------------+------------+
```

### Seleccionar solo a los propietarios con apellido Perez

```SQL
+----+----------+-----------+-----------+
| ID |  nombre  | apellido  |    DNI    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
+----+----------+-----------+-----------+
```

### Listar todos los vehículos con año 2019

```SQL
+----+------------+------------+------+----------------+
| ID |   marca    |   modelo   | anio | ID_Propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 20 | Nissan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+
```

### Seleccionar propietarios que tienen vehículos de la marca Toyota

```SQL
+----+----------+-----------+-----------+
| ID |  nombre  | apellido  |    DNI    |
+----+----------+-----------+-----------+
| 2  | Maria    | Lopez     | 87654321B |
| 7  | Diego    | Sanchez   | 55555555G |
| 12 | Marta    | Diaz      | 10101010L |
| 18 | Clara    | Soto      | 16161616R |
+----+----------+-----------+-----------+
```

### Listar los vehículos de marca Ford y modelo Fiesta

```SQL
+----+------------+------------+------+----------------+
| ID |   marca    |   modelo   | anio | ID_Propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
+----+------------+------------+------+----------------+
```

### Seleccionar los propietarios con DNI 12345678A

```SQL
+----+----------+-----------+-----------+
| ID |  nombre  | apellido  |    DNI    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
+----+----------+-----------+-----------+
```

### Listar vehículos que pertenezcan al propietario con ID 5

```SQL
+----+------------+------------+------+----------------+
| ID |   marca    |   modelo   | anio | ID_Propietario |
+----+------------+------------+------+----------------+
| 5  | Honda      | Civic      | 2016 | 5              |
+----+------------+------------+------+----------------+
```

## Updates

### Actualizar el nombre de un propietario con DNI 12345678A

```SQL
+----+----------+-----------+-----------+
| ID |  nombre  | apellido  |    DNI    |
+----+----------+-----------+-----------+
| 1  | Benito   | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```

### Modificar el año de un vehículo con ID 3 a 2022

```SQL
+----+------------+------------+------+----------------+
| ID |   marca    |   modelo   | anio | ID_Propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+
```

### Cambiar el modelo de todos los vehículos Nissan a Micra

```SQL
+----+------------+------------+------+----------------+
| ID |   marca    |   modelo   | anio | ID_Propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Micra      | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Micra      | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Micra      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Micra      | 2019 | 20             |
+----+------------+------------+------+----------------+
```

### Actualizar el apellido de un propietario con ID 7 a Gomez

```SQL
+----+----------+-----------+-----------+
| ID |  nombre  | apellido  |    DNI    |
+----+----------+-----------+-----------+
| 1  | Benito   | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Gomez     | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```

### Modificar un vehículo con modelo Fiesta a Renault

```SQL
+----+------------+------------+------+----------------+
| ID |   marca    |   modelo   | anio | ID_Propietario |
+----+------------+------------+------+----------------+
| 1  | Renault    | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Micra      | 2022 | 3              |
| 4  | Chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2020 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Micra      | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Micra      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Micra      | 2019 | 20             |
+----+------------+------------+------+----------------+
```