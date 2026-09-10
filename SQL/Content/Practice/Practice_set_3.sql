


============================================================
SQL FUNCTIONS PRACTICE SET
BFSI + DATA ANALYST
============================================================

DATABASE: 

USE
BFSI_Analytics

TABLES:
1. Branches
2. Customers
3. Accounts
4. Transactions
5. Loans
6. Credit_Cards
















============================================================
SECTION 1 — STRING MANIPULATION
============================================================













------------------------------------------------------------
A. CONCAT
------------------------------------------------------------







Q1. Display customer first information by combining
    customer_name and city into one column.

Ans: 

SELECT  
      Concat(customer_name + '   ' , city) As first_information     
FROM Customers









Q2. Create a Customer_Profile column containing:

    Customer Name + State

Ans: 

SELECT 
      Concat(customer_name + '   ' , state) As Customer_Profile
FROM Customers










Q3. Create a Branch_Location column containing:

    City + State

Ans: 

SELECT 
      CONCAT(city + '   ' , State) As Branch_Location
FROM Branches









Q4. Create a Customer_Label containing:

    Customer Name + Customer Segment

Ans: 

SELECT 
     CONCAT(customer_name + '   ' , customer_segment) As Customer_Label
FROM Customers









Q5. Create a Loan_Label containing:

    Customer ID + Loan Type

Ans:


SELECT 
     CONCAT(c.customer_id  + '   ' , '  ' + l.loan_type) As Loan_Label 
FROM Customers As c 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id





















------------------------------------------------------------
B. LOWER
------------------------------------------------------------







Q6. Display all customer names in lowercase.

Ans:


SELECT 
     LOWER(customer_name) As lower_Customers
FROM Customers









Q7. Display all occupations in lowercase.

Ans: 


SELECT 
     LOWER(occupation) As lower_occupation
FROM Customers










Q8. Display customer city names in lowercase.

Ans:


SELECT 
      LOWER(city) As lower_name
FROM Customers








Q9. Create a Customer_Email style value using the customer
    name in lowercase.

    Example concept:

    aarav.sharma


Ans:


SELECT 
     LOWER(customer_name) As lower_customers 
FROM Customers















------------------------------------------------------------
C. UPPER
------------------------------------------------------------






Q10. Display all customer names in uppercase.

Ans:


SELECT 
      UPPER(customer_name) As upper_customer_name
FROM Customers









Q11. Display all states in uppercase.

Ans:

SELECT 
      UPPER(state) As upper_state 
FROM Customers








Q12. Display all account types in uppercase.

Ans:


SELECT 
      UPPER(account_type) As upper_account_type
FROM Accounts





Q13. Display all transaction channels in uppercase.


Ans:


SELECT 
      UPPER(channel) As Upper_channel
FROM Transactions

















------------------------------------------------------------
D. TRIM
------------------------------------------------------------




Q14. Display customer names after removing unnecessary
     leading and trailing spaces.

Ans:



SELECT 
      TRIM(customer_name) As trim_customer_name
FROM Customers










Q15. Display occupation values after applying TRIM.

Ans: 


SELECT 
      TRIM(occupation) As trim_occupation
FROM Customers








Q16. Create a cleaned Customer_Name column using TRIM.

Ans:



SELECT 
      TRIM(customer_name) As trim_customer_name
FROM Customers













------------------------------------------------------------
E. REPLACE
------------------------------------------------------------






Q17. Replace 'Loan' with 'L' in loan_type.

Ans:

SELECT 
     REPLACE(loan_type , 'LOAN' , 'L') As new_loan_type
FROM Loans







Q18. Replace spaces in customer names with underscores.

Ans:


SELECT 
     REPLACE(customer_name , ' ' , '-') As new_customer_name 
FROM Customers









Q19. Replace spaces in city names with hyphens.

Ans:


SELECT 
     REPLACE(city , ' ' , '-') As new_city_name 
FROM Customers









Q20. Replace 'Business Loan' with 'Business Financing'
     in the output.

Ans:
 

SELECT 
     REPLACE(loan_type , 'Business Loan' , 'Business Financing')
FROM Loans






Q21. Create a cleaned loan type column where:

     Personal Loan  → Personal
     Home Loan      → Home
     Business Loan  → Business



Ans:




SELECT 
     REPLACE(loan_type , 'Business Loan' , 'Business') ,
     REPLACE(loan_type , 'Personal Loan' , 'Personal'),
     REPLACE(loan_type , 'Home Loan' , 'Home')
FROM Loans 






















============================================================
SECTION 2 — STRING CALCULATIONS
============================================================










------------------------------------------------------------
A. LEN
------------------------------------------------------------





Q22. Display customer names along with the length of
     each customer name.

Ans:


SELECT 
      customer_name ,
      LEN(customer_name) As name_length
FROM Customers















Q23. Find customers whose names contain more than
     12 characters.

Ans:



SELECT 
      customer_name ,
      LEN(customer_name) As name_length
FROM Customers
WHERE LEN(customer_name) > 12












Q24. Find customers whose occupation name has more than
     10 characters.

Ans:


SELECT 
      customer_name ,
      LEN(occupation) As occupation_length
FROM Customers
WHERE LEN(occupation) > 12












Q25. Display:

     - customer_name
     - length of customer_name

     Sort by name length from highest to lowest.


Ans:




SELECT 
      customer_name ,
      LEN(customer_name) As name_length 
FROM Customers
ORDER BY LEN(customer_name) DESC
 
















============================================================
SECTION 3 — SUBSTRING EXTRACTION
============================================================












------------------------------------------------------------
A. LEFT
------------------------------------------------------------








Q26. Display the first 3 characters of every customer name.

Ans:


SELECT 
      LEFT(customer_name , 3) As short_name 
FROM Customers










Q27. Display the first 2 characters of every city.

Ans:



SELECT 
      LEFT(city, 2) As short_city 
FROM Customers











Q28. Display the first 4 characters of every occupation.

Ans:



SELECT 
      LEFT(occupation , 4) As short_occupation
FROM Customers
















------------------------------------------------------------
B. RIGHT
------------------------------------------------------------





Q29. Display the last 3 characters of every customer name.

Ans:


SELECT 
     RIGHT(customer_name , 3) As right_short_name 
FROM Customers












Q30. Display the last 2 characters of every state.

Ans:



SELECT 
     RIGHT(state , 3) As right_state_name 
FROM Customers









Q31. Display the last 4 digits/characters of customer_id
     after converting it to a suitable string type.


Ans:


SELECT 
     RIGHT(customer_name , 4) As right_name 
FROM Customers














------------------------------------------------------------
C. SUBSTRING
------------------------------------------------------------





Q32. Extract characters 1 to 5 from customer_name.

Ans:


SELECT 
     SUBSTRING(TRIM(customer_name) , 2 , 7)
FROM Customers








Q33. Extract characters 2 to 5 from city.


Ans: 


SELECT 
     SUBSTRING(TRIM(city), 2 , 7) 
FROM Customers




Q34. Extract characters 3 to 7 from occupation.

Ans: 


SELECT 
     SUBSTRING(TRIM(occupation), 3 , 7) 
FROM Customers




Q35. Extract a portion of customer names using SUBSTRING
     and compare it with LEFT.


 Ans: 


SELECT 
     SUBSTRING(TRIM(occupation), 3 , 7) 
FROM Customers













------------------------------------------------------------
STRING FUNCTION CHALLENGE
------------------------------------------------------------




Q36. Create a Customer_Code using:

     First 3 characters of customer name
     +
     Last 2 characters of city
     Convert the final code to uppercase.

Ans: 


SELECT  
    CONCAT(LEFT( TRIM(customer_name) , 3),
    RIGHT( TRIM(city) , 2) )  As Customer_code
FROM Customers









Q37. Create a standardized customer identifier using:

     First 3 characters of customer name
     +
     Last 4 digits of customer_id


Ans:


SELECT  
    CONCAT(LEFT( TRIM(customer_name) , 3),
    RIGHT( customer_id , 4 ))  As customer_identifier
FROM Customers















============================================================
SECTION 4 — ROUNDING FUNCTIONS
============================================================















------------------------------------------------------------
A. ROUND
------------------------------------------------------------





Q38. Display loan interest rates rounded to 1 decimal place.

Ans: 

SELECT 
     ROUND(interest_rate , 0)
FROM Loans







Q39. Calculate loan interest amount using:

     loan_amount × interest_rate / 100

     Round the result to 2 decimal places.


Ans:
 

SELECT 
       ROUND(loan_amount * interest_rate / 100 , 2) As interest_amount 
FROM Loans









Q40. Calculate estimated annual interest for each loan
     and round it to 2 decimal places.

Ans:

SELECT 
      loan_amount ,
      interest_rate,
      loan_amount  * (11.50/100) * 12 As annual_interest   
FROM Loans











Q41. Calculate average loan amount by loan type and round
     the result to 2 decimal places.

Ans: 


SELECT 
      loan_type,
      ROUND(AVG(loan_amount) , 2) As Avg_loan_amount 
FROM Loans
GROUP BY loan_type





Q42. Calculate average account balance by account type
     and round it to 2 decimal places.


Ans:
 


 SELECT 
      account_type,
      ROUND(AVG(balance) , 2) As Avg_round_balance
 FROM Accounts
 GROUP BY account_type
















============================================================
SECTION 5 — ABSOLUTE VALUE
============================================================










------------------------------------------------------------
A. ABS
------------------------------------------------------------






Q43. Calculate the absolute difference between:

     Account Balance and 300000.

Ans:


SELECT 
      ABS(balance - 300000)
FROM Accounts




Q44. Calculate the absolute difference between:

     Loan Amount and 2000000

Ans: 


SELECT 
      ABS(loan_amount - 2000000)
FROM Loans





Q45. Calculate the absolute difference between:

     Credit Limit and Outstanding Amount.


Ans: 


SELECT 
      ABS(credit_limit - outstanding_amount) As absolute_diff   
FROM Credit_Cards
















============================================================
SECTION 6 — GETDATE
============================================================






Q48. Display the current system date and time using GETDATE.

Ans: 


SELECT 
     GETDATE() 




Q49. Display the current date as Current_Date.


Ans: 


SELECT 
      CAST(GETDATE() AS DATE) 
      AS currnt_date;



 



Q50. Compare the current date with loan_start_date.


Ans : 



SELECT *
FROM loans
WHERE loan_start_date < CAST(GETDATE() AS DATE);




















============================================================
SECTION 7 — DATE PART EXTRACTION
============================================================







------------------------------------------------------------
A. YEAR
------------------------------------------------------------



Q51. Extract the year from loan_start_date.

Ans: 


SELECT 
      YEAR(loan_start_date) As year_part
FROM Loans










Q52. Extract the year from account opening_date.


Ans: 

SELECT 
      YEAR(opening_date) As year_opening_date
FROM Accounts







Q53. Count loans by loan_start year.


Ans: 



SELECT 
     YEAR(loan_start_date) As year_loan_date ,
     COUNT(*) as Loan_count
FROM Loans
GROUP BY YEAR(loan_start_date) 
ORDER BY  YEAR(loan_start_date)











------------------------------------------------------------
B. MONTH
------------------------------------------------------------






Q54. Extract the month from transaction_date.

Ans: 

SELECT 
     MONTH(transaction_date)
FROM Transactions











Q55. Count transactions by transaction month.

Ans: 


SELECT 
      --COUNT(transaction_id ) ,
      COUNT(MONTH(transaction_date) )as transaction_month
FROM Transactions














------------------------------------------------------------
C. DAY
------------------------------------------------------------




Q56. Extract the day from transaction_date.

Ans: 


SELECT 
     DAY(transaction_date) 
FROM Transactions








Q57. Find transactions that occurred on day 15
     of any month.

Ans:

SELECT 
      transaction_id,
      transaction_date 
FROM Transactions
WHERE DAY(transaction_date) = 15










------------------------------------------------------------
D. DATEPART
------------------------------------------------------------





Q58. Extract the year from transaction_date using DATEPART.

Ans:

SELECT 
      DATEPART( year , transaction_date ) As year_transaction_date
FROM Transactions








Q59. Extract the month from transaction_date using DATEPART.

Ans:

SELECT 
      DATEPART(month , transaction_date) as month_transaction_date
FROM Transactions







Q60. Extract the weekday from transaction_date.

Ans:


SELECT 
     DATEPART(weekday , transaction_date) As weekday_transaction_date
FROM Transactions






Q61. Count transactions by weekday.

Ans:


SELECT 
     COUNT(account_id ) as total_transaction,
     DATEPART(weekday , transaction_date) As weekday_number
FROM Transactions
GROUP BY DATEPART(weekday , transaction_date)















------------------------------------------------------------
E. DATENAME
------------------------------------------------------------





Q62. Display the month name for every transaction.

Ans:

SELECT 
      DATENAME(month ,transaction_date) as month_name,
      account_id 
FROM Transactions




Q63. Display the weekday name for every transaction.

Ans:

SELECT 
      DATENAME(weekday ,transaction_date) as week_name,
      account_id 
FROM Transactions







Q64. Count transactions by month name.

Ans:



SELECT 
      DATENAME(month ,transaction_date) as month_name,
     COUNT( account_id ) As total_transaction
FROM Transactions
GROUP BY DATENAME(month ,transaction_date)















============================================================
SECTION 8 — DATETRUNC
============================================================






Q65. Truncate transaction_date to the year level.

Ans:



SELECT 
      DATETRUNC(year , transaction_date ) as Year_trunc
FROM Transactions







Q66. Truncate transaction_date to the month level.

Ans:



SELECT 
      DATETRUNC(year , transaction_date ) as Year_trunc
FROM Transactions







Q67. Truncate transaction_date to the day level.

Ans:


SELECT 
      DATETRUNC(day , transaction_date ) as day_trunc
FROM Transactions









Q68. Group transactions by month using DATETRUNC and
     calculate total transaction amount.

Ans:

SELECT 
     COUNT(account_id) As Total_transactions,
     DATETRUNC(month , transaction_date) As month_trunc
FROM Transactions
GROUP BY DATETRUNC(month , transaction_date)












============================================================
SECTION 9 — EOMONTH
============================================================





Q69. Find the last day of the month for every transaction.

Ans:

SELECT 
      transaction_id ,
      EOMONTH(transaction_date )
FROM Transactions









Q70. Find the last day of the month for every loan start date.

Ans:

SELECT 
      loan_id ,
      EOMONTH(loan_start_date )
FROM Loans








Q71. Display:

     - transaction_date
     - month_end_date

Ans:


Ans:

SELECT 
      transaction_id ,
      EOMONTH(transaction_date )
FROM Transactions








Q72. Find transactions that occurred during the last
     5 days of their respective month.


Ans:


SELECT *
FROM transactions
WHERE transaction_date_time >= DATEADD(
    DAY, -4, EOMONTH(transaction_date_time)
)
AND transaction_date_time < DATEADD(
    DAY, 1, EOMONTH(transaction_date_time)
);
















============================================================
SECTION 10 — DATE PARTS / DATE FILTERING
============================================================





Q73. Find all transactions performed in 2026.

Ans:


SELECT 
      transaction_id,
      transaction_date
FROM Transactions
WHERE YEAR( transaction_date)  = 2026










Q74. Find all transactions performed in March.

Ans:



SELECT 
      transaction_id,
      transaction_date
FROM Transactions
WHERE DATENAME(month, transaction_date)  = 'March'










Q75. Find all loans started in 2024.

Ans:

SELECT
      loan_id ,
      loan_start_date
FROM Loans
WHERE YEAR(loan_start_date) >= 2024












Q76. Find all accounts opened after 2021.

Ans:


SELECT 
     account_id,
     opening_date
FROM Accounts
WHERE YEAR(opening_date) >= 2021




Q77. Find customers whose accounts were opened in 2023.

Ans: 



SELECT 
      customer_id ,
      opening_date
FROM Accounts
WHERE YEAR(opening_date) = 2023










































============================================================
SECTION 11 — FORMAT
============================================================










------------------------------------------------------------
A. NUMBER FORMAT
------------------------------------------------------------









Q78. Display account balances with comma-separated
     formatting.

     Example:

     125000 → 125,000. 


Ans:

SELECT 
      Format(balance , 'N') As New_balance
FROM Accounts










Q79. Display loan amounts with comma-separated formatting.

Ans:

SELECT 
      FORMAT(loan_amount , 'N') As New_balance
FROM Loans










Q80. Display credit limits with comma-separated formatting.

Ans:

SELECT 
      FORMAT(credit_limit, 'N') As format_credit
FROM Credit_Cards










Q81. Display loan interest rates with 2 decimal places.

Ans:




SELECT 
      FORMAT(interest_rate, 'N') As format_interest
FROM Loans












------------------------------------------------------------
B. DATE FORMAT
------------------------------------------------------------




Q82. Display transaction_date in:

     DD-MM-YYYY

Ans: 

SELECT 
      FORMAT(transaction_date , 'dd-MM-yyyy') as new_formatted_date
FROM Transactions










Q83. Display loan_start_date in:

     DD/MM/YYYY

Ans:

SELECT 
      FORMAT(loan_start_date , 'dd-MM-yyyy') as new_formatted_date
FROM Loans










Q84. Display account opening_date in:

     MMM YYYY

Ans:


SELECT 
     FORMAT(opening_date , 'MMM yyyy')  as new_formatted_date
FROM Accounts






Q85. Display transaction_date as:

     Month Name + Year


Ans:



SELECT 
     FORMAT(transaction_date , 'MMM yyyy') as new_formatted_date
FROM Transactions
















============================================================
SECTION 12 — CONVERT
============================================================






Q86. Convert transaction_date into VARCHAR.

Ans:

SELECT 
      CONVERT(VARCHAR , transaction_date ,  34) as new_transaction
FROM Transactions









Q87. Convert loan_start_date into VARCHAR using
     an appropriate style.

Ans:


SELECT 
      CONVERT(VARCHAR , loan_start_date ,  34) as new_loan_date
FROM Loans






Q88. Convert account balance into VARCHAR.

Ans:

SELECT 
      CONVERT(VARCHAR , balance ,  34) as new_balance
FROM Accounts







Q89. Convert annual_income into VARCHAR with a suitable
     conversion style.

Ans:



SELECT 
      CONVERT(VARCHAR , annual_income ,  34) as new_income
FROM Customers


















============================================================
SECTION 13 — CAST
============================================================





Q90. CAST annual_income into DECIMAL.

Ans:

SELECT 
     CAST(annual_income As DECIMAL)
FROM Customers












Q91. CAST loan_amount into DECIMAL(12,2).

Ans:

SELECT 
     CAST(loan_amount As DECIMAL(12,2))
FROM Loans











Q92. CAST interest_rate into DECIMAL(5,2).

Ans:


SELECT 
     CAST(interest_rate As DECIMAL(5,2))
FROM Loans











Q93. CAST customer_id into VARCHAR.

Ans:


SELECT 
     CAST(customer_id AS VARCHAR)
FROM Customers




Q94. CAST transaction amount into DECIMAL(12,2).


Ans:


SELECT 
      CAST(amount As DECIMAL(12 , 2))
FROM Transactions














============================================================
SECTION 14 — DATEADD
============================================================




Q95. Find the date 30 days after every transaction.

Ans:


SELECT 
      transaction_date,
      DATEADD(day, 30 , transaction_date) As new_date
FROM Transactions






Q96. Find the date 90 days after every transaction.

Ans:


SELECT 
      transaction_date,
      DATEADD(day, 90 , transaction_date) As new_date
FROM Transactions




 



Q97. Find the date 1 year after every loan start date.

Ans:

SELECT 
      loan_start_date,
      DATEADD(year, 1 , loan_start_date) As new_loan_date
FROM Loans







Q98. Find the date 6 months after every account opening date.

Ans:


SELECT 
      opening_date,
      DATEADD(month, 6, opening_date) as new_account
FROM Accounts









Q99. Calculate the expected review date for each loan
     by adding 1 year to loan_start_date.


Ans:

SELECT 
      loan_start_date,
      DATEADD(year, 1 , loan_start_date) As new_review_date
FROM Loans







============================================================
SECTION 15 — DATEDIFF

============================================================



Q100. Calculate the number of days since each transaction.

Ans:

SELECT 
      transaction_date,
      DATEDIFF(day , transaction_date , GETDATE()) as No_of_days
FROM Transactions









Q101. Calculate the number of days since each loan started.

Ans:

SELECT 
      loan_start_date,
      DATEDIFF(day , loan_start_date , GETDATE()) as no_loans
FROM Loans









Q102. Calculate the age of each account in months.

Ans:

SELECT 
     opening_date ,
     DATEDIFF(month , opening_date , GETDATE()) As account_age
FROM Accounts










Q103. Calculate the age of each loan in months.

Ans:

SELECT 
     loan_start_date ,
     DATEDIFF(month , loan_start_date , GETDATE()) As loan_age
FROM Loans









Q104. Find loans that have been active for more than

      24 months.

Ans:


SELECT 
     loan_start_date ,
     DATEDIFF(month , loan_start_date , GETDATE()) As loan_age
FROM Loans
WHERE  DATEDIFF(month , loan_start_date , GETDATE()) > 24




















============================================================
SECTION 16 — ISDATE
============================================================







Q105. Check whether transaction_date contains valid dates.

Ans:

SELECT 
    transaction_id,
    transaction_date,
    CASE
        WHEN ISDATE(transaction_date) = 1 THEN 'Valid Date'
        ELSE 'Invalid Date'
    END AS date_status
FROM transactions;











Q106. Check whether loan_start_date contains valid dates.

Ans: 



SELECT 
    --loan_start_date,
    ISDATE(loan_start_date) As Valid_date
FROM Loans



































============================================================
SECTION 17 — DATE + BFSI ANALYTICS
============================================================






Q109. Monthly Transaction Analysis

      Calculate total transaction amount for each month.

      Output:
      - Transaction Month
      - Total Amount

Ans:


SELECT 
     DATENAME(month , transaction_date) As Transaction_Month,
     SUM(amount) As Total_Transaction_amount
FROM Transactions
GROUP BY DATENAME(month , transaction_date)














Q110. Monthly Transaction Count

      Calculate the number of transactions performed
      in each month.


Ans:


SELECT 
      COUNT(transaction_id) As Total_Transactions ,
      DATENAME(month , transaction_date) As Transaction_month
FROM Transactions
GROUP BY DATENAME(month , transaction_date)













Q111. Loan Origination Analysis

      Calculate the number of loans originated in each year.


Ans:



SELECT 
      COUNT(loan_id) As total_loans,
      YEAR(loan_start_date) as Tenure_Year
FROM Loans
GROUP BY YEAR(loan_start_date)










Q112. Loan Amount by Year

      Calculate total loan amount originated in each year.


Ans:

SELECT 
     YEAR(loan_start_date) As Loan_Tenure,
     SUM(loan_amount) As Total_Loan_Amount 
FROM Loans 
GROUP BY YEAR(loan_start_date)















Q113. Account Opening Trend

      Calculate the number of accounts opened in each year.

Ans:


SELECT 
      YEAR(opening_date) As Tenure_Year,
      COUNT(account_id) As Total_Accounts_Opened
FROM Accounts
GROUP BY  YEAR(opening_date)










Q114. Transaction Recency

      Find the number of days since the latest transaction
      for each account.


Ans:


SELECT 
     account_id,
     DATEDIFF(day , transaction_date, GETDATE()) As No_of_Days
FROM Transactions



















============================================================
SECTION 18 — COMBINED STRING + NUMERIC FUNCTIONS
============================================================






Q115. Create a Customer_Profile column:

      CUSTOMER_NAME - CITY - CUSTOMER_SEGMENT

      Requirements:

      - Remove unnecessary spaces
      - Convert customer name to uppercase
      - Convert city to uppercase

Ans:



SELECT 
     CONCAT(UPPER(customer_name) ,
     UPPER(city),
     UPPER(customer_segment) , ' ' ) As Customer_Profile
FROM Customers










Q116. Create a Loan_Code using:

      First 3 characters of loan type
      +
      Last 4 digits of loan_id

      Convert the final result to uppercase.

Ans:


SELECT 
     UPPER(CONCAT( LEFT(loan_type , 3),
     RIGHT(loan_id ,  4))) As Loan_Code 
FROM Loans














Q117. Create a formatted Customer_Code using:

      First 3 characters of customer_name
      +
      Last 4 digits of customer_id

      Convert it to uppercase.


Ans:




SELECT 
     UPPER(CONCAT(LEFT(customer_name , 3) ,
     RIGHT(customer_id , 4))) As formatted_Customer_Code 
FROM Customers




















============================================================
SECTION 19 — COMBINED DATE + NUMERIC FUNCTIONS
============================================================








Q118. Calculate estimated annual interest for every loan:

      loan_amount × interest_rate / 100

      Round to 2 decimal places.


Ans:



SELECT 
      loan_type,
      SUM(ROUND(loan_amount * interest_rate/100 , 2)) As estimated_annual_interest
FROM Loans
GROUP BY loan_type
















Q119. Calculate the difference between:

      Loan Amount
      and
      2000000

      Return the absolute difference.


Ans:


SELECT 
     loan_amount,
     ABS(( loan_amount - 2000000 )) As loan_diff
FROM Loans











Q120. Calculate the number of months since each loan
      started and display loans older than 24 months.

Ans:


SELECT 
     DATEDIFF(month , loan_start_date , GETDATE()) As No_of_Months
FROM Loans
WHERE DATEDIFF(month , loan_start_date , GETDATE()) > 24












Q121. Calculate transaction amount rounded to the nearest
      1000.

Ans:


SELECT 
     ROUND(amount , 100)
FROM Transactions









Q122. Calculate the absolute difference between:

      Account Balance
      and
      Credit Card Outstanding Amount.



Ans: 




SELECT 
      a.balance,
      cc.outstanding_amount,
      ABS(a.balance - cc.outstanding_amount) As abs_diff
FROM Accounts As a
INNER JOIN
Credit_Cards As cc 
ON 
a.customer_id = cc.customer_id





























============================================================
SECTION 20 — HIGH-LEVEL CHALLENGES
============================================================







Q128. Monthly BFSI Transaction Dashboard

      Create a query that returns:

      - Transaction Month
      - Transaction Count
      - Total Transaction Amount
      - Average Transaction Amount
      - Maximum Transaction Amount
      - Minimum Transaction Amount

      Format the financial values appropriately.

Ans:




SELECT 
     DATENAME(month , transaction_date) As Transaction_Month,
     COUNT(account_id) As Transaction_Count,
     SUM(amount) As Total_Transaction_amount,
     AVG(amount) As AVG_Transaction_amount,
     MAX(amount) As MAX_Transaction_amount,
     MIN(amount) As MIN_Transaction_amount
FROM Transactions
GROUP BY DATENAME(month , transaction_date)
















Q129. Loan Portfolio Dashboard

      Display:

      - Loan Type
      - Number of Loans
      - Total Loan Amount
      - Average Loan Amount
      - Average Interest Rate

      Round financial values appropriately.


Ans:



SELECT 
      loan_type,
      COUNT(loan_id) As No_of_loans,
      SUM(loan_amount) As Total_Loan_amount,
      AVG(loan_amount) As AVG_Loan_amount,
      AVG(interest_rate) As AVG_interest_rate
FROM Loans
GROUP BY loan_type













Q130. Customer Account Age Analysis

      Display:

      - Customer Name
      - Account Opening Date
      - Account Age in Months
      - Account Age in Years

      Sort from oldest account to newest account.


Ans:

SELECT * FROM Customers 
SELECT * FROM Accounts





SELECT 
      c.customer_name,
      DAY(a.opening_date) As Account_Opening_date ,
      DATEDIFF(MONTH , a.opening_date , GETDATE()) As Account_age_Months,
      DATEDIFF(YEAR  , a.opening_date , GETDATE()) As Account_age_Years
FROM Customers As c 
LEFT JOIN 
Accounts As a 
ON 
c.customer_id = a.customer_id
ORDER BY DATEDIFF(YEAR  , a.opening_date , GETDATE()) DESC










Q131. Banking Customer Identifier

      Create a unique-looking customer identifier using:

      First 3 characters of customer name
      +
      First 2 characters of city
      +
      Last 4 digits of customer_id

      Convert the final identifier to uppercase.



Ans:



SELECT 
      UPPER(CONCAT( LEFT(customer_name , 3) ,
      LEFT(city , 2) ,
      RIGHT(customer_id , 4))) As Customer_identifier 
FROM Customers
















Q132. Loan Risk Screening

      Find loans where:

      - Interest Rate > 10%
      - Loan Amount > 2000000
      - Loan Age > 24 months

      Display:

      - Customer ID
      - Loan Type
      - Loan Amount
      - Interest Rate
      - Loan Age



Ans: 

SELECT 
      c.customer_id ,
      l.interest_rate ,
      l.loan_amount ,
      l.interest_rate,
      DATEDIFF(month , l.loan_start_date , GETDATE()) As loan_age
FROM Customers As c 
LEFT JOIN 
Loans As l 
ON 
c.customer_id = l.customer_id