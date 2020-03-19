--TOP y OFFSET FETCH
SELECT TOP(5) orderid, custid, orderdate
FROM Sales.Orders 
ORDER BY orderdate DESC
--WITH TIES , Muestra los registros empatados o iguales en la ultima fila q ponermos en el select y db d estar asociada en un order by
SELECT TOP(5) WITH TIES  orderid, custid, orderdate
FROM Sales.Orders 
ORDER BY orderdate DESC

--consultamos el 10% de los registros, si la tabla tiene 1830 registros traemos el 10%
SELECT TOP(10) PERCENT  orderid, custid, orderdate
FROM Sales.Orders 
ORDER BY orderdate DESC

--los 5 primero registros que encuentra priorizando ordenando por primaryKey de manera asc y si no hay key toma los 5 primeros q encuentra
SELECT TOP(5) orderid, custid, orderdate
FROM Sales.Orders 

--OFFSETS/FETCH, tenemos q usar order by
--le tenemos q indicar el rango de filas a mostrar, es decir, de q fila  y cuantas filas queremos
SELECT TOP(5) WITH TIES  orderid, custid, empid, orderdate
FROM Sales.Orders 
ORDER BY orderdate, orderid
OFFSETS 0 ROWS FETCH FIRST 50 ROWS ONLY; --desde la fila 0 muestra 50 filas, vemos de la fila 1 a la 50
--OFFSETS 50 ROWS FETCH FIRST 50 ROWS ONLY; --desde la fila 50 muestra 50 registros, vemos las filas de la 51 a la 100

