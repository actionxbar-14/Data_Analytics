


/* ==============================================================================
   SQL SET Operations
-------------------------------------------------------------------------------
   SQL set operations enable you to combine results from multiple queries
   into a single result set. This script demonstrates the rules and usage of
   set operations, including UNION, UNION ALL, EXCEPT, and INTERSECT.
   
   Table of Contents:
     1. SQL Operation Rules
     2. UNION
     3. UNION ALL
     4. EXCEPT
     5. INTERSECT
=================================================================================
*/



















/* ==============================================================================
::   RULES OF SET OPERATIONS   : -
===============================================================================*/





/*  1ST RULE : ORDER BY can be used only once. 
 -->  the order by can not be used by each SELECT query , Instead it can only use once at the end of all SELECT statements. 
*/  

        SELECT 
          FirstName  ,
          LastName 
        FROM Customers 
        JOIN Clause 
        WHERE Clause 
        GROUP BY Clause  

        UNION 

        SELECT 
           FirstName , 
           LastName 
        FROM Employees 
        JOIN Clause 
        WHERE Clause 
        GROUP BY Clause 

        ORDER BY FirstName      
 















/*  2ND RULE : Data Types and Number of Columns.
 -->  The data types of columns and number of column in each query should match.
*/  

-- NOTE : This is wrong and it does not give output because 1st query has 3 column and second query has 2 columns. 
 
SELECT
    FirstName,       
    LastName,
    Country
FROM Sales.Customers
UNION
SELECT
    FirstName,
    LastName
FROM Sales.Employees;







/* RULE: Data Types (Example)    --> CORRECT
   The data types of columns and number of column in each query should match.
*/
SELECT
    CustomerID,
    LastName
FROM Sales.Customers
UNION
SELECT
    FirstName,
    LastName
FROM Sales.Employees;





















/* 3RD RULE: Column Order
   The order / hirarchy of the columns in each query must be the same.
*/
SELECT
    LastName,
    CustomerID
FROM Sales.Customers
UNION
SELECT
    EmployeeID,
    LastName
FROM Sales.Employees;








/* 4TH RULE: Column Aliases
   The column names in the result set are determined by the column names
   specified in the "first" SELECT / query statement.
*/

SELECT
    CustomerID AS ID,
    LastName AS Last_Name
FROM Sales.Customers
UNION
SELECT
    EmployeeID,
    LastName
FROM Sales.Employees;








/* 5TH RULE: Mapping Correct Columns
   Ensure that the correct columns are used to maintain data consistency.
*/

SELECT
    FirstName,
    LastName
FROM Sales.Customers
UNION
SELECT
    LastName,
    FirstName
FROM Sales.Employees;
