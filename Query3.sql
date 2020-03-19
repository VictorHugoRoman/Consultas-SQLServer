--Algunos predicadores con WHERE, (IN, BETWEEN, LIKE, >,<,=, IS NULL, ETC) --LO q hace el where es quedarrse con los valores de tipo verdadero
--una sentencia en sql server tiene 3 tipos de resultados verdadero, falso y desconocido (null), no podemos ejecutar los alias
--recomendable verficiar(prueba/error) que las columnas q estan dentro del where dbn d utilizar indices --ejemplo en los primaryKey y en las fechas pudieran ir indices

SELECT * 
FROM Sales.Orders 
WHERE empid IN (3,4,5) 
ORDER BY orderdate DESC 
GO

SELECT * 
FROM Sales.Customers
--WHERE empid IN (3,4,5) 
ORDER BY region DESC 
GO


SELECT *
FROM Sales.Customers
WHERE region IN ('WY', 'SP', 'OR') --cuando hacermos un filtro los valores null desaparecen
ORDER BY region DESC 
GO

--Consulta no recomendada
SELECT *
FROM Sales.Orders
WHERE YEAR(orderdate) IN ('2006', '2007') --aplicamos la funcion YEAR a la columna orderdate, no es recomendable ya q resolvera fila por fila la funcion
GO

--Consulta recomendada
SELECT *
FROM Sales.Orders
WHERE orderdate BETWEEN '20060101' AND '20071231'
GO
