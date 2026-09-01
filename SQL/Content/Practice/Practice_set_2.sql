




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








USE 
BFSI_Analytics


















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


Ans: 


SELECT 
     c.customer_id , 
     c.customer_name ,
     a.account_type ,
     a.balance 
FROM Customers As c 
RIGHT JOIN 
Accounts As a ON
c.customer_id = a.customer_id 







Q17. Display all branches and their customers using
     RIGHT JOIN.

Ans: 

SELECT 
      c.customer_id ,
      c.customer_name ,
      b.branch_name
FROM Customers As c 
RIGHT JOIN
Branches As b ON 
c.branch_id = b.branch_id










Q18. Display all customers and their loans using
     RIGHT JOIN.

Ans: 

SELECT * FROM Loans

SELECT
      c.customer_id , 
      c.customer_name , 
      l.loan_type ,
      l.loan_amount 
FROM Customers As c 
RIGHT JOIN 
Loans As l ON 
c.customer_id = l.customer_id









Q19. Display all branches and their customers using
     RIGHT JOIN and identify branches that may not have
     customers.

Ans:


SELECT 
      c.customer_id ,
      c.customer_name ,
      b.branch_name , 
      b.state
FROM Customers As c 
RIGHT JOIN 
Branches As b ON 
c.branch_id = b.branch_id
















------------------------------------------------------------
D. FULL OUTER JOIN
------------------------------------------------------------






Q20. Display all customers and all accounts using
     FULL OUTER JOIN.

Ans: 

SELECT 
     c.customer_id , 
     c.customer_name ,
     a.account_type ,
     a.balance
FROM Customers As c 
FULL JOIN 
Accounts As a ON 
c.customer_id = a.customer_id











Q21. Display all customers and all loans using
     FULL OUTER JOIN.

Ans: 


SELECT 
      c.customer_id , 
      c.customer_name , 
      l.loan_type , 
      l.loan_type
FROM Customers As c 
FULL JOIN 
Loans As l ON 
c.customer_id = l.customer_id








Q22. Display all branches and all customers using
     FULL OUTER JOIN.

Ans: 

SELECT 
      b.branch_id , 
      b.branch_name ,
      c.customer_name ,
      c.annual_income
FROM Branches As b 
FULL JOIN 
Customers As c ON 
b.branch_id = c.branch_id











Q23. Compare customers and loans using FULL OUTER JOIN.

     Identify:
     - Customers having loans
     - Customers without loans
     - Loan records without matching customers


Ans: 

SELECT 
      c.customer_id ,
      c.customer_name , 
      l.loan_type,
      l.loan_amount 
FROM Customers As c 
FULL JOIN
Loans As l 
ON 
c.customer_id = l.customer_id




















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

Ans: 

SELECT * FROM Customers
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
 WHERE l.customer_id IS NULL






Q25. Find customers who do NOT have a credit card.

Ans: 

SELECT * FROM Customers
SELECT * FROM Credit_Cards


SELECT 
     c.customer_id ,
     c.customer_name , 
     cc.card_type, 
     cc.credit_limit
FROM Customers c 
LEFT JOIN  
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id 
WHERE cc.customer_id  IS NULL












Q26. Find customers who do NOT have an account.

Ans: 


SELECT * FROM Customers
SELECT * FROM Accounts

SELECT 
     c.customer_id,
     c.customer_name ,
     a.account_type , 
     a.balance
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id
WHERE a.customer_id IS NULL









Q27. Find branches that do NOT have any customers.


Ans: 


SELECT * FROM Branches
SELECT * FROM Customers


SELECT 
      b.branch_id , 
      b.branch_name ,
      c.customer_name ,
      c.annual_income 
FROM Branches As b 
LEFT JOIN 
Customers As c 
ON 
b.branch_id = c.branch_id
WHERE c.branch_id IS NULL








Q28. Find customers who have an account but do NOT have
     a credit card.

Ans: 

SELECT * FROM Customers
SELECT * FROM Accounts 
SELECT * FROM Credit_Cards


SELECT 
     c.customer_id,
     c.customer_name,
     a.account_type,
     a.balance ,
     cc.card_type,
     cc.credit_limit 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id 
WHERE cc.customer_id IS NULL
















------------------------------------------------------------
B. RIGHT ANTI JOIN
------------------------------------------------------------







Q29. Find accounts that do not have a matching customer.

Ans: 


SELECT 
     a.account_id ,
     a.account_type , 
     a.balance ,
     c.customer_name ,
     c.annual_income
FROM Accounts As a 
LEFT JOIN 
Customers As c   
On 
a.customer_id = c.customer_id 
WHERE c.customer_id IS NULL




Q30. Find loans that do not have a matching customer.

Ans: 

SELECT  
      l.loan_id ,
      l.loan_type ,
      c.customer_name,
      c.annual_income 
FROM Loans as l 
LEFT JOIN 
Customers as c 
ON 
l.customer_id = c.customer_id 
WHERE c.customer_id IS NULL






Q31. Find credit cards that do not have a matching customer.

Ans: 


SELECT 
      cc.card_id , 
      cc.card_type ,
      c.customer_name , 
      c.annual_income 
FROM Credit_Cards As cc 
LEFT JOIN 
Customers As c 
ON 
cc.customer_id = c.customer_id 
WHERE c.customer_id IS NULL








Q32. Find branches that do not have matching customers.

Ans: 

SELECT 
      b.branch_id ,
      b.branch_name ,
      c.customer_name, 
      c.annual_income 
FROM Branches As b 
LEFT JOIN 
Customers As c 
ON 
b.branch_id = c.branch_id 
WHERE c.customer_id IS NULL











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

Ans: 



SELECT * FROM Customers 
SELECT * FROM Loans




SELECT
      c.customer_id , 
      c.customer_name ,
      l.loan_type,
      l.loan_amount 
FROM Customers AS c 
FULL JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
WHERE c.customer_id IS NULL OR l.customer_id IS NULL











Q39. Find customers and loans that do not have matching
     records.

Ans: 




SELECT
      c.customer_id , 
      c.customer_name ,
      l.loan_type,
      l.loan_amount 
FROM Customers AS c 
FULL JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
WHERE c.customer_id IS NULL OR l.customer_id IS NULL







Q40. Find unmatched records between Customers and Accounts.

Ans: 


SELECT
      c.customer_id , 
      c.customer_name ,
      a.account_type,
      a.balance 
FROM Customers AS c 
FULL JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id 
WHERE c.customer_id IS NULL OR a.customer_id IS NULL














============================================================
SECTION 4 — CROSS JOIN
============================================================







Q41. Generate every possible combination of customers
     and branches.

Ans: 

SELECT 
      c.customer_id , 
      c.customer_name , 
      b.branch_name ,
      b.city 
FROM Customers As c
CROSS JOIN 
Branches As b 










Q42. Generate every possible combination of account types
     and branch types.

Ans: 

SELECT 
      c.customer_id , 
      c.customer_name , 
      a.account_type ,
      a.balance 
FROM Customers As c
CROSS JOIN 
Accounts As a









Q43. Generate every possible combination of loan types
     and branch types.


Ans: 

SELECT * FROM Loans 

SELECT * FROM Branches
   

SELECT 
     l.loan_type,
     l.loan_amount ,
     b.branch_name ,
     b.city 
FROM loans As l 
CROSS JOIN 
Branches As b


















BFSI BUSINESS QUESTION:







Q44. Management wants to evaluate every possible combination
     of customer segment and account type.

     Generate all possible combinations using CROSS JOIN.


Ans: 

SELECT 
      c.customer_id,
      c.customer_name , 
      a.account_type ,
      a.balance 
FROM Customers As c 
CROSS JOIN 
Accounts As a 






Q45. Generate every possible combination of:

     - Customer segment
     - Loan type

     Do not use customer transaction data.


Ans: 

SELECT 
      c.customer_id , 
      c.customer_name ,
      l.loan_type ,
      l.loan_amount 
FROM Customers As c 
CROSS JOIN 
Loans As l





























============================================================
SECTION 5 — MULTIPLE TABLE JOINS
============================================================








Q46. Display customer name, account type, account balance
     and branch name.

     Tables:
     Customers
     Accounts
     Branches

Ans: 

SELECT * FROM Customers
SELECT * FROM Accounts 
SELECT * FROM Branches


 SELECT 
       c.customer_name , 
       a.account_type,
       a.balance,
       b.branch_name 
FROM Customers As c 
INNER JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
INNER JOIN 
Branches As b 
ON
a.branch_id = b.branch_id









Q47. Display customer name, loan type, loan amount and
     branch name.

     Tables:
     Customers
     Loans
     Branches

Ans: 



 SELECT 
       c.customer_name , 
       l.loan_type,
       l.loan_amount,
       b.branch_name 
FROM Customers As c 
INNER JOIN 
Loans As l
ON 
c.customer_id = l.customer_id 
INNER JOIN 
Branches As b 
ON
c.branch_id = b.branch_id












Q48. Display customer name, account balance and transaction
     details.

     Tables:
     Customers
     Accounts
     Transactions

Ans: 

SELECT * FROM Transactions


 SELECT 
       c.customer_name , 
       a.account_type,
       a.balance,
       t.transaction_type 
FROM Customers As c 
INNER JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
INNER JOIN 
Transactions As t
ON
a.account_id = t.account_id










Q49. Display customer name, loan details and credit card
     details.

     Tables:
     Customers
     Loans
     Credit_Cards


Ans: 


SELECT * FROM Credit_Cards



 SELECT 
       c.customer_name , 
       l.loan_type,
       cc.card_type,
       cc.credit_limit
FROM Customers As c 
INNER JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
INNER JOIN 
Credit_Cards As cc
ON
c.customer_id = cc.customer_id














Q50. Display customer name, account balance, loan amount
     and credit card outstanding amount.

     Tables:
     Customers
     Accounts
     Loans
     Credit_Cards


Ans: 


SELECT * FROM Credit_Cards
SELECT * FROM Loans



 SELECT 
       c.customer_name , 
       a.account_type,
       l.loan_type,
       l.loan_amount,
       cc.card_type,
       cc.credit_limit
FROM Customers As c 
INNER JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
INNER JOIN 
Loans As l 
ON
a.customer_id = l.customer_id
INNER JOIN 
Credit_Cards As cc 
ON
c.customer_id = cc.customer_id



























============================================================
SECTION 7 — JOIN + WHERE
============================================================








Q56. Find customers whose account balance is greater
     than 300000.

     Display:
     - customer_name
     - account_type
     - balance

Ans: 


SELECT 
     c.customer_id ,
     a.account_type ,
     a.balance 
FROM Customers As c 
LEFT JOIN
Accounts As a 
ON 
c.customer_id = a.customer_id 
WHERE balance > 300000










Q57. Find customers who have taken a Home Loan.

     Display:
     - customer_name
     - loan_amount
     - interest_rate

Ans: 


SELECT 
      c.customer_name ,
      l.loan_type,
      l.loan_amount,
      l.interest_rate
FROM Customers As c 
LEFT JOIN
Loans As l 
ON 
c.customer_id = l.customer_id










Q58. Find Premium customers whose account balance is
     greater than 300000.

Ans: 

SELECT 
      c.customer_id ,
      c.customer_name , 
      a.account_type,
      c.customer_segment,
      a.balance   
FROM Customers As c
LEFT JOIN
Accounts As a
ON 
c.customer_id = a.customer_id 
WHERE c.customer_segment = 'Premium' AND
a.balance > 300000
















Q59. Find customers from Haryana who have taken a
     Business Loan.

Ans: 


SELECT 
      c.customer_id ,
      c.customer_name ,
      c.state ,
      l.loan_type,
      c.customer_segment
FROM Customers As c 
LEFT JOIN
Loans As l 
ON 
c.customer_id = l.customer_id 
WHERE c.state = 'Haryana' AND 
l.loan_type = 'Business Loan'












Q60. Find customers whose credit card outstanding amount
     is greater than 75000.

Ans: 

SELECT 
      c.customer_id ,
      c.customer_name ,
      cc.card_type ,
      cc.outstanding_amount 
FROM Customers As c 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
WHERE cc.outstanding_amount > 75000














============================================================
SECTION 8 — JOIN + GROUP BY
============================================================







Q61. Find the number of customers in each branch.

     Output:
     - branch_name
     - customer_count

Ans: 

SELECT 
      COUNT(c.customer_id) As Customer_count,
      b.branch_name 
FROM Customers As c 
LEFT JOIN 
Branches As b 
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name







Q62. Find the total account balance for each branch.

Ans: 



SELECT * FROM Accounts
SELECT * FROM Branches

SELECT 
      SUM(a.balance) As Total_balance,
      b.branch_name 
FROM Accounts As a 
LEFT JOIN 
Branches As b 
ON 
a.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY SUM(a.balance) DESC






Q63. Find the average account balance for each branch.

Ans: 



SELECT 
      AVG(a.balance) As Avg_balance,
      b.branch_name 
FROM Accounts As a 
LEFT JOIN 
Branches As b 
ON 
a.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY SUM(a.balance) DESC












Q64. Find the total loan amount handled by each branch.


SELECT * FROM Loans
SELECT * FROM Branches
SELECT * FROM Customers


Ans: 


SELECT 
      SUM(l.loan_amount) As Total_loan_amount,
      b.branch_name 
FROM Loans As l 
LEFT JOIN 
Customers As c 
ON 
l.customer_id = c.customer_id
LEFT JOIN 
Branches As b
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name















Q65. Find the number of loans for each branch.

Ans: 

SELECT 
      COUNT(l.loan_id) As Total_loans,
      b.branch_name 
FROM Loans As l 
LEFT JOIN 
Customers As c 
ON 
l.customer_id = c.customer_id
LEFT JOIN 
Branches As b
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name





Q66. Find the total transaction amount for each branch.

SELECT * FROM Transactions
SELECT * FROM Branches 
SELECT * FROM Accounts




SELECT 
      SUM(t.amount) as Total_transaction_amount ,
      b.branch_name 
FROM Transactions as t 
LEFT JOIN
Accounts As a 
ON 
t.account_id = a.account_id 
LEFT JOIN 
Branches As b  
ON 
b.branch_id = a.branch_id
GROUP BY b.branch_name













Q67. Find the average transaction amount for each branch.

Ans: 



SELECT 
      AVG(t.amount) as Total_transaction_amount ,
      b.branch_name 
FROM Transactions as t 
LEFT JOIN
Accounts As a 
ON 
t.account_id = a.account_id 
LEFT JOIN 
Branches As b  
ON 
b.branch_id = a.branch_id
GROUP BY b.branch_name

















============================================================
SECTION 9 — JOIN + GROUP BY + HAVING
============================================================





Q68. Find branches having more than 2 customers.

Ans: 


SELECT 
      COUNT(c.customer_id) As No_of_Customers,
      b.branch_name 
FROM Customers As c 
LEFT JOIN 
Branches As b 
ON 
c.branch_id = b.branch_id 
GROUP BY branch_name
HAVING COUNT(c.customer_id) > 2









Q69. Find branches whose total account balance is greater
     than 1000000.

Ans: 



SELECT 
      SUM(a.balance) As Total_balance ,
      b.branch_name
FROM Accounts As a 
LEFT JOIN 
Branches as b 
ON 
a.branch_id = b.branch_id
GROUP BY b.branch_name
HAVING SUM(a.balance) > 1000000













Q70. Find branches whose total loan amount is greater
     than 5000000.

Ans: 


SELECT 
      SUM(l.loan_amount) As Total_loan_amount ,
      b.branch_name 
FROM Loans As l
LEFT JOIN 
Customers As c 
On 
l.customer_id = c.customer_id 
LEFT JOIN 
Branches As b 
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name








Q71. Find customer segments whose total account balance
     is greater than 1000000.


Ans: 


SELECT 
      SUM(a.balance) As Account_balance,
      c.customer_segment 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id
GROUP BY c.customer_segment 
HAVING SUM(a.balance) > 1000000






















============================================================
SECTION 10 — BFSI DATA ANALYST CASE STUDIES
============================================================

USE 
BFSI_Analytics







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

Ans: 



SELECT 
      c.customer_name ,
      c.city ,
      a.account_type ,
      a.balance ,
      l.loan_type ,
      l.loan_amount ,
      cc.credit_limit ,
      cc.outstanding_amount
FROM Customers As c 
FULL JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
FULL JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
FULL JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id


















Q73. Branch Performance Analysis

     For every branch calculate:

     - Number of customers
     - Total account balance
     - Total loan amount
     - Number of loans


Ans: 


SELECT 
      b.branch_name , 
      COUNT(c.customer_id) As Total_Customer ,
      SUM(a.balance) As Total_account_balance ,
      SUM(l.loan_amount) As Total_loan_amount ,
      COUNT(l.loan_id) As No_of_Loans    
FROM Customers As c 
LEFT JOIN 
Branches As b 
ON 
c.branch_id = b.branch_id 
LEFT JOIN 
Accounts As a 
ON 
a.branch_id = b.branch_id
LEFT JOIN
Loans As l 
ON
c.customer_id = l.customer_id 
GROUP BY b.branch_name
















Q74. High-Value Customer Identification

     Find customers who satisfy ALL conditions:

     - Premium segment
     - Annual income > 1000000
     - Account balance > 300000
     - Loan amount > 2000000

Ans: 



SELECT  
     c.customer_id  ,
     c.customer_name ,
     c.customer_segment , 
     c.occupation , 
     c.annual_income ,
     a.account_type ,
     a.balance ,
     l.loan_type , 
     l.loan_amount
FROM Customers As c
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Loans As l 
ON 
a.customer_id = l.customer_id 
WHERE 
c.customer_segment = 'Premium' 
AND
c.annual_income > 1000000 
AND 
a.balance > 300000
AND 
l.loan_amount > 2000000















Q75. Customer Credit Exposure

     Calculate each customers:

     - Account balance
     - Total loan amount
     - Credit card outstanding amount


Ans:



SELECT * FROM Customers 
SELECT * FROM Loans 
SELECT * FROM Accounts
SELECT * FROM Credit_Cards


SELECT 
     c.customer_name , 
     a.balance ,
     l.loan_amount As Total_loan_amount ,
     cc.outstanding_amount 
FROM Customers as c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id

















Q76. High-Risk Customer Analysis

     Find customers who have:

     - Loan interest rate > 10%
     - Credit card outstanding > 75000

Ans: 



SELECT * FROM Customers 
SELECT * FROM Loans 
SELECT * FROM Credit_Cards


SELECT 
      c.customer_name , 
      l.interest_rate ,
      cc.outstanding_amount 
FROM Customers As c 
LEFT JOIN 
Loans As l 
ON 
l.customer_id = c.customer_id 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id 
WHERE
l.interest_rate > 10 
AND 
cc.outstanding_amount > 75000
















Q77. Branch Loan Portfolio

     For each branch calculate:

     - Number of loans
     - Total loan amount
     - Average loan amount
     - Average interest rate

     Sort branches by total loan amount descending.


Ans: 


SELECT 
      b.branch_name ,
      COUNT(l.loan_id) As No_of_loans, 
      SUM(l.loan_amount) As Total_loan_amount ,
      AVG(l.loan_amount) As Avg_loan_amount ,
      AVG(l.interest_rate) As Avg_interest_rate 
FROM Branches As b 
LEFT JOIN 
Customers As c 
ON 
c.branch_id = b.branch_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
GROUP BY b.branch_name
ORDER BY Total_loan_amount DESC























Q78. Transaction Analysis by Customer

     For every customer calculate:

     - Number of transactions
     - Total transaction amount
     - Average transaction amount

     Sort customers by total transaction amount
     from highest to lowest.


Ans: 






SELECT * FROM Customers 
SELECT * FROM Accounts 
SELECT * FROM Transactions


SELECT 
      t.transaction_id ,
      COUNT(a.account_id) As No_of_transactions,
      c.customer_name ,
      SUM(t.amount) As Total_transaction_amount ,
      AVG(t.amount) As Avg_transaction_amount 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
On 
c.customer_id = a.customer_id 
LEFT JOIN 
Transactions As t 
ON 
a.account_id = t.account_id 
GROUP BY t.transaction_id , a.account_id , c.customer_name
ORDER BY Total_transaction_amount DESC























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


Ans: 



SELECT * FROM Customers
SELECT * FROM Credit_Cards
SELECT * FROM Accounts




SELECT  
      c.customer_name , 
      a.account_type ,
      a.balance,
      cc.card_id
FROM Customers As c 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id 
LEFT JOIN 
Accounts As a 
ON 
a.customer_id = c.customer_id 
WHERE cc.customer_id IS NULL











Q80. Identify customers who have:

     - An account
     - A loan
     - But no credit card

Ans: 



SELECT * FROM Loans
SELECT * FROM Credit_Cards
SELECT * FROM Accounts



SELECT  
      l.loan_type , 
      a.account_type ,
      a.balance,
      cc.card_id
FROM Loans As l
LEFT JOIN 
Credit_Cards As cc 
ON 
l.customer_id = cc.customer_id 
LEFT JOIN 
Accounts As a 
ON 
a.customer_id = l.customer_id 
WHERE cc.customer_id IS NULL














Q81. Identify Premium customers who have:

     - Account balance > 300000
     - Loan amount > 2000000
     - Credit card outstanding > 75000

Ans: 



SELECT * FROM Customers 
SELECT * FROM Accounts
SELECT * FROM Loans 
SELECT * FROM Credit_Cards





SELECT 
      c.customer_name , 
      c.customer_segment ,
      a.balance , 
      l.loan_amount ,
      cc.outstanding_amount,
      cc.card_id
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
WHERE customer_segment = 'Premium'














Q82. Find the top 5 customers based on combined financial
     exposure.

     Consider:

     Account Balance
     +
     Loan Amount
     +
     Credit Card Outstanding


Ans:



SELECT * FROM Customers 
SELECT * FROM Accounts 
SELECT * FROM Loans
SELECT * FROM Credit_Cards







SELECT 
    TOP(5)
     c.customer_name , 
     a.balance ,
     l.loan_amount ,
     cc.outstanding_amount 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
WHERE cc.outstanding_amount IS NOT NULL
ORDER BY a.balance DESC









Q83. Find branches having:

     - More than 2 customers
     - Total account balance > 1000000
     - Total loan amount > 5000000


Ans:


SELECT * FROM Customers 
SELECT * FROM Branches 
SELECT * FROM Accounts
SELECT * FROM Loans



SELECT 
     b.branch_name,
     COUNT(c.customer_id) As Total_Customers ,
     SUM(a.balance) As Total_Account_Balance , 
     SUM(loan_amount) As Total_loan_amount
FROM Customers As c 
LEFT JOIN 
Branches AS b 
ON 
c.branch_id = b.branch_id 
LEFT JOIN 
Accounts As a 
ON 
b.branch_id = a.branch_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
GROUP BY b.branch_name
HAVING COUNT(c.customer_id) > 2 
AND 
SUM(a.balance) > 1000000
AND 
SUM(loan_amount) > 5000000
























============================================================
SECTION 12 — INTERVIEW-STYLE CHALLENGES
============================================================












Q84. Find customers who have an account but have never
     performed a transaction.

     Hint:
     Think about LEFT ANTI JOIN.


Ans: 
  

SELECT * FROM Customers 
SELECT * FROM Accounts
SELECT * FROM Transactions


SELECT 
     c.customer_id , 
     c.customer_name , 
     a.balance , 
     t.transaction_id 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Transactions As t 
ON 
a.account_id = t.account_id 
WHERE t.transaction_id IS NULL






Q85. Find customers who have a loan but do not have
     a credit card.

Ans: 

SELECT * FROM Customers 
SELECT * FROM Loans 
SELECT * FROM Credit_Cards




SELECT 
     c.customer_id , 
     c.customer_name , 
     l.loan_type, 
     cc.card_id  
FROM Customers As c 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
LEFT JOIN 
Credit_Cards As cc
ON 
c.customer_id = cc.customer_id 
WHERE cc.customer_id IS NULL












Q86. Find customers who have both:

     - Savings Account
     - Personal Loan

Ans:


SELECT * FROM Customers 
SELECT * FROM Accounts
SELECT * FROM Loans




SELECT 
     c.customer_name , 
     a.account_type ,
     l.loan_type 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
WHERE a.account_type = 'Savings' 
AND 
l.loan_type = 'Personal Loan'












Q87. Find customers who have:

     - Savings Account
     - Active Loan
     - Active Credit Card


Ans: 



SELECT * FROM Customers 
SELECT * FROM Accounts
SELECT * FROM Loans
SELECT * FROM Credit_Cards




SELECT 
     c.customer_name , 
     a.account_type ,
     l.loan_type ,
     cc.card_type ,
     cc.card_id 
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
WHERE cc.card_id IS NOT NULL













Q88. Find the branch with the highest total loan exposure.


Ans: 


SELECT * FROM Customers
SELECT * FROM Branches 
SELECT * FROM Loans



SELECT 
     COUNT(c.customer_id)  As Total_Customers, 
     b.branch_name ,
     SUM(l.loan_amount) As Total_Loan_amount
FROM Customers As c 
LEFT JOIN 
Branches As b 
ON 
c.branch_id = b.branch_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
GROUP BY b.branch_name
ORDER BY SUM(l.loan_amount) DESC










Q89. Find the branch with the highest total account balance.


Ans:


SELECT * FROM Customers
SELECT * FROM Branches 
SELECT * FROM Accounts



SELECT 
     COUNT(c.customer_id)  As Total_Customers, 
     b.branch_name ,
     SUM(a.balance) As Total_Account_balance
FROM Customers As c 
LEFT JOIN 
Branches As b 
ON 
c.branch_id = b.branch_id 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id
GROUP BY b.branch_name
ORDER BY SUM(a.balance) DESC





















Q90. Find the customer with the highest combined exposure:

     Account Balance
     +
     Loan Amount
     +
     Credit Card Outstanding


Ans: 



SELECT * FROM Customers
SELECT * FROM Credit_Cards
SELECT * FROM Loans
SELECT * FROM Accounts



SELECT 
     c.customer_id , 
     c.customer_name ,
     a.balance ,
     l.loan_amount ,
     cc.outstanding_amount
FROM Customers As c 
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
WHERE cc.outstanding_amount IS NOT NULL
ORDER BY a.balance , l.loan_amount , cc.outstanding_amount DESC










     

