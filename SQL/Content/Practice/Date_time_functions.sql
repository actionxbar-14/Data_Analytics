




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





------------------------------------------------------------------------------------------------------------------


-- :: Date Format :





USE
SalesDB



SELECT 
     OrderID ,
     CreationTime ,
     -- FORMAT USA : 
     FORMAT(CreationTime , 'MM-dd-yyyy') As USA_Format,
     -- FORMAT Europe : 
      FORMAT(CreationTime , 'dd-MM-yyyy') As Europe_Format,
     -- DAY :
     FORMAT(CreationTime , 'dd') As day_no , 
     FORMAT(CreationTime , 'ddd') As short_week_name ,
     FORMAT(CreationTime , 'dddd') As Full_week_name ,
     -- MONTH :
     FORMAT(CreationTime , 'MM') As month_no , 
     FORMAT(CreationTime , 'MMM') As short_month_name ,
     FORMAT(CreationTime , 'MMMM') As Full_month_name
FROM Sales.Orders



-- Show CreationTime using the following format : 
 
-->  [ Day Wed Jan Q1 2025 12:34:56 PM ]


SELECT 
     OrderID ,
     CreationTime ,
     ' Day ' + FORMAT(CreationTime , ' ddd ') + 
     FORMAT(CreationTime , ' MMM ') + ' Q'    + 
     DATENAME(quarter ,CreationTime) + 
     FORMAT(CreationTime , ' yyyy hh:mm:ss:tt ') 
     as CustomFormat 
FROM Sales.Orders





--> Formatting USE CASE : 

SELECT 
     FORMAT(OrderDate , 'MMM yy') As OrderDate ,
     COUNT(*) As No_of_Orders
FROM Sales.Orders
GROUP BY FORMAT(OrderDate , 'MMM yy')



--> Convert : 

SELECT 
      CONVERT(INT , '123') As [ String to INT CONVERT ],
      CONVERT(DATE , '2025-08-20') As [ String to Date CONVERT ] ,
      CreationTime ,
      CONVERT(DATE , CreationTime ) As [ Datetime to Date CONVERT ],
      CONVERT(VARCHAR , CreationTime , 32) As  [ USA Std. Style : 32 ] ,
       CONVERT(VARCHAR , CreationTime , 34) As  [ EURO Std. Style : 32 ] 
FROM Sales.Orders




--> CAST : 

SELECT 
     CAST('123' As INT) As [ String to Int] ,
     CAST(123 AS VARCHAR) As [ INT to String ],
     CAST('2025-08-20' AS DATE) As [ String to Date ],
     CAST('2025-08-20' AS DATETIME2) As [ String to Datetime ],
     CreationTime ,
     CAST(CreationTime As DATE) As [ Datetime to Date ] 
FROM Sales.Orders

