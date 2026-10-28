/* =============================================================================
   ============================================================================
                      BFSI_WINDOW
                ADVANCED SQL PRACTICE QUESTIONS
   ============================================================================
============================================================================= */







USE
BFSI_Window








/* =============================================================================
                      SECTION A — SUBQUERY RESULT TYPES
============================================================================= */



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

Ans:


SELECT 
     * ,
     AVG(loan_amount) OVER() As Avg_loan_amount
FROM Loans







/* Q35. Display every customer along with the average customer age.  */

Ans:

SELECT 
     *,
     AVG(age) OVER() As Avg_age
FROM Customers





/* Q36. Display every branch along with the average customer income. */

Ans:



SELECT 
     branch_name ,
     AVG(annual_income) As Avg_annual_income
FROM
(
SELECT
     b.branch_name as branch_name,
     c.annual_income As annual_income
FROM Customers As c
LEFT JOIN 
Branches As b
ON 
c.branch_id = b.branch_id
)t 
GROUP BY branch_name









/* Q37. Display every customer along with their total loan amount.  */

Ans:




SELECT
     Customer_id,
     Customer_Name,
     loan_type,
     SUM(loan_amount) As Total_loan
FROM
(
SELECT 
     c.customer_id As Customer_id,
     c.customer_name  As Customer_Name,
     l.loan_type As loan_type,
     l.loan_amount As loan_amount
FROM Customers As c
LEFT JOIN 
Loans As l
ON 
c.customer_id = l.customer_id
)t
GROUP BY Customer_id , Customer_Name , loan_type;










/* Q38. Display every customer along with their total account balance. */

Ans:


SELECT 
     customer_id,
     customer_name,
     SUM(balance) As Total_Balance
FROM
(
SELECT
     c.customer_id As customer_id,
     c.customer_name As customer_name,
     a.balance As balance
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
)t
GROUP BY customer_id , customer_name;





/* Q39. Display every customer along with their total number of transactions.  */

Ans:




SELECT
     Customer_id,
     Customer_Name,
     Transaction_type,
     COUNT(transaction_id) As Total_Transactions
FROM
(
SELECT 
     c.customer_id As Customer_id,
     c.customer_name As Customer_Name,
     t.transaction_type As Transaction_type,
     t.transaction_id As transaction_id
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
LEFT JOIN 
Transactions As t
ON 
a.account_id = t.account_id
)t
GROUP BY Customer_id , Customer_Name , Transaction_type;








/* Q40. Display every customer along with their total credit card outstanding.  */

Ans:




SELECT
     Customer_id,
     Customer_Name,
     SUM(Outstanding_amount) OVER() As Total_Outstanding_amount
FROM(
SELECT 
     c.customer_id As Customer_id,
     c.customer_name As Customer_Name,
     cc.outstanding_amount As Outstanding_amount
FROM Customers As c
LEFT JOIN
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
)t





/* Q41. Display every loan along with the total number of Transactions.  */
    

Ans:




SELECT 
     loan_type,
     COUNT(Transaction_id) As Total_no_of_transactions
FROM
(
SELECT
     l.loan_type As loan_type,
     t.transaction_id As Transaction_id
FROM Loans As l
LEFT JOIN
Accounts As a
ON 
l.customer_id = a.customer_id 
LEFT JOIN
Transactions As t
ON
a.account_id = t.account_id
)t
GROUP BY loan_type











       
/*  8Q42. Display every credit card along with its percentage of total
     outstanding amount. */

Ans:


SELECT
     card_id,
     card_type,
    ROUND(( outstanding_amount / Total_outstanding_Amount ) * 100 , 2)  As outstanding_amount_percentage
FROM
(
SELECT 
     card_id,
     card_type,
     outstanding_amount,
     SUM(outstanding_amount) OVER() As Total_outstanding_Amount
FROM Credit_Cards
)t






      
/* Q43. Display every customer along with the maximum annual income
     in the customer table.  */

Ans:


SELECT 
     * ,
     MAX(annual_income) OVER() As Max_annual_income
FROM Customers












/* Q44. Display every branch along with the total loan amount originated
     from that branch.   */

Ans:


SELECT 
     b.branch_id,
     b.branch_name,
     l.loan_type,
     l.loan_amount,
     SUM(l.loan_amount) OVER(PARTITION BY b.branch_name ) As Total_loan_amount
FROM Branches As b
LEFT JOIN
Customers As c
ON 
b.branch_id = c.branch_id
LEFT JOIN 
Loans As l
ON 
c.customer_id =l.customer_id

















/* =============================================================================
   SECTION D — SUBQUERY IN JOIN CLAUSE
============================================================================= */







/* Q46. Join Customers with a subquery containing customer-wise total
     loan amount.  */


Ans:

SELECT 
     *,
     SUM(loan_amount) OVER() AS Total_loan_amount
FROM
(
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
)t













/* Q47. Display customers whose total loan amount is greater than 3000000.  */

Ans:


SELECT
     *
FROM 
(
SELECT 
     *,
     SUM(loan_amount) OVER() AS Total_loan_amount
FROM
(
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
)t
)t
WHERE Total_loan_amount > 30000000;









/* Q48. Join Branches with a subquery containing branch-wise average
     customer income.  */

Ans:





SELECT 
     CustomerId,
     Branch_Name,
     Annual_income,
     AVG(Annual_income) OVER() As Avg_annual_income
FROM
(
SELECT 
     c.customer_id As CustomerId,
     b.branch_name As Branch_Name,
     c.annual_income As Annual_income
FROM Customers As c
LEFT JOIN
Branches As b 
ON
c.branch_id = b.branch_id
)t







       
/* Q49. Display branches whose average customer income is greater than
     1500000.  */

Ans:

SELECT
     CustomerId,
     Branch_Name,
     Annual_income,
     Avg_annual_income
FROM
(
SELECT 
     CustomerId,
     Branch_Name,
     Annual_income,
     AVG(Annual_income) OVER() As Avg_annual_income
FROM
(
SELECT 
     c.customer_id As CustomerId,
     b.branch_name As Branch_Name,
     c.annual_income As Annual_income
FROM Customers As c
LEFT JOIN
Branches As b 
ON
c.branch_id = b.branch_id
)t
)t
WHERE Avg_annual_income > 1500000;









/*  Q50. Join Customers with a subquery containing customer-wise average age.  */

Ans:


SELECT 
     customer_id As CustomerId,
     age,
     AVG(age) OVER() As avg_age   
FROM Customers 









/* Q51. Display customers whose age is greater than their state-wise
     average customer age.  */

Ans:

SELECT
     CustomerId,
     state,
     age,
     avg_age
FROM
(
SELECT 
     customer_id As CustomerId,
     state as state,
     age as age,
     AVG(age) OVER(PARTITION BY state) As avg_age   
FROM Customers 
)t
WHERE age > avg_age;











/*  Q52. Join Customers with a subquery containing total credit card
     outstanding. */

Ans:

SELECT
     CustomerID,
     Customer_income
     CardType,
     SUM(outstanding_amount) OVER() As Total_outstanding_amount
FROM
(
SELECT
    c.customer_id As CustomerID,
    c.customer_name AS Customer_income,
    cc.card_type as CardType,
    COALESCE(cc.outstanding_amount , 0) As outstanding_amount
FROM 
Customers As c
LEFT JOIN 
Credit_Cards As cc
On
c.customer_id = cc.customer_id
)t





/* Q53. Display customers whose credit card outstanding exceeds 200000.  */

Ans:

SELECT 
     CustomerID,
     Customer_name,
     CardType,
     Total_outstanding_amount
FROM
(
SELECT
     CustomerID,
     Customer_name,
     CardType,
     SUM(outstanding_amount) OVER() As Total_outstanding_amount
FROM
(
SELECT
    c.customer_id As CustomerID,
    c.customer_name AS Customer_name,
    cc.card_type as CardType,
    COALESCE(cc.outstanding_amount , 0) As outstanding_amount
FROM 
Customers As c
LEFT JOIN 
Credit_Cards As cc
On
c.customer_id = cc.customer_id
)t
)t
WHERE Total_outstanding_amount > 200000;





/* Q56. Join Accounts with a subquery containing account-wise
     transaction count.   */

Ans:


SELECT
     DISTINCT accountId,
     account_type,
     SUM(transaction_count) OVER(PARTITION BY accountId) As Total_transactions
FROM
(
SELECT 
     a.account_id As accountId,
     a.account_type As account_type,
     COUNT(t.transaction_id) OVER(PARTITION BY a.account_id) AS transaction_count
FROM Accounts As a
LEFT JOIN
Transactions As t
ON 
a.account_id = t.account_id
)t




/* 57. Display accounts having more than 2 transactions.  */

Ans:

SELECT
     accountId,
     account_type,
     Total_transactions
FROM
(
SELECT
     DISTINCT accountId,
     account_type,
     SUM(transaction_count) OVER(PARTITION BY accountId) As Total_transactions
FROM
(
SELECT 
     a.account_id As accountId,
     a.account_type As account_type,
     COUNT(t.transaction_id) OVER(PARTITION BY a.account_id) AS transaction_count
FROM Accounts As a
LEFT JOIN
Transactions As t
ON 
a.account_id = t.account_id
)t
)t
WHERE Total_transactions > 2;





















/* =============================================================================
   SECTION E — SUBQUERY WITH COMPARISON OPERATORS
============================================================================= */










/*  Q58. Find customers whose income is greater than the average income.  */

Ans:




SELECT
     *
FROM 
(
SELECT 
     customer_id,
     customer_name,
     annual_income,
     AVG(annual_income) OVER() As Avg_annual_income
FROM Customers
)t
WHERE annual_income > Avg_annual_income;















/* Q59. Find customers whose income is less than the average income.  */

Ans:



SELECT 
     customer_id,
     customer_name,
     annual_income,
     AVG(annual_income) OVER() As Avg_annual_income
FROM Customers
WHERE annual_income > (
SELECT 
     AVG(annual_income) As Avg_annual_income
FROM Customers
)












/* Q60. Find accounts whose balance is greater than the average balance. */

Ans:





SELECT 
     account_id,
     account_type,
     balance,
     AVG(balance) OVER() As Avg_balance
FROM Accounts
WHERE balance > (
SELECT
     AVG(balance) As Avg_balance
FROM Accounts
)













/* Q61. Find accounts whose balance is less than the average balance.  */

Ans:





SELECT 
     account_id,
     account_type,
     balance,
     AVG(balance) OVER() As Avg_balance
FROM Accounts
WHERE balance < (
SELECT
     AVG(balance) As Avg_balance
FROM Accounts
)















/* Q62. Find loans whose amount is greater than the average Home Loan amount.  */

Ans:


SELECT 
     loan_id,
     loan_type,
     loan_amount,
     AVG(loan_amount) OVER() As Avg_loan_amount
FROM Loans
WHERE loan_amount > (
SELECT
     AVG(loan_amount) As AVG_loan_amount
FROM Loans
)








  
/* Q63. Find loans whose amount is less than the average Personal Loan amount.   */

Ans:


SELECT 
     loan_id,
     loan_type,
     loan_amount,
     AVG(loan_amount) OVER() As Avg_loan_amount
FROM Loans
WHERE loan_amount < (
SELECT
     AVG(loan_amount) As AVG_loan_amount
FROM Loans
)













/* Q64. Find customers whose annual_income is greater than the annual_income
     of a specific customer.   */

Ans:




SELECT 
     customer_id,
     customer_name,
     annual_income,
     AVG(annual_income) OVER() As Avg_annual_income
FROM Customers
WHERE annual_income > (
SELECT 
     annual_income As specific_annual_income
FROM Customers
WHERE customer_name = 'Priya Verma'
)















/* Q65. Find customers whose annual_income is less than the annual_income
     of a specific customer.  */

Ans:



SELECT 
     customer_id,
     customer_name,
     annual_income,
     AVG(annual_income) OVER() As Avg_annual_income
FROM Customers
WHERE annual_income < (
SELECT 
     annual_income As specific_annual_income
FROM Customers
WHERE customer_name = 'Priya Verma'
)











       
/*  Q66. Find branches whose customer count is less than the customer
     count of a specific branch.  */

Ans:

SELECT 
     branchID,
     Branch_name,
     Customer_count
FROM
(
SELECT 
    DISTINCT b.branch_id As branchID,
    b.branch_name As Branch_name,
    COUNT(c.customer_id) OVER(PARTITION BY b.branch_name) As Customer_count
FROM 
Branches As b
LEFT JOIN
Customers As c
ON
c.branch_id = b.branch_id
)t
WHERE Customer_count < (

SELECT 
    DISTINCT COUNT(c.customer_id) OVER(PARTITION BY b.branch_name)  As Customer_count
FROM 
Branches As b
LEFT JOIN
Customers As c
ON
c.branch_id = b.branch_id
WHERE branch_name = 'Main Branch'

)













/*  Q67. Find credit cards whose outstanding amount is greater than the
     average outstanding amount of Platinum cards.  */

Ans:


SELECT 
     *
FROM
(
SELECT 
     card_id,
     card_type,
     outstanding_amount,
     AVG(outstanding_amount) OVER() As Avg_outstanding_amount
FROM Credit_Cards
WHERE card_type = 'Platinum'
)t
WHERE outstanding_amount > Avg_outstanding_amount












/*  Q68. Find transactions whose amount is greater than the average
     UPI transaction amount.  */

Ans:



SELECT 
     *
FROM
(
SELECT 
     transaction_id,
     transaction_type,
     channel,
     amount,
     AVG(amount) OVER() As Avg_transaction_amount
FROM Transactions
WHERE channel = 'UPI'
)t
WHERE amount > Avg_transaction_amount;
















/*  Q69. Find loans whose interest rate is greater than the average
     loan interest rate.  */


Ans:


SELECT 
     loan_id,
     loan_type,
     interest_rate
FROM Loans
WHERE interest_rate > (

SELECT 
     AVG(interest_rate) As Avg_interest_rate
FROM Loans
)






/*  Q70. Find customers whose income is not equal to the highest income. */

Ans:

SELECT 
     customer_id,
     customer_segment,
     annual_income
FROM Customers
WHERE annual_income <> (

SELECT 
     MAX(annual_income) As Max_annual_income
FROM Customers
)








/*  Q71. Find accounts whose balance is greater than or equal to the
     average account balance.  */

Ans:


SELECT
     account_id,
     account_type,
     balance,
     AVG(balance) OVER() As Avg_balance
FROM Accounts
WHERE balance > (

SELECT 
     AVG(balance)  As Avg_balance
FROM Accounts

)



















/* =============================================================================
   SECTION F — SUBQUERY WITH IN OPERATOR
============================================================================= */






/* Q72. Find customers who have at least one Home Loan.  */


Ans:

SELECT 
     *
FROM 
(
SELECT 
     c.customer_id,
     c.customer_name,
     COUNT(l.customer_id) As Total_loan_count
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
GROUP BY c.customer_id , c.customer_name
)t
WHERE Total_loan_count >= 1






 
/* Q73. Find customers who have at least one Business Loan. */

Ans:


SELECT
     *
FROM
(
SELECT 
     c.customer_id,
     c.customer_name,
     l.loan_type,
     COUNT(l.customer_id) OVER(PARTITION BY c.customer_id) As Total_loan_count
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
WHERE l.loan_type IN('Business Loan')
)t
WHERE Total_loan_count >= 1
















/*  Q74. Find customers who have at least one active loan. */

Ans:


SELECT
     *
FROM
(
SELECT 
     c.customer_id,
     c.customer_name,
     l.loan_status As loan_status,
     COUNT(l.customer_id) OVER(PARTITION BY c.customer_id) As Total_loan_count
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
WHERE l.loan_status IN('Active')
)t
WHERE Total_loan_count >= 1











/*  Q75. Find customers who have at least one credit card.  */

Ans:


SELECT  
     *
FROM
(
SELECT 
     c.customer_id,
     c.customer_name,
     COUNT(cc.card_id) OVER(PARTITION BY c.customer_id) As Credit_Count
FROM Customers As c
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
)t
WHERE Credit_Count >= 1; 







/*  Q76. Find customers who have at least one Platinum credit card.  */

Ans:

SELECT
     *
FROM
(
SELECT 
     c.customer_id,
     c.customer_name,
     c.customer_segment,
     COUNT(cc.card_id) OVER(PARTITION BY c.customer_id) As Card_Count
FROM Customers As c
LEFT JOIN
Credit_Cards As cc
ON 
c.customer_id = cc.customer_id
WHERE card_type = 'Platinum'
)t
WHERE Card_Count >= 1







/*  Q77. Find customers whose branch is located in Delhi or Maharashtra.  */

Ans:



SELECT
     c.customer_id ,
     c.customer_name,
     c.state,
     b.branch_name
FROM Customers As c
LEFT JOIN 
Branches As b
ON
c.branch_id = b.branch_id
WHERE b.state IN('Delhi' , 'Maharashtra')










/*  Q78. Find customers belonging to branches having more than 2 customers.  */

Ans:

SELECT
     *
FROM Customers
WHERE customer_id IN (
SELECT
     CustomerID
FROM
(
SELECT 
     DISTINCT c.customer_id As CustomerID,
     b.branch_name,
     COUNT(c.customer_id) OVER(PARTITION BY b.branch_name) As Customer_Count
FROM Customers As c
LEFT JOIN
Branches As b
ON 
c.branch_id = b.branch_id
)t
WHERE Customer_Count > 2)







/*  Q79. Find customers belonging to branches having more than 2 accounts.  */


Ans:



SELECT 
     branchID,
     branch_Name,
     Account_count
FROM
(
SELECT 
     DISTINCT b.branch_id As branchID ,
     b.branch_name As branch_Name,
     COUNT(a.account_id) OVER(PARTITION BY b.branch_name) As Account_count
FROM Branches As b
LEFT JOIN
Accounts As a
ON
b.branch_id = a.branch_id
)t
WHERE Account_count > 2;























/*  Q80. Find loans belonging to customers whose annual income exceeds 2000000.   */

Ans:

SELECT  
     l.loan_id,
     l.loan_type,
     l.loan_type,
     c.customer_id,
     c.customer_name,
     c.annual_income
FROM Loans As l
LEFT JOIN
Customers As c
ON
l.customer_id = c.customer_id
WHERE c.annual_income > 200000;










/*  Q81. Find accounts belonging to customers having at least one loan. */


Ans:


SELECT 
     c.customer_id,
     c.customer_name,
     a.account_id,
     a.account_type,
     l.loan_type,
     COUNT(l.loan_id) OVER(PARTITION BY c.customer_id)
FROM Customers As c
LEFT JOIN
Accounts As a
ON 
c.customer_id = a.customer_id
LEFT JOIN
Loans As l
ON 
c.customer_id = l.customer_id;






























/* =============================================================================
   SECTION G — SUBQUERY WITH ANY OPERATOR
============================================================================= */





/*  Q86. Find customers whose annual income is greater than ANY income
     of Regular customers.  */


Ans:


SELECT 
     *
FROM Customers
WHERE annual_income > ANY (

SELECT  
     annual_income
FROM Customers 
WHERE customer_segment = 'Regular'
)








/*  Q87. Find customers whose annual income is less than ANY income
    of Premium customers.  */


Ans:



SELECT 
     *
FROM Customers
WHERE annual_income > ANY (

SELECT  
     annual_income
FROM Customers 
WHERE customer_segment = 'Premium'
)













/*  Q88. Find accounts whose balance is greater than ANY balance of
    Savings accounts.  */

Ans:




SELECT 
     *
FROM Accounts
WHERE balance > ANY (

SELECT  
     balance
FROM Accounts 
WHERE account_type = 'Savings'
)








/*  Q89. Find loans whose loan amount is greater than ANY Personal Loan amount.  */


Ans:


SELECT 
     *
FROM Loans
WHERE loan_amount > ANY (

SELECT  
     loan_amount
FROM Loans
WHERE loan_type = 'Personal Loan'
)











/*  Q90. Find loans whose loan amount is less than ANY Home Loan amount.  */

Ans:



SELECT 
     *
FROM Loans
WHERE loan_amount < ANY (

SELECT  
     loan_amount
FROM Loans
WHERE loan_type = 'Home Loan'
)


















/*  Q91. Find customers whose annual income is greater than ANY income
    of customers from a specific state.  */

Ans:




SELECT 
     *
FROM Customers As c
LEFT JOIN 
Loans As l
ON
c.customer_id = l.customer_id
WHERE l.loan_amount > ANY (

SELECT  
     loan_amount
FROM Loans
WHERE c.state = 'Delhi'
)









/* Q92. Find customers whose annual income is less than ANY income
    of customers from a specific state. */

Ans:




SELECT 
     *
FROM Customers As c
LEFT JOIN 
Loans As l
ON
c.customer_id = l.customer_id
WHERE l.loan_amount < ANY (

SELECT  
     loan_amount
FROM Loans
WHERE c.state = 'Delhi'
)










     
/*  Q93. Find credit cards whose credit limit is greater than ANY
    Gold credit card limit.  */


Ans:


SELECT
     *
FROM Credit_Cards
WHERE credit_limit > ANY(
SELECT 
     credit_limit
FROM Credit_Cards
WHERE card_type = 'Gold')










/*  Q94. Find transactions whose amount is greater than ANY ATM transaction.  */


Ans:


SELECT
     *
FROM Transactions
WHERE amount > ANY (

SELECT 
     amount
FROM Transactions
WHERE channel = 'ATM')













/*  Q95. Find customers whose total loan amount is greater than ANY
    loan amount belonging to customers from the Regular segment.  */

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
WHERE l.loan_amount > ANY (


SELECT 
     l.loan_amount
FROM Customers As c
LEFT JOIN 
Loans As l
ON
c.customer_id = l.customer_id
WHERE customer_segment = 'Regular')




























/* =============================================================================
   SECTION H — CORRELATED SUBQUERIES
============================================================================= */





/*  Q96. Find customers whose income is greater than the average income
    of customers from their own state.  */

Ans:




SELECT
     *
FROM
(
SELECT 
     customer_id,
     state,
     customer_name,
     annual_income,
     AVG(annual_income) OVER(PARTITION BY state) As avg_income
FROM Customers
)t
WHERE annual_income > avg_income;







/*  Q97. Find customers whose income is below their states average income.  */

Ans:


SELECT
     *
FROM
(
SELECT 
     customer_id,
     state,
     customer_name,
     annual_income,
     AVG(annual_income) OVER(PARTITION BY state) As avg_income
FROM Customers
)t
WHERE annual_income < avg_income;









 
/*  Q98. Find accounts whose balance is greater than the average balance
    of accounts belonging to the same account_type.  */


Ans:



SELECT
     *
FROM
(
SELECT 
     account_id,
     account_type,
     balance,
     AVG(balance) OVER(PARTITION BY account_type) As avg_balance
FROM Accounts
)t
WHERE balance < avg_balance;













/*  Q99. Find customers whose annual income is greater than the average
    income of customers from their own city.   */

Ans:


SELECT
     *
FROM
(
SELECT 
     customer_id,
     city,
     customer_name,
     annual_income,
     AVG(annual_income) OVER(PARTITION BY city) As avg_income
FROM Customers
)t
WHERE annual_income > avg_income;












/*  Q100. Find customers whose annual income is below their city average.  */


Ans:

SELECT
     *
FROM
(
SELECT 
     customer_id,
     city,
     customer_name,
     annual_income,
     AVG(annual_income) OVER(PARTITION BY city) As avg_income
FROM Customers
)t
WHERE annual_income < avg_income;












/*  Q101. Find the highest-income customer in each branch using a
     correlated subquery.  */

Ans:


SELECT 
     *
FROM
(
SELECT
     c.customer_id,
     c.customer_name,
     annual_income,
     MAX(c.annual_income) OVER(PARTITION BY b.branch_name) As Max_income,
     b.branch_name
FROM Customers As c
LEFT JOIN
Branches As b
ON
c.branch_id = b.branch_id
)t
WHERE annual_income = Max_income;












/*  Q102. Find the lowest-income customer in each branch.   */

Ans:

SELECT 
     *
FROM
(
SELECT
     c.customer_id,
     c.customer_name,
     annual_income,
     MIN(c.annual_income) OVER(PARTITION BY b.branch_name) As Min_income,
     b.branch_name
FROM Customers As c
LEFT JOIN
Branches As b
ON
c.branch_id = b.branch_id
)t
WHERE annual_income = Min_income;















/*  Q104. Find the largest transaction for each account.  */


Ans:



SELECT
     *
FROM
(
SELECT
     DISTINCT a.account_id,
     t.transaction_id,
     t.amount As amount,
     MAX(t.amount) OVER(PARTITION BY a.account_id) as Max_Transaction
FROM Transactions As t
LEFT JOIN
Accounts As a
ON
t.account_id = a.account_id
)t
WHERE amount = Max_Transaction










/*  Q105. Find the credit card with the highest outstanding amount
     for each customer. */

Ans:


SELECT 
     cc.card_id,
     cc.card_type,
     c.customer_name,
     cc.outstanding_amount
FROM Customers As c
LEFT JOIN
Credit_Cards As cc
ON 
c.customer_id = cc.customer_id
WHERE cc.card_id IS NOT NULL














/*  Q106. Find customers whose total loan amount is greater than the
     average total loan amount of customers. */


Ans:




SELECT 
     c.customer_id,
     c.customer_name,
     l.loan_type,
     SUM(l.loan_amount) OVER(PARTITION BY c.customer_id)
FROM Loans As l
LEFT JOIN
Customers As c
ON 
c.customer_id = l.customer_id













/*  Q107. Find loans whose amount is greater than the average loan amount
     for their loan_type.  */

Ans:


SELECT
     * 
FROM 
(
SELECT 
     loan_type,
     loan_amount,
     AVG(loan_amount) OVER(PARTITION BY loan_type) As AVG_loan_amount
FROM Loans
)t
WHERE loan_amount > AVG_loan_amount;















/* =============================================================================
   SECTION I — EXISTS OPERATOR
============================================================================= */




/*  Q111. Find customers for whom at least one account exists.  */

Ans:



SELECT 
     c.customer_id,
     c.customer_name,
     a.account_id,
     a.balance
FROM Customers As c
LEFT JOIN
Accounts As a
ON 
c.customer_id = a.customer_id;









/*  Q112. Find customers for whom no account exists.  */

Ans:


SELECT 
     c.customer_id,
     c.customer_name,
     a.account_id,
     a.balance
FROM Customers As c
LEFT JOIN
Accounts As a
ON 
c.customer_id = a.customer_id;








/*  Q113. Find customers for whom at least one loan exists.  */

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
c.customer_id = l.customer_id;






/*   Q114. Find customers for whom no loan exists.  */

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
c.customer_id = l.customer_id;






 
/*   Q115. Find customers for whom at least one credit card exists.  */

Ans:



SELECT 
     *
FROM Customers As c
LEFT JOIN
Credit_Cards As cc
ON 
c.customer_id = cc.customer_id
WHERE cc.customer_id IS NOT NULL;








/*  Q116. Find customers for whom no credit card exists.  */

Ans:


SELECT
    *
FROM Customers As c
WHERE EXISTS (
    SELECT *
    FROM Credit_Cards As cc
    WHERE cc.card_id IS NULL
      AND c.customer_id = cc.customer_id
);





/*  Q117. Find accounts for which at least one transaction exists.  */


Ans:


SELECT 
     a.account_id,
     a.account_type
FROM Accounts As a
WHERE EXISTS (
SELECT
     t.transaction_id,
     t.transaction_type
FROM Transactions As t
WHERE a.account_id IS NOT NULL
AND a.account_id = t.account_id

)











/*  Q118. Find accounts for which no transaction exists.  */

Ans:

SELECT 
     a.account_id,
     a.account_type
FROM Accounts As a
WHERE EXISTS (
SELECT
     t.transaction_id,
     t.transaction_type
FROM Transactions As t
WHERE a.account_id IS NOT NULL
AND a.account_id = t.account_id

)







 
/*   Q119. Find customers having at least one transaction greater than 50000.   */

Ans:


SELECT 
     *
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
WHERE a.account_id IN (

SELECT
     a.account_id
FROM Transactions
WHERE amount > 5000)







/*  Q120. Find customers having no transaction greater than 50000.   */

Ans:



SELECT 
     *
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
WHERE a.account_id IN (

SELECT
     a.account_id
FROM Transactions
WHERE amount <= 5000)






/*  Q122. Find customers having no successful transaction.  */

Ans:



SELECT * FROM Customers As c
LEFT JOIN 
Accounts As a
ON
c.customer_id = a.customer_id
WHERE a.account_id IN (
SELECT account_id FROM Transactions
WHERE transaction_status = 'failed')




/*  Q124. Find branches having no active loan.  */

Ans:

SELECT * FROM Branches As b
LEFT JOIN 
Customers As c
ON 
c.branch_id = c.branch_id
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
WHERE l.loan_id IN (

SELECT 
     loan_id
FROM Loans
WHERE loan_status = 'Closed')










/*  Q125. Find branches having at least one customer with annual income
     greater than 2000000.   */


Ans:


SELECT 
     * 
FROM Branches As b
WHERE EXISTS (
SELECT b.branch_id FROM Customers AS c
WHERE annual_income > 2000000
AND b.branch_id = c.branch_id)





/*   Q126. Find customers having at least one transaction greater than 50000.  */


Ans:


SELECT 
     * 
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
WHERE EXISTS (
SELECT t.transaction_id FROM Transactions As t
WHERE amount > 50000
AND a.account_id = t.account_id)






/*  Q127. Find customers having at least one account with balance greater
     than 100000.  */


Ans:




SELECT 
     * 
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
WHERE EXISTS (
SELECT a.account_id FROM Accounts As a
WHERE balance > 100000
AND c.customer_id = a.customer_id)






/*  Q128. Find customers having no account with balance greater than 100000.  */

Ans:


SELECT 
     * 
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
WHERE EXISTS (
SELECT a.account_id FROM Accounts As a
WHERE balance <> 100000
AND c.customer_id = a.customer_id)








/*   Q129. Find customers who have both an active loan and active account.   */

Ans:



SELECT 
     * 
FROM Customers As c
LEFT JOIN 
Loans As l
ON 
c.customer_id = l.customer_id
LEFT JOIN 
Accounts As a
ON
l.customer_id = a.customer_id
WHERE l.loan_status = 'Active'







  

/*   Q130. Find customers who have an active loan and an active credit card.  */

 
 Ans:




SELECT 
     * 
FROM Customers As c
LEFT JOIN 
Loans As l
ON 
c.customer_id = l.customer_id
LEFT JOIN 
Credit_Cards As cc
ON
l.customer_id = cc.customer_id
WHERE l.loan_status = 'Active'
AND
cc.card_id IS NOT NULL
















------------------------------------------------------------------------------------------------------------------------------------------------























/* =============================================================================
   SECTION J — NON-RECURSIVE CTE
============================================================================= */








/*  Q131. Create a CTE containing Premium customers.  */

Ans:


WITH CTE_Premium_Customers As
(
SELECT
     *
FROM Customers
WHERE customer_segment = 'Premium'
)


SELECT 
     *
FROM CTE_Premium_Customers







/*  Q132. Use a CTE to calculate branch-wise customer count.   */


Ans:


WITH CTE_Branch_Customer AS(
SELECT
     b.branch_name ,
     COUNT(c.customer_id) As Customer_Count
FROM Branches As b
LEFT JOIN 
Customers As c
ON
c.branch_id = b.branch_id
GROUP BY b.branch_name
)


SELECT 
     *
FROM CTE_Branch_Customer




/* Q133. Use a CTE to calculate branch-wise average customer income. */

Ans:



WITH CTE_Branch_income AS (
SELECT
     b.branch_name,
     c.annual_income
FROM Customers As c
LEFT JOIN 
Branches As b
ON 
b.branch_id = c.branch_id
)


SELECT
     DISTINCT branch_name,
     AVG(annual_income) OVER(PARTITION BY branch_name) AS Avg_BranchIncome
FROM CTE_Branch_income










/*  Q134. Use a CTE to find branches having average customer income
     above 1500000.  */

Ans:




WITH CTE_Branch_income AS (
SELECT
     b.branch_name,
     c.annual_income
FROM Customers As c
LEFT JOIN 
Branches As b
ON 
b.branch_id = c.branch_id
)
,
AVG_CTE_BranchIncome As (
SELECT
     DISTINCT branch_name,
     AVG(annual_income) OVER(PARTITION BY branch_name) AS Avg_BranchIncome
FROM CTE_Branch_income
)


SELECT
     *
FROM AVG_CTE_BranchIncome
WHERE Avg_BranchIncome > 150000














/*  Q135. Use a CTE to calculate customer-wise total loan amount.  */

Ans:


WITH CTE_Customer_loan As (
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
)


SELECT 
     *
FROM CTE_Customer_loan











 
/*  Q136. Use a CTE to find customers whose total loan amount exceeds 3000000.   */

Ans:


WITH CTE_Customer_loan As (
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
)


SELECT 
     *
FROM CTE_Customer_loan
WHERE loan_amount > 3000000












/*  Q137. Use a CTE to calculate customer-wise total account balance.  */

Ans:


With CTE_Customer_balance As (
SELECT 
     c.customer_id ,
     c.customer_name,
     a.balance
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
)

SELECT 
     *
FROM CTE_Customer_balance









/*  Q138. Use a CTE to find high-balance customers. */

Ans:


WITH CTE_high_balance As (
SELECT
     c.customer_id,
     c.customer_name,
     a.balance,
     CASE
         WHEN a.balance > 300000 THEN 'HIGH'
         WHEN a.balance < 150000 and a.balance > 20000 THEN 'MEDIUM'
         WHEN a.balance < 200000 THEN 'LOW'
     END As balance_segment
FROM Customers As c
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id
)

SELECT
     *
FROM CTE_high_balance
WHERE balance_segment = 'HIGH'








 
/*   Q139. Use a CTE to calculate account-wise transaction count.  */

Ans:


WITH CTE_Account_Transaction AS (
SELECT 
     a.account_id,
     a.account_type,
     t.transaction_id
FROM Accounts As a
LEFT JOIN 
Transactions As t
ON 
a.account_id = t.account_id
)

SELECT 
     DISTINCT account_id,
     COUNT(transaction_id) OVER(PARTITION BY account_id) As Transaction_Count
FROM CTE_Account_Transaction










/*  Q140. Use a CTE to identify highly active accounts.  */

Ans:




WITH CTE_Account_Transaction AS (
SELECT 
     a.account_id,
     a.account_type,
     t.transaction_id
FROM Accounts As a
LEFT JOIN 
Transactions As t
ON 
a.account_id = t.account_id
)


, CTE_Transaction_count As (
SELECT 
     DISTINCT account_id,
     COUNT(transaction_id) OVER(PARTITION BY account_id) As Transaction_Count
FROM CTE_Account_Transaction
),


CTE_Active_segment As(
SELECT
     *,
     CASE
        WHEN Transaction_Count = '3' THEN 'HIGHLY ACTIVE'
        WHEN Transaction_Count = '2' THEN 'MEDIUM ACTIVE'
        WHEN Transaction_Count = '1' THEN 'LOW ACTIVE'
    END AS Active_segmemt
FROM CTE_Transaction_count
)



SELECT
     *
FROM CTE_Active_segment 
WHERE Active_segmemt = 'HIGHLY ACTIVE';












/*  Q141. Use a CTE to calculate customer-wise total transaction amount.   */

Ans:


WITH Customer_Transaction AS (
SELECT
     c.customer_id,
     t.amount
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
LEFT JOIN 
Transactions As t 
ON 
a.account_id = t.account_id
)

SELECT
     DISTINCT customer_id,
     SUM(amount) OVER(PARTITION BY customer_id) As Sum_amount
FROM Customer_Transaction












/*  Q142. Use a CTE to identify customers having total transactions
     above 500000.  */

Ans:




WITH Customer_Transaction AS (
SELECT
     c.customer_id,
     t.amount
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
LEFT JOIN 
Transactions As t 
ON 
a.account_id = t.account_id
)

, CTE_sum_amount As (
SELECT
     DISTINCT customer_id,
     SUM(amount) OVER(PARTITION BY customer_id) As Sum_amount
FROM Customer_Transaction
)


SELECT 
     *
FROM CTE_sum_amount
WHERE Sum_amount > 250000









  
/*  Q143. Use a CTE to calculate customer-wise credit card outstanding.  */

Ans:


WITH CTE_Customer_Credit As (

SELECT 
     c.customer_id,
     c.customer_name,
     cc.outstanding_amount
FROM Customers As c
LEFT JOIN 
Credit_Cards As cc
ON
c.customer_id = cc.customer_id
)

SELECT 
     *
FROM CTE_Customer_Credit







/*  Q144. Use a CTE to identify customers with outstanding above 200000.  */

Ans:


WITH CTE_Customer_Credit As (

SELECT 
     c.customer_id,
     c.customer_name,
     cc.outstanding_amount
FROM Customers As c
LEFT JOIN 
Credit_Cards As cc
ON
c.customer_id = cc.customer_id
)

, CTE_Outstanding_amount As (
SELECT 
     *
FROM CTE_Customer_Credit
)


SELECT
     *
FROM CTE_Outstanding_amount
WHERE outstanding_amount > 20000








/*  Q145. Use a CTE to calculate branch-wise total loan amount.   */

Ans:




WITH CTE_Branch_loan_amount As (
SELECT
     DISTINCT b.branch_name,
     SUM(l.loan_amount) OVER(PARTITION BY b.branch_name) As total_loan_amount
FROM Branches As b
LEFT JOIN 
Customers As c
ON
c.branch_id = b.branch_id
LEFT JOIN 
Loans As l
ON 
c.customer_id = l.customer_id
)



SELECT 
     *
FROM CTE_Branch_loan_amount












/*  Q146. Find the branch with the highest total loan amount.  */

Ans:


WITH CTE_Branch_loan_amount As (
SELECT
     DISTINCT b.branch_name,
     SUM(l.loan_amount) OVER(PARTITION BY b.branch_name) As total_loan_amount
FROM Branches As b
LEFT JOIN 
Customers As c
ON
c.branch_id = b.branch_id
LEFT JOIN 
Loans As l
ON 
c.customer_id = l.customer_id
)


, CTE_Max_LoanAmount AS (
SELECT 
     *,
     MAX(total_loan_amount) OVER() AS Max_total_LoanAmount
FROM CTE_Branch_loan_amount
)


SELECT
     *
FROM CTE_Max_LoanAmount
WHERE total_loan_amount = Max_total_LoanAmount











/*   Q147. Use a CTE to calculate loan_type-wise average loan amount.  */

Ans:


WITH CTE_AVG_loan AS(
SELECT
     DISTINCT loan_type,
     AVG(loan_amount) OVER(PARTITION BY loan_type) AS AVG_loan_amount
FROM Loans
)



SELECT
     *
FROM CTE_AVG_loan








  
/*  Q148. Find the loan type having the highest average loan amount.  */


Ans:



WITH CTE_AVG_loan AS(
SELECT
     DISTINCT loan_type,
     AVG(loan_amount) OVER(PARTITION BY loan_type) AS AVG_loan_type
FROM Loans
)


, CTE_MAX_loan As (
SELECT
     *,
     MAX(AVG_loan_type) OVER() As MAX_loan_type
FROM CTE_AVG_loan
)


, CTE_MAX_AVG_loan AS (
SELECT
     *
FROM CTE_MAX_loan
) 


SELECT
     *
FROM CTE_MAX_AVG_loan
WHERE AVG_loan_type = MAX_loan_type










/*  Q149. Use a CTE to calculate state-wise total loan amount.  */

Ans:

WITH CTE_state_loan AS (
SELECT
     DISTINCT c.state,
     SUM(l.loan_amount) OVER(PARTITION BY c.state) As Total_loan_amount
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
)

SELECT
     *
FROM CTE_state_loan









 /* Q150. Find states whose total loan amount exceeds 10000000.  */



Ans:


WITH CTE_state_loan AS (
SELECT
     DISTINCT c.state,
     SUM(l.loan_amount) OVER(PARTITION BY c.state) As Total_loan_amount
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
)


, CTE_state_loan_exceed As (
SELECT
     *
FROM CTE_state_loan
) 


SELECT
     *
FROM CTE_state_loan_exceed
WHERE Total_loan_amount > 10000000


























/* =============================================================================
   SECTION K — MULTIPLE CTEs
============================================================================= */






/* Q151. Use two CTEs to calculate:

     Customer Total Loan
     Customer Total Account Balance  */


Ans:


WITH CTE_Customer_TotalLoan AS (
SELECT
     c.customer_id,
     c.customer_name,
     l.loan_type,
     l.loan_amount
FROM Loans As l 
LEFT JOIN 
Customers As c
ON 
c.customer_id = l.customer_id
) ,

CTE_Customer_AccountBalance As (
SELECT 
     c.customer_id,
     a.account_type,
     a.balance
FROM Customers As c
LEFT JOIN 
Accounts As a 
On 
c.customer_id = a.customer_id
)



SELECT 
     *
FROM CTE_Customer_TotalLoan As ctl
LEFT JOIN 
CTE_Customer_AccountBalance As cab
ON 
ctl.customer_id = cab.customer_id








/*  Q152. Use multiple CTEs to identify customers having both:
     high loan exposure and high account balance.  */

Ans:




WITH CTE_loan_Exposure As (
SELECT
     c.customer_id,
     l.loan_type,
     l.loan_amount,
     MAX(l.loan_amount) OVER() As Max_loan_amount
FROM Customers As c 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
),





CTE_High_loan_exposure As (
SELECT
     *
FROM CTE_loan_Exposure
WHERE loan_amount = Max_loan_amount
),





CTE_Account_balance AS (
SELECT
     c.customer_id,
     c.customer_name,
     a.account_type,
     a.balance,
     MAX(a.balance) OVER() AS MAX_balance
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
),



CTE_High_AccountBalance AS (
SELECT
     * 
FROM CTE_Account_balance
WHERE balance = Max_balance
)



SELECT 
     *
FROM CTE_High_loan_exposure As hle
LEFT JOIN 
CTE_High_AccountBalance As hab
ON 
hle.customer_id = hab.customer_id
















/* =============================================================================
   SECTION L — RECURSIVE CTE : GENERATE SEQUENCE
============================================================================= */













/* Q161. Generate numbers from 1 to 10 using a recursive CTE.  */

Ans:


WITH CTE_Series AS (

SELECT 
     1 As MyNumber 

UNION ALL

SELECT 
     MyNumber + 1
FROM CTE_Series
WHERE MyNumber < 20

)

SELECT 
     *
FROM CTE_Series










/*  Q162. Generate numbers from 1 to 100.  */

Ans:




WITH CTE_Series AS (

SELECT 
     1 As MyNumber 

UNION ALL

SELECT 
     MyNumber + 1
FROM CTE_Series
WHERE MyNumber <= 100

)

SELECT 
     *
FROM CTE_Series









/*  Q163. Generate even numbers from 2 to 20.  */

Ans:





WITH CTE_Series AS (

SELECT 
     2 As MyNumber 

UNION ALL

SELECT 
     MyNumber + 1
FROM CTE_Series
WHERE MyNumber <= 20

)

SELECT 
     *
FROM CTE_Series
WHERE MyNumber % 2 = 0









/*  Q164. Generate odd numbers from 1 to 25.  */

Ans:




WITH CTE_Series AS (

SELECT 
     1 As MyNumber 

UNION ALL

SELECT 
     MyNumber + 1
FROM CTE_Series
WHERE MyNumber < 20

)

SELECT 
     *
FROM CTE_Series
WHERE MyNumber % 2 <> 0










/* Q165. Generate dates from '2024-01-01' to '2024-01-31'.  */

Ans:

WITH CTE_Dates As (

SELECT
     CAST('2024-01-01' AS DATE) AS MyDate

UNION ALL 

SELECT 
     DATEADD(Day , 1 , MyDate) AS DateRange
FROM CTE_Dates 
WHERE MyDate < '2024-01-31'


)

SELECT 
     *
FROM CTE_Dates











/*  Q166. Generate all months of 2024.  */


Ans:




WITH CTE_Dates As (

SELECT
     CAST('2024-01-01' AS DATE) AS MyDate

UNION ALL 

SELECT 
     DATEADD(MONTH , 1 , MyDate) AS DateRange
FROM CTE_Dates 
WHERE MyDate < '2024-12-01'


)

SELECT 
     MyDate,
     DATENAME(MONTH , MyDate) As MonthName,
     YEAR(MyDate) As Year
FROM CTE_Dates














/*  Q167. Generate quarterly periods for 2024.  */

Ans:



WITH CTE_Dates As (

SELECT
     CAST('2024-01-01' AS DATE) AS MyDate

UNION ALL 

SELECT 
     DATEADD(QUARTER , 1 , MyDate) AS DateRange
FROM CTE_Dates 
WHERE MyDate < '2024-12-01'


)

SELECT 
     MyDate,
     DATENAME(MONTH , MyDate) As MonthName,
     YEAR(MyDate) As Year
FROM CTE_Dates










/* Q168. Generate numbers from 100 to 500 with an increment of 50.  */

Ans:



WITH CTE_Series AS (

SELECT 
     100 As MyNumber 

UNION ALL

SELECT 
     MyNumber + 50
FROM CTE_Series
WHERE MyNumber < 500

)

SELECT 
     *
FROM CTE_Series












/*  Q169. Generate a sequence representing loan tenure months
     from 1 to 12.   */

Ans:




WITH LoanTenure AS (
    SELECT 1 AS Month_No

    UNION ALL

    SELECT Month_No + 1
    FROM LoanTenure
    WHERE Month_No < 12
)
SELECT Month_No
FROM LoanTenure;










/*  Q170. Generate the first 12 monthly periods for loan repayment analysis.  */

Ans:


WITH CTE_loan_repayment AS (

SELECT 
     1 AS Month_No,
     CAST('2024-01-01' AS DATE) As Start_Date

UNION ALL 

SELECT 
     Month_No + 1,
     DATEADD(MONTH ,1 , Start_Date) As DateRange
FROM CTE_loan_repayment
WHERE Month_No < 13
AND 
Start_Date < '2024-12-01'

)

SELECT 
     *,
     EOMONTH(Start_Date) AS End_Date
FROM CTE_loan_repayment










------------------------------------------------------------------------------------------------------------------------------------------------


















/* =============================================================================
   SECTION N — VIEWS
============================================================================= */






/*  Q186. Create a view containing:

     Customer Name
     State
     Annual Income
     Customer Segment  */


Ans:



CREATE VIEW Customer_View As (
SELECT 
     customer_id,
     customer_name,
     state,
     annual_income,
     customer_segment
FROM Customers
)



SELECT * FROM Customer_View


      






/*  Q187. Create a view containing customer and account information.   */

Ans:




CREATE VIEW Account_info_view As (
SELECT
     customer_id,
     account_type,
     account_status,
     balance
FROM Accounts
)



SELECT 
     * 
FROM Customer_View As cv
LEFT JOIN
Account_info_view aiv
ON 
cv.customer_id = aiv.customer_id






/*  Q188. Create a view containing customer and loan information.  */

Ans:



CREATE VIEW Customer_Loan_View As (
SELECT 
     c.customer_id,
     c.customer_name,
     c.annual_income,
     l.loan_type,
     l.loan_amount
FROM Customers As c
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id
)



SELECT
     * 
FROM Customer_Loan_View







/*  Q189. Create a view containing customer and credit card information.  */

Ans:

CREATE VIEW Customer_Credit_Info AS (

SELECT
     c.customer_id,
     c.customer_name,
     c.annual_income,
     cc.card_type,
     cc.outstanding_amount
FROM Customers As c
LEFT JOIN 
Credit_Cards As cc
ON 
c.customer_id = cc.customer_id
)



SELECT 
     *
FROM Customer_Credit_Info










/*  Q190. Create a view containing branch-wise customer count.   */

Ans:


CREATE VIEW Branch_Customer_View AS (

SELECT 
     b.branch_name,
    COUNT(c.customer_id) As Customer_count
FROM Branches As b
LEFT JOIN 
Customers As c 
ON 
c.branch_id = b.branch_id
GROUP BY b.branch_name
)


SELECT 
     *
FROM Branch_Customer_View






/*  Q191. Create a view containing branch-wise total loan amount.  */

Ans:



CREATE VIEW Branch_loan_View As (
SELECT
     b.branch_name ,
     SUM(l.loan_amount) AS Total_loan_amount
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


SELECT 
     * 
FROM Branch_loan_View








/*  Q203. Create a view showing only active loans.  */

Ans:



CREATE VIEW Active_Loans AS (
SELECT
     *
FROM Loans
WHERE loan_status = 'Active'
)


SELECT 
     *
FROM Active_Loans







/*  Q204. Create a view showing only active credit cards.   */

Ans:



CREATE VIEW Active_Credit_Cards As (
SELECT
     *
FROM Credit_Cards
WHERE card_status = 'Active'
) 

SELECT 
     *
FROM Active_Credit_Cards














/*  Q205. Create a view showing only successful transactions.  */

Ans:



CREATE VIEW Succussful_Transaction AS (
SELECT 
     * 
FROM Transactions
WHERE transaction_status = 'Success'
) 


SELECT 
     * 
FROM Succussful_Transaction

















------------------------------------------------------------------------------------------------------------------------------------------------


















/* =============================================================================
   SECTION O — TEMPORARY TABLES
============================================================================= */









/*  Q206. Create a temporary table containing Premium customers.   */

Ans:


SELECT
     * 
INTO Premium_customers
FROM Customers
WHERE customer_segment = 'Premium'



SELECT
     *
FROM Premium_customers








/*  Q207. Create a temporary table containing customer-wise total loan amount.  */

Ans:



SELECT 
     c.customer_id , 
     c.customer_name,
     l.loan_type,
     l.loan_amount,
     SUM(l.loan_amount) OVER () As Total_loan_amount
INTO Customer_loanWise
FROM Customers AS c 
LEFT JOIN 
Loans as l 
ON 
c.customer_id = l.customer_id










/* Q208. Find the top 10 customers from the temporary table.  */


Ans:


SELECT
     TOP(10)
     *
INTO Top_Customers
FROM Customer_loanWise


SELECT
     *
FROM Top_Customers







/* Q209. Create a temporary table containing branch-wise loan exposure.  */

Ans:


SELECT 
     DISTINCT b.branch_name , 
     SUM(l.loan_amount) OVER(PARTITION BY b.branch_name) As Total_loan_amount
INTO Branch_loan
FROM Branches As b 
LEFT JOIN 
Customers As c
ON 
b.branch_id = c.branch_id
LEFT JOIN 
Loans As l
ON 
c.customer_id = l.customer_id


SELECT
     *
FROM Branch_loan










/*  Q211. Create a temporary table containing account-wise transaction count.  */

Ans:



SELECT 
     a.account_id ,
     COUNT(t.transaction_id) AS Transaction_count
INTO Account_TransactionCount
FROM Accounts As a 
LEFT JOIN 
Transactions As t 
ON
a.account_id = t.account_id
GROUP BY a.account_id

SELECT 
     *
FROM Account_TransactionCount





/* Q212. Find accounts having more than 2 transactions.  */

Ans:


SELECT 
     a.account_id ,
     COUNT(t.transaction_id) AS Transaction_count
INTO Account_TransactionCountTOP
FROM Accounts As a 
LEFT JOIN 
Transactions As t 
ON
a.account_id = t.account_id
GROUP BY a.account_id
HAVING COUNT(t.transaction_id) > 2

SELECT 
     *
FROM Account_TransactionCountTOp










/*  Q213. Create a temporary table containing customer-wise total
     transaction amount.  */

Ans:




SELECT 
     DISTINCT c.customer_id ,
     COUNT(t.transaction_id) OVER(PARTITION BY c.customer_id) AS Transaction_count
INTO Customer_TransactionCount
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
LEFT JOIN 
Transactions As t 
ON
a.account_id = t.account_id





SELECT 
     *
FROM Customer_TransactionCount












/*   Q214. Find customers whose transaction amount exceeds 500000.   */

Ans:


SELECT
     * 
INTO Customer_Transaction_Amount
FROM (
SELECT 
     DISTINCT c.customer_id ,
     SUM(t.amount) OVER(PARTITION BY c.customer_id) AS Transaction_amount
-- INTO Customer_TransactionCount
FROM Customers As c
LEFT JOIN 
Accounts As a
ON 
c.customer_id = a.customer_id
LEFT JOIN 
Transactions As t 
ON
a.account_id = t.account_id
)t
WHERE Transaction_amount > 500000


SELECT 
     *
FROM Customer_Transaction_Amount







/*  Q215. Create a temporary table containing customer-wise total
     credit card outstanding.  */

Ans:


SELECT 
     c.customer_id,
     cc.outstanding_amount
INTO Customer_CreditOutstanding
FROM Customers As c 
LEFT JOIN 
Credit_Cards As cc 
ON 
c.customer_id = cc.customer_id
WHERE cc.card_id IS NOT NULL


SELECT 
     *
FROM Customer_CreditOutstanding












/*  Q217. Create a temporary table for monthly transaction analysis.  */

Ans:



SELECT 
     DISTINCT a.account_id,
     COUNT(t.transaction_id) OVER(PARTITION BY a.account_id) AS Transaction_count,
     DATENAME(MONTH  , t.transaction_date) As Month_Name,
     YEAR(t.transaction_date) AS Year
INTO transaction_analysis
FROM Transactions As t
LEFT JOIN 
Accounts As a
ON 
a.account_id = t.account_id


SELECT
     *
FROM transaction_analysis


























------------------------------------------------------------------------------------------------------------------------------------------------



















/* =============================================================================
   SECTION P — STORED PROCEDURES : BASICS
============================================================================= */






/* Q226. Create a stored procedure that returns all customers.  */

Ans:


CREATE PROCEDURE All_Customer AS(
SELECT
     *
FROM Customers
);


EXEC All_Customer;









/* Q227. Create a stored procedure that returns all active accounts.  */

Ans:



CREATE PROCEDURE Active_Accounts AS(
SELECT
     *
FROM Accounts
WHERE account_status = 'Active'
);


EXEC Active_Accounts;






/*  Q228. Create a stored procedure that returns all active loans.  */

Ans:

CREATE PROCEDURE Active_Loan As(
SELECT
     *
FROM Loans 
WHERE loan_status = 'Active'
);


EXEC Active_Loan;














/* =============================================================================
   SECTION Q — STORED PROCEDURES : PARAMETERS
============================================================================= */







/*  Q233. Create a procedure accepting customer_id and returning
     all accounts of that customer.  */

Ans:

ALTER PROCEDURE All_Customer @CustomerID INT AS
BEGIN
    SELECT
         *
    FROM Customers
    WHERE customer_id = @CustomerID
END


EXEC All_Customer @CustomerID = 1001;













/*  Q234. Create a procedure accepting customer_id and returning
     all loans of that customer.  */

Ans:


ALTER PROCEDURE loans_customer @CustomerID INT As
BEGIN
    SELECT
         *
    FROM Loans 
    WHERE customer_id = @CustomerID
END

EXEC loans_customer @CustomerID = 1001











/*   Q235. Create a procedure accepting customer_id and returning
     all credit cards.  */

Ans:



ALTER PROCEDURE Credit_customer @CustomerID INT As
BEGIN
    SELECT
         *
    FROM Credit_Cards
    WHERE customer_id = @CustomerID
END

EXEC Credit_customer @CustomerID = 1001;









/*  Q236. Create a procedure accepting branch_id and returning
     all customers of that branch.  */


Ans:




ALTER PROCEDURE branch_Customer @BranchID INT As
BEGIN
    SELECT
         *
    FROM Credit_Cards
    WHERE customer_id = @BranchID
END



EXEC branch_Customer @BranchID = 1001;













/*   Q237. Create a procedure accepting minimum loan amount.   */

Ans:

CREATE PROCEDURE MINloan_amount As 
BEGIN 
    SELECT
         *
    FROM Loans 
    WHERE loan_amount = (
    SELECT
      MIN(loan_amount) As Min_loan
    FROM Loans)
END


EXEC MINloan_amount;










/*  Q238. Create a procedure accepting loan_type.  */

Ans:


CREATE PROCEDURE loanTypes_Customers @loanType VARCHAR(50) As
BEGIN
    SELECT
         *
    FROM Loans
    WHERE loan_type = @loanType
END

EXEC loanTypes_Customers @loanType = 'Business Loan';





































/* =============================================================================
   SECTION R — STORED PROCEDURES : MULTIPLE QUERIES
============================================================================= */








/*  Q243. Create a procedure that accepts customer_id and returns:

     1. Customer Details
     2. Account Details
     3. Loan Details
     4. Credit Card Details  */

Ans:


ALTER PROCEDURE ALL_Customers @CustomerID INT AS
BEGIN
    SELECT
         c.customer_id ,
         c.customer_name,
         a.account_type,
         a.balance,
         a.account_status,
         l.loan_type,
         l.loan_amount,
         cc.card_type,
         cc.outstanding_amount
    FROM Customers AS c
    LEFT JOIN 
    Accounts As a 
    ON 
    c.customer_id = a.customer_id
    LEFT JOIN 
    Loans AS l 
    On 
    c.customer_id = l.customer_id
    LEFT JOIN 
    Credit_Cards As cc 
    ON 
    c.customer_id = cc.customer_id
    WHERE c.customer_id = @CustomerID;
END



EXEC ALL_Customers @CustomerID = 1001;

























/* =============================================================================
   SECTION S — STORED PROCEDURES : VARIABLES
============================================================================= */








/*  Q247. Create a procedure using variables to calculate the average
     customer income.  */


Ans:

ALTER PROCEDURE FIND_AVGCutomerIncome AS
BEGIN
    
    DECLARE @CustomerAVGIncome INT;
    SELECT
        @CustomerAVGIncome = AVG(annual_income)
    FROM Customers

    PRINT ('THE AVG Customer Income is : ' + CAST(@CustomerAVGIncome AS NVARCHAR));
END


EXEC FIND_AVGCutomerIncome;












/*  Q248. Create a procedure using variables to calculate total loan exposure.  */

Ans:


ALTER PROCEDURE Total_LoanExposure AS
BEGIN
    DECLARE @Total_loan INT;
    SELECT
         @Total_loan = SUM(loan_amount)
    FROM Loans

    PRINT('The Total Loan Exposure is : ' + CAST(@Total_loan AS NVARCHAR))
END


EXEC Total_LoanExposure;







/*  Q249. Create a procedure using variables to calculate:

     Total Loan Amount
     Total Account Balance
     Total Transaction Amount  */


Ans:


ALTER PROCEDURE DetailsCustomers As 
BEGIN 

    DECLARE @Loan_amount INT , @Account_balance INT , @Transaction_amount INT
    SELECT
         @Loan_amount = SUM(l.loan_amount) ,
         @Account_balance = SUM(a.balance),
         @Transaction_amount = SUM(t.amount)
    FROM Accounts As a 
    LEFT JOIN 
    Transactions As t
    ON 
    a.account_id = t.account_id
    LEFT JOIN 
    Customers As c
    ON 
    c.customer_id = a.customer_id
    LEFT JOIN 
    Loans As l 
    ON 
    l.customer_id = c.customer_id


    PRINT('The total Loan amount is : ' + CAST(@Loan_amount AS NVARCHAR))
    PRINT('The total account balance is : ' + CAST(@Account_balance AS NVARCHAR))
    PRINT('The total transaction amount is : ' + CAST(@Transaction_amount AS NVARCHAR))

END


EXEC DetailsCustomers;












































----------------------------------------------------------------------------------------------------------------------------------------------------





















/* =============================================================================
   SECTION U — TRIGGERS
============================================================================= */









/*  Q263. Create an AFTER INSERT trigger on Customers.  */

Ans:





-- Step 1: Drop old trigger if it exists
IF OBJECT_ID('trg_AfterInsert_Customers', 'TR') IS NOT NULL
    DROP TRIGGER trg_AfterInsert_Customers;
GO








-- Step 2: Create audit table if it does not exist
IF OBJECT_ID('CustomerAudit', 'U') IS NULL
BEGIN
    CREATE TABLE CustomerAudit
    (
        audit_id INT IDENTITY(1,1) PRIMARY KEY,
        customer_id INT,
        action_type VARCHAR(20),
        action_date DATETIME
    );
END;
GO








-- Step 3: Create AFTER INSERT trigger
CREATE TRIGGER trg_Customers_Insert
ON Customers
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO CustomerAudit
        (customer_id, action_type, action_date)
    SELECT
        customer_id,
        'INSERT',
        GETDATE()
    FROM inserted;
END;
GO




SELECT * FROM CustomerAudit



















/*  Q264. Create an audit table and log newly inserted customers.  */

Ans:


-- Step 1 : Create audit table if it does not exist
CREATE TABLE Customer_Audit
(
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    action_type VARCHAR(20),
    action_date DATETIME DEFAULT GETDATE()
);
GO




-- Step 2 : Create AFTER INSERT trigger
ALTER TRIGGER trg_Customer_Audit_Insert
ON Customers
AFTER INSERT
AS
BEGIN
    INSERT INTO Customer_Audit
        (customer_id, customer_name, action_type, action_date)
    SELECT
        customer_id,
        customer_name,
        'INSERT',
        GETDATE()
    FROM inserted;
END;
GO



SELECT * FROM Customer_Audit
















/*  Q265. Insert a new customer and verify that the trigger executes.  */

Ans : 



-- Step 1: Insert a new customer
INSERT INTO Customers
(
    customer_id,
    customer_name,
    gender,
    age,
    city,
    state,
    occupation,
    annual_income,
    customer_segment,
    branch_id
)
VALUES
(
    9999,
    'Test Customer',
    'Male',
    25,
    'Faridabad',
    'Haryana',
    'Analyst',
    500000,
    'Regular',
    1
);
GO

-- Step 2: Verify the trigger's audit log
SELECT *
FROM Customer_Audit
WHERE customer_id = 9999;
GO
















/*  Q266. Create an AFTER UPDATE trigger on Customers.  */


Ans:



-- Step 1: Insert a new customer
INSERT INTO Customers
(
    customer_id,
    customer_name,
    gender,
    age,
    city,
    state,
    occupation,
    annual_income,
    customer_segment,
    branch_id
)
VALUES
(
    9999,
    'Test Customer',
    'Male',
    25,
    'Faridabad',
    'Haryana',
    'Analyst',
    500000,
    'Regular',
    1
);
GO

-- Step 2: Verify the trigger's audit log
SELECT *
FROM Customer_Audit
WHERE customer_id = 9999;
GO













