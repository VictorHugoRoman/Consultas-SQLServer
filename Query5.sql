--INSERT INTO
CREATE TABLE TVentaDetalle(
orderid  int, productid int, qty decimal (10,2), unitprice money, discount decimal(10, 2)
)
GO
SELECT * FROM Sales.OrderDetails
SELECT * from dbo.TVentaDetalle
INSERT INTO TVentaDetalle (orderid, productid, qty, unitprice, discount)
VALUES(10147, 11, 4, 13.2, 0), 
VALUES(10148, 9, 42, 1.2, 0)
GO
--address entre corchetes ya q sql lo puede tomar como palabra reservada
CREATE TABLE  dbo.TReporte(
companyname VARCHAR(100), city VARCHAR(100), [address] VARCHAR(100), orderid int, orderdate DATETIME, empid int
)
GO
INSERT INTO dbo.TReporte --INSERTAMOS LOS DATOS DEL SELECT, IMPORTTANTE SEGUIR EL ORDEN DE LAS COLUMNAS YA SEA EN EL SELECT O EN EL INSERT INTO
SELECT  SC.companyname, SC.city, SC.address, SO.orderid, SO.orderdate, SO.empid
FROM Sales.Customers AS SC
INNER JOIN Sales.Orders AS SO
ON SC.custid=SO.custid
WHERE SC.country='Brazil' AND orderdate>='20060101' --AND YEAR(orderdate)>=2006 --No dbmos usar funciones aqui
GO
SELECT * FROM TReporte