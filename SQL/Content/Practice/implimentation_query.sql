




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

     





 ----------------------------------------------------------------------------------------------------------------------------






--> Find the average scores of the customers : 

SELECT 
      COUNT(CustomerID) As Valid_Values,
      AVG(Score) As Avg_Score 
FROM Sales.Customers

-- Ans :  625 

 
-->  After Handelling the null values : 

SELECT 
      COUNT(CustomerID) As Valid_Values, 
      -- AVG(ISNULL(Score,0)) As Avg_Score 
      AVG(COALESCE(Score , 0)) As Avg_Score
FROM Sales.Customers

-- Ans :  500 










-- Display the full name of customers in a single field. 
-- by merging their first and last names 
-- and add 10 bonus points to each customer's score. :

SELECT 
     CustomerID , 
     FirstName ,
     LastName ,
     FirstName + ' ' + COALESCE(LastName , ' ') As FullName ,
     Score ,
     COALESCE(Score , 0) +  10 As ScoreWithBonus
FROM Sales.Customers










 ----------------------------------------------------------------------------------------------------------------------------




--  :: Handle the Null Before doing Joins : 



/*



SELECT 
     a.year , 
     a.type ,
     a.orders ,
     b.sales ,
FROM Table1 As a 
INNER JOIN 
Table2 As b
ON 
a.year == b.year 
AND 
ISNULL(a.type , '') = ISNULL(b.type , '')



*/





 ----------------------------------------------------------------------------------------------------------------------------




--  :: Handle the Nulls Sorting Data : 


--> ORDER BY DESC : SQL always place the NULL always on the bottom of the Column. 

--> ORDER BY ASC : SQL always place the NULL always on the TOP of the Column. 





-- Ques :  Sort the customers from lowest to highest scores , with Nulls appearing last. 

-- Ans : 




SELECT 
     CustomerID ,
     Score
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END,Score 






 ----------------------------------------------------------------------------------------------------------------------------




--  :: Handle the Nulls diving by Zero : 


-- Ques :  Find the sales price for each order by dividing sales by quantity. 

SELECT 
     OrderID ,
     Sales ,
     Quantity ,
     Sales / NULLIF(Quantity , 0) As Price 
FROM Sales.Orders









----------------------------------------------------------------------------------------------------------------------------

USE 
SalesDB


WITH Orders As(
SELECT 1 Id , 'A' Category 
UNION 
SELECT 2 , NULL 
UNION 
SELECT 3 , '' 
UNION 
SELECT 4 , '   ' 
)

 

SELECT 
*,
TRIM(Category) Policy1,
NULLIF(TRIM(Category) , '') Policy2,
COALESCE(NULLIF(TRIM(Category) , '') , 'unknown')  Policy3
FROM Orders







---------------------------------------------------------------------------------------------------------------------------------------





-- :: CASE WHEN Statement : 




/* 

Generate a report showing the total sales for each category : 

- High : If the sales higher than 50 . 
- Medium : If the sales between 20 and 5. 
- Low : If the sales equal or lower than 20. 

and Sort the result from lowest to highest. 

*/

Ans: 

USE 
SalesDB



SELECT 
     OrderID,
     sales,
     CASE 
         WHEN Sales > 50 THEN 'High' 
         WHEN Sales > 20 AND Sales <= 50 THEN 'Medium' 
         WHEN Sales <= 20 THEN 'LOW' 
     END As Category
FROM Sales.Orders
ORDER BY Sales 





-- GROUP Them with catogries : 


SELECT 
Category ,
SUM(Sales) As TotalSales
FROM(
     SELECT 
     OrderID,
     Sales,
     CASE 
         WHEN Sales > 50 THEN 'High' 
         WHEN Sales > 20 AND Sales <= 50 THEN 'Medium' 
         WHEN Sales <= 20 THEN 'LOW' 
     END As Category
FROM Sales.Orders
 )t
 GROUP BY Category
 ORDER BY TotalSales DESC








 -- Maping Values :  Transform the values one form to another. 


 /*
 Task : 

 Retrieve employee details with gender displayed as full text. 


 */



 SELECT 
       EmployeeID,
       FirstName , 
       LastName ,
       Gender ,
       CASE 
           WHEN Gender = 'F' THEN 'Female'
           WHEN Gender = 'M' THEN 'Male'
           ELSE 'Not Available'
        END As GenderFullText
FROM Sales.Employees




 /*
 Task : 

 Retrieve customer details with abbreviated country code.


 */


 Ans: 


  SELECT 
       CustomerID,
       FirstName , 
       LastName ,
       Country  ,
       CASE 
          WHEN Country = 'Germany'  THEN 'DE' 
          WHEN Country = 'USA' THEN  'US'
          ELSE 'N/A'
       END As CountryAbbr
FROM Sales.Customers






SELECT DISTINCT Country 
FROM Sales.Customers






-- Quick Format : (only for one column)
/*


CASE 
    WHEN Country = 'Germany' THEN 'DE' 
    WHEN Country = 'India' 
    WHEN Country = 'United States' THEN 'US' 
    WHEN Country = 'France'  THEN 'FR' 
    WHEN Country = 'Italy'   THEN 'IT'
    ELSE 'n/a'
END 



-- This can be written as : 



CASE 
    WHEN 'Germany' THEN 'DE' THEN 'IN'  
    WHEN 'United States' THEN 'US' 
    WHEN 'France'  THEN 'FR' 
    WHEN 'Italy'   THEN 'IT' 
    WHEN 'India'   THEN 'IN'  
    WHEN 'United States' THEN 'US' 
    WHEN 'France'  THEN 'FR' 
    WHEN 'Italy'  THEN 'IT' 
END 


*/







-- ::  Conditional Aggregation : Apply aggregate function only on subsets of data that fulfill certain conditions. 


/*

COUNT how many times each customer has made an order with sales greater than 30

*/


Ans:

-- FLAG : Binary indicator(1 ,0) to be summarized to show how many times the condition is true.  [ Using CASE Statement ]



SELECT 
     CustomerID ,
     SUM(CASE 
         WHEN Sales > 30 THEN 1 
         ELSE 0
     END) TotalHIGHOrders,
     COUNT(*) As TotalOrders
FROM Sales.Orders 
GROUP BY CustomerID 

