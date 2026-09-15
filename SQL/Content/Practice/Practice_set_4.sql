




============================================================
SQL PRACTICE SET – NULL HANDLING & LEFT ANTI JOIN
============================================================

Database:

USE
BFSI_NULL

Tables:
1. Branches
2. Customers
3. Accounts
4. Transactions
5. Loans
6. Credit_Cards








============================================================
1. HANDLE NULL – DATA AGGREGATION
============================================================

Topics:
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- NULL behaviour in aggregate functions
- COUNT(*) vs COUNT(column)
- ISNULL()
- COALESCE()





-------------------------
BASIC
-------------------------




Q1. Count the total number of customers.

Ans:

SELECT 
      COUNT(*) As Total_customer
FROM Customers








Q2. Count the number of customers whose annual_income is available
    (not NULL).

Ans:

SELECT 
     COUNT(*)  As Total_customers
FROM Customers
WHERE annual_income IS NOT NULL









Q3. Count the number of customers whose occupation is NULL.

Ans:

SELECT 
    COUNT(*) As No_of_Customers
FROM Customers
WHERE occupation IS NULL








Q4. Calculate the total annual income of all customers.

Ans:


SELECT 
      SUM(annual_income) As total_annual_income
FROM Customers









Q5. Calculate the average annual income of customers.

Ans:

SELECT 
     AVG(COALESCE(annual_income , 0)) As avg_annual_income
FROM Customers










Q6. Find the minimum and maximum annual income.

Ans:


SELECT 
      MIN(annual_income) As min_annnual_income,
      MAX(annual_income) As max_annnual_income
FROM Customers









Q7. Count the number of accounts whose balance is available.

Ans:

SELECT 
      COUNT(*) As Total_Accounts
FROM Accounts
WHERE balance IS NOT NULL









Q8. Calculate the total balance of all accounts.

Ans:


SELECT 
      SUM(balance) As Total_Balance 
FROM Accounts









Q9. Calculate the average account balance.

Ans:


SELECT 
     AVG(COALESCE(balance, 0)) As Avg_balance 
FROM Accounts






Q10. Count the number of loans where interest_rate is available.

Ans:


SELECT 
    COUNT(*) As interest_rate
FROM Loans
WHERE interest_rate IS NULL









-------------------------
MEDIUM
-------------------------







Q11. Compare COUNT(*) and COUNT(occupation) for Customers.

Ans:

SELECT 
     COUNT(*) as count_star,
     COUNT(occupation) as count_occupation 
FROM Customers










Q12. Find the number of customers in each state,
     considering only customers whose annual_income is NOT NULL.

Ans:

SELECT 
      state , 
      COUNT(customer_id) As Total_Customers
FROM Customers
WHERE annual_income IS NOT NULL
GROUP BY state










Q13. Calculate the average annual_income for each customer_segment.

Ans:

SELECT 
      customer_segment ,
      AVG(COALESCE(annual_income ,0)) As avg_annual_income
FROM Customers
GROUP BY customer_segment








Q14. Calculate the average loan_amount for each loan_type.

Ans:


SELECT 
     loan_type,
     AVG(COALESCE(loan_amount,0)) As avg_loan_amount
FROM Loans
GROUP BY loan_type










Q15. Calculate the total outstanding_amount for each card_type.

Ans:

SELECT 
      card_type ,
      SUM(outstanding_amount) As total_outstanding_amount 
FROM Credit_Cards
GROUP BY card_type








Q16. Find the average outstanding_amount for each card_type.

Ans:


SELECT 
      card_type ,
      AVG(COALESCE(outstanding_amount,0)) As AVG_outstanding_amount 
FROM Credit_Cards
GROUP BY card_type











Q17. Count customers by occupation, including customers
     where occupation is NULL.

Ans:

SELECT 
     COUNT(*) As customer_occupation
FROM Customers










Q18. Display the average annual_income by state and understand
     how NULL values affect the result.

Ans:


SELECT 
      AVG(annual_income) As Avg, 
      AVG(COALESCE(annual_income , 0)) As avg_annual_income,
      state
FROM Customers
GROUP BY state











Q19. Find the total transaction amount for each transaction_type.

Ans:


SELECT 
      transaction_type,
      SUM(amount) As total_transaction_amount
FROM Transactions
GROUP by transaction_type










Q20. Calculate the average transaction amount for each channel.


Ans:



SELECT 
      channel,
      AVG(COALESCE(amount , 0)) As transaction_amount
FROM Transactions
GROUP BY channel

















-------------------------
ADVANCED
-------------------------









Q21. Display customer_segment and average annual income.
     Replace NULL average income with 0.

Ans:


SELECT 
      customer_segment,
      AVG(COALESCE(annual_income,0)) As Avg_annual_income
FROM Customers
GROUP BY customer_segment









Q22. Calculate the average loan_amount by loan_status.
     Handle NULL loan_amount values properly.

Ans:

SELECT 
     loan_status,
     AVG(COALESCE(loan_amount , 0)) As Avg_loan_amount
FROM Loans
GROUP BY loan_status














Q23. Calculate the total outstanding amount for each customer.
     Customers without a credit card should also appear.

Ans:



SELECT 
     customer_id,
     outstanding_amount,
     SUM(outstanding_amount) OVER() As Total_outstanding_amount
FROM Credit_Cards









Q24. Count the number of credit cards per customer.
     Customers without cards should show 0.

Ans:



SELECT 
      customer_id ,
      count(card_id) OVER(PARTITION BY customer_id) As no_of_cards
FROM Credit_Cards







Q25. Calculate total account balance per customer.
     Customers without accounts should show 0.

Ans:


SELECT 
      customer_id,
      balance
FROM Accounts









Q26. Find customers whose total account balance is NULL
     after a LEFT JOIN and replace it with 0.


Ans:



SELECT 
      c.customer_id ,
      c.customer_name,
      COALESCE(a.balance , 0) as new_balance
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
WHERE a.balance IS NULL












Q27. Calculate total loan amount per customer.
     Customers without loans should show 0.

Ans:


SELECT 
      c.customer_id ,
      c.customer_name,
      l.loan_type,
      COALESCE(l.loan_amount,0) As new_loan_amount
FROM Customers As c
FULL JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id












Q28. Find the average transaction amount per account.
     Handle accounts that have no transactions.

Ans:



SELECT 
      a.account_id,
      t.transaction_id ,
      AVG(COALESCE(t.amount , 0)) OVER(PARTITION BY a.account_id) As Avg_transaction_amount    
FROM Accounts As a 
FULL JOIN 
Transactions As t 
ON 
a.account_id = t.account_id













Q29. Display each customer along with:
     - Customer Name
     - Total Account Balance
     - Total Loan Amount
     - Total Credit Card Outstanding

     Replace missing values with 0.



Ans:



SELECT 
     c.customer_name,
     COALESCE(a.balance,0) As new_balance,
     COALESCE(l.loan_amount,0) As loan_amount,
     COALESCE(cc.outstanding_amount,0) As outstanding_amount
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
































============================================================
2. HANDLE NULL – MATHEMATICAL OPERATORS
============================================================

Topics:
- NULL + number  = Gives NULL.
- NULL - number  = Gives NULL.
- NULL * number  = Gives NULL.
- NULL / number
- Arithmetic with NULL
- ISNULL()
- COALESCE()









-------------------------
BASIC
-------------------------



Q30. Display account_id and calculate:

     balance + 1000

     Check how NULL balance behaves.

Ans:


SELECT 
      account_id,
     ( balance + 1000 ) As new_balance
FROM Accounts









Q31. Display account_id and calculate:

     balance - 5000


Ans:


SELECT 
      account_id,
     ( balance - 1000 ) As new_balance
FROM Accounts







Q32. Display account_id and calculate:

     balance * 2


Ans:


SELECT 
      account_id,
     ( balance * 2 ) As new_balance
FROM Accounts






Q33. Display loan_id and calculate:

     loan_amount * 1.10


Ans:

SELECT 
      loan_id,
     ( loan_amount * 1.10 ) As new_balance
FROM Loans








Q34. Display credit card details and calculate:

     credit_limit - outstanding_amount


Ans:


SELECT 
      card_id,
     ( credit_limit - outstanding_amount ) As new_balance
FROM Credit_Cards















-------------------------
MEDIUM
-------------------------






Q35. Calculate the available credit for each credit card:

     credit_limit - outstanding_amount.

Ans:


SELECT 
     COALESCE(( credit_limit - outstanding_amount ),0) As available_credit
FROM Credit_Cards








Q36. Calculate the outstanding percentage:

     (outstanding_amount / credit_limit) * 100.

Ans:



SELECT 
   outstanding_amount ,
   credit_limit, 
   COALESCE(ROUND((NULLIF(outstanding_amount , 0) / credit_limit * 100 ),0),2)  As outstanding_percentage
FROM Credit_Cards










Q37. Calculate annual interest amount:

     loan_amount * interest_rate / 100.

Ans:


SELECT 
      COALESCE(( loan_amount * interest_rate / 100 ),0) As annual_interest_amount
FROM Loans








Q38. Calculate estimated monthly interest:

     loan_amount * interest_rate / 100 / 12

Ans:


SELECT 
      loan_id,
      COALESCE((loan_amount * interest_rate / 100 / 12),0) As estimated_interest
FROM Loans









Q39. Calculate remaining balance for each account after
     deducting a hypothetical charge of ₹1,000.

Ans:


SELECT 
     account_id,
     balance ,
     COALESCE(( balance - 1000 ),0) As remaining_balance 
FROM Accounts









Q40. Calculate transaction amount after applying a 2% processing fee.

Ans:


SELECT 
      transaction_id,
      amount ,
      COALESCE(( amount * 0.2 ),0) As Processing_fee
FROM Transactions










-------------------------
ADVANCED
-------------------------





Q41. Calculate credit utilization percentage:

     outstanding_amount / credit_limit * 100

     Handle NULL values appropriately.

Ans:

SELECT 
     card_id ,
     COALESCE(( NULLIF(outstanding_amount , 0) / credit_limit * 100 ),0) As credit_utilization
FROM Credit_Cards












Q42. Calculate loan interest amount and replace NULL result with 0.

Ans:


SELECT 
     loan_type,
     COALESCE(( loan_amount * interest_rate ),0) As loan_interest_amount
FROM Loans











Q43. Calculate:

     loan_amount / tenure_months

     Handle NULL values in loan_amount or tenure_months.

Ans:



SELECT 
     loan_id,
     COALESCE(( loan_amount / tenure_months ),0) As tenure_month 
FROM Loans 










Q44. Calculate the average monthly loan principal:

     loan_amount / tenure_months.

Ans:


SELECT 
     loan_id ,
     COALESCE(( loan_amount / tenure_months ),0) As avg_monthly_loan
FROM Loans











Q45. Calculate each customers:

     Total Loan Amount / Annual Income

     Handle NULL values safely.

Ans:


SELECT  
     c.customer_id,
     l.loan_amount,
     c.annual_income,
     COALESCE(( NULLIF(l.loan_amount,0) / NULLIF(c.annual_income,0)),0) As customer_income
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id












Q46. Calculate debt-to-income ratio for each customer.

Ans:



SELECT  
     c.customer_id,
     l.loan_amount,
     c.annual_income,
     COALESCE(( NULLIF(l.loan_amount,0) / NULLIF(c.annual_income,0)),0) As customer_income
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id









Q47. Calculate:

     Total Outstanding Credit Card Amount
     ------------------------------------
             Annual Income

     Handle NULL values.




Ans: 



SELECT  
     c.customer_id,
     l.loan_amount,
     c.annual_income,
     COALESCE(( NULLIF(l.loan_amount,0) / NULLIF(c.annual_income,0)),0) As customer_income
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id



















============================================================
3. HANDLE NULL – SORTING DATA
============================================================





Topics:
- ORDER BY
- ASC / DESC
- NULL sorting behaviour
- CASE WHEN
- NULLS FIRST / NULLS LAST alternative in SQL Server















-------------------------
BASIC
-------------------------





Q48. Display customers ordered by annual_income
     from highest to lowest.

Ans:



SELECT * FROM Customers
ORDER BY annual_income DESC





Q49. Display customers ordered by annual_income
     from lowest to highest.
     
Ans:


SELECT * FROM Customers
ORDER BY annual_income DESC






Q50. Display accounts ordered by balance descending.

Ans:

SELECT 
      balance ,
      COALESCE(balance , 0) As balance_descending
FROM Accounts
ORDER BY COALESCE(balance , 0) DESC





Q51. Display loans ordered by interest_rate descending.

Ans:


SELECT 
      COALESCE(loan_amount,0) ,
      COALESCE(interest_rate , 0) As interest_descending
FROM Loans
ORDER BY COALESCE(interest_rate , 0) DESC




















-------------------------
MEDIUM
-------------------------




Q52. Sort customers by annual_income but place NULL values
     at the bottom.

Ans:


SELECT * FROM Customers
ORDER BY annual_income DESC









Q53. Sort customers by annual_income but place NULL values
     at the top.


Ans:


SELECT * FROM Customers 
ORDER BY annual_income 










Q54. Sort customers by occupation alphabetically,
     including NULL occupations.

Ans:


SELECT 
     occupation
FROM Customers 
ORDER BY occupation DESC











Q55. Sort credit cards by outstanding_amount descending
     and handle NULL values appropriately.


Ans:




SELECT 
     *
FROM Credit_Cards
ORDER BY outstanding_amount DESC





USE BFSI_NULL




Q56. Sort loans by loan_amount descending and put NULL
     loan amounts at the bottom.

Ans:


SELECT 
     loan_id ,
     loan_amount 
FROM Loans 
ORDER BY loan_amount DESC


























-------------------------
ADVANCED
-------------------------







Q57. Sort customers using this priority:

     1. Non-NULL annual_income first
     2. Highest annual_income first

Ans:



SELECT 
     annual_income 
FROM Customers
ORDER BY annual_income 



SELECT 
     annual_income 
FROM Customers
ORDER BY annual_income DESC











Q58. Sort customers using this priority:

     1. NULL annual_income first
     2. Non-NULL annual_income afterward
     3. Highest income first

Ans:





SELECT 
     customer_id ,
     customer_segment ,
     annual_income
FROM Customers 
ORDER BY customer_segment DESC , annual_income 











Q59. Sort customers by customer_segment and then
     annual_income descending.

Ans:


SELECT 
     customer_id ,
     customer_segment ,
     annual_income
FROM Customers 
ORDER BY customer_segment DESC , annual_income DESC










Q60. Sort accounts by account_status and then balance,
     while keeping NULL balances at the bottom.


Ans:

SELECT * FROM Accounts
ORDER BY account_status DESC , balance DESC













Q61. Sort loans so that:
     - Active loans appear first
     - Closed loans appear afterward
     - Within each status, highest loan amount first.


Ans:

SELECT 
     loan_id ,
     loan_status,
     loan_amount,
     SUM(loan_amount) OVER(PARTITION BY loan_status) As loan_amount
FROM Loans





























============================================================
4. NULLIF – DIVISION BY ZERO
============================================================





Topics:
- NULLIF()
- Division by zero
- NULLIF(column, 0)
- Safe calculations
- NULLIF + COALESCE()







-------------------------
BASIC
-------------------------






Q62. Calculate:

     outstanding_amount / credit_limit

     using NULLIF() to avoid division by zero.


Ans:


SELECT 
      outstanding_amount ,
      credit_limit,
      COALESCE(( NULLIF(outstanding_amount,0) / credit_limit ),0) As new_calculations
FROM Credit_Cards









Q63. Calculate credit utilization percentage safely.

Ans:


SELECT 
      outstanding_amount ,
      credit_limit,
      COALESCE(( NULLIF(outstanding_amount,0) / credit_limit ),0) As new_calculations
FROM Credit_Cards







Q64. Calculate:

     loan_amount / tenure_months

     using NULLIF().

Ans:


SELECT 
      loan_amount,
      tenure_months,
      COALESCE((loan_amount / tenure_months),0) As new_loan
FROM Loans







Q65. Calculate:

     transaction_amount / account_balance

     without getting a division-by-zero error.



Ans:


SELECT 
      t.amount,
      a.balance,
     COALESCE(NULLIF(t.amount,0) / NULLIF(a.balance,0),0) As new_balance
FROM Transactions As t
LEFT JOIN 
Accounts As a 
ON
t.account_id = a.account_id














-------------------------
MEDIUM
-------------------------








Q66. Calculate credit utilization percentage:

     (outstanding_amount * 100.0)
     / NULLIF(credit_limit, 0)

Ans:

SELECT
     COALESCE((outstanding_amount * 100.0)
     / NULLIF(credit_limit, 0),0)
FROM Credit_Cards





Q67. Calculate loan amount per month:

     loan_amount / NULLIF(tenure_months, 0)

Ans:


SELECT 
      COALESCE( loan_amount / NULLIF(tenure_months, 0), 0)
FROM Loans



Q68. Calculate:

     Total Loan Amount / Annual Income

     using NULLIF().

Ans:

SELECT 
     l.loan_amount,
     c.annual_income,
     COALESCE( l.loan_amount/ NULLIF( c.annual_income, 0), 0)
FROM Loans As l 
LEFT JOIN 
Customers As c 
ON 
l.customer_id = c.customer_id








Q69. Calculate:

     Outstanding Amount / Annual Income
     using NULLIF().

Ans:



SELECT 
     cc.outstanding_amount,
     c.annual_income,
     COALESCE(NULLIF(outstanding_amount,0) / c.annual_income  , 0)
FROM Credit_Cards As cc
LEFT JOIN 
Customers As c 
ON 
cc.customer_id = c.customer_id










Q70. Calculate transaction amount as a percentage
     of account balance using NULLIF().

Ans:


SELECT 
     cc.outstanding_amount,
     c.annual_income,
     COALESCE(NULLIF(outstanding_amount,0) / c.annual_income  , 0)
FROM Credit_Cards As cc
LEFT JOIN 
Customers As c 
ON 
cc.customer_id = c.customer_id












-------------------------
ADVANCED
-------------------------






Q71. Calculate customer debt-to-income ratio using:

     Total Loan Amount / NULLIF(Annual Income, 0)

Ans:


SELECT 
      l.loan_amount ,
      c.annual_income ,
      COALESCE( l.loan_amount / NULLIF( c.annual_income , 0),0) 
FROM Loans As l 
LEFT JOIN 
Customers As c
ON 
l.customer_id = c.customer_id









Q72. Calculate credit utilization and return 0 instead
     of NULL when the denominator is 0 or NULL.

Ans:



SELECT 
     cc.outstanding_amount,
     c.annual_income,
     COALESCE(NULLIF(outstanding_amount,0) / c.annual_income  , 0)
FROM Credit_Cards As cc
LEFT JOIN 
Customers As c 
ON 
cc.customer_id = c.customer_id





















============================================================
5. IS NULL – IS NOT NULL
============================================================

Topics:
- IS NULL
- IS NOT NULL
- NULL filtering
- NULL conditions in WHERE
- NULL with AND / OR













-------------------------
BASIC
-------------------------





Q76. Find customers whose occupation is NULL.

Ans:

SELECT * FROM Customers
WHERE occupation IS NULL






Q77. Find customers whose occupation is NOT NULL.

Ans:

SELECT * FROM Customers
WHERE occupation IS NOT NULL









Q78. Find customers whose annual_income is NULL.

Ans:

SELECT * FROM Customers 
WHERE annual_income IS NULL



































============================================================
6. NULL vs EMPTY STRING vs BLANK SPACES
============================================================











-------------------------
BASIC
-------------------------





Q119. Find customers where occupation IS NULL.

Ans:



SELECT * FROM Customers 
WHERE annual_income IS NULL










Q120. Find customers where occupation = ''.

Ans:

SELECT * FROM Customers
WHERE occupation = ''








Q121. Find customers where occupation contains only
      blank spaces.

Ans:


SELECT * FROM Customers
WHERE occupation = ' '





























