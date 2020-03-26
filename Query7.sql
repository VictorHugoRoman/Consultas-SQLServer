UPDATE SOD
SET SOD.unitprice=SOD.unitprice*1.05
SELECT SO.orderid, SO.orderdate, SO.shipcountry, SOD.productid, SOD.unitprice, PP.productname, HRE.firstname, HRE.lastname
FROM Sales.Orders SO
INNER JOIN Sales.OrderDetails SOD
ON SO.orderid=SOD.orderid
INNER JOIN Production.Products PP
ON SOD.productid=PP.productid
INNER JOIN HR.Employees HRE
ON SO.empid=HRE.empid
WHERE orderdate>='20060101'