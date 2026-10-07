



/* ==============================================================================
   SETS:  UNION ALL 
   - combine the result of both the queries and return all the data and including the duplicate data. 
   - UNION ALL is generally faster than UNION.
   - IF you're confindent that there are no duplicates , use UNION ALL. 
   - Use UNION ALL to find duplicates and quality issues. 
===============================================================================*/







/* TASK 2: 
   Combine the data from Employees and Customers into one table, including duplicates, using UNION ALL 
*/
SELECT
    FirstName,
    LastName
FROM Sales.Customers
UNION ALL
SELECT
    FirstName,
    LastName
FROM Sales.Employees;