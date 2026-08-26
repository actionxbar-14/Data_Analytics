




USE 
SalesDB

SELECT 
     OrderID ,
     OrderDate , 
     ShipDate, 
     CreationTime
FROM 
Sales.Orders




SELECT 
     OrderID , 
     CreationTime ,
     '2025-08-20' HardCoded
FROM Sales.Orders




SELECT
     OrderID,
     GETDATE() as today
FROM Sales.Orders



SELECT
     OrderID,
     OrderDate,
     CreationTime,
     YEAR(CreationTime) AS YEAR,
     MONTH(CreationTime) AS MONTH,
     DAY(CreationTime) AS DAY
FROM Sales.Orders




SELECT
     OrderID,
     OrderDate,
     CreationTime,
     DATEPART(YEAR , OrderDate) AS YEAR,
     DATEPART(Month, OrderDate) AS MONTH,
     DATEPART(Day , OrderDate) AS DAY,
     DATEPART(hour , CreationTime) AS HOUR,
     DATEPART(QUARTER ,CreationTime) AS QUARTER,
     DATEPART(Week , OrderDate) AS Week
FROM Sales.Orders