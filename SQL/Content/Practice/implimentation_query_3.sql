


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








-- ## FROM : [ Used as temporary table for the main query ].




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







-- ## SELECT : [ Output of subquery must be one scalar/aggregated value ].



-- Show the product ID's , product names , prices , and the total number of orders : 

SELECT 
    ProductID,
    Product,
    Price,
    (SELECT COUNT(*) FROM Sales.Orders) As TotalOrders 
FROM Sales.Products





-- ## JOIN : [ used to prepare the data (filtering or aggregation) before joining it with other tables ]



SELECT 
      *,
      COUNT(Sales) OVER(PARTITION BY c.CustomerID) AS Total_Orders
FROM Sales.Customers c
LEFT JOIN
Sales.Orders As o
ON 
c.CustomerID = o.CustomerID




-- ## WHERE : [ Used for complex filtering logic and makes query more flexible and dynamic ].


SELECT
     *
FROM 
(
SELECT 
     * ,
     AVG(Price) OVER() AS Avg_price
FROM Sales.Products
)t
WHERE Price > Avg_price







-- ## IN  :  [ Checks whether a value matches any value from a list ]



-- Show the details of orders made by the customers in germany 



SELECT
     * 
FROM Sales.Orders As o
LEFT JOIN
Sales.Customers As c 
ON 
o.CustomerID = c.CustomerID
WHERE c.Country IN('Germany')
 





 
-- ## ANY  : 

-- > [ Checks if a value matches ANY value within a list ]. 
-- > [ Used to check if a value is true for At least one of the values in a list ].


-- Find female employees whose salaries are greater than the salaries of any male employees. 


SELECT 
     * 
FROM Sales.Employees
WHERE Gender = 'F' AND
Salary > ANY(
SELECT 
     salary
FROM Sales.Employees
WHERE Gender IN('M')
)





 
-- ## ALL  :  [ Checks if a value matches ALl value within a list ].

SELECT 
     * 
FROM Sales.Employees
WHERE Gender = 'F' AND
Salary > ALL(
SELECT 
     salary
FROM Sales.Employees
WHERE Gender IN('M')
)





 
-- ## EXISTS : 


-- Show the details of orders made by customers in Germany :

SELECT
     *
FROM Sales.Orders o 
WHERE EXISTS ( 
SELECT 
     1 
FROM Sales.Customers c 
WHERE Country = 'Germany' 
AND o.CustomerID = c.CustomerID)












------------------------------------------------------------------------------------------------------------------------------------------



-- ::  CTE ( Common Table Expression ) :

-- It is a Temporary , named result set ( virtual table ) , that can be used multiple times within your query to simplify and organize 
-- complex query.





-- Find the total sales per customer 

-- Ans :


WITH CTE_Total_Sales As
(
SELECT
     CustomerID,
     SUM(Sales) As TotalSales
FROM Sales.Orders
GROUP BY CustomerID
-- ORDER BY CustomerID   #--> Order by is not allowed in CTE
)


SELECT 
     c.CustomerID,
     c.FirstName,
     c.LastName,
     cts.TotalSales
FROM Sales.Customers As c
LEFT JOIN 
CTE_Total_Sales As cts
ON
cts.CustomerID = c.CustomerID
ORDER BY c.CustomerID













-- Multiple CTE's : Find the last order date for each customer









WITH CTE_Total_Sales As
(
SELECT
     CustomerID,
     SUM(Sales) As TotalSales
FROM Sales.Orders
GROUP BY CustomerID

)

, CTE_Last_Order As
(
SELECT
     CustomerID,
     MAX(OrderDate) As Last_Order
FROM Sales.Orders
GROUP BY CustomerID

)



SELECT 
     c.CustomerID,
     c.FirstName,
     c.LastName,
     cts.TotalSales,
     ctsl.Last_Order
FROM Sales.Customers As c
LEFT JOIN 
CTE_Total_Sales As cts
ON
cts.CustomerID = c.CustomerID
LEFT JOIN
CTE_Last_Order As ctsL
ON
ctsL.CustomerID = c.CustomerID
ORDER BY c.CustomerID








-- Nested CTE's :   [ CTE inside another CTE ]

-- A nested CTE uses the result of another CTE, so it can't run independently.





-- Rank Customers based on Total Sales Per Customer.












WITH CTE_Total_Sales As
(
SELECT
     CustomerID,
     SUM(Sales) As TotalSales
FROM Sales.Orders
GROUP BY CustomerID

)

, CTE_Last_Order As
(
SELECT
     CustomerID,
     MAX(OrderDate) As Last_Order
FROM Sales.Orders
GROUP BY CustomerID

)

, CTE_Customer_Rank As 
(
SELECT 
     CustomerID,
     TotalSales,
     RANK() OVER(ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales

)







SELECT 
     c.CustomerID,
     c.FirstName,
     c.LastName,
     cts.TotalSales,
     ctsl.Last_Order,
     ccr.CustomerRank
FROM Sales.Customers As c
LEFT JOIN 
CTE_Total_Sales As cts
ON
cts.CustomerID = c.CustomerID
LEFT JOIN
CTE_Last_Order As ctsL
ON
ctsL.CustomerID = c.CustomerID
LEFT JOIN 
CTE_Customer_Rank As ccr
ON 
ccr.CustomerID = c.CustomerID
ORDER BY c.CustomerID








-- Segment customers based on their total sales.














WITH CTE_Total_Sales As
(
SELECT
     CustomerID,
     SUM(Sales) As TotalSales
FROM Sales.Orders
GROUP BY CustomerID

)



, CTE_Last_Order As
(
SELECT
     CustomerID,
     MAX(OrderDate) As Last_Order
FROM Sales.Orders
GROUP BY CustomerID

)



, CTE_Customer_Rank As 
(
SELECT 
     CustomerID,
     TotalSales,
     RANK() OVER(ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales

)




, CTE_Customer_Segments As
(
SELECT 
     CustomerID,
     TotalSales,
     CASE 
         WHEN TotalSales > 100 THEN 'High'
         WHEN TotalSales > 80 THEN 'Medium'
         ELSE 'Low'
     END CustomerSegments
FROM CTE_Total_Sales
)






SELECT 
     c.CustomerID,
     c.FirstName,
     c.LastName,
     cts.TotalSales,
     ctsl.Last_Order,
     ccr.CustomerRank
FROM Sales.Customers As c
LEFT JOIN 
CTE_Total_Sales As cts
ON
cts.CustomerID = c.CustomerID
LEFT JOIN
CTE_Last_Order As ctsL
ON
ctsL.CustomerID = c.CustomerID
LEFT JOIN 
CTE_Customer_Rank As ccr
ON 
ccr.CustomerID = c.CustomerID
LEFT JOIN
CTE_Customer_Segments AS ccs
ON 
ccs.CustomerID = c.CustomerID
ORDER BY c.CustomerID


















