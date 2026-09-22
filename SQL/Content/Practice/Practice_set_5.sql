



================================================================
BFSI_WINDOW – SQL FUNCTIONS & WINDOW FUNCTIONS PRACTICE SET
================================================================

Database:

USE
BFSI_WINDOW

Tables:
1. Branches
2. Customers
3. Accounts
4. Transactions
5. Loans
6. Credit_Cards







================================================================
SECTION A – BASIC AGGREGATE FUNCTIONS
================================================================

Topics:
COUNT()
SUM()
AVG()
MAX()
MIN()






-------------------------
BASIC
-------------------------





Q1. Count the total number of customers.

Ans:

SELECT 
      COUNT(*) As total_customers ,
      COUNT(customer_id) As total_customers_id
FROM Customers







Q2. Count the total number of accounts.

Ans:


SELECT 
      COUNT(*) As total_accounts ,
      COUNT(account_id) As total_accounts_id
FROM Accounts








Q3. Count the total number of transactions.

Ans:

SELECT 
      COUNT(*) As total_transactions ,
      COUNT(transaction_id) As total_transactions_id
FROM Transactions









Q4. Count the total number of loans.

Ans:

SELECT 
      COUNT(*) As total_loans ,
      COUNT(loan_id) As total_loans_id
FROM Loans








Q5. Count the total number of credit cards.

Ans:


SELECT 
      COUNT(*) As total_Credit_Cards ,
      COUNT(card_id) As total_card_id
FROM Credit_Cards








Q6. Calculate the total annual income of all customers.

Ans:

SELECT 
      COUNT(*) As Total_Customers,
      SUM(annual_income) As Total_annual_income
FROM Customers







Q7. Calculate the total balance across all accounts.

Ans:

SELECT
     COUNT(*) As total_accounts,
     SUM(balance) As Total_balance
FROM Accounts











Q8. Calculate the total transaction amount.

Ans:


SELECT 
     COUNT(*) As total_transactions ,
     SUM(amount) As total_transaction_amount
FROM Transactions










Q9. Calculate the total loan amount.

Ans:


SELECT 
      COUNT(*) As total_loans ,
      SUM(loan_amount) As total_loan_amount
FROM Loans









Q10. Calculate the total outstanding amount of all credit cards.

Ans:

SELECT 
      COUNT(*) As total_card_id ,
      SUM(outstanding_amount) As Total_outstanding_amount
FROM Credit_Cards











Q11. Calculate the average annual income of customers.

Ans:

SELECT 
      COUNT(*) As total_customers ,
      AVG(annual_income) As avg_annual_income
FROM Customers







Q12. Calculate the average account balance.

Ans:

SELECT 
      COUNT(*) As total_accounts ,
      AVG(balance) As total_avg_balance
FROM Accounts









Q13. Calculate the average transaction amount.

Ans:

SELECT 
      COUNT(transaction_id) As total_transactions,
      AVG(amount) As avg_transaction_amount
FROM Transactions







Q14. Calculate the average loan amount.

Ans:

SELECT 
      COUNT(loan_id) As total_loans,
      AVG(loan_amount) As avg_loan_amount
FROM Loans











Q15. Find the maximum annual income.

Ans:


SELECT  
     MAX(annual_income) As Max_annual_income
FROM Customers






Q16. Find the minimum annual income.

Ans:


SELECT  
     MIN(annual_income) As Min_annual_income
FROM Customers




Q17. Find the maximum account balance.

Ans:


SELECT  
     MAX(balance) As Max_account_balance
FROM Accounts




Q18. Find the minimum account balance.

Ans:

SELECT  
     MIN(balance) As Min_account_balance
FROM Accounts












Q19. Find the highest loan amount.

Ans:

SELECT
     MAX(loan_amount) As highest_loan_amount
FROM Loans









Q20. Find the lowest loan amount.

Ans:

SELECT
     MIN(loan_amount) As lowest_loan_amount
FROM Loans








Q21. Find the highest transaction amount.

Ans:

SELECT
     MAX(amount) As highest_transaction_amount
FROM Transactions



Q22. Find the lowest transaction amount.

Ans:

SELECT
     MIN(amount) As lowest_transaction_amount
FROM Transactions












-------------------------
MEDIUM
-------------------------







Q23. Count the number of Savings accounts.

Ans:

SELECT 
      COUNT(*) As Total_Saving_accounts 
FROM Accounts
WHERE account_type = 'Savings'






Q24. Count the number of Current accounts.

Ans:

SELECT 
      COUNT(*) As Total_Saving_accounts 
FROM Accounts
WHERE account_type = 'Current'








Q25. Calculate the total balance of Savings accounts.

Ans:

SELECT  
     SUM(balance) As total_balance
FROM Accounts
WHERE account_type = 'Savings'






Q26. Calculate the total balance of Current accounts.

Ans:

SELECT  
     SUM(balance) As total_balance
FROM Accounts
WHERE account_type = 'Current'








Q27. Calculate the average balance of Active accounts.

Ans:

SELECT 
    AVG(balance) As Avg_balance 
FROM Accounts 
WHERE account_status = 'Active'







Q28. Find the maximum loan amount for Home Loans.

Ans:


SELECT 
      MAX(loan_amount) As Max_home_loan
FROM Loans
WHERE loan_type = 'Home Loan'






Q29. Find the minimum loan amount for Personal Loans.

Ans:

SELECT 
      MIN(loan_amount) As Max_Personal_loan
FROM Loans
WHERE loan_type = 'Personal Loan'







Q30. Find the average interest rate of all loans.

Ans:


SELECT 
      AVG(interest_rate) As avg_interest_rate
FROM Loans






Q31. Find the maximum credit limit.

Ans:


SELECT 
     MAX(credit_limit) As max_credit_limit
FROM Credit_Cards











Q32. Find the minimum credit limit.

Ans:


SELECT 
     MIn(credit_limit) As min_credit_limit
FROM Credit_Cards







Q33. Calculate the average outstanding amount
     on credit cards.

Ans:


SELECT 
     AVG(outstanding_amount) As avg_credit_limit
FROM Credit_Cards






Q34. Count successful transactions.

Ans:

SELECT 
     COUNT(*) As Total_succussful_transactions 
FROM Transactions
WHERE transaction_status = 'Success'




Q35. Count failed transactions.


Ans:


SELECT 
     COUNT(*) As Total_unsuccussful_transactions 
FROM Transactions
WHERE transaction_status = 'Failed'












================================================================
SECTION B – GROUPED AGGREGATIONS
================================================================

Topics:
GROUP BY
COUNT
SUM
AVG
MAX
MIN


-------------------------
BASIC
-------------------------





Q36. Count customers by gender.

Ans:

SELECT 
      COUNT(customer_id) As Total_customer,
      gender 
FROM Customers
GROUP BY gender








Q37. Count customers by state.

Ans:


SELECT 
      COUNT(customer_id) As Total_customer,
      state 
FROM Customers
GROUP BY state







Q38. Count customers by city.

Ans:


SELECT 
      COUNT(customer_id) As Total_customer,
      city
FROM Customers
GROUP BY city




Q39. Count customers by customer_segment.

Ans:


SELECT 
      COUNT(customer_id) As Total_customer,
      customer_segment
FROM Customers
GROUP BY customer_segment







Q40. Count accounts by account_type.

Ans:


SELECT 
      COUNT(account_id) As Total_account,
      account_type
FROM Accounts
GROUP BY account_type








Q41. Count accounts by account_status.

Ans:


SELECT 
      COUNT(account_id) As Total_account,
      account_status
FROM Accounts
GROUP BY account_status









Q42. Count loans by loan_type.

Ans:


SELECT 
      COUNT(loan_id) As Total_loan,
      loan_type
FROM Loans
GROUP BY loan_type








Q43. Count loans by loan_status.

Ans:

SELECT 
      COUNT(loan_id) As Total_loan,
      loan_status
FROM Loans
GROUP BY loan_status








Q44. Count credit cards by card_type.

Ans:


SELECT 
      COUNT(card_id) As Total_card_id,
      card_type
FROM Credit_Cards 
GROUP BY card_type





Q45. Count transactions by transaction_type.

Ans:

SELECT
     COUNT(transaction_id) As Total_transactions,
     transaction_type
FROM Transactions
GROUP BY transaction_type





Q46. Count transactions by channel.

Ans:

SELECT
     COUNT(transaction_id) As Total_transactions,
     channel
FROM Transactions
GROUP BY channel








Q47. Count transactions by transaction_status.

Ans:

SELECT
     COUNT(transaction_id) As Total_transactions,
     transaction_status
FROM Transactions
GROUP BY transaction_status







-------------------------
MEDIUM
-------------------------









Q48. Calculate total account balance by account_type.

Ans:


SELECT 
      COUNT(account_id) As Total_accounts,
      account_type
FROM Accounts
GROUP BY account_type








Q49. Calculate average account balance by account_type.

Ans:

SELECT 
      AVG(balance) As AVG_accounts,
      account_type
FROM Accounts
GROUP BY account_type







Q50. Find maximum account balance by account_type.

Ans: 

SELECT 
      MAX(balance) As MAX_accounts_balance,
      account_type
FROM Accounts
GROUP BY account_type








Q51. Find minimum account balance by account_type.

Ans:


SELECT 
      MIN(balance) As MAX_accounts_balance,
      account_type
FROM Accounts
GROUP BY account_type









Q52. Calculate total loan amount by loan_type.

Ans:

SELECT
     SUM(loan_amount) As Total_loan_amount,
     loan_type
FROM Loans
GROUP BY loan_type








Q53. Calculate average loan amount by loan_type.

Ans:

SELECT
     AVG(loan_amount) As AVG_loan_amount,
     loan_type
FROM Loans
GROUP BY loan_type







Q54. Calculate average interest rate by loan_type.

Ans:



SELECT
     AVG(interest_rate) As AVG_interest_rate,
     loan_type
FROM Loans
GROUP BY loan_type







Q55. Find maximum loan amount by loan_type.

Ans:


SELECT
     MAX(loan_amount) As MAX_loan_amount,
     loan_type
FROM Loans
GROUP BY loan_type






Q56. Calculate total transaction amount by transaction_type.

Ans:


SELECT
     SUM(amount) As Total_transaction_amount,
     transaction_type
FROM Transactions
GROUP BY transaction_type






Q57. Calculate average transaction amount by channel.

Ans:



SELECT
     AVG(amount) As AVG_transaction_amount,
     channel
FROM Transactions
GROUP BY channel






Q58. Calculate total transaction amount by channel.

Ans:

SELECT
     SUM(amount) As Total_transaction_amount,
     channel
FROM Transactions
GROUP BY channel






Q59. Calculate total credit limit by card_type.

Ans:


SELECT 
     SUM(credit_limit) As Total_credit_limit,
     card_type 
FROM Credit_Cards
GROUP BY card_type




Q60. Calculate total outstanding amount by card_type.

Ans:

SELECT 
     SUM(outstanding_amount) As Total_outstandind_amount,
     card_type 
FROM Credit_Cards
GROUP BY card_type




-------------------------
ADVANCED
-------------------------




Q61. Find states having more than 2 customers.

Ans:

SELECT 
     COUNT(customer_id) As No_of_customers,
     state
FROM Customers
GROUP BY state
HAVING COUNT(customer_id) > 2





Q62. Find customer segments having more than 5 customers.

Ans:

SELECT 
    COUNT(customer_id) As No_of_customer,
    customer_segment
FROM Customers 
GROUP BY customer_segment
HAVING COUNT(customer_id) > 5








Q63. Find loan types having average loan amount
     greater than ₹20 lakh.

Ans:

SELECT 
      AVG(loan_amount) As avg_loan_amount,
      loan_type
FROM Loans
GROUP BY loan_type
HAVING AVG(loan_amount) > 2000000





Q64. Find branches having total account balance
     greater than ₹10 lakh.

Ans:

SELECT 
      b.branch_name , 
      SUM(a.balance) as Total_account_balance
FROM Accounts As a
LEFT JOIN 
Branches As b
ON 
a.branch_id = b.branch_id
GROUP BY b.branch_name
HAVING SUM(a.balance) > 1000000










Q65. Find transaction channels having total transaction
     amount greater than ₹5 lakh.

 
 Ans:

 SELECT 
       channel,
       SUM(amount) As Total_transaction_amount
 FROM Transactions
 GROUP BY channel
 HAVING  SUM(amount) > 1000000







Q66. Find loan types where maximum loan amount
     exceeds ₹40 lakh.

Ans:

SELECT 
     loan_amount,
     MAX(loan_amount) As Max_loan_amount
FROM Loans
GROUP BY loan_amount
HAVING MAX(loan_amount) > 4000000











Q67. Find customer segments where average annual income
     exceeds ₹10 lakh.

Ans:


SELECT 
      customer_segment,
      AVG(annual_income) As Avg_annual_income
FROM Customers
GROUP BY customer_segment
HAVING AVG(annual_income) > 1000000








Q68. Find account types where average balance
     exceeds ₹3 lakh.

Ans:


SELECT 
     account_type,
     AVG(balance) As AVG_balance
FROM Accounts
GROUP BY account_type 
HAVING AVG(balance) > 300000


































================================================================
SECTION C – SQL WINDOW BASICS
================================================================

Topics:
Window Functions
Aggregate vs Window Aggregate
OVER()













-------------------------
BASIC
-------------------------





Q69. Display every account along with the total
     balance of all accounts.

Ans:



SELECT 
      Account_id,
      balance,
      SUM(balance) OVER() As Total_balance
FROM Accounts








Q70. Display every loan along with the total
     loan amount across all customers.

Ans:

SELECT 
      loan_id,
      loan_amount,
      SUM(loan_amount) OVER() As Total_loan
FROM Loans









Q71. Display every transaction along with the
     total transaction amount.

Ans:

SELECT 
     transaction_id,
     amount,
     SUM(amount) OVER() As Total_amount
FROM Transactions







Q72. Display every customer along with the
     average annual income of all customers.

Ans:


SELECT 
     customer_id,
     customer_name,
     annual_income,
     ROUND(AVG(annual_income) OVER() ,0) As Total_Avg_annual_income
FROM Customers










Q73. Display every customer along with:
     - Maximum annual income
     - Minimum annual income

Ans:


SELECT 
     customer_id,
     customer_name,
     annual_income,
     MAX(annual_income) OVER() As Max_annual_income,
     MIN(annual_income) OVER() As Min_annual_income
FROM Customers







Q74. Display every loan along with:
     - Total loan amount
     - Average loan amount
     - Maximum loan amount
     - Minimum loan amount

Ans:

SELECT 
      loan_id,
      loan_amount,
      SUM(loan_amount) OVER() As Total_loan_amount,
      AVG(loan_amount) OVER() As Avg_loan_amount,
      MAX(loan_amount) OVER() As Max_loan_amount,
      MIN(loan_amount) OVER() As Min_loan_amount
FROM Loans






















================================================================
SECTION E – WINDOW PARTITION
================================================================



Topics:
PARTITION BY


-------------------------
BASIC
-------------------------







Q82. Display each customer along with the total
     annual income of their state.


Ans:

SELECT 
      customer_id,
      customer_name,
      state,
      SUM(annual_income) OVER(PARTITION BY state) As Total_annual_income
FROM Customers










Q83. Display each customer along with the average
     annual income of their state.

Ans:

SELECT 
      customer_id,
      customer_name,
      state,
      AVG(annual_income) OVER(PARTITION BY state) As Total_annual_income
FROM Customers







Q84. Display each customer along with the total
     balance of their account type.

Ans:

SELECT 
     c.customer_id,
     c.customer_name,
     a.account_type,
     SUM(a.balance) OVER(PARTITION BY a.account_type) As Total_balance_byAccountType
FROM Customers As c
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id








Q85. Display each loan along with the total loan
     amount for its loan_type.

Ans:


SELECT 
     loan_id,
     loan_type,
     loan_amount,
     SUM(loan_amount) OVER(PARTITION BY loan_type) As total_loan_amount_byloanType
FROM Loans







Q86. Display each loan along with the average loan
     amount for its loan_type.

Ans:


SELECT 
     loan_id,
     loan_type,
     loan_amount,
     AVG(loan_amount) OVER(PARTITION BY loan_type) As total_loan_amount_byloanType
FROM Loans







Q87. Display each transaction along with the total
     transaction amount for its transaction_type.

Ans:



SELECT 
     transaction_id,
     transaction_type,
     amount,
     SUM(amount) OVER(PARTITION BY transaction_type) As total_transaction_amount_bytransactionType
FROM Transactions







Q88. Display each credit card along with the total
     outstanding amount for its card_type.

Ans:

SELECT 
      card_id,
      card_type,
      outstanding_amount,
      SUM(outstanding_amount) OVER(PARTITION BY card_type) As Total_outstanding_amount_ByCardType
FROM Credit_Cards












-------------------------
MEDIUM
-------------------------




Q89. Calculate total annual income by state
     while retaining every customer row.

Ans:


SELECT
      customer_id,
      customer_name,
      state,
      annual_income,
      SUM(annual_income) OVER(PARTITION BY state) As Total_annual_income_ByState
FROM Customers





Q90. Calculate average annual income by
     customer_segment while retaining every customer.

Ans:


SELECT 
     customer_id,
     customer_name,
     customer_segment,
     annual_income,
     AVG(annual_income) OVER(PARTITION BY customer_segment) As Total_annualAmount_ByCustomerSegment
FROM Customers








Q91. Calculate total account balance by branch
     while retaining every account.

Ans:

SELECT 
     a.account_id,
     b.branch_id,
     b.branch_name,
     a.balance,
     SUM(a.balance) OVER(PARTITION BY b.branch_name) As total_balance_BYbranch
FROM Accounts As a
LEFT JOIN
Branches As b 
ON 
a.branch_id = b.branch_id







Q92. Calculate total loan amount by customer_segment.

Ans:

SELECT 
     c.customer_id,
     c.customer_name,
     c.customer_segment,
     l.loan_amount,
     SUM(loan_amount) OVER(PARTITION BY c.customer_segment) As Total_loanAmount_ByCustomerSegment
FROM Customers As c
LEFT JOIN 
Loans As l
ON
c.customer_id = l.customer_id






Q93. Calculate total transaction amount by account.

Ans:


SELECT
      *,
      SUM(amount) OVER(PARTITION BY transaction_type) As Total_transaction_amount_ByAccountType
FROM Transactions









Q94. Calculate total transaction amount by channel
     while retaining every transaction row.

Ans:


SELECT 
     * ,
     SUM(amount) OVER(PARTITION BY channel) As Total_transaction_amount_ByChannel
FROM Transactions






Q95. Calculate total credit limit by card_type.

Ans:

SELECT 
      card_type,
      credit_limit,
      SUM(credit_limit) OVER(PARTITION BY card_type) As Total_credit_limit
FROM Credit_Cards


























================================================================
SECTION F – WINDOW ORDER
================================================================

Topics:
ORDER BY inside OVER()


-------------------------
BASIC
-------------------------

Q96. Assign a row number to customers based on
     annual_income descending.

Q97. Assign a row number to loans based on
     loan_amount descending.

Q98. Assign a row number to transactions based on
     transaction_date ascending.

Q99. Calculate a running total of transaction amount
     ordered by transaction_date.

Q100. Calculate a running total of loan amount
      ordered by loan_start_date.

Q101. Calculate a running total of account balance
      ordered by opening_date.


-------------------------
MEDIUM
-------------------------

Q102. Calculate cumulative transaction amount
      for each account ordered by transaction_date.

Q103. Calculate cumulative loan amount by loan_type
      ordered by loan_start_date.

Q104. Calculate cumulative account balance by
      branch ordered by opening_date.

Q105. Calculate running average transaction amount
      ordered by transaction_date.


================================================================
SECTION G – WINDOW FRAME
================================================================

Topics:
ROWS
BETWEEN
UNBOUNDED PRECEDING
CURRENT ROW
PRECEDING
FOLLOWING


-------------------------
BASIC
-------------------------

Q106. Calculate a running transaction total using:

      ROWS BETWEEN UNBOUNDED PRECEDING
      AND CURRENT ROW


Q107. Calculate a running average transaction amount.

Q108. Calculate a 2-row moving average of transaction amount.

Q109. Calculate a 3-row moving average of transaction amount.

Q110. Calculate a rolling 3-transaction total.

Q111. Calculate the sum of the current transaction
      and previous transaction.

Q112. Calculate the average of the current transaction
      and previous transaction.


-------------------------
ADVANCED
-------------------------

Q113. Calculate a 3-transaction moving average
      separately for each account.

Q114. Calculate a 3-transaction rolling total
      separately for each account.

Q115. Calculate the sum of the current transaction,
      previous transaction and next transaction.

Q116. Calculate a rolling average using:

      2 PRECEDING
      AND CURRENT ROW

Q117. Compare:
      - Running total
      - Rolling 3-row total

      for each transaction.


================================================================
SECTION H – WINDOW RULES
================================================================

Q118. Explain why an aggregate query with GROUP BY
      reduces the number of rows.

Q119. Explain why a window aggregate does NOT
      reduce the number of rows.

Q120. Explain the purpose of OVER().

Q121. Explain the difference between:

      SUM(amount)

      and

      SUM(amount) OVER()


Q122. Explain the difference between:

      GROUP BY

      and

      PARTITION BY


Q123. Explain why ORDER BY inside OVER()
      is different from the final ORDER BY.

Q124. Explain the purpose of a window frame.

Q125. What is the difference between:

      ROWS

      and

      RANGE


================================================================
SECTION I – WINDOW FUNCTIONS + GROUP BY
================================================================

Q126. First calculate total loan amount by loan_type
      using GROUP BY.

Q127. Then calculate the percentage contribution
      of each loan_type to total loan amount.

Q128. Find each state’s total customer income
      and compare it with the overall income.

Q129. Find each branch's total account balance
      and calculate its percentage of total bank balance.

Q130. Calculate total transaction amount by channel
      and rank the channels based on total amount.

Q131. Calculate total loan amount by loan_type
      and rank loan types by total loan amount.

Q132. Calculate customer count by state
      and rank states by customer count.


================================================================
SECTION J – ROW_NUMBER
================================================================

Q133. Assign ROW_NUMBER to all customers based
      on annual_income descending.

Q134. Assign ROW_NUMBER to all loans based
      on loan_amount descending.

Q135. Assign ROW_NUMBER to transactions based
      on transaction_date descending.

Q136. Assign ROW_NUMBER separately within each state.

Q137. Assign ROW_NUMBER separately within each
      customer_segment.

Q138. Assign ROW_NUMBER separately within each
      loan_type.

Q139. Find the highest-income customer from each state.

Q140. Find the largest loan from each loan_type.

Q141. Find the latest transaction for each account.

Q142. Find the first transaction for each account.


================================================================
SECTION K – RANK
================================================================

Q143. Rank customers based on annual_income.

Q144. Rank loans based on loan_amount.

Q145. Rank accounts based on balance.

Q146. Rank transactions based on amount.

Q147. Rank customers separately within each state.

Q148. Rank loans separately within each loan_type.

Q149. Find the top 3 customers by annual income
      from each state.

Q150. Find the top 3 loans within each loan_type.


================================================================
SECTION L – DENSE_RANK
================================================================

Q151. Dense-rank customers based on annual_income.

Q152. Dense-rank loans based on loan_amount.

Q153. Dense-rank customers within each state.

Q154. Dense-rank loans within each loan_type.

Q155. Find the top 3 customers from each state
      using DENSE_RANK.

Q156. Find the top 2 loans from each loan_type
      using DENSE_RANK.

Q157. Compare RANK and DENSE_RANK on loan amounts.


================================================================
SECTION M – NTILE
================================================================

Q158. Divide all customers into 4 income groups
      using NTILE(4).

Q159. Divide customers into 5 groups based
      on annual_income.

Q160. Divide loans into 4 groups based
      on loan_amount.

Q161. Divide customers into 4 groups separately
      within each state.

Q162. Identify customers belonging to the
      highest income quartile.

Q163. Identify loans belonging to the
      highest loan-value quartile.

Q164. Divide customers into 3 groups based
      on annual_income and customer_segment.


================================================================
SECTION N – CUME_DIST
================================================================

Q165. Calculate cumulative distribution of customers
      based on annual_income.

Q166. Calculate CUME_DIST for loan_amount.

Q167. Calculate CUME_DIST separately within
      each customer_segment.

Q168. Find customers whose cumulative income
      distribution is less than or equal to 25%.

Q169. Find customers in the top 25% income range
      using CUME_DIST.

Q170. Calculate CUME_DIST for loans within
      each loan_type.


================================================================
SECTION O – LEAD
================================================================

Q171. Display each transaction along with
      the next transaction amount.

Q172. Display each transaction along with
      the next transaction date.

Q173. Find the difference between current transaction
      amount and next transaction amount.

Q174. Find the number of days between current
      transaction and next transaction.

Q175. Find the next transaction for each account.

Q176. Find the next loan start date for each
      customer.

Q177. Compare current loan amount with the
      next loan amount.

Q178. Identify transactions where the next transaction
      amount is higher than the current transaction.


================================================================
SECTION P – LAG
================================================================

Q179. Display each transaction along with
      the previous transaction amount.

Q180. Display each transaction along with
      the previous transaction date.

Q181. Calculate the difference between current
      transaction amount and previous transaction amount.

Q182. Calculate the percentage change from
      previous transaction amount.

Q183. Find the previous transaction for each account.

Q184. Compare current loan amount with
      previous loan amount.

Q185. Find the number of days between
      current and previous transaction.

Q186. Identify transactions where the current
      amount is greater than the previous amount.


================================================================
SECTION Q – FIRST_VALUE
================================================================

Q187. Find the first transaction amount
      for each account.

Q188. Find the first transaction date
      for each account.

Q189. Display every transaction along with
      the first transaction amount of its account.

Q190. Find the first loan amount within
      each loan_type.

Q191. Display every loan along with
      the first loan amount of its loan_type.

Q192. Find the first customer income
      within each state after ordering
      customers by annual_income.


================================================================
SECTION R – LAST_VALUE
================================================================

Q193. Find the latest transaction amount
      for each account.

Q194. Find the latest transaction date
      for each account.

Q195. Display every transaction along with
      the latest transaction amount of its account.

Q196. Find the last loan amount within
      each loan_type.

Q197. Display every loan along with
      the last loan amount of its loan_type.

Q198. Explain why LAST_VALUE() often requires
      an explicit window frame.


================================================================
SECTION S – COMBINED WINDOW FUNCTION QUESTIONS
================================================================

Q199. For every customer, display:

      customer_name
      annual_income
      ROW_NUMBER
      RANK
      DENSE_RANK


Q200. For every loan, display:

      loan_amount
      ROW_NUMBER
      RANK
      DENSE_RANK


Q201. For every transaction, display:

      transaction_date
      amount
      previous_amount
      next_amount


Q202. Calculate:

      current transaction
      previous transaction
      next transaction
      difference from previous
      difference from next


Q203. For every customer, calculate:

      annual_income
      state average income
      difference from state average


Q204. For every loan, calculate:

      loan_amount
      loan_type average
      difference from loan_type average


Q205. For every transaction, calculate:

      amount
      account total
      account average
      running total


Q206. For every account, calculate:

      transaction count
      total transaction amount
      average transaction amount
      first transaction amount
      latest transaction amount


================================================================
SECTION T – BFSI DATA ANALYST CASE STUDIES
================================================================

Q207. Find the top 3 highest-income customers
      from every state.

Q208. Find the top 2 highest-value loans
      from every loan type.

Q209. Find the latest transaction for every account.

Q210. Find the first transaction for every account.

Q211. Calculate month-over-month transaction
      amount change using LAG.

Q212. Find accounts where the latest transaction
      amount is greater than the previous transaction.

Q213. Calculate running transaction amount
      for every account.

Q214. Calculate a 3-transaction moving average
      for every account.

Q215. Find customers whose income is above
      their state average income.

Q216. Find loans whose amount is above the
      average loan amount of their loan_type.

Q217. Divide customers into income quartiles.

Q218. Identify customers belonging to the
      highest income quartile.

Q219. Rank branches based on total account balance.

Q220. Rank states based on total customer income.

Q221. Calculate each state's percentage contribution
      to total customer income.

Q222. Calculate each loan type's percentage contribution
      to total loan amount.

Q223. Find the customer with the highest income
      in each customer segment.

Q224. Find the largest account balance
      in each branch.

Q225. Find the largest transaction
      for each account.

Q226. Find the first and latest transaction
      for every account.

Q227. Calculate transaction growth between
      consecutive transactions.

Q228. Identify accounts whose transaction amount
      increased for two consecutive transactions.

Q229. Find customers whose income rank is
      within the top 10.

Q230. Find customers whose income is in
      the top 25% using NTILE.

Q231. Find loans whose CUME_DIST is
      greater than 0.75.

Q232. Find each customer's income rank
      within their state.

Q233. Find each customer's income quartile
      within their state.

Q234. Find each account's cumulative transaction
      amount over time.

Q235. Find the average transaction amount
      over the previous 2 transactions.

Q236. Find the difference between each transaction
      and the account's first transaction.

Q237. Find the difference between each transaction
      and the account's latest transaction.

Q238. Find the customer with the highest income
      from every branch.

Q239. Find the top 3 loans from every branch
      after joining Customers and Loans.

Q240. Find the top 3 customers in every state
      based on annual_income and show their
      rank, state average income and difference
      from state average.

