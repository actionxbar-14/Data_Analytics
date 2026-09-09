





USE
MyDatabase





-- Aggregation Function :  


-- Ques : Find the  total number of orders , Sum of Orders , Avg Orders , Max Orders , Min Orders .

Ans:

SELECT
      COUNT(*) As total_number_of_orders ,
      SUM(sales) As Total_Sales , 
      AVG(sales) As AVG_sales ,
      MAX(sales) As Max_Sales ,
      MIN(sales) As Min_Sales
FROM orders
GROUP BY customer_id









____________________________________________________________________________________________________________________________________________






-- :: Window ( Analytical Function ) : 


USE 
SalesDB



-- ## first UseCase : 



-- Ques : Find the total Sales Across all orders. 

-- Ans :


SELECT 
     SUM(Sales) As Total_Sales
FROM Sales.Orders





-- Ques : Find the total Sales for Each orders. 

-- Ans :


SELECT 
      ProductID ,
     SUM(Sales ) As Total_Sales
FROM Sales.Orders
GROUP BY ProductID





-- Ques : Find the total Sales for Each Product , additionally provide details such as order Id , order date.

-- Ans :



--> GROUP BY LIMITATION :
-- It can't do aggregations and provide various details at same time. 
-- by adding additional information total_sales column are not gives aggregated result!


SELECT  
     ProductID,
     OrderID ,
     OrderDate,
     SUM(Sales) As Total_Sales
FROM Sales.Orders
GROUP BY ProductID , OrderID  , OrderDate




--> WINDOW Function : 


SELECT 
     OrderID ,
     OrderDate,
     ProductID ,
     SUM(Sales) OVER(PARTITION BY ProductID)  As total_SalesBY_Product
FROM Sales.Orders








-- Find the total sales across all 'orders' additionally provide details such order id & order date 


SELECT 
      OrderID ,
      OrderDate ,
      SUM(sales) OVER() As Total_Sales
FROM Sales.Orders







-- Find the total sales for each 'product' , additionally provide details such order id & order date : 

SELECT 
     ProductID,
     OrderID ,
     OrderDate,
     SUM(sales) OVER(PARTITION BY ProductID) As Total_Sales
FROM Sales.Orders





 -- Find the total sales across all 'orders' additionally provide details such order id & order date &  
 -- Find the total sales for each 'product' , additionally provide details such order id & order date : 




 SELECT 
     ProductID,
     OrderID ,
     OrderDate,
     Sales,
     SUM(sales) OVER() As Total_Sales,
     SUM(sales) OVER(PARTITION BY ProductID) As Total_SalesByProducts
FROM Sales.Orders







-- find the total sales for each combination of 'product' and 'order status' : 



 SELECT 
     ProductID,
     OrderID ,
     OrderDate,
     Sales,
     OrderStatus,
     SUM(sales) OVER() As Total_Sales,
     SUM(sales) OVER(PARTITION BY ProductID) As Total_SalesByProducts,
     SUM(sales) OVER(PARTITION BY ProductID, OrderStatus) As SalesByProductsAndStatus
FROM Sales.Orders














-- Rank each order based on thir sales from highest to lowest , additionally provide details such order id & order date : 

SELECT 
      OrderID ,
      OrderDate, 
      sales ,
      RANK() OVER(ORDER BY Sales DESC) AS Ranking_Sales
FROM Sales.Orders








-- :: FRAME Practice : 




SELECT  
      OrderID ,
      OrderDate ,
      OrderStatus ,
      Sales ,
      SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) As TotalSales
FROM Sales.Orders





-- :: Compact Frame : 

--> For only PRECEDING , the CURRENT ROW can be skipped. 
 

--> Ex :  ( Normal form ) 
-- ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING 

--> Ex :  ( Short form ) 
--  ROWS 2 FOLLOWING




SELECT  
      OrderID ,
      OrderDate ,
      OrderStatus ,
      Sales ,
      SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) As TotalSales
FROM Sales.Orders


-- short form : 


SELECT  
      OrderID ,
      OrderDate ,
      OrderStatus ,
      Sales ,
      SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
      ROWS 2 PRECEDING) As TotalSales
FROM Sales.Orders








-- :: DEFAULT FRAME : ( ORDER BY always uses a FRAME )


-- > default frame :-  " ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW " 


SELECT  
      OrderID ,
      OrderDate ,
      OrderStatus ,
      Sales ,
      SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) As TotalSales
FROM Sales.Orders







-- Rank Customers based on their total sales :  

SELECT 
     CustomerID ,
     SUM(Sales) As TotalSales,
     RANK() OVER(ORDER BY SUM(Sales) DESC) As RankCustomers
FROM Sales.Orders 
GROUP BY CustomerID


