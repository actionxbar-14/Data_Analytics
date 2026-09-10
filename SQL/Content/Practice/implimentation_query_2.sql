





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









-- --------------------------------------------------------------------------------------------------------------------------------------------



-- :: Window Aggregation Function : 



-- find the total number of orders  , additionally provide details such as order Id , order date :- 


SELECT 
      OrderID ,
      OrderDate,
      COUNT(*) OVER() As Total_Orders   
FROM Sales.Orders





-- find the total number of orders for each customers :



SELECT 
      OrderID ,
      OrderDate,
      CustomerID,
      COUNT(*) OVER() As Total_Orders  ,
      COUNT(*) OVER(PARTITION BY CustomerID) As OrderBYCustomers
FROM Sales.Orders





-- find the total number of Customers  , additionally provide all customer details : 

SELECT 
    *,
     COUNT(*) OVER() As Total_Customers
FROM Sales.Customers






-- find the total numnber of scores for the customers : 


SELECT
     * ,
     COUNT(Score) OVER() As Total_Scores
FROM Sales.Customers




-- ::  USECASE COUNT :- 



-- check whether the table 'orders' contains any duplicate rows : 

SELECT 
     OrderID ,
     COUNT(*) OVER(PARTITION BY OrderID) As CheckPK
FROM Sales.Orders


 


-- check whether the table 'OrdersArchive' contains any duplicate rows :


SELECT 
     OrderID ,
     COUNT(*) OVER(PARTITION BY OrderID) As CheckPK
FROM Sales.OrdersArchive









-- Find the total sales across all orders and the total sales for each product. Additionally , provide details such ad orderID and order date. 


SELECT 
     orderID ,
     orderDate,
     ProductID,
     SUM(sales) OVER() As Total_Orders,
     SUM(sales) OVER(PARTITION BY ProductID) As Total_Orders    
FROM Sales.Orders







-- :: USECASE SUM :- 


-- Find the percentage contribution of each product's sales to the total sales. 


SELECT  
     OrderID ,
     ProductID, 
     Sales ,
     SUM(Sales) OVER() As Total_Sales,
     ROUND(CAST(Sales As FLOAT) / SUM(Sales) OVER() * 100 ,2) As Percentage_contribution
FROM Sales.Orders







-- find the average sales across 'all orders' and the average sales for 'each product' ,
-- additionally provide details such as orderID and orderDate. 


SELECT 
     OrderID ,
     OrderDate ,
     ProductID,
     AVG(COALESCE(Sales,0)) OVER() As Avg_Sales,
     AVG(COALESCE(Sales,0))  OVER(PARTITION BY ProductID) As Avg_Sales 
FROM Sales.Orders





-- Find the average scores of customers . Additionally , provide details such as CustomerID and Last Name :



SELECT
     CustomerID, 
     LASTNAME,
     Score,
     AVG(COALESCE(Score,0)) OVER() As AVG_Score
FROM Sales.Customers






-- Find all orders where sales are higher than average sales across all orders : 


SELECT 
*
FROM(
SELECT 
     OrderID , 
     ProductID ,
     Sales , 
     AVG(Sales) OVER() As AVG_Sales
FROM Sales.Orders 
)t WHERE Sales > AVG_Sales