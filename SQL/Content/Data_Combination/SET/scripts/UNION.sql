



/* ==============================================================================
   SETS: UNION
   -> combine the result of both the queries and return all the data and remove the duplicate data and return it only once. 
===============================================================================*/





/* TASK 1: 
   Combine the data from Employees and Customers into one table using UNION 
*/



SELECT
    FirstName,
    LastName
FROM Sales.Customers
UNION
SELECT
    FirstName,
    LastName
FROM Sales.Employees;