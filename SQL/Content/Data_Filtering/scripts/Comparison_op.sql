
/* ============================================================================== 
   SQL Filtering Data
-------------------------------------------------------------------------------
   This document provides an overview of SQL filtering techniques using WHERE 
   and various operators for precise data retrieval.

   Table of Contents:
     1. Comparison Operators
        - =, <>, >, >=, <, <=
     2. Logical Operators
        - AND, OR, NOT
     3. Range Filtering
        - BETWEEN
     4. Set Filtering
        - IN
     5. Pattern Matching
        - LIKE
=================================================================================
*/







/* ============================================================================== 
 
::  COMPARISON OPERATORS :-
=============================================================================== */

-- Retrieve all customers from Germany.
SELECT *
FROM customers
WHERE country = 'Germany'






-- Retrieve all customers who are not from Germany.
SELECT *
FROM customers
WHERE country <> 'Germany'





-- Retrieve all customers with a score greater than 500.
SELECT *
FROM customers
WHERE score > 500




-- Retrieve all customers with a score of 500 or more.
SELECT *
FROM customers
WHERE score >= 500




-- Retrieve all customers with a score less than 500.
SELECT *
FROM customers
WHERE score < 500




-- Retrieve all customers with a score of 500 or less.
SELECT *
FROM customers
WHERE score <= 500
