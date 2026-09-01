============================================================
SQL SET OPERATIONS PRACTICE SET
BFSI + DATA ANALYST
============================================================

DATABASE: BFSI_Analytics

TABLES:
1. Branches
2. Customers
3. Accounts
4. Transactions
5. Loans
6. Credit_Cards







USE 
BFSI_Analytics


============================================================
SECTION 1 — SQL OPERATION RULES
============================================================

Q1. Identify two queries from the Customers table that can
    be combined using UNION.

Q2. Write two SELECT queries that return the same number
    of columns and compatible data types.

Q3. Identify whether the following operations can be
    performed using UNION:

    Query 1:
    SELECT customer_id, customer_name
    FROM Customers;

    Query 2:
    SELECT customer_id, customer_name
    FROM Customers;

Q4. Can the following two queries be combined using UNION?

    Query 1:
    SELECT customer_id, customer_name
    FROM Customers;

    Query 2:
    SELECT loan_id, loan_amount
    FROM Loans;

    Explain why or why not.

Q5. Understand and identify the difference between:

    UNION
    UNION ALL
    EXCEPT
    INTERSECT

    using the Customers and Accounts tables.


============================================================
SECTION 2 — UNION
============================================================

Q6. Display all customer cities and branch cities in a
    single result without duplicate cities.

    Use UNION.


Q7. Display all states in which the bank has:

    - Customers
    - Branches

    Remove duplicate states.


Q8. Display all cities where the bank has either customers
    or branches.

    Do not display duplicate cities.


Q9. Display all people names from:

    - Customer names
    - Branch manager names

    Remove duplicates.


Q10. Create a single list containing:

     - Customer cities
     - Branch cities

     Sort the final result alphabetically.


Q11. Display all customer segments and account types in
     one result.

     Remove duplicate values.


============================================================
SECTION 3 — UNION ALL
============================================================

Q12. Display all customer cities and branch cities using
     UNION ALL.

     Keep duplicate cities.


Q13. Display all customer states and branch states using
     UNION ALL.

     Do not remove duplicates.


Q14. Combine the following into one result:

     - Customer cities
     - Branch cities

     Keep all duplicate values.


Q15. Display all loan types and account types in a single
     result using UNION ALL.


Q16. Combine customer occupations and branch manager names
     into one result.

     Keep duplicates.


------------------------------------------------------------
UNION vs UNION ALL
------------------------------------------------------------

Q17. Write two queries:

     1. Using UNION
     2. Using UNION ALL

     to combine customer cities and branch cities.

     Compare the number of rows returned by both queries.


Q18. Determine which operation should be used:

     A. Management wants a list of all unique cities.
     B. Management wants every occurrence of each city.

     Choose between UNION and UNION ALL.


============================================================
SECTION 4 — EXCEPT
============================================================

Note:

EXCEPT returns rows that exist in the first query but
do NOT exist in the second query.


Q19. Find cities that have customers but do not have
     bank branches.


Q20. Find states that have customers but do not have
     bank branches.


Q21. Find cities that have branches but no customers.


Q22. Find states that have branches but no customers.


Q23. Find customer cities that are not present in the
     branch cities.


Q24. Find loan types that are not present as account types.


Q25. Find account types that are not present as loan types.


------------------------------------------------------------
EXCEPT — BFSI ANALYST QUESTIONS
------------------------------------------------------------

Q26. Identify locations where the bank has customers but
     does not currently have a branch.

     Output unique cities.


Q27. Identify states where the bank has branches but does
     not have customers.


Q28. Find customer segments that do not match any account
     type.


Q29. Find transaction channels that are not equal to any
     account type.


============================================================
SECTION 5 — INTERSECT
============================================================

Note:

INTERSECT returns only rows that exist in BOTH queries.


Q30. Find cities that exist in both:

     - Customers
     - Branches


Q31. Find states that exist in both:

     - Customers
     - Branches


Q32. Find customer cities that also have bank branches.


Q33. Find states where both customers and branches exist.


Q34. Find values that are common between:

     - Loan types
     - Account types


Q35. Find values that are common between:

     - Account types
     - Credit card types


------------------------------------------------------------
INTERSECT — BFSI ANALYST QUESTIONS
------------------------------------------------------------

Q36. Identify cities where the bank has both:

     - Customers
     - Branches

     Sort the result alphabetically.


Q37. Identify states that have both customers and branches.


Q38. Find customer occupations that are also present as
     branch manager names.

     Use INTERSECT.


============================================================
SECTION 6 — COMBINING SET OPERATIONS
============================================================

Q39. Find all cities that are present in either Customers
     or Branches but not necessarily both.

     Use appropriate set operations.


Q40. Find cities that:

     - Exist in Customers
     - Do NOT exist in Branches

     Use EXCEPT.


Q41. Find cities that:

     - Exist in Branches
     - Do NOT exist in Customers

     Use EXCEPT.


Q42. Find cities that:

     - Exist in both Customers and Branches

     Use INTERSECT.


Q43. Create a complete location analysis containing:

     1. Cities only in Customers
     2. Cities only in Branches
     3. Cities in both


============================================================
SECTION 7 — SET OPERATIONS + FILTERING
============================================================

Q44. Find cities of Premium customers and combine them with
     branch cities using UNION.

     Return only unique cities.


Q45. Find cities of Premium customers that do not have
     a bank branch.

     Use EXCEPT.


Q46. Find cities of Premium customers that also have
     a bank branch.

     Use INTERSECT.


Q47. Find states of customers whose annual income is greater
     than 1000000 and combine them with branch states.

     Remove duplicates.


Q48. Find cities of customers aged below 30 that do not
     have a branch.


============================================================
SECTION 8 — SET OPERATIONS + BFSI ANALYTICS
============================================================

Q49. Customer Coverage Analysis

     Identify cities where:

     A. Customers exist but branches do not.
     B. Branches exist but customers do not.
     C. Both customers and branches exist.

     Use appropriate set operations.


Q50. Market Expansion Analysis

     Find cities where the bank has customers but does not
     have a branch.

     These cities can be considered potential locations
     for branch expansion.


Q51. Branch Utilization Analysis

     Find cities where branches exist but there are no
     customers.

     These branches may require further business analysis.


Q52. Customer Reach Analysis

     Find all unique cities where the bank has either:

     - Customers
     - Branches

     Return one consolidated list.


Q53. Geographic Overlap Analysis

     Find cities where both customers and branches exist.

     Return only unique cities.


============================================================
SECTION 9 — HIGH-LEVEL CHALLENGES
============================================================

Q54. Create a result containing all unique states from:

     - Customers
     - Branches

     Then identify which states exist in both tables.


Q55. Identify states where:

     - Customers exist
     - Branches do not exist

     Sort alphabetically.


Q56. Identify states where:

     - Branches exist
     - Customers do not exist

     Sort alphabetically.


Q57. Find all cities covered by either customers or branches,
     but identify which cities are common to both.


Q58. Compare customer locations and branch locations and
     classify each city into:

     - Customer Only
     - Branch Only
     - Both


============================================================
SECTION 10 — INTERVIEW-STYLE QUESTIONS
============================================================

Q59. Explain the difference between UNION and UNION ALL
     using customer and branch cities.

Q60. When would you prefer UNION ALL over UNION in a
     banking data pipeline?

Q61. What is the difference between EXCEPT and
     LEFT ANTI JOIN?

Q62. What is the difference between INTERSECT and
     INNER JOIN?

Q63. A bank has two customer databases from two different
     systems.

     Database A contains customer IDs:
     1001, 1002, 1003, 1004

     Database B contains customer IDs:
     1003, 1004, 1005, 1006

     Find:

     A. Customers present in both systems.
     B. Customers only in Database A.
     C. Customers only in Database B.

     Use INTERSECT and EXCEPT.


Q64. A bank receives customer records from two different
     branches.

     Branch A:
     Delhi
     Gurugram
     Pune

     Branch B:
     Pune
     Jaipur
     Delhi

     Find:

     A. All unique cities
     B. All cities including duplicates
     C. Common cities
     D. Cities only in Branch A
     E. Cities only in Branch B

     Use UNION, UNION ALL, INTERSECT and EXCEPT.


============================================================
DIFFICULTY PROGRESSION
============================================================

LEVEL 1 — SQL OPERATION RULES
Q1 - Q5

LEVEL 2 — UNION
Q6 - Q11

LEVEL 3 — UNION ALL
Q12 - Q18

LEVEL 4 — EXCEPT
Q19 - Q29

LEVEL 5 — INTERSECT
Q30 - Q38

LEVEL 6 — COMBINED SET OPERATIONS
Q39 - Q48

LEVEL 7 — BFSI DATA ANALYST CASE STUDIES
Q49 - Q58

LEVEL 8 — INTERVIEW / CONCEPTUAL
Q59 - Q64


============================================================
CONCEPTS COVERED
============================================================

SQL SET OPERATIONS
UNION
UNION ALL
EXCEPT
INTERSECT

SET OPERATION RULES
Column Count Compatibility
Data Type Compatibility
Duplicate Handling
ORDER BY with Set Operations

COMBINATIONS
SET OPERATIONS + WHERE
SET OPERATIONS + DISTINCT
SET OPERATIONS + ORDER BY

BFSI ANALYTICS
Customer Coverage
Branch Coverage
Geographic Analysis
Market Expansion
Branch Utilization
Customer Reach


============================================================
IMPORTANT SQL RULES
============================================================

1. Both SELECT statements must return the same number
   of columns.

2. Corresponding columns must have compatible data types.

3. UNION removes duplicate rows.

4. UNION ALL keeps duplicate rows.

5. EXCEPT returns rows from the first query that are
   not present in the second query.

6. INTERSECT returns rows common to both queries.

7. The order of queries matters for EXCEPT.

8. The order of queries generally does not change the
   result of INTERSECT.

9. Set operations combine result sets vertically.

10. JOINs combine related columns horizontally.


============================================================
PRACTICE ORDER
============================================================

UNION
   ↓
UNION ALL
   ↓
UNION vs UNION ALL
   ↓
EXCEPT
   ↓
INTERSECT
   ↓
EXCEPT vs ANTI JOIN
   ↓
INTERSECT vs INNER JOIN
   ↓
Combined Set Operations
   ↓
BFSI Case Studies
   ↓
Interview Questions

============================================================