



-- ::  Practice Question : 


/* ============================================================
SQL PRACTICE SET
BFSI + DATA ANALYST
============================================================

DATABASE: BFSI_Analytics

TABLES:
1. Branches
2. Customers
3. Accounts
4. Transactions
5. Loans
6. Credit_Cards*/

/*








============================================================
SECTION 1 — SELECT
============================================================




Q1. Display all columns from the Customers table.

Ans : SELECT * FROM Customers







Q2. Display customer_name, gender, age, city and state
    from the Customers table.

Ans : SELECT customer_name, gender, age, city , state FROM Customers








Q3. Display account_id, customer_id, account_type and balance
    from the Accounts table.

Ans :  SELECT account_id, customer_id, account_type ,balance FROM Accounts






Q4. Display loan_id, customer_id, loan_type, loan_amount
    and interest_rate from the Loans table.

Ans : SELECT loan_id, customer_id, loan_type, loan_amount,
      interest_rate FROM Loans





    */

/*============================================================
SECTION 2 — WHERE + COMPARISON OPERATORS
============================================================





Q5. Find customers whose annual income is greater than
   800000.

Ans: 

SELECT * FROM Customers
WHERE annual_income > 800000










Q6. Find customers whose age is less than 30.

Ans: 


SELECT * FROM Customers
WHERE age < 30









Q7. Find accounts whose balance is greater than or equal to
   300000.

Ans:

SELECT * FROM Accounts
WHERE balance >= 300000










Q8. Find loans whose interest rate is greater than 10%.

Ans: 

SELECT loan_id , loan_type , interest_rate FROM Loans
WHERE interest_rate > 10









Q9. Find customers whose annual income is greater than
   800000 and age is less than 35.

Ans: 


SELECT * FROM customers 
WHERE annual_income > 800000 and age < 35











Q10. Find loans where loan_amount is greater than 3000000
    OR interest_rate is greater than 10%.

Ans: 

SELECT * FROM loans
WHERE loan_amount > 3000000 OR interest_rate > 10









Q11. Find customers who are not in the 'Regular' segment.

Ans:

SELECT * FROM customers
WHERE customer_segment <> 'Regular'








*/


============================================================
SECTION 3 — AND / OR / NOT
============================================================




/*
Q12. Find customers from Haryana whose annual income is
    greater than 800000.

Ans: 

SELECT * FROM customers 
WHERE state = 'Haryana' and annual_income > 800000









Q13. Find customers from Delhi OR Haryana whose age is
    less than 30.

Ans: 

SELECT * FROM customers 
WHERE state = 'Delhi'  OR state = 'Haryana' and
age < 30









Q14. Find Premium customers whose annual income is greater
    than 1000000.

Ans: 

SELECT * FROM customers 
WHERE customer_segment = 'Premium' and annual_income > 1000000









Q15. Find loans that are NOT 'Home Loan' and whose
    loan_amount is greater than 1000000.

Ans: 

SELECT * FROM Loans
WHERE loan_type <> 'Home Loan' and loan_amount > 1000000








Q16. Find customers who satisfy all the following conditions:

    - State is Delhi OR Haryana
    - Age is between 25 and 40
    - Annual income is greater than 700000

Ans: 

SELECT * FROM customers
WHERE state = 'Delhi' OR state = 'Haryana'   AND    age > 25 and age < 40   AND  annual_income > 700000



*/






/*
============================================================
SECTION 4 — BETWEEN
============================================================





Q17. Find customers whose age is between 30 and 40.

Ans: 

SELECT * FROM customers 
WHERE age BETWEEN 30 and 40





Q18. Find customers whose annual income is between
    700000 and 1200000.

Ans: 

SELECT * FROM customers 
WHERE annual_income BETWEEN 700000 and 1200000










Q19. Find accounts whose balance is between
    100000 and 500000.

Ans: 

SELECT * FROM Accounts 
WHERE balance BETWEEN 100000 and 500000











Q20. Find loans whose loan_amount is between
    500000 and 3000000.

Ans: 

SELECT * FROM Loans 
WHERE loan_amount BETWEEN 500000 and 3000000










Q21. Find Premium customers whose annual income is between
    1000000 and 1500000.

Ans: 

SELECT * FROM customers 
WHERE customer_segment = 'Premium' AND
annual_income BETWEEN 1000000 and 1500000





*/







/*
============================================================
SECTION 5 — IN
============================================================


Q22. Find customers from Delhi, Haryana and Maharashtra.

Ans: 

SELECT * FROM customers 
WHERE state IN ('Delhi', 'Haryana', 'Maharashtra')










Q23. Find accounts whose account_type is either Savings
    or Current.

Ans: 

SELECT * FROM Accounts
WHERE account_type IN('Savings' , 'Current')





Q24. Find loans whose loan_type is one of:

    - Home Loan
    - Business Loan
    - Personal Loan


Ans:

SELECT * FROM Loans 
WHERE loan_type IN('Home loan' , 'Business Loan' , 'Personal Loan') 








Q25. Find customers from Delhi, Gurugram and Faridabad
    whose annual income is greater than 800000.

Ans: 

SELECT * FROM customers 
WHERE state IN('Delhi', 'Gurugram','Faridabad') AND
annual_income > 800000




*/








/*
============================================================
SECTION 6 — LIKE
============================================================







Q26. Find customers whose name starts with 'A'.

Ans: 

SELECT * FROM customers
WHERE customer_name LIKE 'A%'







Q27. Find customers whose name contains the letter 'a'.

Ans: 

SELECT * FROM customers 
WHERE customer_name LIKE '%a%'









Q28. Find customers whose occupation contains the word
    'Manager'.

Ans: 


SELECT * FROM customers 
WHERE occupation LIKE('%Manager%')









Q29. Find customers whose city starts with 'P'.

Ans: 

SELECT * FROM customers 
WHERE city LIKE 'P%'













Q30. Find customers whose name contains 'a' AND whose
    annual income is greater than 800000.

Ans: 


SELECT * FROM customers
WHERE customer_name LIKE '%a%' AND annual_income > 800000











*/









============================================================
SECTION 7 — DISTINCT
============================================================






Q31. Display all unique cities from the Customers table.

Ans: 

USE BFSI_Analytics
SELECT * FROM Customers

SELECT DISTINCT city FROM customers










Q32. Display all unique occupations.

Ans: 

SELECT DISTINCT occupation FROM Customers








Q33. Display all unique account types.

Ans: 

SELECT DISTINCT account_type FROM Accounts









Q34. Display all unique transaction channels.

Ans: 


SELECT DISTINCT transaction_type
FROM Transactions












Q35. Display all unique loan types.

Ans: 


SELECT DISTINCT loan_type
FROM Loans














Q36. Display all unique states in which the bank has customers.

Ans:


SELECT * FROM Customers

SELECT DISTINCT state
FROM Customers



























============================================================
SECTION 8 — ORDER BY
============================================================











Q37. Display customers in ascending order of annual income.

Ans: 

SELECT * FROM Customers 
ORDER BY annual_income ASC











Q38. Display customers in descending order of annual income.

Ans: 

SELECT * FROM Customers 
ORDER BY annual_income DESC













Q39. Display accounts from highest balance to lowest balance.

Ans: 



SELECT *
FROM Accounts
ORDER BY balance DESC













Q40. Display loans from highest interest rate to lowest
    interest rate.

Ans: 


SELECT * 
FROM Loans
ORDER BY interest_rate DESC











Q41. Display customers first by customer_segment in ascending
    order and then by annual_income in descending order.

Ans: 

SELECT * FROM Customers
ORDER BY customer_segment ASC , annual_income DESC


















============================================================
SECTION 9 — TOP
============================================================














Q42. Find the top 5 customers with the highest annual income.

Ans: 

SELECT TOP 5* FROM Customers
ORDER BY annual_income DESC
















Q43. Find the top 10 accounts with the highest balance.

Ans:  



SELECT TOP 10* FROM Accounts
ORDER BY balance DESC

















Q44. Find the top 5 largest loans based on loan_amount.

Ans: 


SELECT TOP 5* FROM Loans
ORDER BY loan_amount  DESC





















Q45. Find the top 3 credit cards with the highest
    outstanding_amount.

Ans: 

SELECT TOP 3* FROM Credit_Cards
ORDER BY outstanding_amount DESC












Q46. Find the top 5 high-income customers.

Ans: 

SELECT TOP 5* FROM Customers
ORDER BY annual_income DESC














============================================================
SECTION 10 — GROUP BY
============================================================







Q47. Find the number of customers in each city.

Ans:  

SELECT * FROM Customers

SELECT COUNT(customer_id) AS Total_Customer , city FROM Customers
GROUP BY city 
ORDER BY Total_Customer DESC













Q48. Find the number of customers in each state.

Ans: 


SELECT COUNT(customer_id) AS Total_Customer , state FROM Customers
GROUP BY state 
ORDER BY Total_Customer DESC














Q49. Find the number of customers in each customer segment.

Ans: 


SELECT COUNT(customer_id) AS Total_Customer , customer_segment FROM Customers
GROUP BY customer_segment 
ORDER BY Total_Customer DESC











Q50. Find the number of accounts for each account type.

Ans: 

SELECT * FROM Accounts

SELECT COUNT(account_id) As Total_Accounts , account_type FROM Accounts 
GROUP BY account_type 
ORDER BY Total_Accounts DESC













Q51. Find the average account balance for each account type.

Ans: 


SELECT AVG(balance) AS Avg_balance , account_type FROM Accounts
GROUP BY account_type 
ORDER BY Avg_balance







Q52. Find the average annual income for each city.

Ans: 

SELECT AVG(annual_income) AS Avg_income , city FROM Customers
GROUP BY city 
ORDER BY Avg_income















Q53. Find the total loan amount for each loan type.

Ans: 

SELECT * FROM Loans

SELECT SUM(loan_amount) AS Total_amount , loan_type FROM Loans
GROUP BY loan_type
ORDER BY Total_amount DESC














Q54. Find the average interest rate for each loan type.

Ans: 


SELECT * FROM Loans

SELECT AVG(interest_rate) AS Avg_interest,  loan_type FROM Loans
GROUP BY loan_type 
ORDER BY Avg_interest DESC

















============================================================
SECTION 11 — HAVING
============================================================










Q55. Find cities having more than 2 customers.

Ans: 

SELECT COUNT(customer_id) AS Total_Customers , city FROM Customers
GROUP BY city 
ORDER BY Total_Customers DESC













Q56. Find customer segments whose average annual income
    is greater than 800000.

Ans: 

SELECT * FROM Customers


SELECT customer_segment , AVG(annual_income) AS Avg_income FROM Customers
GROUP BY customer_segment 
HAVING AVG(annual_income) > 800000













Q57. Find loan types whose total loan amount is greater than
    5000000.

Ans: 

SELECT * FROM Loans


SELECT SUM(loan_amount) AS Total_Amount , loan_type FROM Loans
GROUP BY loan_type 
HAVING SUM(loan_amount) > 5000000






Q58. Find account types whose average balance is greater
    than 200000.

Ans: 


SELECT * FROM Accounts

SELECT AVG(balance) AS Avg_balance , account_type FROM Accounts
GROUP BY account_type 
HAVING AVG(balance) > 200000











Q59. Find states where:

    - At least 2 customers exist
    - Average annual income is greater than 800000

Ans: 


SELECT COUNT(customer_id) AS Total_Customers, AVG(annual_income) AS Avg_income , state FROM Customers
GROUP BY state
HAVING AVG(annual_income) > 800000 and COUNT(customer_id) >= 2





















============================================================
SECTION 12 — COMBINATION QUESTIONS
============================================================











Q60. Find the top 5 customers based on annual income.

Ans: 


SELECT TOP 5* FROM Customers
ORDER BY annual_income DESC








Q61. Find the top 3 highest-income customers from Haryana.

Ans:  


SELECT TOP 3* FROM Customers
WHERE state = 'Haryana'
ORDER BY annual_income DESC











Q62. Find the top 5 Premium customers whose annual income
    is greater than 1000000.

Ans: 


SELECT TOP 5* FROM Customers 
WHERE customer_segment = 'Premium' and annual_income > 1000000

















Q63. Find the customer count, average income, maximum income
    and minimum income for each customer segment.

Ans:  

SELECT COUNT(customer_id) AS Total_Customer ,  AVG(annual_income) AS Avg_income , MAX(annual_income) As Max_income , 
MIN(annual_income) As Min_income FROM Customers
GROUP BY customer_segment


















============================================================
SECTION 13 — BFSI DATA ANALYST CASE STUDIES
============================================================

Q64. Customer Segmentation Analysis

    For each customer segment, calculate:

    - Customer count
    - Average annual income
    - Maximum annual income
    - Minimum annual income

    Display only those segments where average annual income
    is greater than 800000.









Q65. Loan Portfolio Analysis

    For each loan type, calculate:

    - Number of loans
    - Total loan amount
    - Average loan amount
    - Average interest rate

    Display only loan types whose total loan exposure is
    greater than 5000000.


Q66. High-Value Customer Analysis

    Find Premium customers who satisfy all conditions:

    - Age >= 30
    - Annual income > 1000000
    - City is Delhi, Gurugram or Faridabad

    Sort the result by annual income from highest to lowest.


Q67. Transaction Channel Analysis

    For each transaction channel, calculate:

    - Number of transactions
    - Total transaction amount
    - Average transaction amount

    Display only channels whose total transaction amount
    is greater than 500000.


Q68. High-Interest Loan Analysis

    Find loans where:

    - Interest rate > 10%
    - Loan amount > 1000000

    Sort the result by loan amount from highest to lowest.





















============================================================
SECTION 14 — CHALLENGE QUESTIONS
============================================================

Q69. High-Income + High-Loan Customers

    Find customers whose:

    - Annual income > 1000000
    - Loan amount > 2000000

    Display:

    - customer_name
    - annual_income
    - loan_type
    - loan_amount
    - interest_rate


Q70. Loan Portfolio Concentration

    Calculate total loan amount for each loan type.

    Display only loan types whose total loan exposure is
    greater than 10000000.

    Sort by total loan exposure in descending order.


Q71. Premium Customer Banking Profile

    Find customers who satisfy all conditions:

    - Customer segment = Premium
    - Annual income > 1000000
    - Account balance > 300000
    - Credit card outstanding amount > 75000

    Display:

    - customer_name
    - annual_income
    - balance
    - credit_limit
    - outstanding_amount












































































============================================================
DIFFICULTY PROGRESSION
============================================================

LEVEL 1 — BASIC
Q1 - Q4

LEVEL 2 — FILTERING
Q5 - Q30

LEVEL 3 — DISTINCT / SORTING / TOP
Q31 - Q46

LEVEL 4 — AGGREGATION
Q47 - Q59

LEVEL 5 — ANALYTICAL SQL
Q60 - Q68

LEVEL 6 — BFSI INTERVIEW CHALLENGE
Q69 - Q71


============================================================
TOPICS COVERED
============================================================

SELECT
WHERE
Comparison Operators
AND
OR
NOT
BETWEEN
IN
LIKE
ORDER BY
DISTINCT
TOP
GROUP BY
HAVING

COMBINATIONS:
SELECT + WHERE
WHERE + AND
WHERE + OR
WHERE + BETWEEN
WHERE + IN
WHERE + LIKE
WHERE + ORDER BY
TOP + WHERE + ORDER BY
GROUP BY + Aggregate Functions
GROUP BY + HAVING
Multiple SQL concepts together


============================================================
IMPORTANT
============================================================

Q1-Q59:
No JOIN required.

Q60-Q68:
Combination and analytical thinking.

Q69-Q71:
JOIN will be required.

Do not look at solutions while solving.
First attempt every question independently.
============================================================
*/