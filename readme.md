
# DDL y DML
Las sentencias SQL se dividen en dos categorías:

- **DDL** *data definition language*: Lenguaje de definición de datos
- **DML** *data manipulation language*: Lenguaje de manipulación de datos

## Lenguaje de definición de datos (DDL)
Las sentencias DDL se utilizan para crear y modificar la estructura de las tablas así como otros objetos de la base de datos.

### CREATE
**Ejemplos:** 
- Para crear una nueva base de datos:
`CREATE DATABASE db4apps;`
- Para crear una nueva tabla
``CREATE TABLE `personas` ( `id` INT NOT NULL AUTO_INCREMENT , `apaterno` VARCHAR(64) NOT NULL , `amaterno` VARCHAR(64) NOT NULL , `nombre` VARCHAR(64) NOT NULL , PRIMARY KEY (`id`));``

### SHOW
**Ejemplos:** 
- Puede ser utilizado para listar las bases de datos dentro del servidor con:
`SHOW DATABASES;`
- También puede mostrar las tablas dentro de una base de datos:
`SHOW TABLES`

### DESCRIBE
Su función es mostrar la estructura de una tabla.
**Ejemplo:** 
`DESCRIBE personas;`

### ALTER
Modifica la estructura de la base de datos.
**Ejemplo:** 
``ALTER TABLE `personas` ADD `edad` DATE NOT NULL AFTER `nombre`;``
 
### TRUNCATE
Borra objetos de la base de datos, pero, **conserva la estructura**
**Ejemplo**
`TRUNCATE personas;`

###  DROP
Elimina todos los registros de la tabla, incluyendo todos los espacios asignados a los registros.
**Ejemplo**
`DROP TABLE personas2;`

## Lenguaje de manipulación de datos (DML)
Las sentencias de lenguaje de manipulación de datos (DML) son utilizadas para gestionar datos dentro de las tablas, son estas sentencias básicas las englobadas en el acrónimo **CRUD**.

|Acrónimo|C|R|U|D|
|--|--|--|--|--|
|**Significado**|Create|Read|Update|Delete|
|**Sentencia SQL**|Insert|Select|Update|Delete|

### INSERT
Inserta datos a una tabla.
**Ejemplo:**
``INSERT INTO `personas` (`id`, `apaterno`, `amaterno`, `nombre`, `edad`) VALUES (NULL, 'Arana', 'Sanchez', 'Jonathan', '1992-02-29');``

### SELECT
Recupera datos desde la base de datos.
**Ejemplo:**
``SELECT * FROM `personas` WHERE id=1;``

### UPDATE
Modifica datos existentes dentro de una tabla.
**Ejemplo:**
``UPDATE `personas` SET `amaterno` = 'Sánchez' WHERE `id` = 1;``

### DELETE 
Elimina registros de la tabla, generalmente se limita su acción con el modificador *WHERE*, de lo contrario, **Tendrá el mismo efecto que [TRUNCATE](#truncate)**.
**Ejemplo:**
``DELETE FROM `personas` WHERE `id` = 2;``
