


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

