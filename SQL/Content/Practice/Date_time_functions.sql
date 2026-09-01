




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





-- -------------------------------------------------------------------------------------------------------------------------


USE 
SalesDB






SELECT 
     OrderID, 
     OrderDate,
     DATEADD(year , -2 , OrderDate) As TwoYearsBefore,
     DATEADD(month , -2 , OrderDate) As TwoMonthsBefore,
     DATEADD(Day , -2 , OrderDate) As TwoDaysBefore,
     DATEADD(year , 2 , OrderDate) As TwoYearsAfter,
     DATEADD(Month , 2 , OrderDate) As TwoMonthsAfter,
     DATEADD(Day , 2 , OrderDate) As TwoDaysAfter
FROM Sales.Orders  








-- Calculate the age of employees : 

SELECT * FROM Sales.Employees

SELECT 
      EmployeeID ,
      BirthDate ,
      DATEDIFF(year , BirthDate , GETDATE()) As Age 
FROM Sales.Employees




-- Find the shipping duration in days  : 



SELECT 
      OrderID ,
      OrderDate ,
      ShipDate , 
      DATEDIFF(day , OrderDate , ShipDate) As Day_2_ship
FROM Sales.Orders






-- Find the 'Average' shipping duration in days for each 'month' : 


SELECT 
      MONTH(OrderDate) As OrderDate_num ,
      DATENAME(Month , OrderDate) As Month_Name,
      AVG(DATEDIFF(day , OrderDate , ShipDate)) As Avg_ship
FROM Sales.Orders
GROUP BY MONTH(OrderDate) ,  DATENAME(Month , OrderDate)





    
-- Time Gap Analysis :  



-- Find the number of days between each order and the previous order. 


USE 
SalesDB


SELECT * FROM Sales.Orders



SELECT 
      OrderID  , 
      OrderDate CurrentOrderDate , 
      LAG(OrderDate)  OVER  (ORDER BY OrderDate) As PreviousOrderDate,
      DATEDIFF(day , LAG(OrderDate) OVER (ORDER BY OrderDate) , OrderDate) As No_of_Days
FROM Sales.Orders






SELECT 
      ISDATE('1234') As DateCheck1 ,    
      ISDATE('2025-08-20') As DateCheck3,   -- > 1
      ISDATE('20-08-2025') As DateCheck3,
      ISDATE('2025') As DateCheck4,         -- > 1
      ISDATE('08') As DateCheck5
      






-- :: Validateing the List of Dates using ISDATE and CAST it into str to DATE : 


SELECT
      OrderDate ,
      ISDATE(OrderDate),
      CASE WHEN ISDATE(OrderDate) = 1
      THEN
      CAST(OrderDate AS DATE) 
      END NewOrderDate

FROM 
(
    SELECT '2025-08-20' As OrderDate
    UNION 
    SELECT '2025-08-21' 
    UNION 
    SELECT '2025-08-23' 
    UNION 
    SELECT '2025-08' 
)t

     