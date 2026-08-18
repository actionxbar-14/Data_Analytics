
/* ==============================================================================
   SQL SELECT Query
-------------------------------------------------------------------------------
   This guide covers various SELECT query techniques used for retrieving, 
   filtering, sorting, and aggregating data efficiently.

   Table of Contents:
     1. SELECT ALL COLUMNS
     2. SELECT SPECIFIC COLUMNS
     3. WHERE CLAUSE
     4. ORDER BY
     5. GROUP BY
     6. HAVING
     7. DISTINCT
     8. TOP
     9. Combining Queries
	 10. COOL STUFF - Additional SQL Features
=================================================================================
*/












/* ==============================================================================
::   SELECT ALL COLUMNS
=============================================================================== */

-- Retrieve All Customer Data
SELECT *
FROM customers

-- Retrieve All Order Data
SELECT *
FROM orders








/* ==============================================================================
::   SELECT FEW COLUMNS
=============================================================================== */

-- Retrieve each customer's name, country, and score.
SELECT 
    first_name,
    country, 
    score
FROM customers