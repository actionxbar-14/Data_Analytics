



/* ==============================================================================
   SETS:  EXCEPT
   - Returns unique rows in 1st Table that are not in 2nd Table. 
   - Returns all distinct rows from the first query that are not found in the second query. 
   - It is the only one where the order of queries affects the final result. 
===============================================================================*/









/* TASK 3: 
   Find employees who are NOT customers using EXCEPT 
*/
SELECT
    FirstName,
    LastName
FROM Sales.Employees
EXCEPT
SELECT
    FirstName,
    LastName
FROM Sales.Customers;