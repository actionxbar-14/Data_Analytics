/* =============================================================================
   ============================================================================
                      BFSI_WINDOW
                ADVANCED SQL PRACTICE QUESTIONS
   ============================================================================
============================================================================= */
















/* =============================================================================
                      SECTION A — SUBQUERY RESULT TYPES
============================================================================= */

USE
BFSI_Window




/* Q1. Find customers whose annual_income is greater than the average
    annual_income of all customers.   */

Ans:




SELECT 
     *
FROM 
(
SELECT 
     *,
     AVG(annual_income) OVER() As Avg_annual_income
FROM Customers
)t
WHERE annual_income > Avg_annual_income;







/*  Q2. Find customers whose annual_income is less than the average
    annual_income.   */

Ans:


SELECT 
     *
FROM 
(
SELECT 
     *,
     AVG(annual_income) OVER() As Avg_annual_income
FROM Customers
)t
WHERE annual_income < Avg_annual_income;











/* Q3. Find the customer having the highest annual_income using a subquery.  */

Ans:

SELECT 
     *
FROM Customers
WHERE annual_income = (
SELECT 
     MAX(annual_income) As Max_salary
FROM Customers
);











/* Q4. Find the customer having the lowest annual_income using a subquery.   */

Ans:

SELECT 
     *
FROM Customers
WHERE annual_income = (
SELECT 
     MIN(annual_income) As Min_salary
FROM Customers
);










/* Q5. Find accounts whose balance is greater than the average account balance.  */

Ans:


SELECT
     *
FROM Accounts
WHERE balance > (
SELECT
     AVG(balance) As AVG_balance
FROM Accounts
);










/* Q6. Find accounts whose balance is equal to the maximum account balance.  */

Ans:



SELECT
     *
FROM Accounts
WHERE balance = (
SELECT
     MAX(balance) As Max_balance
FROM Accounts
);











/* Q7. Find loans whose loan_amount is greater than the average loan amount.  */

Ans:




SELECT 
     * 
FROM Loans
WHERE loan_amount >  (
SELECT 
     AVG(loan_amount) As avg_loan_amount
FROM Loans);










/* Q8. Find the loan having the highest loan_amount using a subquery.  */

Ans:


SELECT 
     * 
FROM Loans
WHERE loan_amount =  (
SELECT 
     MAX(loan_amount) As Max_loan_amount
FROM Loans);











/* Q9. Find transactions whose amount is greater than the average
    transaction amount.   */

Ans:


SELECT 
     *
FROM Transactions
WHERE amount > (
SELECT
     AVG(amount) As Avg_amount
FROM Transactions
);






/* Q10. Find credit cards whose outstanding_amount is greater than the
     average outstanding amount.  */

Ans:


SELECT
     *
FROM Credit_Cards
WHERE outstanding_amount > (
SELECT 
     AVG(outstanding_amount) As Avg_outstanding_amount
FROM Credit_Cards);








/* Q11. Find customers whose age is greater than the average customer age.  */

Ans:

SELECT 
     *
FROM Customers
WHERE age > (
SELECT 
     AVG(age) As Customer_avg_age
FROM Customers);








/* Q12. Find branches whose number of customers is greater than the
     average number of customers per branch.  */

Ans:




SELECT
     *
FROM 
(
SELECT
     BranchName,
     Number_of_Customers,
     AVG(Number_of_Customers) OVER() As AvgNumber_of_customers
FROM
(
SELECT 
     b.branch_name As BranchName,
     COUNT(c.customer_id) as Number_of_Customers
FROM Customers As c
LEFT JOIN
Branches as b
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name
)t
)t
WHERE Number_of_Customers > AvgNumber_of_customers;







/* Q13. Find the customer having the highest loan amount.  */

Ans:


SELECT 
     c.customer_id,
     c.customer_name,
     l.loan_type,
     l.loan_amount
FROM Customers As c
LEFT JOIN
Loans As l 
ON
c.customer_id = l.customer_id
WHERE l.loan_amount = (
SELECT 
     MAX(loan_amount) As Max_loan_amount
FROM Loans)








/* Q14. Find the Customers having the highest balance.  */

Ans:


SELECT 
     c.customer_id,
     c.customer_name,
     a.account_type,
     a.balance
FROM Customers As c
LEFT JOIN
Accounts As a 
ON
c.customer_id = a.customer_id
WHERE a.balance = (
SELECT 
     MAX(balance) As Max_balance
FROM Accounts)











/* Q15. Find the loan having the highest interest rate.  */

Ans:

SELECT * FROM Loans
WHERE interest_rate = (
SELECT 
     MAX(interest_rate) As Max_interest_rate
FROM Loans)









/* Q16. Find the branch having the highest number of customers.  */

Ans:



SELECT
     *
FROM 
(
SELECT
     BranchName,
     Number_of_Customers,
     MAX(Number_of_Customers) OVER() As MaxNumber_of_customers
FROM
(
SELECT 
     b.branch_name As BranchName,
     COUNT(c.customer_id) as Number_of_Customers
FROM Customers As c
LEFT JOIN
Branches as b
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name
)t
)t
WHERE Number_of_Customers = MaxNumber_of_customers;



















/* =============================================================================
   SECTION B — SUBQUERY IN FROM CLAUSE
============================================================================= */


USE 
BFSI_Window



/* Q17. Create a derived table containing branch-wise average customer income.  */
  
Ans:


WITH CTE_derive As
(
SELECT
     b.branch_name ,
     AVG(c.annual_income) As Customer_income
FROM Branches As b
JOIN
Customers As c 
ON
c.branch_id = b.branch_id
GROUP BY b.branch_name
)

SELECT 
     *
FROM CTE_derive










/*  Q18. Find branches whose average customer income is greater than 150000.  */


Ans:




WITH CTE_derive As
(
SELECT
     b.branch_name ,
     AVG(c.annual_income) As Customer_income
FROM Branches As b
JOIN
Customers As c 
ON
c.branch_id = b.branch_id
GROUP BY b.branch_name
)

SELECT 
     *
FROM CTE_derive
WHERE Customer_income > 150000









/*  Q19. Create a derived table containing customer-wise total account balance. */

Ans:


SELECT 
     c.customer_id,
     c.customer_name,
    SUM(a.balance) OVER() As Total_balance
FROM Customers As c 
LEFT JOIN 
Accounts As a
ON
c.customer_id = a.customer_id 










/*  Q20. Find customers whose total account balance is greater than 300000.  */

Ans: 

SELECT 
     c.customer_id,
     c.customer_name,
     a.balance 
FROM Customers As c 
LEFT JOIN 
Accounts As a
ON
c.customer_id = a.customer_id 
WHERE a.balance > 300000;






/*  Q21. Create a derived table containing customer-wise total loan amount. */

Ans:


SELECT 
     c.customer_id,
     c.customer_name,
     l.loan_type,
     loan_amount,
     SUM(l.loan_amount) OVER() As Total_loan_amount
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id








/*  Q22. Find customers whose total loan amount exceeds 3000000. */

Ans:

SELECT 
     c.customer_id,
     c.customer_name,
     a.balance 
FROM Customers As c 
LEFT JOIN 
Accounts As a
ON
c.customer_id = a.customer_id 
WHERE a.balance > 300000;









/*  Q23. Create a derived table containing branch-wise total loan amount.  */

Ans:


WITH CTE_derive_loan AS
(
SELECT 
     b.branch_name,
     SUM(l.loan_amount) As Total_loan_amount
FROM Branches As b
LEFT JOIN 
Customers As c
ON
b.branch_id = c.branch_id
LEFT JOIN 
Loans As l
ON
c.customer_id = l.customer_id
GROUP BY b.branch_name
)

SELECT * FROM CTE_derive_loan;







/* Q24. Find branches whose total loan amount is greater than 10000000.  */

Ans:


WITH CTE_Loan_Branches As
(
SELECT 
     b.branch_name,
     SUM(l.loan_amount) As Total_loan_amount
FROM Customers As c 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
LEFT JOIN 
Branches As b 
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name
)



SELECT * FROM CTE_Loan_Branches
WHERE Total_loan_amount > 10000000;











/* Q25. Create a derived table containing customer-wise transaction count.  */

Ans:


SELECT 
     c.customer_id,
     c.customer_name,
     t.transaction_type,
     COUNT(t.transaction_id) OVER(PARTITION BY c.customer_id) As Customer_Count
FROM Customers As c
LEFT JOIN 
Accounts As a
ON
c.customer_id = a.customer_id
LEFT JOIN 
Transactions As t
ON
t.account_id = a.account_id









/* Q26. Find customers having more transactions than the average customer
     transaction count.  */

Ans:




SELECT
     customer_id,
     customer_name,
     COUNT(AVG_Customer_TransactionCount) As AVG_transaction_count
FROM 
(
SELECT
     customer_id,
     customer_name,
     transaction_type,
     Customer_TransactionCount,
     AVG(Customer_TransactionCount) OVER() As AVG_Customer_TransactionCount
FROM(
SELECT 
     c.customer_id As customer_id,
     c.customer_name As customer_name,
     t.transaction_type As transaction_type,
     COUNT(t.transaction_id) OVER(PARTITION BY c.customer_id) As Customer_TransactionCount
     
FROM Customers As c
LEFT JOIN 
Accounts As a
ON
c.customer_id = a.customer_id
LEFT JOIN 
Transactions As t
ON
t.account_id = a.account_id
)t
)t
WHERE Customer_TransactionCount >= AVG_Customer_TransactionCount
GROUP BY customer_id , customer_name;











/* Q27. Create a derived table containing loan_type-wise average loan amount.  */

Ans:



SELECT     
     loan_type,
     AVG(loan_amount) As Avg_loan_amount
FROM Loans
GROUP BY loan_type












/*  Q28. Find loan types whose average loan amount exceeds 2000000.  */

Ans:


SELECT     
     loan_type,
     AVG(loan_amount) As Avg_loan_amount
FROM Loans
GROUP BY loan_type
HAVING AVG(loan_amount) > 2000000;







/* Q29. Create a derived table containing branch-wise customer count.  */

Ans:

SELECT 
     branch_name,
     Customer_Count,
     AVG(Customer_Count) OVER() As Avg_customer_count
FROM
(
SELECT 
     b.branch_name,
     COUNT(c.customer_id) as Customer_Count
FROM Branches As b
LEFT JOIN
Customers As c 
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name
)t








/* Q30. Find branches having more customers than the average branch
     customer count.  */

Ans:



SELECT 
     *
FROM
(
SELECT 
     branch_name,
     Customer_Count,
     AVG(Customer_Count) OVER() As Avg_customer_count
FROM
(
SELECT 
     b.branch_name,
     COUNT(c.customer_id) as Customer_Count
FROM Branches As b
LEFT JOIN
Customers As c 
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name
)t
)t
WHERE Customer_Count > Avg_customer_count

























/* =============================================================================
   SECTION C — SUBQUERY IN SELECT
============================================================================= */







/* Q31. Display every customer along with the average customer income.  */

Ans:


SELECT 
     customer_id,
     customer_name,
     AVG(annual_income) As avg_customer_income
FROM Customers
GROUP BY customer_id , customer_name






/* Q32. Display every customer along with the difference between their income
     and the average customer income.  */

Ans:


SELECT
     customer_id,
     customer_name,
     annual_income,
    ABS( annual_income - avg_customer_income ) As Diff_customer_income
FROM 
(
SELECT 
     customer_id,
     customer_name,
     annual_income,
     AVG(annual_income) OVER() As avg_customer_income
FROM Customers
)t









/* Q33. Display every account along with the average account balance.  */

Ans:


SELECT 
     account_id,
     AVG(balance) as AVG_account_balance
FROM Accounts
GROUP BY account_id






/* Q 34. Display every loan along with the average loan amount.  */








Q35. Display every customer along with the average customer age.

Q36. Display every branch along with the average customer income.

Q37. Display every customer along with their total loan amount.

Q38. Display every customer along with their total account balance.

Q39. Display every customer along with their total number of transactions.

Q40. Display every customer along with their total credit card outstanding.

Q41. Display every loan along with the total number of payments.
     Use available transaction/account data where applicable.

Q42. Display every credit card along with its percentage of total
     outstanding amount.

Q43. Display every customer along with the maximum annual income
     in the customer table.

Q44. Display every branch along with the total loan amount originated
     from that branch.

Q45. Display every customer along with their percentage contribution
     to total loan amount.





































/* =============================================================================
   SECTION D — SUBQUERY IN JOIN CLAUSE
============================================================================= */

Q46. Join Customers with a subquery containing customer-wise total
     loan amount.

Q47. Display customers whose total loan amount is greater than 3000000.

Q48. Join Branches with a subquery containing branch-wise average
     customer income.

Q49. Display branches whose average customer income is greater than
     1500000.

Q50. Join Customers with a subquery containing customer-wise average age.

Q51. Display customers whose age is greater than their state-wise
     average customer age.

Q52. Join Customers with a subquery containing total credit card
     outstanding.

Q53. Display customers whose credit card outstanding exceeds 200000.

Q54. Join Loans with a subquery containing customer-wise total loan amount.

Q55. Display loans belonging to customers whose total loan exposure
     exceeds 3000000.

Q56. Join Accounts with a subquery containing account-wise
     transaction count.

Q57. Display accounts having more than 2 transactions.






















/* =============================================================================
   SECTION E — SUBQUERY WITH COMPARISON OPERATORS
============================================================================= */

Q58. Find customers whose income is greater than the average income.

Q59. Find customers whose income is less than the average income.

Q60. Find accounts whose balance is greater than the average balance.

Q61. Find accounts whose balance is less than the average balance.

Q62. Find loans whose amount is greater than the average Home Loan amount.

Q63. Find loans whose amount is less than the average Personal Loan amount.

Q64. Find customers whose annual_income is greater than the annual_income
     of a specific customer.

Q65. Find customers whose annual_income is less than the annual_income
     of a specific customer.

Q66. Find branches whose customer count is greater than the customer
     count of a specific branch.

Q67. Find credit cards whose outstanding amount is greater than the
     average outstanding amount of Platinum cards.

Q68. Find transactions whose amount is greater than the average
     UPI transaction amount.

Q69. Find loans whose interest rate is greater than the average
     loan interest rate.

Q70. Find customers whose income is not equal to the highest income.

Q71. Find accounts whose balance is greater than or equal to the
     average account balance.




















/* =============================================================================
   SECTION F — SUBQUERY WITH IN OPERATOR
============================================================================= */

Q72. Find customers who have at least one Home Loan.

Q73. Find customers who have at least one Business Loan.

Q74. Find customers who have at least one active loan.

Q75. Find customers who have at least one credit card.

Q76. Find customers who have at least one Platinum credit card.

Q77. Find customers whose branch is located in Delhi or Maharashtra.

Q78. Find customers belonging to branches having more than 2 customers.

Q79. Find customers belonging to branches having more than 5 accounts.

Q80. Find loans belonging to customers whose annual income exceeds 2000000.

Q81. Find accounts belonging to customers having at least one loan.

Q82. Find customers who have both an account and a loan using
     subquery-based IN logic.

Q83. Find customers belonging to branches that have at least one
     active loan.

Q84. Find credit cards belonging to customers having total loan amount
     greater than 3000000.

Q85. Find transactions belonging to accounts owned by Premium customers.


















/* =============================================================================
   SECTION G — SUBQUERY WITH ANY OPERATOR
============================================================================= */

Q86. Find customers whose annual income is greater than ANY income
    of Regular customers.

Q87. Find customers whose annual income is less than ANY income
    of Premium customers.

Q88. Find accounts whose balance is greater than ANY balance of
    Savings accounts.

Q89. Find loans whose loan amount is greater than ANY Personal Loan amount.

Q90. Find loans whose loan amount is less than ANY Home Loan amount.

Q91. Find customers whose annual income is greater than ANY income
    of customers from a specific state.

Q92. Find customers whose annual income is less than ANY income
    of customers from a specific state.

Q93. Find credit cards whose credit limit is greater than ANY
    Gold credit card limit.

Q94. Find transactions whose amount is greater than ANY ATM transaction.

Q95. Find customers whose total loan amount is greater than ANY
    loan amount belonging to customers from the Regular segment.
























/* =============================================================================
   SECTION H — CORRELATED SUBQUERIES
============================================================================= */

Q96. Find customers whose income is greater than the average income
    of customers from their own state.

Q97. Find customers whose income is below their states average income.

Q98. Find accounts whose balance is greater than the average balance
    of accounts belonging to the same account_type.

Q99. Find customers whose annual income is greater than the average
    income of customers from their own city.

Q100. Find customers whose annual income is below their city average.

Q101. Find the highest-income customer in each branch using a
     correlated subquery.

Q102. Find the lowest-income customer in each branch.

Q103. Find the highest-value loan for each customer.

Q104. Find the largest transaction for each account.

Q105. Find the credit card with the highest outstanding amount
     for each customer.

Q106. Find customers whose total loan amount is greater than the
     average total loan amount of customers.

Q107. Find loans whose amount is greater than the average loan amount
     for their loan_type.

Q108. Find transactions whose amount is greater than the average
     transaction amount of their account.

Q109. Find credit cards whose outstanding amount is greater than the
     average outstanding amount for their card_type.

Q110. Find customers whose total credit card outstanding is greater than
     the average outstanding of customers in their state.


















/* =============================================================================
   SECTION I — EXISTS OPERATOR
============================================================================= */

Q111. Find customers for whom at least one account exists.

Q112. Find customers for whom no account exists.

Q113. Find customers for whom at least one loan exists.

Q114. Find customers for whom no loan exists.

Q115. Find customers for whom at least one credit card exists.

Q116. Find customers for whom no credit card exists.

Q117. Find accounts for which at least one transaction exists.

Q118. Find accounts for which no transaction exists.

Q119. Find customers having at least one transaction greater than 50000.

Q120. Find customers having no transaction greater than 50000.

Q121. Find customers having at least one successful transaction.

Q122. Find customers having no successful transaction.

Q123. Find branches having at least one active loan.

Q124. Find branches having no active loan.

Q125. Find branches having at least one customer with annual income
     greater than 2000000.

Q126. Find customers having at least one transaction greater than 50000.

Q127. Find customers having at least one account with balance greater
     than 100000.

Q128. Find customers having no account with balance greater than 100000.

Q129. Find customers who have both an active loan and active account.

Q130. Find customers who have an active loan and an active credit card.
















------------------------------------------------------------------------------------------------------------------------------------------------























/* =============================================================================
   SECTION J — NON-RECURSIVE CTE
============================================================================= */

Q131. Create a CTE containing Premium customers.

Q132. Use a CTE to calculate branch-wise customer count.

Q133. Use a CTE to calculate branch-wise average customer income.

Q134. Use a CTE to find branches having average customer income
     above 1500000.

Q135. Use a CTE to calculate customer-wise total loan amount.

Q136. Use a CTE to find customers whose total loan amount exceeds 3000000.

Q137. Use a CTE to calculate customer-wise total account balance.

Q138. Use a CTE to find high-balance customers.

Q139. Use a CTE to calculate account-wise transaction count.

Q140. Use a CTE to identify highly active accounts.

Q141. Use a CTE to calculate customer-wise total transaction amount.

Q142. Use a CTE to identify customers having total transactions
     above 500000.

Q143. Use a CTE to calculate customer-wise credit card outstanding.

Q144. Use a CTE to identify customers with outstanding above 200000.

Q145. Use a CTE to calculate branch-wise total loan amount.

Q146. Find the branch with the highest total loan amount.

Q147. Use a CTE to calculate loan_type-wise average loan amount.

Q148. Find the loan type having the highest average loan amount.

Q149. Use a CTE to calculate state-wise total loan amount.

Q150. Find states whose total loan amount exceeds 10000000.


/* =============================================================================
   SECTION K — MULTIPLE CTEs
============================================================================= */

Q151. Use two CTEs to calculate:

     Customer Total Loan
     Customer Total Account Balance

Q152. Use multiple CTEs to identify customers having both:
     high loan exposure and high account balance.

Q153. Use multiple CTEs to calculate:

     Total Loans
     Total Transaction Amount
     Total Account Balance

Q154. Use multiple CTEs to calculate customer-level financial exposure.

Q155. Use multiple CTEs to calculate branch-level:

     Customer Count
     Total Deposits
     Total Loans

Q156. Find branches where total loan amount is greater than
     total account balance.

Q157. Use multiple CTEs to calculate customer-level:

     Income
     Loan Amount
     Account Balance

Q158. Identify customers whose loan exposure is greater than
     their annual income.

Q159. Use multiple CTEs to calculate customer-wise:

     Loan Count
     Credit Card Count
     Account Count

Q160. Identify customers having all three product relationships.


/* =============================================================================
   SECTION L — RECURSIVE CTE : GENERATE SEQUENCE
============================================================================= */

Q161. Generate numbers from 1 to 10 using a recursive CTE.

Q162. Generate numbers from 1 to 100.

Q163. Generate even numbers from 2 to 20.

Q164. Generate odd numbers from 1 to 25.

Q165. Generate dates from '2024-01-01' to '2024-01-31'.

Q166. Generate all months of 2024.

Q167. Generate quarterly periods for 2024.

Q168. Generate numbers from 100 to 500 with an increment of 50.

Q169. Generate a sequence representing loan tenure months
     from 1 to 12.

Q170. Generate the first 12 monthly periods for loan repayment analysis.


/* =============================================================================
   SECTION M — RECURSIVE CTE : BUILD CUSTOMER / BRANCH HIERARCHY
============================================================================= */

Q171. Display the complete branch-to-customer relationship hierarchy.

Q172. Display branch name along with customer name.

Q173. Generate a hierarchy level for every branch-customer relationship.

Q174. Find all customers belonging directly to a specific branch.

Q175. Find all customers belonging to branches located in a specific state.

Q176. Find all customers under a specific branch.

Q177. Find all customers under each branch.

Q178. Find the branch having the maximum number of customers.

Q179. Display state → branch → customer relationship.

Q180. Generate a complete location path for every customer.

Q181. Count customers under each branch.

Q182. Find customers belonging to branches having more than 2 customers.

Q183. Find branches having customers from multiple cities.

Q184. Display the branch hierarchy for customers belonging to the Risk
     or high-value customer segment.

Q185. Find the number of customers under each branch.







































/* =============================================================================
   SECTION N — VIEWS
============================================================================= */

Q186. Create a view containing:

     Customer Name
     State
     Annual Income
     Customer Segment

Q187. Create a view containing customer and account information.

Q188. Create a view containing customer and loan information.

Q189. Create a view containing customer and credit card information.

Q190. Create a view containing branch-wise customer count.

Q191. Create a view containing branch-wise total loan amount.

Q192. Create a view containing customer-wise total loan exposure.

Q193. Create a view containing customer-wise total account balance.

Q194. Create a view containing customer-wise credit card outstanding.

Q195. Create a view containing account-wise transaction summary.

Q196. Create a view containing customer-wise transaction summary.

Q197. Create a view containing customer name, branch name, city
     and state.

Q198. Create a view that hides the complexity of a multi-table
     customer financial profile.

Q199. Modify an existing view using ALTER VIEW.

Q200. Drop an existing view.

Q201. Create a view that exposes only non-sensitive customer information.

Q202. Create a view that hides annual_income from the Customers table.

Q203. Create a view showing only active loans.

Q204. Create a view showing only active credit cards.

Q205. Create a view showing only successful transactions.































/* =============================================================================
   SECTION O — TEMPORARY TABLES
============================================================================= */

Q206. Create a temporary table containing Premium customers.

Q207. Create a temporary table containing customer-wise total loan amount.

Q208. Find the top 10 customers from the temporary table.

Q209. Create a temporary table containing branch-wise loan exposure.

Q210. Find branches whose loan exposure exceeds 10000000.

Q211. Create a temporary table containing account-wise transaction count.

Q212. Find accounts having more than 2 transactions.

Q213. Create a temporary table containing customer-wise total
     transaction amount.

Q214. Find customers whose transaction amount exceeds 500000.

Q215. Create a temporary table containing customer-wise total
     credit card outstanding.

Q216. Identify high outstanding customers using the temporary table.

Q217. Create a temporary table for monthly transaction analysis.

Q218. Create a temporary table for customer-level financial exposure.

Q219. Update values inside a temporary table.

Q220. Delete records from a temporary table using a condition.

Q221. Use a temporary table in a JOIN.

Q222. Use a temporary table for a multi-step financial analysis.

Q223. Use a temporary table to perform a customer segmentation exercise.

Q224. Use a temporary table for a loan portfolio analysis.

Q225. Drop the temporary table explicitly after completing the analysis.























/* =============================================================================
   SECTION P — STORED PROCEDURES : BASICS
============================================================================= */

Q226. Create a stored procedure that returns all customers.

Q227. Create a stored procedure that returns all active accounts.

Q228. Create a stored procedure that returns all active loans.

Q229. Create a stored procedure that returns all active credit cards.

Q230. Execute the customer procedure.

Q231. Create a stored procedure that returns customers from a
     specified state.

Q232. Create a stored procedure that returns customers belonging
     to a specified customer segment.











/* =============================================================================
   SECTION Q — STORED PROCEDURES : PARAMETERS
============================================================================= */

Q233. Create a procedure accepting customer_id and returning
     all accounts of that customer.

Q234. Create a procedure accepting customer_id and returning
     all loans of that customer.

Q235. Create a procedure accepting customer_id and returning
     all credit cards.

Q236. Create a procedure accepting branch_id and returning
     all customers of that branch.

Q237. Create a procedure accepting minimum loan amount.

Q238. Create a procedure accepting loan_type.

Q239. Create a procedure accepting minimum customer income.

Q240. Create a procedure accepting transaction start_date
     and end_date.

Q241. Create a procedure accepting branch_id and minimum loan amount.

Q242. Create a procedure accepting customer_id and date range
     for transactions.


/* =============================================================================
   SECTION R — STORED PROCEDURES : MULTIPLE QUERIES
============================================================================= */

Q243. Create a procedure that accepts customer_id and returns:

     1. Customer Details
     2. Account Details
     3. Loan Details
     4. Credit Card Details

Q244. Create a procedure that accepts branch_id and returns:

     1. Customer Count
     2. Total Account Balance
     3. Total Loan Amount
     4. Total Credit Card Outstanding

Q245. Create a procedure that accepts loan_id and returns:

     1. Loan Details
     2. Customer Details
     3. Customer Total Loan Amount
     4. Customer Account Balance

Q246. Create a procedure that accepts customer_id and returns:

     Total Accounts
     Total Loans
     Total Cards
     Total Loan Amount
     Total Account Balance
     Total Card Outstanding


/* =============================================================================
   SECTION S — STORED PROCEDURES : VARIABLES
============================================================================= */

Q247. Create a procedure using variables to calculate the average
     customer income.

Q248. Create a procedure using variables to calculate total loan exposure.

Q249. Create a procedure using variables to calculate:

     Total Loan Amount
     Total Account Balance
     Total Transaction Amount

Q250. Create a procedure using variables to calculate customer-level
     financial exposure.


/* =============================================================================
   SECTION T — STORED PROCEDURES : IF / ELSE + TRY / CATCH
============================================================================= */

Q251. Create a procedure that accepts customer income and returns:

     'High Income'
     'Medium Income'
     'Low Income'

Q252. Create a procedure that checks whether a customer exists.

Q253. Create a procedure that checks whether a customer has an active loan.

Q254. Create a procedure that checks whether a customer has an active
     credit card.

Q255. Create a procedure that checks whether a loan exists.

Q256. Create a procedure that checks whether sufficient account balance
     exists for a withdrawal.

Q257. Create a procedure that inserts a new customer using TRY/CATCH.

Q258. Handle duplicate customer_id using TRY/CATCH.

Q259. Handle invalid branch_id using TRY/CATCH.

Q260. Create a procedure that updates customer income with error handling.

Q261. Create a procedure that inserts a new loan using TRY/CATCH.

Q262. Return ERROR_NUMBER(), ERROR_MESSAGE() and ERROR_LINE()
     from the CATCH block.


























/* =============================================================================
   SECTION U — TRIGGERS
============================================================================= */

Q263. Create an AFTER INSERT trigger on Customers.

Q264. Create an audit table and log newly inserted customers.

Q265. Insert a new customer and verify that the trigger executes.

Q266. Create an AFTER UPDATE trigger on Customers.

Q267. Log customer annual_income changes.

Q268. Log customer customer_segment changes.

Q269. Create an AFTER DELETE trigger on Customers.

Q270. Log deleted customers into an audit table.

Q271. Create a trigger that logs changes to customer information.

Q272. Create a trigger that logs both INSERT and UPDATE operations
     on Customers.

Q273. Create a trigger that records GETDATE() as action_date.

Q274. Create a trigger that prevents deleting a customer who has
     active loans.

Q275. Create a trigger that logs changes made to customer annual_income.






