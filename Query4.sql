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

--PARA PROBAR LOS HINTS PODEMOS EJECUTAR EL PLAN DE EJECUCION DE ESTA SENTENCIA
--dentro de los ON van los campos donde se hace match para hacer los filtros
SELECT *
FROM Sales.Customers AS sc 
INNER HASH JOIN Sales.Orders AS so
ON sc.custid=so.custid
JOIN Sales.OrderDetails AS sod
ON so.orderid=sod.orderid
JOIN Production.Products AS pp
ON sod.productid=pp.productid
GO

--Mala practica hacer filtro dentro de ON de los JOINS
SELECT *
FROM Sales.Customers AS sc 
INNER JOIN Sales.Orders AS so
ON sc.custid=so.custid
JOIN Sales.OrderDetails AS sod
ON so.orderid=sod.orderid
JOIN Production.Products AS pp
ON sod.productid=pp.productid 
--AND pp.categoryid<>2 -- esto ya no pertenece a un JOIN, es un filtro por tanto va en el WHERE
WHERE pp.categoryid<>2
GO

--OUTER JOIN (LEFT, RIGHT, FULL)
--LEFT JOIN
SELECT sc.custid, sc.companyname, so.orderid, so.orderdate 
FROM Sales.Customers AS sc --MUESTRO TODOS LOS REGISTROS DE ESTA TABLA AUNQUE NO HAGAN MATCH
LEFT JOIN Sales.Orders AS so --MAS LOS QUE HACEN MATCH CON ESTA TABLA
ON sc.custid=so.custid

--RIGHT JOIN
SELECT sc.custid, sc.companyname, so.orderid, so.orderdate 
FROM Sales.Customers AS sc --OBTENEMOS LOS CLIENTES QUE HACEN MATCH CON LAS ORDENES
RIGHT JOIN Sales.Orders AS so --MUESTRO TODAS LAS ORDENES AUNQUE NO TENGAN CLIENTES
ON sc.custid=so.custid
GO

--RIGHT JOIN, simulando el LEFT JOIN d la sentencia L47
SELECT sc.custid, sc.companyname, so.orderid, so.orderdate 
FROM Sales.Orders AS so 
RIGHT JOIN Sales.Customers AS sc
ON sc.custid=so.custid
GO

--RIGHT JOIN, clientes q no han hecho ventas
SELECT sc.custid, sc.companyname, so.orderid, so.orderdate 
FROM Sales.Orders AS so 
RIGHT JOIN Sales.Customers AS sc
ON sc.custid=so.custid
WHERE so.custid IS NULL
GO

--OUTER JOIN
SELECT *
FROM Sales.Orders AS so
FULL OUTER JOIN Sales.OrderDetails AS sod
ON so.orderid=sod.orderid


--SELF JOINS
--normalmente se usan en tablas recursivas
SELECT * 
FROM HR.Employees --tiene la relacion recursiva en el campo empid con mgrid

SELECT e.empid, e.lastname as empname,  e.title, e.mgrid, m.lastname as mgrname
FROM HR.Employees as e 
JOIN HR.Employees as m --AQUI HACEMOS EL SELFT JOIN YA Q HACEMOS UN JOIN A LA MISMA TABLA
on e.mgrid=m.empid

--HACEMOS UN LEFT JOIN PARA TRAERNOS LOS REGISTROS DE LA TABLA con alias e
SELECT e.empid, e.lastname as empname,  e.title, e.mgrid, m.lastname as mgrname
FROM HR.Employees as e 
LEFT OUTER  JOIN HR.Employees as m --AQUI HACEMOS EL SELFT JOIN YA Q HACEMOS UN JOIN A LA MISMA TABLA
on e.mgrid=m.empid