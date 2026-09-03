


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











Q33. Extract characters 2 to 5 from city.

Q34. Extract characters 3 to 7 from occupation.

Q35. Extract a portion of customer names using SUBSTRING
     and compare it with LEFT.











------------------------------------------------------------
STRING FUNCTION CHALLENGE
------------------------------------------------------------

Q36. Create a Customer_Code using:

     First 3 characters of customer name
     +
     Last 2 characters of city

     Convert the final code to uppercase.


Q37. Create a standardized customer identifier using:

     First 3 characters of customer name
     +
     Last 4 digits of customer_id


============================================================
SECTION 4 — ROUNDING FUNCTIONS
============================================================

------------------------------------------------------------
A. ROUND
------------------------------------------------------------

Q38. Display loan interest rates rounded to 1 decimal place.

Q39. Calculate loan interest amount using:

     loan_amount × interest_rate / 100

     Round the result to 2 decimal places.

Q40. Calculate estimated annual interest for each loan
     and round it to 2 decimal places.

Q41. Calculate average loan amount by loan type and round
     the result to 2 decimal places.

Q42. Calculate average account balance by account type
     and round it to 2 decimal places.


============================================================
SECTION 5 — ABSOLUTE VALUE
============================================================

------------------------------------------------------------
A. ABS
------------------------------------------------------------

Q43. Calculate the absolute difference between:

     Account Balance and 300000

Q44. Calculate the absolute difference between:

     Loan Amount and 2000000

Q45. Calculate the absolute difference between:

     Credit Limit and Outstanding Amount.


BFSI ANALYTICS:

Q46. Find customers whose account balance is closest to
     300000.

     Display:

     - customer_name
     - balance
     - difference from 300000


Q47. Find loans whose loan amount is closest to 2000000.


============================================================
SECTION 6 — GETDATE
============================================================

Q48. Display the current system date and time using GETDATE.

Q49. Display the current date as Current_Date.

Q50. Compare the current date with loan_start_date.


============================================================
SECTION 7 — DATE PART EXTRACTION
============================================================

------------------------------------------------------------
A. YEAR
------------------------------------------------------------

Q51. Extract the year from loan_start_date.

Q52. Extract the year from account opening_date.

Q53. Count loans by loan_start year.


------------------------------------------------------------
B. MONTH
------------------------------------------------------------

Q54. Extract the month from transaction_date.

Q55. Count transactions by transaction month.


------------------------------------------------------------
C. DAY
------------------------------------------------------------

Q56. Extract the day from transaction_date.

Q57. Find transactions that occurred on day 15
     of any month.


------------------------------------------------------------
D. DATEPART
------------------------------------------------------------

Q58. Extract the year from transaction_date using DATEPART.

Q59. Extract the month from transaction_date using DATEPART.

Q60. Extract the weekday from transaction_date.

Q61. Count transactions by weekday.


------------------------------------------------------------
E. DATENAME
------------------------------------------------------------

Q62. Display the month name for every transaction.

Q63. Display the weekday name for every transaction.

Q64. Count transactions by month name.


============================================================
SECTION 8 — DATETRUNC
============================================================

Q65. Truncate transaction_date to the year level.

Q66. Truncate transaction_date to the month level.

Q67. Truncate transaction_date to the day level.

Q68. Group transactions by month using DATETRUNC and
     calculate total transaction amount.


============================================================
SECTION 9 — EOMONTH
============================================================

Q69. Find the last day of the month for every transaction.

Q70. Find the last day of the month for every loan start date.

Q71. Display:

     - transaction_date
     - month_end_date

Q72. Find transactions that occurred during the last
     5 days of their respective month.


============================================================
SECTION 10 — DATE PARTS / DATE FILTERING
============================================================

Q73. Find all transactions performed in 2026.

Q74. Find all transactions performed in March.

Q75. Find all loans started in 2024.

Q76. Find all accounts opened after 2021.

Q77. Find customers whose accounts were opened in 2023.


============================================================
SECTION 11 — FORMAT
============================================================

------------------------------------------------------------
A. NUMBER FORMAT
------------------------------------------------------------

Q78. Display account balances with comma-separated
     formatting.

     Example:

     125000 → 125,000


Q79. Display loan amounts with comma-separated formatting.

Q80. Display credit limits with comma-separated formatting.

Q81. Display loan interest rates with 2 decimal places.


------------------------------------------------------------
B. DATE FORMAT
------------------------------------------------------------

Q82. Display transaction_date in:

     DD-MM-YYYY


Q83. Display loan_start_date in:

     DD/MM/YYYY


Q84. Display account opening_date in:

     MMM YYYY


Q85. Display transaction_date as:

     Month Name + Year


============================================================
SECTION 12 — CONVERT
============================================================

Q86. Convert transaction_date into VARCHAR.

Q87. Convert loan_start_date into VARCHAR using
     an appropriate style.

Q88. Convert account balance into VARCHAR.

Q89. Convert annual_income into VARCHAR with a suitable
     conversion style.


============================================================
SECTION 13 — CAST
============================================================

Q90. CAST annual_income into DECIMAL.

Q91. CAST loan_amount into DECIMAL(12,2).

Q92. CAST interest_rate into DECIMAL(5,2).

Q93. CAST customer_id into VARCHAR.

Q94. CAST transaction amount into DECIMAL(12,2).


============================================================
SECTION 14 — DATEADD
============================================================

Q95. Find the date 30 days after every transaction.

Q96. Find the date 90 days after every transaction.

Q97. Find the date 1 year after every loan start date.

Q98. Find the date 6 months after every account opening date.

Q99. Calculate the expected review date for each loan
     by adding 1 year to loan_start_date.


============================================================
SECTION 15 — DATEDIFF
============================================================

Q100. Calculate the number of days since each transaction.

Q101. Calculate the number of days since each loan started.

Q102. Calculate the age of each account in months.

Q103. Calculate the age of each loan in months.

Q104. Find loans that have been active for more than
      24 months.


============================================================
SECTION 16 — ISDATE
============================================================

Q105. Check whether transaction_date contains valid dates.

Q106. Check whether loan_start_date contains valid dates.

Q107. Create a test result using ISDATE for a VARCHAR
      date column.

Q108. Identify invalid date values from a hypothetical
      imported banking dataset.


============================================================
SECTION 17 — DATE + BFSI ANALYTICS
============================================================

Q109. Monthly Transaction Analysis

      Calculate total transaction amount for each month.

      Output:
      - Transaction Month
      - Total Amount


Q110. Monthly Transaction Count

      Calculate the number of transactions performed
      in each month.


Q111. Loan Origination Analysis

      Calculate the number of loans originated in each year.


Q112. Loan Amount by Year

      Calculate total loan amount originated in each year.


Q113. Account Opening Trend

      Calculate the number of accounts opened in each year.


Q114. Transaction Recency

      Find the number of days since the latest transaction
      for each account.


============================================================
SECTION 18 — COMBINED STRING + NUMERIC FUNCTIONS
============================================================

Q115. Create a Customer_Profile column:

      CUSTOMER_NAME - CITY - CUSTOMER_SEGMENT

      Requirements:

      - Remove unnecessary spaces
      - Convert customer name to uppercase
      - Convert city to uppercase


Q116. Create a Loan_Code using:

      First 3 characters of loan type
      +
      Last 4 digits of loan_id

      Convert the final result to uppercase.


Q117. Create a formatted Customer_Code using:

      First 3 characters of customer_name
      +
      Last 4 digits of customer_id

      Convert it to uppercase.


============================================================
SECTION 19 — COMBINED DATE + NUMERIC FUNCTIONS
============================================================

Q118. Calculate estimated annual interest for every loan:

      loan_amount × interest_rate / 100

      Round to 2 decimal places.


Q119. Calculate the difference between:

      Loan Amount
      and
      2000000

      Return the absolute difference.


Q120. Calculate the number of months since each loan
      started and display loans older than 24 months.


Q121. Calculate transaction amount rounded to the nearest
      1000.


Q122. Calculate the absolute difference between:

      Account Balance
      and
      Credit Card Outstanding Amount.


============================================================
SECTION 20 — BFSI DATA ANALYST CASE STUDIES
============================================================

Q123. Customer Profile Standardization

      Create a standardized output containing:

      - Customer Name in uppercase
      - City in uppercase
      - State in uppercase
      - Customer Segment
      - Customer Code

      Customer Code:

      First 3 characters of customer name
      +
      Last 4 digits of customer_id


Q124. Loan Portfolio Analysis

      For every loan display:

      - Loan Type
      - Loan Amount
      - Interest Rate
      - Annual Interest
      - Loan Start Date
      - Loan Age in Months

      Round financial calculations to 2 decimals.


Q125. Transaction Trend Analysis

      Calculate for each month:

      - Transaction Count
      - Total Transaction Amount
      - Average Transaction Amount

      Round average transaction amount to 2 decimals.


Q126. Customer Financial Distance

      For every customer calculate:

      ABS(Account Balance - 300000)

      Display customers from smallest difference
      to largest difference.


Q127. Loan Maturity Analysis

      For every loan calculate:

      - Loan Start Date
      - Tenure in Months
      - Expected End Date

      Expected End Date should be calculated using
      DATEADD.


============================================================
SECTION 21 — HIGH-LEVEL CHALLENGES
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


Q129. Loan Portfolio Dashboard

      Display:

      - Loan Type
      - Number of Loans
      - Total Loan Amount
      - Average Loan Amount
      - Average Interest Rate
      - Total Estimated Annual Interest

      Round financial values appropriately.


Q130. Customer Account Age Analysis

      Display:

      - Customer Name
      - Account Opening Date
      - Account Age in Months
      - Account Age in Years

      Sort from oldest account to newest account.


Q131. Banking Customer Identifier

      Create a unique-looking customer identifier using:

      First 3 characters of customer name
      +
      First 2 characters of city
      +
      Last 4 digits of customer_id

      Convert the final identifier to uppercase.


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


============================================================
DIFFICULTY PROGRESSION
============================================================

LEVEL 1 — BASIC STRING FUNCTIONS
Q1 - Q25

LEVEL 2 — SUBSTRING + STRING CHALLENGES
Q26 - Q37

LEVEL 3 — NUMERIC FUNCTIONS
Q38 - Q47

LEVEL 4 — DATE FUNCTIONS
Q48 - Q77

LEVEL 5 — FORMAT / CONVERT / CAST
Q78 - Q94

LEVEL 6 — DATEADD / DATEDIFF / ISDATE
Q95 - Q108

LEVEL 7 — BFSI ANALYTICS
Q109 - Q127

LEVEL 8 — DATA ANALYST / INTERVIEW
Q128 - Q132


============================================================
CONCEPTS COVERED
============================================================

STRING FUNCTIONS
CONCAT
LOWER
UPPER
TRIM
REPLACE
LEN

SUBSTRING FUNCTIONS
LEFT
RIGHT
SUBSTRING

NUMERIC FUNCTIONS
ROUND
ABS

DATE FUNCTIONS
GETDATE
YEAR
MONTH
DAY
DATEPART
DATENAME
DATETRUNC
EOMONTH
DATEADD
DATEDIFF
ISDATE

DATA TYPE CONVERSION
CAST
CONVERT

FORMATTING
FORMAT
Number Format Specifiers
Date Format Specifiers
Date Parts
Culture Formats


============================================================
PRACTICE ORDER
============================================================

STRING MANIPULATION
        ↓
STRING CALCULATION
        ↓
SUBSTRING EXTRACTION
        ↓
ROUND / ABS
        ↓
GETDATE
        ↓
YEAR / MONTH / DAY
        ↓
DATEPART / DATENAME
        ↓
DATETRUNC / EOMONTH
        ↓
FORMAT
        ↓
CONVERT / CAST
        ↓
DATEADD / DATEDIFF
        ↓
ISDATE
        ↓
COMBINED FUNCTIONS
        ↓
BFSI DATA ANALYTICS
        ↓
INTERVIEW CHALLENGES


============================================================
IMPORTANT
============================================================

Q1-Q37:
Focus on understanding String Functions.

Q38-Q47:
Focus on Numeric Functions.

Q48-Q77:
Focus on Date and Time Functions.

Q78-Q94:
Focus on formatting and data type conversion.

Q95-Q108:
Focus on date calculations and validation.

Q109-Q127:
Solve from a Data Analyst perspective.

Q128-Q132:
Treat these as BFSI interview/case-study questions.

Do not look at solutions while solving.
First write the logic yourself.
============================================================