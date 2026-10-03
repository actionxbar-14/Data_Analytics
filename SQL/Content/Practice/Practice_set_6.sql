/* ==============================================================================

   SQL ADVANCED PRACTICE QUESTION SET

   Database: SQL_ADVANCED

   Topics Covered:
     1. SUBQUERY - RESULT TYPES
     2. SUBQUERY - FROM CLAUSE
     3. SUBQUERY - SELECT
     4. SUBQUERY - JOIN CLAUSE
     5. SUBQUERY - COMPARISON OPERATORS
     6. SUBQUERY - IN OPERATOR
     7. SUBQUERY - ANY OPERATOR
     8. SUBQUERY - CORRELATED
     9. SUBQUERY - EXISTS OPERATOR
    10. NON-RECURSIVE CTE
    11. RECURSIVE CTE - GENERATE SEQUENCE
    12. RECURSIVE CTE - BUILD HIERARCHY
    13. VIEWS
    14. TEMPORARY TABLES
    15. STORED PROCEDURES
    16. TRIGGERS
    17. COMBINED ADVANCED PRACTICE
    18. INTERVIEW-LEVEL QUESTIONS

   Total Questions: 250

   NOTE:
   - No BFSI-specific questions
   - No UNION / UNION ALL / EXCEPT / INTERSECT questions
   - No answers included

===============================================================================*/





SELECT * FROM Accounts

SELECT * FROM BankOrders

SELECT * FROM Branches

SELECT * FROM CardTransactions

SELECT * FROM CreditCards

SELECT * FROM Customers

SELECT * FROM EmployeeAudit

SELECT * FROM Employees

SELECT * FROM LoanPayments

SELECT * FROM  Loans

SELECT * FROM Products

SELECT * FROM Transactions






/* ==============================================================================
   SECTION A
   SUBQUERY - RESULT TYPES
===============================================================================*/






 /* Q1. Find employees whose salary is greater than the average salary
     of all employees. */

Ans:

SELECT
     *
FROM
(
SELECT
     *,
     AVG(salary) OVER() As Avg_Salary
FROM Employees
)t
WHERE salary > Avg_Salary








    
/* Q2. Find the employee with the highest salary using a subquery. */

Ans:

SELECT
     *
FROM
(
SELECT 
     * ,
     MAX(salary) OVER() AS Max_salary
FROM Employees
)t
WHERE salary = Max_salary;









/* Q3. Find employees whose salary is equal to the maximum salary. */

Ans:




SELECT
     *
FROM
(
SELECT 
     * ,
     MAX(salary) OVER() AS Max_salary
FROM Employees
)t
WHERE salary = Max_salary;








/* Q4. Find products whose unit_price is greater than the average
    product price. */

Ans:


SELECT
     *
FROM 
(
SELECT 
     * ,
     AVG(unit_price) OVER() As AVG_unit_price
FROM BankOrders
)t
WHERE unit_price > AVG_unit_price;










/* Q5. Find customers who have placed more than one order.  */

Ans:


SELECT
     *
FROM 
(
SELECT 
     customer_id,
     COUNT(order_id) As Order_Quantity
FROM BankOrders
GROUP BY customer_id
)t
WHERE Order_Quantity > 1;














/* Q6. Find orders whose sales_amount is greater than the average
    order amount. */

Ans:


SELECT
     * 
FROM 
(
SELECT
     *,
     AVG(unit_price) OVER() As Avg_unit_price
FROM BankOrders
)t
WHERE unit_price > Avg_unit_price;












/* Q7. Find the department having the highest budget. */

Ans:



SELECT 
     * 
FROM 
(
SELECT
     *,
     MAX(Total_Salary) OVER() As Highest_Budget
FROM 
(
SELECT 
     department,
     SUM(salary) As Total_Salary
FROM Employees
GROUP BY department
)t

)t
WHERE  Total_Salary = Highest_Budget;












/* Q8. Find employees who earn less than the average salary.  */

Ans:







Q9. Find employees whose salary is greater than the salary of
    employee 'Amit Sharma'.

Q10. Find products whose price is greater than the price of
     'Keyboard'.

Q11. Find orders whose sales amount is greater than the average
     completed order amount.

Q12. Find customers whose total order amount is greater than the
     average customer order amount.

Q13. Find employees working in the department having the highest budget.

Q14. Find the second-highest salary using a subquery.

Q15. Find employees whose salary is greater than the second-highest salary.

Q16. Find the department whose average employee salary is highest.




























/* ==============================================================================
   SECTION B
   SUBQUERY - FROM CLAUSE
===============================================================================

Q17. Create a derived table containing department-wise average salary.

Q18. From the derived table, find departments whose average salary
    is greater than 90000.

Q19. Create a derived table containing customer-wise total sales.

Q20. Find customers whose total sales exceed 50000 using a subquery
    in the FROM clause.

Q21. Create a derived table containing category-wise average product price.

Q22. Find categories whose average product price is greater than
    the overall product average.

Q23. Create a derived table containing department-wise employee count.

Q24. Find departments having more than 3 employees.

Q25. Create a derived table containing customer-wise order count.

Q26. Find customers who have placed more orders than the average
    customer order count.


























/* ==============================================================================
   SECTION C
   SUBQUERY - SELECT
===============================================================================

Q27. Display every employee along with the overall average salary.

Q28. Display every employee with the difference between their salary
    and the average salary.

Q29. Display every product along with the overall average product price.

Q30. Display every customer along with their total number of orders.

Q31. Display every customer with their total sales amount.

Q32. Display every department along with the total number of employees.

Q33. Display every product along with the total quantity sold.

Q34. Display every employee along with the maximum salary in the company.

Q35. Display every employee with the percentage of company salary
    represented by their salary.


























/* ==============================================================================
   SECTION D
   SUBQUERY - JOIN CLAUSE
===============================================================================

Q36. Join Employees with a subquery containing department-wise average salary.

Q37. Display employees whose salary is greater than their department's
    average salary.

Q38. Join Customers with a subquery containing customer-wise total sales.

Q39. Display customers whose total sales exceed 50000.

Q40. Join Products with a subquery containing category-wise average price.

Q41. Display products whose price is greater than their category average price.

Q42. Join Departments with a subquery containing employee counts.

Q43. Display departments having more than 3 employees.































/* ==============================================================================
   SECTION E
   SUBQUERY - COMPARISON OPERATORS
===============================================================================

   Practice Operators:

   >
   <
   =
   >=
   <=
   <>

-------------------------------------------------------------------------------

Q44. Find employees whose salary is greater than the average salary.

Q45. Find employees whose salary is less than the average salary.

Q46. Find the employee whose salary equals the maximum salary.

Q47. Find products whose price is greater than the average price.

Q48. Find orders whose sales amount is less than the average
    completed order.

Q49. Find employees whose salary is greater than the salary of
    'Rahul Mehta'.

Q50. Find products whose price is less than the price of 'Laptop'.

Q51. Find employees whose salary is not equal to the minimum salary.

Q52. Find departments whose budget is greater than the average
    department budget.
































/* ==============================================================================
   SECTION F
   SUBQUERY - IN OPERATOR
===============================================================================

Q53. Find employees working in departments whose budget is greater
    than 10000000.

Q54. Find employees working in the IT or Finance departments using
    a subquery with IN.

Q55. Find customers who have placed completed orders.

Q56. Find customers who have never placed a completed order.

Q57. Find products belonging to categories having more than 2 products.

Q58. Find employees belonging to departments located in Delhi.

Q59. Find customers who have placed orders greater than 50000.

Q60. Find products belonging to categories whose average product price
    is greater than 10000.

Q61. Find employees working under managers whose department budget
    is greater than 12000000.

Q62. Find customers who have at least one order with status 'Completed'.






























/* ==============================================================================
   SECTION G
   SUBQUERY - ANY OPERATOR
===============================================================================

Q63. Find employees whose salary is greater than ANY salary in the
    HR department.

Q64. Find employees whose salary is less than ANY salary in the
    IT department.

Q65. Find employees whose salary is greater than ANY employee salary
    in Finance.

Q66. Find products whose price is greater than ANY product price
    in the Accessories category.

Q67. Find products whose price is less than ANY product price
    in Electronics.

Q68. Find orders whose sales amount is greater than ANY order placed
    by Customer A.

Q69. Find employees whose salary is greater than ANY employee reporting
    to 'Amit Sharma'.

Q70. Find employees whose salary is less than ANY employee in the
    Sales department.


























/* ==============================================================================
   SECTION H
   SUBQUERY - CORRELATED SUBQUERIES
===============================================================================

Q71. Find employees whose salary is greater than the average salary
    of their own department.

Q72. Find employees whose salary is below their department's average salary.

Q73. Find the highest-paid employee in each department using a
    correlated subquery.

Q74. Find the lowest-paid employee in each department.

Q75. Find products whose price is greater than the average price
    of their own category.

Q76. Find products whose price is below their category average.

Q77. Find customers whose total order amount is greater than the
    average order amount of all customers.

Q78. Find orders whose sales amount is greater than the average
    order amount of the same customer.

Q79. Find employees who earn more than every employee hired before
    them in the same department.

Q80. Find customers who have placed more orders than the average
    number of orders for customers in their segment.

Q81. Find the most expensive product in each category.

Q82. Find employees who have the highest salary among employees
    with the same job title.

Q83. Find orders that have a sales amount greater than the average
    order amount placed in the same month.

Q84. Find customers whose latest order amount is greater than
    their own average order amount.

























/* ==============================================================================
   SECTION I
   SUBQUERY - EXISTS OPERATOR
===============================================================================

Q85. Find customers for whom at least one order exists.

Q86. Find customers for whom no order exists.

Q87. Find products that have been ordered at least once.

Q88. Find products that have never been ordered.

Q89. Find employees who have at least one employee reporting to them.

Q90. Find employees who have no direct reports.

Q91. Find departments having at least one employee.

Q92. Find departments having no employees.

Q93. Find customers who have at least one completed order.

Q94. Find customers who have no completed orders.

Q95. Find categories having at least one product priced above 10000.

Q96. Find employees whose department has at least one employee earning
    more than 100000.


















---------------------------------------------------------------------------------------------------------------------------------------------




















/* ==============================================================================
   SECTION J
   NON-RECURSIVE CTE
===============================================================================

Q97. Create a CTE containing employees with salary greater than 80000.

Q98. Use a CTE to calculate department-wise average salary.

Q99. Use a CTE to find departments whose average salary exceeds 90000.

Q100. Use a CTE to calculate customer-wise total sales.

Q101. Use a CTE to find customers whose total sales exceed 50000.

Q102. Use a CTE to calculate category-wise average product price.

Q103. Use a CTE to find categories having more than 2 products.

Q104. Use a CTE to calculate monthly sales.

Q105. Use a CTE to find the month with the highest sales.

Q106. Use a CTE to calculate employee count per department.

Q107. Use a CTE to identify departments having employee count greater
     than the company average department size.

Q108. Use multiple CTEs to calculate customer order count and
     customer total sales.

Q109. Use multiple CTEs to identify high-value customers.

Q110. Use a CTE to calculate product revenue using quantity × unit_price.

Q111. Find the top 5 products by revenue using a CTE.































/* ==============================================================================
   SECTION K
   RECURSIVE CTE - GENERATE SEQUENCE
===============================================================================

Q112. Generate numbers from 1 to 10 using a recursive CTE.

Q113. Generate numbers from 1 to 100.

Q114. Generate even numbers from 2 to 20.

Q115. Generate odd numbers from 1 to 19.

Q116. Generate dates from '2024-01-01' to '2024-01-31'.

Q117. Generate all months of 2024.

Q118. Generate numbers from 100 to 200 with an increment of 10.

Q119. Generate the first 12 months using a recursive CTE.

Q120. Generate a sequence representing employee hierarchy levels.






















/* ==============================================================================
   SECTION L
   RECURSIVE CTE - BUILD HIERARCHY
===============================================================================

Q121. Display the complete employee hierarchy starting from
     top-level employees.

Q122. Display employee name along with manager name.

Q123. Generate hierarchy level for every employee.

Q124. Display all employees reporting directly to Amit Sharma.

Q125. Display all employees indirectly reporting to Amit Sharma.

Q126. Display the complete hierarchy under each department head.

Q127. Find the maximum hierarchy depth.

Q128. Display employee → manager → manager's manager.

Q129. Find all employees under the IT Director.

Q130. Generate a hierarchy path such as:

     Amit Sharma
          >
     Neha Verma
          >
     Karan Gupta

Q131. Count the number of employees under each top-level manager.

Q132. Find employees who are at hierarchy level 2 or deeper.

























_____________________________________________________________________________________________________________________________________________________
























/* ==============================================================================
   SECTION M
   SQL VIEWS
===============================================================================

Q133. Create a view containing employee name, department name,
     job title and salary.

Q134. Create a view containing active employees only.

Q135. Create a view containing employees earning more than 80000.

Q136. Create a view containing department-wise employee count.

Q137. Create a view containing department-wise average salary.

Q138. Create a view containing customer-wise total sales.

Q139. Create a view containing customer name, order date and sales amount.

Q140. Create a view containing product name, category name and unit price.

Q141. Modify an existing view using ALTER VIEW.

Q142. Drop a view.

Q143. Create a view that hides the complexity of a 4-table join.

Q144. Create a view that exposes only selected employee columns
     for data security.

Q145. Create a view that hides employee salary information.

Q146. Create a view showing only active employees from the IT department.
















_____________________________________________________________________________________________________________________________________________________


























/* ==============================================================================
   SECTION N
   SQL TEMPORARY TABLES
===============================================================================

Q147. Create a temporary table containing all active employees.

Q148. Insert department-wise employee counts into a temporary table.

Q149. Create a temporary table containing customer-wise total sales.

Q150. Find the top 5 customers from the temporary table.

Q151. Create a temporary table containing products and their total
     sold quantity.

Q152. Update values in a temporary table.

Q153. Delete records from a temporary table based on a condition.

Q154. Create a temporary table and use it in a JOIN.

Q155. Create a temporary table for a multi-step sales analysis.

Q156. Use a temporary table to identify high-value customers.

Q157. Use a temporary table to perform a data migration from one
     structure to another.

Q158. Drop the temporary table explicitly after completing the analysis.






--------------------------------------------------------------------------------------------------------------------------------------------------










/* ==============================================================================
   SECTION O
   STORED PROCEDURES - BASICS
===============================================================================

Q159. Create a stored procedure that returns all employees.

Q160. Create a stored procedure that returns all active employees.

Q161. Create a stored procedure that returns all products.

Q162. Execute the stored procedure created in Q159.

Q163. Create a stored procedure that returns all customers from
     a specified city.

Q164. Create a stored procedure that returns employees from a
     specified department.








/* ==============================================================================
   SECTION P
   STORED PROCEDURES - PARAMETERS
===============================================================================

Q165. Create a procedure accepting department_id as a parameter.

Q166. Create a procedure accepting minimum salary as a parameter.

Q167. Create a procedure accepting city as a parameter.

Q168. Create a procedure accepting start_date and end_date.

Q169. Create a procedure accepting customer_id and returning
     their orders.

Q170. Create a procedure accepting category_id and returning products.

Q171. Create a procedure accepting minimum order amount.

Q172. Create a procedure with multiple parameters:

     department_id
     minimum_salary

Q173. Create a procedure that returns employees between two
     salary values.







/* ==============================================================================
   SECTION Q
   STORED PROCEDURES - MULTIPLE QUERIES
===============================================================================

Q174. Create a procedure that returns:

     1. Employee details
     2. Department details
     3. Department employee count

Q175. Create a procedure that returns customer information
     and their orders.

Q176. Create a procedure that returns product information
     and category information.

Q177. Create a procedure that returns:

     Total orders
     Total sales
     Average order value

Q178. Create a procedure that returns employee count and
     average salary for a department.










/* ==============================================================================
   SECTION R
   STORED PROCEDURES - VARIABLES
===============================================================================

Q179. Create a procedure using a variable to store average salary.

Q180. Create a procedure using a variable to store total sales.

Q181. Create a procedure that stores the maximum salary in a variable.

Q182. Use a variable to calculate the difference between an employee's
     salary and company average salary.

Q183. Create a procedure using multiple variables for:

     Total Sales
     Average Sales
     Maximum Sales









/* ==============================================================================
   SECTION S
   STORED PROCEDURES - IF / ELSE
===============================================================================

Q184. Create a procedure that accepts employee salary and returns:

     'High Salary' if salary > 100000
     'Medium Salary' if salary between 70000 and 100000
     'Low Salary' otherwise.

Q185. Create a procedure that checks whether a customer exists.

Q186. Create a procedure that checks whether an order exists.

Q187. Create a procedure that checks whether a department has employees.

Q188. Create a procedure that checks whether stock quantity is sufficient
     for a product.

Q189. Create a procedure that checks whether a customer is a
     high-value customer.

Q190. Create a procedure that checks whether an employee is a manager.
















/* ==============================================================================
   SECTION T
   STORED PROCEDURES - TRY / CATCH
===============================================================================

Q191. Create a procedure that inserts a new employee using TRY/CATCH.

Q192. Handle duplicate employee_id using TRY/CATCH.

Q193. Handle invalid department_id using TRY/CATCH.

Q194. Create a procedure that updates employee salary with error handling.

Q195. Create a procedure that inserts a new order with TRY/CATCH.

Q196. Create a procedure that performs multiple operations
     and handles errors.

Q197. Return an appropriate error message using ERROR_MESSAGE().

Q198. Capture ERROR_NUMBER(), ERROR_MESSAGE(), and ERROR_LINE()
     inside a TRY/CATCH block.












--------------------------------------------------------------------------------------------------------------------------------------------------













/* ==============================================================================
   SECTION U
   SQL TRIGGERS
===============================================================================

Q199. Create an EmployeeLogs table for employee audit tracking.

Q200. Create an AFTER INSERT trigger on Employees.

Q201. Log newly inserted employees into EmployeeLogs.

Q202. Insert a new employee and verify the trigger execution.

Q203. Create an AFTER UPDATE trigger for Employees.

Q204. Log employee salary updates.

Q205. Create a trigger that records changes to employee department.

Q206. Create an AFTER DELETE trigger for Employees.

Q207. Log deleted employee information.

Q208. Create a trigger that prevents deleting employees from a
     specific department.

Q209. Create a trigger that automatically logs changes to
     employee status.

Q210. Create a trigger that logs both INSERT and UPDATE operations.

Q211. Create a trigger that records the action date using GETDATE().






















--------------------------------------------------------------------------------------------------------------------------------------------------


































/* ==============================================================================
   SECTION V
   ADVANCED COMBINED PRACTICE
===============================================================================

Q212. Use a CTE + window function to identify the highest-paid
     employee in every department.

Q213. Use a CTE + subquery to find employees earning above
     their department average.

Q214. Use a CTE + EXISTS to find customers having completed orders.

Q215. Use a CTE + correlated subquery to find the highest-value
     customer in each state.

Q216. Use a CTE + JOIN to calculate department-wise salary statistics.

Q217. Use a temporary table + CTE to perform multi-step sales analysis.

Q218. Use a temporary table to calculate customer lifetime sales.

Q219. Create a view hiding a complex multi-table query.

Q220. Create a stored procedure that uses a CTE internally.

Q221. Create a stored procedure that uses a temporary table internally.

Q222. Create a stored procedure that checks a condition using EXISTS.

Q223. Create a stored procedure that uses IF/ELSE and TRY/CATCH.

Q224. Create an INSERT trigger that writes an audit record.

Q225. Create an UPDATE trigger that logs changed employee information.

Q226. Build an employee hierarchy using a recursive CTE and expose it
     through a view.

Q227. Create a stored procedure that returns the hierarchy under
     a specified manager.

Q228. Create a stored procedure that accepts a department_id
     and returns:

     Employee Count
     Average Salary
     Maximum Salary
     Minimum Salary
     Total Salary

Q229. Create a view containing customer total sales and order count,
     then use a subquery to find above-average customers.

Q230. Use CTE + correlated subquery to identify products whose price
     is above their category average.

Q231. Use EXISTS + correlated subquery to find customers who have
     at least one order above their own average order amount.

Q232. Create a temporary table containing monthly sales and identify
     the highest-sales month.

Q233. Create a stored procedure that accepts a customer_id and returns:

     Customer Details
     Order Count
     Total Sales
     Average Order Value
     Highest Order Value

Q234. Create an audit trigger that records INSERT, UPDATE and DELETE
     operations on Employees.
































/* ==============================================================================
   SECTION W
   INTERVIEW-LEVEL QUESTIONS
===============================================================================

Q235. What is the difference between a subquery and a CTE?
     Demonstrate using Employees.

Q236. When would you prefer a CTE over a derived table?

Q237. When would you prefer EXISTS over IN?

Q238. Demonstrate a case where a correlated subquery is required.

Q239. Rewrite a correlated subquery using a JOIN.

Q240. Rewrite a subquery using a CTE.

Q241. Rewrite a derived table query using a CTE.

Q242. Explain the difference between:

     Subquery in SELECT
     Subquery in FROM
     Subquery in WHERE
     Subquery in JOIN

Q243. Compare EXISTS vs IN using the Customers and Orders tables.

Q244. Explain recursive CTE execution using the Employees hierarchy.

Q245. What is the difference between a view and a temporary table?

Q246. What is the difference between a view and a stored procedure?

Q247. What is the difference between a stored procedure and a function?

Q248. What are practical use cases of triggers?

Q249. What are potential disadvantages of triggers?

Q250. Why should triggers be designed carefully in production systems?


