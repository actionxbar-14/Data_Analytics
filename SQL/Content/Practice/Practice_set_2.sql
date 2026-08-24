




============================================================
SQL JOIN PRACTICE SET
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



























============================================================
SECTION 1 — BASIC JOINS
============================================================












------------------------------------------------------------
A. INNER JOIN
------------------------------------------------------------











Q1. Display customer names along with their account IDs.

    Output:
    - customer_name
    - account_id


Ans:


SELECT c.customer_name , 
a.account_id
FROM Customers c 
INNER JOIN 
Accounts a ON
c.customer_id = a.customer_id




















Q2. Display customer names along with their account type
    and account balance.

Ans: 


SELECT c.customer_name , 
a.account_type , 
a.balance 
FROM Customers c 
INNER JOIN 
Accounts a ON 
c.customer_id = a.customer_id



















Q3. Display customer names along with their branch names.

Ans: 


SELECT * FROM Customers
SELECT * FROM Branches



SELECT c.customer_name , 
b.branch_name  
FROM Customers c 
INNER JOIN 
Branches b ON 
c.branch_id = b.branch_id















Q4. Display customer names and their loan details.

    Output:
    - customer_name
    - loan_type
    - loan_amount
    - interest_rate

Ans: 

SELECT * FROM Customers 

SELECT * FROM Loans



SELECT c.customer_name , 
l.loan_type , 
l.loan_amount , 
l.interest_rate
FROM Customers c 
INNER JOIN 
Loans l ON 
c.customer_id = l.customer_id 
ORDER BY loan_amount DESC


















Q5. Display customer names along with their credit card
    type and credit limit.

Ans:  



SELECT 
      c.customer_name ,
      cc.card_type , 
      cc.credit_limit 
FROM Customers AS c
INNER JOIN 
Credit_Cards AS cc
ON
c.customer_id = cc.customer_id














Q6. Display transaction details along with the customer name.

    Output:
    - transaction_id
    - customer_name
    - transaction_date
    - transaction_type
    - amount

Ans: 



SELECT * FROM Customers

SELECT * FROM Transactions

SELECT * FROM Accounts


SELECT 
      t.transaction_id ,
      c.customer_name , 
      t.transaction_date , 
      t.transaction_type , 
      t.amount 
FROM Customers AS c 
INNER JOIN 
Accounts  AS a ON
c.customer_id = a.customer_id 
INNER JOIN
Transactions AS t ON 
t.account_id = a.account_id









Q7. Display customers who have an account with the bank.

Ans: 


SELECT * FROM Customers

SELECT * FROM Accounts

SELECT 
     c.customer_id , 
     c.customer_name , 
     a.account_id  , 
     a.balance
FROM Customers AS c 
INNER JOIN 
Accounts AS a ON 
c.customer_id = a.customer_id









Q8. Display customers who have taken a loan from the bank.

Ans: 


SELECT 
     c.customer_id , 
     c.customer_name , 
     l.loan_id , 
     l.loan_amount 
FROM Customers AS c 
INNER JOIN 
Loans As l ON
c.customer_id = l.customer_id 










Q9. Display customers who have a credit card.

Ans: 


SELECT * FROM Credit_Cards

SELECT 
     c.customer_id , 
     c.customer_name , 
     cc.card_id , 
     cc.credit_limit 
FROM Customers AS c 
INNER JOIN 
Credit_Cards As cc ON
c.customer_id = cc.customer_id 















Q10. Display customers along with their branch city and
     branch manager name.


Ans: 

SELECT * FROM Customers

SELECT * FROM Branches


SELECT 
     c.customer_id ,
     c.customer_name , 
     b.city ,
     b.manager_name 
FROM Customers As c 
LEFT JOIN 
Branches As b ON 
c.branch_id = b.branch_id













------------------------------------------------------------
B. LEFT JOIN
------------------------------------------------------------





Q11. Display all customers along with their account details.

     Include customers even if they do not have an account.

Ans: 


SELECT * FROM Customers

SELECT * FROM Accounts


SELECT  
      c.customer_id ,
      c.customer_name , 
      a.account_type , 
      a.balance 
FROM Customers As c 
LEFT JOIN 
Accounts As a ON 
c.customer_id = a.customer_id










Q12. Display all customers along with their loan details.

     Include customers even if they have not taken a loan.

Ans: 

SELECT * FROM Loans

SELECT  
      c.customer_id ,
      c.customer_name , 
      l.loan_type , 
      l.loan_amount 
FROM Customers As c 
LEFT JOIN 
Loans As l ON 
c.customer_id = l.customer_id











Q13. Display all customers along with their credit card details.

     Include customers even if they do not have a credit card.


Ans: 

SELECT * FROM Credit_Cards

SELECT  
      c.customer_id ,
      c.customer_name , 
      cc.card_type , 
      cc.credit_limit 
FROM Customers As c 
LEFT JOIN 
Credit_Cards As cc ON 
c.customer_id = cc.customer_id



















Q14. Display all branches and their customers.

     Include branches even if no customer is associated
     with them.

Ans:



SELECT * FROM Customers


SELECT * FROM Branches



SELECT 
     b.branch_id ,
     b.branch_name , 
     c.customer_name , 
     c.annual_income  
FROM Branches AS b 
LEFT JOIN 
Customers AS c ON 
b.branch_id = c.branch_id 












Q15. Display all customers with their account balance.

     If a customer does not have an account, their account
     information should still be visible as NULL.


Ans: 

SELECT * FROM Customers 

SELECT * FROM Accounts


SELECT 
     c.customer_id ,
     c.customer_name , 
     a.account_type ,
     a.balance 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id





















------------------------------------------------------------
C. RIGHT JOIN
------------------------------------------------------------





Q16. Display all customers and their accounts using
     RIGHT JOIN.

     Understand which tables records are preserved.


Q17. Display all branches and their customers using
     RIGHT JOIN.


Q18. Display all customers and their loans using
     RIGHT JOIN.


Q19. Display all branches and their customers using
     RIGHT JOIN and identify branches that may not have
     customers.


------------------------------------------------------------
D. FULL OUTER JOIN
------------------------------------------------------------

Q20. Display all customers and all accounts using
     FULL OUTER JOIN.


Q21. Display all customers and all loans using
     FULL OUTER JOIN.


Q22. Display all branches and all customers using
     FULL OUTER JOIN.


Q23. Compare customers and loans using FULL OUTER JOIN.

     Identify:
     - Customers having loans
     - Customers without loans
     - Loan records without matching customers


















============================================================
SECTION 2 — ADVANCED JOINS
============================================================

------------------------------------------------------------
A. LEFT ANTI JOIN
------------------------------------------------------------

Note:

SQL Server does not have a keyword called
"LEFT ANTI JOIN".

Usually we implement it using:

    LEFT JOIN
    +
    WHERE right_table.key IS NULL


Q24. Find customers who do NOT have any loan.


Q25. Find customers who do NOT have a credit card.


Q26. Find customers who do NOT have an account.


Q27. Find branches that do NOT have any customers.


Q28. Find customers who have an account but do NOT have
     a credit card.


------------------------------------------------------------
B. RIGHT ANTI JOIN
------------------------------------------------------------

Q29. Find accounts that do not have a matching customer.


Q30. Find loans that do not have a matching customer.


Q31. Find credit cards that do not have a matching customer.


Q32. Find branches that do not have matching customers.


------------------------------------------------------------
C. ALTERNATIVE INNER JOIN
------------------------------------------------------------

Instead of using INNER JOIN, solve the following questions
using alternative techniques wherever logically possible.

Q33. Find customers who have at least one account.

     Try solving using EXISTS.


Q34. Find customers who have at least one loan.

     Try solving using EXISTS.


Q35. Find customers who have a credit card.

     Try solving using EXISTS.


Q36. Find customers who have both an account and a loan.


Q37. Find customers who have an account with balance
     greater than 300000.


============================================================
SECTION 3 — FULL ANTI JOIN
============================================================

Note:

SQL Server does not have a direct FULL ANTI JOIN keyword.

It can be simulated using:

    FULL OUTER JOIN
    +
    WHERE left_key IS NULL
       OR right_key IS NULL


Q38. Find customers who do not have a corresponding loan
     AND loan records that do not have a corresponding
     customer.


Q39. Find customers and loans that do not have matching
     records.


Q40. Find unmatched records between Customers and Accounts.


============================================================
SECTION 4 — CROSS JOIN
============================================================

Q41. Generate every possible combination of customers
     and branches.

Q42. Generate every possible combination of account types
     and branch types.

Q43. Generate every possible combination of loan types
     and branch types.


BFSI BUSINESS QUESTION:

Q44. Management wants to evaluate every possible combination
     of customer segment and account type.

     Generate all possible combinations using CROSS JOIN.


Q45. Generate every possible combination of:

     - Customer segment
     - Loan type

     Do not use customer transaction data.


============================================================
SECTION 5 — MULTIPLE TABLE JOINS
============================================================

Q46. Display customer name, account type, account balance
     and branch name.

     Tables:
     Customers
     Accounts
     Branches


Q47. Display customer name, loan type, loan amount and
     branch name.

     Tables:
     Customers
     Loans
     Branches


Q48. Display customer name, account balance and transaction
     details.

     Tables:
     Customers
     Accounts
     Transactions


Q49. Display customer name, loan details and credit card
     details.

     Tables:
     Customers
     Loans
     Credit_Cards


Q50. Display customer name, account balance, loan amount
     and credit card outstanding amount.

     Tables:
     Customers
     Accounts
     Loans
     Credit_Cards


============================================================
SECTION 6 — 4 TABLE JOINS
============================================================

Q51. Display the following:

     - Customer Name
     - Account ID
     - Account Type
     - Account Balance
     - Transaction ID
     - Transaction Date
     - Transaction Type
     - Transaction Amount

     Tables:

     Customers
        ↓
     Accounts
        ↓
     Transactions


Q52. Display:

     - Customer Name
     - City
     - Branch Name
     - Account Type
     - Account Balance

     Tables:

     Customers
     Accounts
     Branches


Q53. Display:

     - Customer Name
     - Branch Name
     - Account Balance
     - Loan Type
     - Loan Amount

     Tables:

     Customers
     Branches
     Accounts
     Loans


Q54. Display:

     - Customer Name
     - Account Balance
     - Transaction Amount
     - Transaction Channel
     - Branch Name

     Tables:

     Customers
     Accounts
     Transactions
     Branches


Q55. Display:

     - Customer Name
     - Branch Name
     - Account Balance
     - Loan Amount
     - Credit Card Limit

     Tables:

     Customers
     Branches
     Accounts
     Loans
     Credit_Cards


============================================================
SECTION 7 — JOIN + WHERE
============================================================

Q56. Find customers whose account balance is greater
     than 300000.

     Display:
     - customer_name
     - account_type
     - balance


Q57. Find customers who have taken a Home Loan.

     Display:
     - customer_name
     - loan_amount
     - interest_rate


Q58. Find Premium customers whose account balance is
     greater than 300000.


Q59. Find customers from Haryana who have taken a
     Business Loan.


Q60. Find customers whose credit card outstanding amount
     is greater than 75000.


============================================================
SECTION 8 — JOIN + GROUP BY
============================================================

Q61. Find the number of customers in each branch.

     Output:
     - branch_name
     - customer_count


Q62. Find the total account balance for each branch.


Q63. Find the average account balance for each branch.


Q64. Find the total loan amount handled by each branch.


Q65. Find the number of loans for each branch.


Q66. Find the total transaction amount for each branch.


Q67. Find the average transaction amount for each branch.


============================================================
SECTION 9 — JOIN + GROUP BY + HAVING
============================================================

Q68. Find branches having more than 2 customers.


Q69. Find branches whose total account balance is greater
     than 1000000.


Q70. Find branches whose total loan amount is greater
     than 5000000.


Q71. Find customer segments whose total account balance
     is greater than 1000000.


============================================================
SECTION 10 — BFSI DATA ANALYST CASE STUDIES
============================================================

Q72. Customer Banking Profile

     For every customer, display:

     - Customer Name
     - City
     - Account Type
     - Account Balance
     - Loan Type
     - Loan Amount
     - Credit Card Limit
     - Credit Card Outstanding


Q73. Branch Performance Analysis

     For every branch calculate:

     - Number of customers
     - Total account balance
     - Total loan amount
     - Number of loans


Q74. High-Value Customer Identification

     Find customers who satisfy ALL conditions:

     - Premium segment
     - Annual income > 1000000
     - Account balance > 300000
     - Loan amount > 2000000


Q75. Customer Credit Exposure

     Calculate each customers:

     - Account balance
     - Total loan amount
     - Credit card outstanding amount


Q76. High-Risk Customer Analysis

     Find customers who have:

     - Loan interest rate > 10%
     - Credit card outstanding > 75000


Q77. Branch Loan Portfolio

     For each branch calculate:

     - Number of loans
     - Total loan amount
     - Average loan amount
     - Average interest rate

     Sort branches by total loan amount descending.


Q78. Transaction Analysis by Customer

     For every customer calculate:

     - Number of transactions
     - Total transaction amount
     - Average transaction amount

     Sort customers by total transaction amount
     from highest to lowest.


============================================================
SECTION 11 — HIGH-LEVEL JOIN CHALLENGES
============================================================

Q79. Identify customers who have:

     - No credit card
     - At least one account

     Display:
     - customer_name
     - account_type
     - balance


Q80. Identify customers who have:

     - An account
     - A loan
     - But no credit card


Q81. Identify Premium customers who have:

     - Account balance > 300000
     - Loan amount > 2000000
     - Credit card outstanding > 75000


Q82. Find the top 5 customers based on combined financial
     exposure.

     Consider:

     Account Balance
     +
     Loan Amount
     +
     Credit Card Outstanding


Q83. Find branches having:

     - More than 2 customers
     - Total account balance > 1000000
     - Total loan amount > 5000000


============================================================
SECTION 12 — INTERVIEW-STYLE CHALLENGES
============================================================

Q84. Find customers who have an account but have never
     performed a transaction.

     Hint:
     Think about LEFT ANTI JOIN.


Q85. Find customers who have a loan but do not have
     a credit card.


Q86. Find customers who have both:

     - Savings Account
     - Personal Loan


Q87. Find customers who have:

     - Savings Account
     - Active Loan
     - Active Credit Card


Q88. Find the branch with the highest total loan exposure.


Q89. Find the branch with the highest total account balance.


Q90. Find the customer with the highest combined exposure:

     Account Balance
     +
     Loan Amount
     +
     Credit Card Outstanding










     



============================================================
DIFFICULTY PROGRESSION
============================================================

LEVEL 1 — BASIC JOIN
Q1 - Q23

LEVEL 2 — ADVANCED JOIN
Q24 - Q45

LEVEL 3 — MULTIPLE TABLE JOIN
Q46 - Q55

LEVEL 4 — JOIN + FILTERING
Q56 - Q60

LEVEL 5 — JOIN + AGGREGATION
Q61 - Q71

LEVEL 6 — BFSI DATA ANALYST CASE STUDIES
Q72 - Q78

LEVEL 7 — HIGH-LEVEL / INTERVIEW
Q79 - Q90


============================================================
JOIN CONCEPTS COVERED
============================================================

INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN

LEFT ANTI JOIN
RIGHT ANTI JOIN
FULL ANTI JOIN

EXISTS
CROSS JOIN

Multiple Table JOIN
3 Table JOIN
4 Table JOIN

JOIN + WHERE
JOIN + GROUP BY
JOIN + HAVING
JOIN + ORDER BY
JOIN + TOP

BFSI Customer Analytics
BFSI Account Analytics
BFSI Loan Analytics
BFSI Transaction Analytics
BFSI Credit Risk Analytics
BFSI Branch Performance Analytics


============================================================
IMPORTANT
============================================================

Q1-Q45:
Focus on understanding JOIN behavior.

Q46-Q55:
Focus on joining multiple tables.

Q56-Q71:
Focus on combining JOIN with filtering and aggregation.

Q72-Q90:
Solve these like Data Analyst interview/case-study questions.

Do not look at solutions while solving.
First write the JOIN logic yourself.
============================================================