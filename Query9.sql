SHOW TABLES
# **FUNCIONES DE CADENA**#CONCATENA LOS TRING

SELECT CONCAT('HOLA',' COMO',' ESTAS');
#CONCATENA CON EL PRIMER CARACTER
SELECT CONCAT_WS('/', 'Miguel','LOPEZ','Martinez');
# tamaño del string
SELECT length('Hola a todos');
#  corta el string dede la izquerda, con el numero proporcionado
SELECT LEFT('Hola a Todos', 8);
# corta el string dede la derecha, con el numero proporcionado
 SELECT RIGHT('Hola a Todos', 8);
 # quita los espacios del lado derecho
 SELECT LTRIM('   udemy   ');
 # quita los espacios del lado izquierdo
 SELECT RTRIM('   udemy   ');
 # quita los espacios en blanco antes y despues del texto
 SELECT RTRIM('   udemy   ');
 #reemplaza en el strgin el primer caracter escrito por el segundo
 SELECT REPLACE('xxx.udemy.com','x','w')
 ##reite el string por el numero de veces ingresado
 SELECT REPEAT('SQL', 5)
 #vultea el string
SELECT REVERSE('Hola')
#convierte en minuscula el string
SELECT LOWER('hOLA COMO Estan')
SELECT LCASE('hOLA COMO Estan')
#convierte en mayuscula el string
SELECT UCASE('hOLA COMO Estan')
SELECT UPPER('hOLA COMO Estan')

# **FUNCIONES MATEMATICAS**

#redondea hacia arriba siempre y cuando tenga decimales
SELECT CEILING(12.00001)
#redondea hacia abajo siempre y cuando tenga decimales
SELECT FLOOR(12.0001)
# devuelve el residuo de una division
SELECT MOD(10, 3)
# devuelve el numero x elevado a la y SELECT POWER(X,Y)
SELECT POWER(2,3)
# REDONDEA HACIA ARRIBA A PARTIR DE .5 Y HACIA ABAJO MENOR A .5
SELECT ROUND(20.5)
SELECT ROUND(20.12)


SELECT CONCAT_WS('/',producto, precio) FROM producto
SELECT UPPER(producto) FROM producto
