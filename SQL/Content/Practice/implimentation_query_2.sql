





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
     SUM(Sales ) As Total_Sales
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
