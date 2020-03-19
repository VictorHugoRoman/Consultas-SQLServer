--Si vas a ordenar que se de una columna q c mostrará, los numeros representan como c ejecuta la consulta
SELECT YEAR(orderdate), COUNT(*) AS Nro --5
FROM Sales.Orders  ---1
WHERE empid IN (2,3,4) --2 --el alias Nro no se puede usar en este qhere ya q hasta aqui no c ejecuta la consulta
GROUP BY YEAR(orderdate) --3
HAVING COUNT(*) > 10 	--4
ORDER BY Nro --COUNT(*) --6
GO

SELECT orderid, orderdate
FROM Sales.Orders
ORDER BY shipcity
