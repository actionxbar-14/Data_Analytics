



/* ==============================================================================
   SETS:  INTERSECT
   - Returns only the rows that are common in both queries. 
===============================================================================*/










/* TASK 4: 
   Find employees who are also customers using INTERSECT 
*/
SELECT
    FirstName,
    LastName
FROM Sales.Employees
INTERSECT
SELECT
    FirstName,
    LastName
FROM Sales.Customers;






:: SET OPERATOR USECASE : 

- Combine similar information before analyzing the data. 

- SET Operator like UNION help combine the data from multiple tables , making it easier to consolidate information for reporting and analysis. 

- DELTA DETECTION : SET Operator Idenitifying the differences or changes ( delta ) between two batches of data , and SET Operator like EXCEPT help detect changes between datasets , making it easier to identify new , updated or missing records during data integration. 

- DATA COMPLETENESS CHECK : EXCEPT operator can be used to compare tables to detect discrepancies between databases , And SET Operator like EXCEPT help verify data completeness by comparing tables across databases , ensuring no records are missing or mismatched. 







NOTE : Never use an asteisk(*) to combine tables ; list needed columns instead. 






/* TASK 5: 
   Combine order data from Orders and OrdersArchive into one report without duplicates .
*/
SELECT
    'Orders' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM Sales.Orders
UNION
SELECT
    'OrdersArchive' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM Sales.OrdersArchive
ORDER BY OrderID;