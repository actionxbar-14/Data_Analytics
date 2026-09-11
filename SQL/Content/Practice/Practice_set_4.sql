




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
- NULL + number
- NULL - number
- NULL * number
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

Q31. Display account_id and calculate:

     balance - 5000

Q32. Display account_id and calculate:

     balance * 2

Q33. Display loan_id and calculate:

     loan_amount * 1.10

Q34. Display credit card details and calculate:

     credit_limit - outstanding_amount


-------------------------
MEDIUM
-------------------------

Q35. Calculate the available credit for each credit card:

     credit_limit - outstanding_amount

Q36. Calculate the outstanding percentage:

     (outstanding_amount / credit_limit) * 100

Q37. Calculate annual interest amount:

     loan_amount * interest_rate / 100

Q38. Calculate estimated monthly interest:

     loan_amount * interest_rate / 100 / 12

Q39. Calculate remaining balance for each account after
     deducting a hypothetical charge of ₹1,000.

Q40. Calculate transaction amount after applying a 2% processing fee.


-------------------------
ADVANCED
-------------------------

Q41. Calculate credit utilization percentage:

     outstanding_amount / credit_limit * 100

     Handle NULL values appropriately.

Q42. Calculate loan interest amount and replace NULL result with 0.

Q43. Calculate:

     loan_amount / tenure_months

     Handle NULL values in loan_amount or tenure_months.

Q44. Calculate the average monthly loan principal:

     loan_amount / tenure_months

Q45. Calculate each customers:

     Total Loan Amount / Annual Income

     Handle NULL values safely.

Q46. Calculate debt-to-income ratio for each customer.

Q47. Calculate:

     Total Outstanding Credit Card Amount
     ------------------------------------
             Annual Income

     Handle NULL values.
















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

Q49. Display customers ordered by annual_income
     from lowest to highest.

Q50. Display accounts ordered by balance descending.

Q51. Display loans ordered by interest_rate descending.


-------------------------
MEDIUM
-------------------------

Q52. Sort customers by annual_income but place NULL values
     at the bottom.

Q53. Sort customers by annual_income but place NULL values
     at the top.

Q54. Sort customers by occupation alphabetically,
     including NULL occupations.

Q55. Sort credit cards by outstanding_amount descending
     and handle NULL values appropriately.

Q56. Sort loans by loan_amount descending and put NULL
     loan amounts at the bottom.


-------------------------
ADVANCED
-------------------------

Q57. Sort customers using this priority:

     1. Non-NULL annual_income first
     2. Highest annual_income first

Q58. Sort customers using this priority:

     1. NULL annual_income first
     2. Non-NULL annual_income afterward
     3. Highest income first

Q59. Sort customers by customer_segment and then
     annual_income descending.

Q60. Sort accounts by account_status and then balance,
     while keeping NULL balances at the bottom.

Q61. Sort loans so that:
     - Active loans appear first
     - Closed loans appear afterward
     - Within each status, highest loan amount first.
















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

Q63. Calculate credit utilization percentage safely.

Q64. Calculate:

     loan_amount / tenure_months

     using NULLIF().

Q65. Calculate:

     transaction_amount / account_balance

     without getting a division-by-zero error.


-------------------------
MEDIUM
-------------------------

Q66. Calculate credit utilization percentage:

     (outstanding_amount * 100.0)
     / NULLIF(credit_limit, 0)

Q67. Calculate loan amount per month:

     loan_amount / NULLIF(tenure_months, 0)

Q68. Calculate:

     Total Loan Amount / Annual Income

     using NULLIF().

Q69. Calculate:

     Outstanding Amount / Annual Income

     using NULLIF().

Q70. Calculate transaction amount as a percentage
     of account balance using NULLIF().


-------------------------
ADVANCED
-------------------------

Q71. Calculate customer debt-to-income ratio using:

     Total Loan Amount / NULLIF(Annual Income, 0)

Q72. Calculate credit utilization and return 0 instead
     of NULL when the denominator is 0 or NULL.

Q73. Calculate loan principal-to-income ratio and safely
     handle both NULL and zero income.

Q74. Find customers whose credit utilization is above 50%,
     using NULLIF() to avoid division errors.

Q75. Find customers whose loan-to-income ratio is greater than 3.


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

Q77. Find customers whose occupation is NOT NULL.

Q78. Find customers whose annual_income is NULL.

Q79. Find customers whose annual_income is NOT NULL.

Q80. Find accounts whose balance is NULL.

Q81. Find loans whose interest_rate is NULL.

Q82. Find credit cards whose outstanding_amount is NULL.


-------------------------
MEDIUM
-------------------------

Q83. Find customers where occupation is NULL
     AND annual_income is NOT NULL.

Q84. Find customers where occupation is NOT NULL
     AND annual_income is NULL.

Q85. Find customers where both occupation and annual_income
     are NULL.

Q86. Find customers where either occupation or annual_income
     is NULL.

Q87. Find loans where loan_amount is NOT NULL
     AND interest_rate is NULL.

Q88. Find credit cards where credit_limit is NOT NULL
     AND outstanding_amount is NULL.


-------------------------
ADVANCED
-------------------------

Q89. Count customers having NULL occupation.

Q90. Find the percentage of customers whose occupation is NULL.

Q91. Find the percentage of customers whose annual_income is NULL.

Q92. Find states having at least one customer
     with NULL occupation.

Q93. Find customers who have annual_income available
     but no credit card.

Q94. Find customers who have a credit card but
     NULL outstanding_amount.

Q95. Find loans where loan_amount is available
     but interest_rate is NULL.



















============================================================
6. LEFT ANTI JOIN
============================================================

IMPORTANT:
SQL Server does NOT have a direct keyword called
"LEFT ANTI JOIN".

Usually LEFT ANTI JOIN is implemented using:

     LEFT JOIN
     +
     WHERE right_table.key IS NULL

Example concept:

     Customers
         LEFT JOIN
     Credit_Cards
         ON Customers.customer_id = Credit_Cards.customer_id
     WHERE Credit_Cards.customer_id IS NULL


Meaning:

"Customers jinka matching record Credit_Cards table
mein nahi hai."


-------------------------
BASIC
-------------------------

Q96. Find customers who do not have any credit card.

Q97. Find customers who do not have any loan.

Q98. Find customers who do not have any account.

Q99. Find branches that do not have any customers.

Q100. Find accounts that do not have any transactions.

Q101. Find customers who have no transactions.

Q102. Find customers who do not have a loan.


-------------------------
MEDIUM
-------------------------

Q103. Find customers who do not have a credit card
      but have an account.

Q104. Find customers who have a loan
      but do not have a credit card.

Q105. Find customers who have a credit card
      but do not have a loan.

Q106. Find customers who have neither a loan
      nor a credit card.

Q107. Find customers who have an account
      but no transactions.

Q108. Find accounts that have no successful transactions.

Q109. Find branches that have customers
      but no accounts.

Q110. Find customers who have no successful transactions.


-------------------------
ADVANCED
-------------------------

Q111. Find customers who have:
      - Active account
      - No credit card

Q112. Find customers who have:
      - Active loan
      - No credit card

Q113. Find customers who have:
      - Annual income > ₹10 lakh
      - No credit card

Q114. Find premium customers who do not have any loan.

Q115. Find customers who have a Current Account
      but no loan.

Q116. Find customers who have a credit card
      but no successful transactions.

Q117. Find customers who have loans
      but have never made a transaction.

Q118. Find branches where customers exist
      but no customer has a credit card.


============================================================
7. NULL vs EMPTY STRING vs BLANK SPACES
============================================================

IMPORTANT DIFFERENCE:

NULL
----
Means value is missing/unknown.

Example:
occupation = NULL


EMPTY STRING
------------
String exists but contains zero characters.

Example:
occupation = ''


BLANK SPACES
------------
String contains spaces.

Example:
occupation = '   '


In SQL Server these are NOT the same thing.


-------------------------
BASIC
-------------------------

Q119. Find customers where occupation IS NULL.

Q120. Find customers where occupation = ''.

Q121. Find customers where occupation contains only
      blank spaces.

Q122. Find customers where occupation is either NULL
      or an empty string.

Q123. Find customers where occupation is either NULL,
      empty string, or blank spaces.


-------------------------
MEDIUM
-------------------------

Q124. Find customers with missing occupation data,
      considering:
      - NULL
      - ''
      - '   '

Q125. Count customers having NULL occupation.

Q126. Count customers having empty-string occupation.

Q127. Count customers having blank-space occupation.

Q128. Count customers having any form of missing occupation.

Q129. Display occupation after removing leading
      and trailing spaces.

Q130. Find customers where occupation becomes empty
      after TRIM().


-------------------------
ADVANCED
-------------------------

Q131. Display customer_name and occupation,
      replacing:
      - NULL
      - ''
      - blank spaces

      with 'Not Available'.

Q132. Count valid occupation values after treating
      NULL, empty strings, and blank spaces as missing.

Q133. Find customers whose occupation contains
      leading or trailing spaces.

Q134. Clean occupation values by removing
      leading/trailing spaces.

Q135. Find customers where occupation is considered
      missing after applying TRIM().

Q136. Calculate the percentage of customers
      having valid occupation data.

Q137. Find the number of valid vs missing occupation records.

Q138. Replace missing occupation values with
      'Unknown' in the result.

Q139. Identify records where occupation is:
      - NULL
      - Empty
      - Blank spaces
      - Valid




















============================================================
8. BFSI DATA ANALYST CASE STUDIES
============================================================

Q140. Find customers who have an account
      but no credit card.

Q141. Find customers who have a loan
      but no account.

Q142. Find customers who have a credit card
      but no loan.

Q143. Find customers who have neither a loan
      nor a credit card.

Q144. Find customers whose annual income is NULL
      but who have an active loan.

Q145. Find customers whose annual income is available
      but occupation is missing.

Q146. Find customers with missing occupation data
      and annual income greater than ₹8 lakh.

Q147. Calculate credit utilization percentage
      while safely handling NULL and zero credit limits.

Q148. Find customers with credit utilization above 70%,
      excluding records where credit_limit is NULL or 0.

Q149. Find customers whose loan-to-income ratio
      is greater than 3.

Q150. Find accounts that have no transactions.

Q151. Find customers who have accounts but
      no successful transactions.

Q152. Find customers who have active loans
      but no credit card.

Q153. Find premium customers who have no credit card.

Q154. Find premium customers who have no active loan.

Q155. Find branches with customers but no credit card holders.

Q156. Find customers having:
      - Active Account
      - Active Loan
      - No Credit Card

Q157. Find customers having:
      - Annual Income > ₹10 lakh
      - Active Loan
      - No Credit Card

Q158. Find customers having:
      - Current Account
      - No Credit Card
      - No Loan

Q159. Find customers who have no transactions
      but have an active account.

Q160. Find customers who have no transactions
      but have an active loan.





















============================================================
9. INTERVIEW-LEVEL QUESTIONS
============================================================

Q161. What is the difference between:

      COUNT(*)
      COUNT(column)

Q162. Why does:

      NULL + 100

      return NULL?

Q163. Why does:

      NULL * 10

      return NULL?

Q164. Why should we use:

      NULLIF(denominator, 0)

      during division?

Q165. Explain the difference between:

      NULL
      ''
      '   '

Q166. Why does this NOT work for NULL?

      WHERE occupation = NULL

Q167. What is the correct way to check NULL values?

Q168. Explain:

      IS NULL
      IS NOT NULL

Q169. Explain LEFT ANTI JOIN.

Q170. Write two different approaches to find customers
      who do not have a credit card:

      Approach 1:
      LEFT JOIN + IS NULL

      Approach 2:
      NOT EXISTS

Q171. What is the difference between:

      LEFT JOIN
      LEFT ANTI JOIN

Q172. How would you calculate credit utilization
      without getting a divide-by-zero error?

Q173. How would you replace NULL numerical values
      with 0?

Q174. How would you replace NULL/empty/blank
      occupation values with 'Unknown'?

Q175. How would you find customers who have
      no transactions?

