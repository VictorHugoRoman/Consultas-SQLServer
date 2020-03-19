--Consulta a multiples tablas
SELECT @@VERSION

SELECT * FROM Sales.OrderDetails -- las consultas nos arrojan tablas virtuales

--VIDEO 4 MINUTO 14
SELECT orderid, productid, (unitprice*qty-unitprice*qty*discount) AS SubTotal
FROM Sales.OrderDetails 