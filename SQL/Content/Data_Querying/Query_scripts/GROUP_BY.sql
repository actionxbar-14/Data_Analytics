



/* ==============================================================================
::   GROUP BY :-
=============================================================================== */





-- Find the total score for each country
SELECT 
    country,
    SUM(score) AS total_score
FROM customers
GROUP BY country






/* This will not work because 'first_name' is neither part of the GROUP BY 
   nor wrapped in an aggregate function. SQL doesn't know how to handle this column. */
SELECT 
    country,
    first_name,
    SUM(score) AS total_score
FROM customers
GROUP BY country








-- Find the total score and total number of customers for each country
SELECT 
    country,
    SUM(score) AS total_score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country