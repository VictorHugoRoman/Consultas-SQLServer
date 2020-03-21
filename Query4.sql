--Consulta a multiples tablas
SELECT @@VERSION
--Existen 3 tipos de JOIN (CROSS, INNER, OUTER)
SELECT * FROM Sales.OrderDetails -- las consultas nos arrojan tablas virtuales

--VIDEO 4 MINUTO 14
SELECT orderid, productid, (unitprice*qty-unitprice*qty*discount) AS SubTotal
FROM Sales.OrderDetails 

--HINTS PARA INNER JOIN:
--HASH: ES MAS REPIDO PERO CONSUMA MAS RECURSOS DEL SERVIDOR, NORMALMENTE SE USAN EN DATAWAREHOUSE
--MERGE: MAS RAPIDO QUE LOOP, SE USAN NORMALMENTE EN GRANDES CANTIDADDES DE DATOS, TENER CUIDAD EN EL CONSUMO DE CPU Y RAM
--LOOP: SE USA NORMALMENTE EN TABLAS CON MILES DE REGISTROS

SELECT orderid, Sales.Orders.custid,  orderdate, companyname
FROM Sales.Orders 
INNER LOOP JOIN Sales.Customers --INNER JOIN MANEJA 3 ALGORITMOS(HINTS) (HASH, MERGE, LOOP), (INNER HASH JOIN, INNER MERGE JOIN) 
ON Sales.Orders.custid = Sales.Customers.custid
