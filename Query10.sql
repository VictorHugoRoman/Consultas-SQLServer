#Patron de busqueda REGEXP - NOT REGEXP
SELECT * FROM producto WHERE producto REGEXP 'mo' #todos los registros q tengan en el string mo
SELECT * FROM producto WHERE producto REGEXP '[el]' #todos los registros q tengan en el string las e,l
SELECT * FROM producto WHERE producto REGEXP '[a-m]' #todos los registros q tengan en el string desde la a hasta la m
SELECT * FROM producto WHERE producto REGEXP '^m' #todos los registros q tengan en el string  comienzen con m
SELECT * FROM producto WHERE producto REGEXP 'a.t' #todos los registros q tengan en el string  a+algunacaracter+t
SELECT * FROM producto WHERE producto REGEXP 'a..t' #todos los registros q tengan en el string a+algunacaracter+algunacaracter+t
SELECT * FROM producto WHERE descripcion REGEXP 'l.*l' #todos los registros q tengan en el string la p 2 veces

#FUNCIONES DE AGRUPAMIENTO
#cuenta todos los registros
SELECT COUNT(*) FROM producto 
#sumo la columna precio todos los registros
SELECT SUM(precio) FROM producto 
#suma col precio cuando sea proveedor hp
SELECT SUM(precio) FROM producto  WHERE proveedor='HP'
# obtenees el precio mayor
SELECT MAX(precio) FROM producto 
## obtenemos el precio menor
SELECT MIN(precio) FROM producto 
#obtnemos el precio promedio de tpdps ñps registros
SELECT AVG(precio) FROM producto 

