


USE 
SalesDB

-- :: System Catalog :- 

SELECT * FROM INFORMATION_SCHEMA.COLUMNS

SELECT 
     DISTINCT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS




------------------------------------------------------------------------------------------------------------------------------------------



-- :: SubQuery Based on the :-


-- 1. Result Types : [ Scalar , Row , Table ]


--## Scalar : 
SELECT
     AVG(Sales)
FROM Sales.Orders


--## Row : 
SELECT
     CustomerID
FROM Sales.Orders



--## Table :
SELECT
     OrderID,
     OrderDate
FROM Sales.Orders





------------------------------------------------------------------------------------------------------------------------------------------


-- 2. Location | clauses :   [ SELECT , FROM , JOIN , WHERE ]



-- ## FROM : [ Used as temporary table for the main query ]


-- Ques : Find the products that have a price higher than average price of all products. 

-- Ans: 

SELECT 
     *
FROM 
(
SELECT 
     ProductID,
     Price,
     AVG(Price) OVER() As AvgPrice
FROM Sales.Products
)t
WHERE Price > AvgPrice



