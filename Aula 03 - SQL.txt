---- COMANDO AS 

SELECT TOP 560 LISTPRICE AS PRECO
FROM Production.Product;

SELECT TOP 560 LISTPRICE AS 'PRECO'
FROM Production.Product;

SELECT TOP 560 LISTPRICE AS 'PRECO DO PRODUTO'
FROM Production.Product;



-- FORMULAS ESTATISTICAS BASICAS

SELECT TOP 10 * 
FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LINETOTAL)
FROM Sales.SalesOrderDetail;

SELECT TOP 10 SUM(LINETOTAL) AS SOMA
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(LINETOTAL) AS MEDIA
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(LINETOTAL) AS MINIMO
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MAX(LINETOTAL) AS MAXIMO
FROM Sales.SalesOrderDetail;



-- GROUP BY

SELECT TOP 20 *
FROM Production.Product;

SELECT Color, AVG(ListPrice) AS Media
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color;

SELECT ProductID, SUM(OrderQty) AS Total -- QUANTITATIVO / SOMA
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID ASC;

SELECT ProductID, COUNT(ProductID) AS Total -- QUALITATIVO / CONTAGEM
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT FirstName, COUNT(FirstName) AS Total
FROM Person.Person
GROUP BY FirstName;


SELECT ProductID, AVG(ListPrice)
FROM Production.Product
WHERE Color = 'SILVER'
GROUP BY ProductID;

SELECT Color, AVG(ListPrice)
FROM Production.Product
GROUP BY Color;



---- COMANDO HAVING - COMANDO WHERE PARA A TABELA JA FILTRADA

SELECT TOP 10 ProductID, SUM(LineTotal) AS TOTAL
FROM Sales.SalesOrderDetail
GROUP BY ProductID;


SELECT TOP 10 ProductID, SUM(LineTotal) AS TOTAL
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > 10000; -- SEGUNDO FILTRO


SELECT FirstName, COUNT(FirstName) AS Quantidade
FROM Person.Person
WHERE Title = 'MR.' AND FirstName IS NOT NULL
GROUP BY FirstName


SELECT FirstName, COUNT(FirstName) AS Quantidade
FROM Person.Person
WHERE Title = 'MR.' AND FirstName IS NOT NULL
GROUP BY FirstName
HAVING COUNT(FirstName) > 10;



---- DESAFIOS 1

SELECT MiddleName, COUNT(MiddleName) AS Quantidade
FROM Person.Person
WHERE MiddleName IS NOT NULL
GROUP BY MiddleName;

SELECT TOP 10 * 
FROM Sales.SalesOrderDetail;

SELECT ProductID, AVG(OrderQty) AS Media 
FROM  Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT TOP 10 ProductID, MAX(LineTotal) AS MAXIMO
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY MAXIMO DESC;

SELECT TOP 10 ProductID, SUM(LineTotal) AS TOTAL
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TOTAL DESC;

SELECT *
FROM Production.WorkOrder;

SELECT ProductID, SUM(OrderQty) AS Quantidade, AVG(OrderQty) AS Media
FROM Production.WorkOrder
GROUP BY ProductID;

SELECT ProductID, COUNT(ProductID) AS Total, AVG(OrderQty) AS Media
FROM Production.WorkOrder
GROUP BY ProductID;


---- DESAFIOS 2

SELECT StateProvinceID, COUNT(StateProvinceID) AS Contagem
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000;


SELECT ProductID, AVG(LineTotal) AS SOMA
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000;