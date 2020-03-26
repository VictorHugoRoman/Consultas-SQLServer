#CREATE DATABASE curso_sql  CREATE DATABASE IF NOT EXISTS curso_sql 
#SHOW DATABASES
#DROP DATABASE test #DROP DATABASE IF EXISITS nombreDB
 USE curso_sql
 create table usuarios(
 nombre VARCHAR(50),
 edad int(15)
 );
 create table productos(
 nombre VARCHAR(50),
 cantidad int(15)
 ); 
  create table alumnos(
	nombre varchar(50),
	apellido varchar(50),
	direccion varchar(100),
	telefono varchar(15),
	edad int(11)
	);
 show tables;
 describe alumnos; #muestra las caracteristicas de la tabla
 drop table nombreTabla;
 
 INSERT INTO alumnos
 values ('Juan','Martinez', 'Barrio Duarte', '34223434242', 35),
 values ('Pedro','Montero', '27 de febrero', '67678754655', 15) 
 INSERT INTO alumnos(nombre, telefono,edad)
 values ('Juan', '34223434242', 36)
 
 select * from alumnos
 update alumnos set nombre='Miguel' where telefono='34223434242'
 
 CREATE TABLE IF NOT EXISTS usuario(
 nombre VARCHAR(50),
 apellido VARCHAR(50),
 correo varchar(100),
 PRIMARY KEY (nombre)
 )
 insert into usuario VALUES('juan2', 'perez', 'sadasdas@gmail.com')
 select * from usuarios
 
 CREATE TABLE IF NOT EXISTS producto(
 id int(11) auto_increment,
 producto varchar(50),
 descripcion text,
 precio float(11, 2),
 primary key(id)
 
 );
 DESCRIBE producto
 INsert into producto values(null, 'Laptop', 'La mejor laptop del mercado', 128.64)
 INsert into producto values(null, 'Mouse', 'logitech', 5.64)
 select * from producto
 
 #TRUNCATE #Borra los registros completamente de una tabla, reestablece los valores en cero
 #UNSIGNED #tipo de dato para trabajar solo con valores positivos
 CREATE TABLE if not EXISTS persona( 
 id integer unsigned not null,
 nombre varchar(50),
 edad integer UNSIGNED,
 PRIMARY KEY(id)
 );
 describe persona
 #RANGO EN LOS TIPO DE DATOS
 TINYINT -127 128 UNSIGNED
 SMALLINT 62,000
 MEDIUM 5,000,000
 INT 60,000,000
 BIGINT
 #DECIMALES
 FLOAT
 precio float ()
 DOUBLE
 DECIMAL
 ##fecha
 DATE AAAA-MM-DD
 20200209
 2020-02-09
 DATETIME
 TIME
 TIMESTAMP #PUEDE SIMPLIFICAR LAS FECHAS
 AAAA-MM-DD
 AA-MM-DD
 ON UPDATE CURRENT_TIMESTAMP #Actuliza el campo con le fecha que se actualizo el registro
 
 CREATE TABLE IF NOT EXISTS libros(
 id int UNSIGNED auto_increment,
 titulo varchar(40) not null,
 editorial VARCHAR(15),
 autor varchar(50) DEFAULT "Desconocido", #valor DEFAULT si no ingresamos
 precio decimal(5.2) UNSIGNED DEFAULT 8.25, #valor DEFAULT si no ingresamos
 cantidad MEDIUMINT UNSIGNED not NULL,
 primary KEY(id) 
 );
 describe libros
 
 
 #ZEROFILL SOLO TRABAJA CON DATOS NUMERICOS, rellena de ceros a la izquierda
 ALTER TABLE libros(
 id int(6) zerofill UNSIGNED auto_increment,
 titulo varchar(40) not null,
 editorial VARCHAR(15),
 autor varchar(50) DEFAULT "Desconocido", #valor DEFAULT si no ingresamos
 precio decimal(5.2) UNSIGNED DEFAULT 8.25, #valor DEFAULT si no ingresamos
 cantidad MEDIUMINT UNSIGNED zerofill not NULL,
 primary KEY(id) 
 );
 describe libros