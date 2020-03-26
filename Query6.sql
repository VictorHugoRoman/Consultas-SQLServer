--SELECT INTO
--NO CREAN INDICES, CONSTRAINT, PRIMARY KEYS
IF EXISTS(SELECT 1 FROM sys.tables WHERE name='ReporteLogisitica')
DROP TABLE ReporteLogisitica
SELECT 
SO.orderid, SO.orderdate, SO.shipcountry, SOD.productid, SOD.unitprice, PP.productname, HRE.firstname, HRE.lastname
INTO ReporteLogisitica
FROM Sales.Orders SO
INNER JOIN Sales.OrderDetails SOD
ON SO.orderid=SOD.orderid
INNER JOIN Production.Products PP
ON SOD.productid=PP.productid
INNER JOIN HR.Employees HRE
ON SO.empid=HRE.empid
WHERE orderdate>='20060101'
GO
SELECT * FROM ReporteLogisitica
GO

--crea un respaldo de productos cuando el id sea mayor o igual a 70 en la tabla NewProductos
DROP TABLE IF EXISTS NewProducts
GO
SELECT * INTO NewProducts FROM Production.Products WHERE ProductID>=70
GO

DELETE FROM Sales.OrderDetails
OUTPUT DELETED.* --Muestra los registros eliminados
WHERE ProductID >= 70

DELETE FROM Production.Products
OUTPUT DELETED.* --Muestra los registros eliminados
WHERE productid >= 70

INSERT Sales.OrderDetails(orderid, productid, unitprice, qty, discount)
OUTPUT INSERTED.*
SELECT * FROM NewOrderDetails



