


/* ==============================================================================
::  All Together :-
=============================================================================== */









/* Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first. */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
ORDER BY AVG(score) DESC








/* ============================================================================== 
::  COOL STUFF - Additional SQL Features  : -
=============================================================================== */




-- Execute multiple queries at once
SELECT * FROM customers;
SELECT * FROM orders;









/* Selecting Static Data */
-- Select a static or constant value without accessing any table
SELECT 123 AS static_number;

SELECT 'Hello' AS static_string;








-- Assign a constant value to a column in a query
SELECT
    id,
    first_name,
    'New Customer' AS customer_type
FROM customers;