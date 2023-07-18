SELECT * FROM Customer;

-- --selects only the columns that we need from the Customer table.

SELECT CustID,CustName,DOB FROM Customer;

-- We can temporarily rename a column name in a table while reviewing its data using the "AS" keyword.

SELECT CustID,CustName AS 'Customer Name',DOB AS 'Date of birth' 
FROM Customer;


--  ----------------------------------------------------------------------

SELECT CustID,CustName,salary FROM Customer;

/* (salary* 0.03) column is not there in the real Customer database table,but we can  
get this coulmn whiile executing below statement.it contatins each customers salary by mutiplying those by 0.03 */

SELECT CustID,CustName,salary, (salary * 0.03) FROM Customer;

-- example for combination of AS and above example.

SELECT CustID,CustName,salary, (salary * 0.03) AS EPF FROM Customer;

 /*practise question 01 

CustName Salary ETF EPF Commision NetSalary

ETF = 3% from salary
EPF = 12% from salary
Commison = 1% from salary
NetSalary = (Salary + Commision) - (EPF + ETF) /*
*/
-- Answer------------------------ 
SELECT CustName, salary, (salary * 0.03) AS ETF, (salary * 0.12) AS EPF, 
(salary * 0.01) AS Commison,(salary + (salary * 0.01)) - ((salary * 0.03) + (salary * 0.12)) AS NetSalary 
FROM Customer; 


-- ---Order by clause - Data Sort---------------

/* 2 ways

1.Asending order - use "ASC"
2.Decending Order -use "DESC"

*/

SELECT CustID,CustName,salary FROM Customer ORDER BY CustName;

SELECT CustID,CustName,salary FROM Customer ORDER BY CustName asc;
SELECT CustID,CustName,salary FROM Customer ORDER BY CustName desc;

SELECT CustID,CustName,salary FROM Customer ORDER BY salary desc;
SELECT CustID,CustName,salary FROM Customer ORDER BY salary asc;

-- we can limit the count of the data that we are reviewing using the Keyword -LIMIT.

SELECT CustID,CustName,salary FROM Customer ORDER BY salary asc LIMIT 1;

SELECT CustID,CustName,salary FROM Customer ORDER BY salary desc LIMIT 1;

SELECT CustID,CustName,salary FROM Customer ORDER BY salary desc LIMIT 10;

-- When you want to review the customer details according to the asending order of the salary while getting the decending order of the Customer name.

SELECT CustID,CustName,salary FROM Customer ORDER BY salary asc, CustName desc;

-- according to the above example  If salary is same, the second option will triger/run

SELECT OrderDate, OrderId FROM Orders ORDER BY OrderDate desc;


-- WHERE clause - we can select data to a given condition

SELECT CustName,salary FROM Customer WHERE salary >= 75000;

SELECT CustName,salary FROM Customer WHERE salary <= 75000;


SELECT CustName,salary FROM Customer WHERE salary >= 75000
ORDER BY salary desc;


SELECT CustName,salary FROM Customer WHERE CustName="Danapala";
SELECT salary,DOB FROM Customer WHERE CustName="Danapala";


SELECT CustName,salary FROM Customer WHERE salary <= 75000 AND salary >= 40000;


SELECT CustName,salary, salary <= 75000 FROM Customer 
WHERE salary <= 75000 AND salary >= 40000;

SELECT CustName,salary,province FROM Customer 
WHERE salary <= 75000 && province="Western";

SELECT CustName,salary,province FROM Customer 
WHERE salary <= 75000 OR province="Western";

SELECT CustName,salary,province FROM Customer 
WHERE salary <= 75000 || province="Western";

-- salary >= 75000 AND province (wester, southern,eastern)

SELECT CustName,salary,province FROM Customer 
WHERE salary >= 75000 AND
(province="Western" || province="Southern" || province="Eastern");

SELECT CustName,salary,province FROM Customer 
WHERE salary >= 75000 AND province IN ('Western','Southern','Eastern');

SELECT CustName,salary,province FROM Customer 
WHERE salary >= 75000 AND province NOT IN ('Western','Southern','Eastern');

/* Structure

SELECT <coulumn heading>
FROM <table>
WHERE <if there is a condition>
ORDER BY <column acs/desc>;

*/


-- list the customer details acording to the salary 40000 - 80000

SELECT CustName,salary,province FROM Customer 
WHERE salary >= 40000 AND salary <= 80000 ORDER BY salary;

SELECT CustName,salary,province FROM Customer 
WHERE salary BETWEEN 40000 AND 80000 ORDER BY salary;

SELECT CustName,salary,province FROM Customer 
WHERE salary NOT BETWEEN 40000 AND 80000 ORDER BY salary;


-- salary = 40000 OR salary = 76000


SELECT CustName,salary,province FROM Customer 
WHERE salary = 40000 OR salary = 76000 ORDER BY salary;

SELECT CustName,salary,province FROM Customer 
WHERE salary IN (40000,76000) ORDER BY salary;


-- -----------------------------------------------------------------------------------
-- LIKE and NOT LIKE

-- -custname ending with 'pala'

SELECT CustName,salary,province FROM Customer 
WHERE CustName LIKE '%pala';


-- -custname not ending with 'pala'

SELECT CustName,salary,province FROM Customer 
WHERE CustName NOT LIKE '%pala';

-- -custname starting with 'So'

SELECT CustName,salary,province FROM Customer 
WHERE CustName LIKE 'So%';


-- if there is "ma" in between a custname

SELECT CustName,salary,province FROM Customer 
WHERE CustName LIKE '%ma%';


SELECT CustName,salary,province FROM Customer 
WHERE CustName LIKE 'So%' AND province IN ('western','Southern');


SELECT CustName,salary,province FROM Customer 
WHERE salary LIKE '40%' AND province IN ('western','Southern');

--   ------------------------------------------------------------------------------------------------------
-- -HAVING clause

-- refer the readme file first

SELECT CustName,salary FROM Customer WHERE salary >= 75000;

SELECT CustName,salary FROM Customer HAVING salary >= 75000;

-- pre filter
SELECT CustName,dob FROM Customer WHERE salary >= 75000; 

-- below statement will give an error 

SELECT CustName,dob FROM Customer HAVING salary >= 75000; 


SELECT CustID,CustName,salary, (salary * 0.03) AS EPF FROM Customer;

SELECT CustID,CustName,salary, (salary * 0.03) AS EPF FROM Customer
WHERE salary >= 75000;

-- error
SELECT CustID,CustName,salary, (salary * 0.03) AS EPF FROM Customer
WHERE EPF >= 1000; 

SELECT CustID,CustName,salary, (salary * 0.03) AS EPF FROM Customer
WHERE (salary * 0.03) >= 1000;

SELECT CustID,CustName,salary, (salary * 0.03) AS EPF FROM Customer
HAVING EPF >= 1000;



-- ==========================================================================================================================
-- -SQL Functions
-- ----------------------------
/*
Two types of functions
--------------------------
1. Normal Function
2. Aggregate Function
*/
-- ===================================================================
-- Normal Function
-----------------------

-- gives the version of the MYSQL that currenlty runs in the system.
SELECT version();

-- gives the current data.

SELECT CurDate();

-- gives the year according to the date of (2019-12-25)

SELECT year('2019-12-25');

-- gives the year of the current date (function inside another function)
SELECT year(CurDate());

SELECT month(CurDate());
SELECT monthname(CurDate());
SELECT day(CurDate());
SELECT dayname(CurDate());
SELECT datediff(CurDate(),'2020-04-01');

-- 1. Find the age of each customer in days

SELECT CustName,DOB,datediff(CurDate(),DOB) AS Age FROM Customer ORDER BY AGE;

-- 2. Find the age of each customer in years who lives in western province

SELECT CustName,DOB,province, (year(CurDate()) - year(DOB)) AS Age FROM Customer
WHERE province = 'Western';

-- 3. Find the customers who are above 60 years.

SELECT CustName,DOB,province, (year(CurDate()) - year(DOB)) AS Age FROM Customer 
HAVING AGE > 60;

-- 4. Find the customers who are above 60 years old and living in western or southern province

SELECT CustName,DOB,province, (year(CurDate()) - year(DOB)) AS Age FROM Customer 
HAVING AGE > 60 AND province IN ('Western','Southern');

SELECT CustName,DOB,province, (year(CurDate()) - year(DOB)) AS Age FROM Customer 
WHERE province IN ('Western','Southern') HAVING AGE > 60;

-- 5. Find the customers who born in 1st of January or April

SELECT CustName,DOB,province FROM Customer 
WHERE day(DOB)=1 AND (month(DOB) = 1 OR month(DOB)= 4);

SELECT CustName,DOB,province FROM Customer 
WHERE day(DOB)=1 AND month(DOB) IN (1,4);

SELECT CustName,DOB,province FROM Customer 
WHERE day(DOB)=1 AND (monthname(DOB) = 'January' OR monthname(DOB)= 'April');

SELECT CustName,DOB,province FROM Customer 
WHERE day(DOB)=1 AND monthname(DOB) IN ('January','April');


-- ==========================================================================================
-- Aggregate Functions
-- ----------------------------------------------

SELECT count(*) FROM Customer;
SELECT count(CustID) FROM Customer;

-- error
-- SELECT count() FROM Customer; 
SELECT count(province) FROM Customer;

--  Distinct used to remove repeated groups
SELECT count(DISTINCT province) FROM Customer;

SELECT max(salary) FROM Customer;
SELECT min(salary) FROM Customer;
SELECT sum(salary) FROM Customer;
SELECT avg(salary) FROM Customer;

SELECT count(*),max(salary),min(salary),sum(salary),avg(salary) FROM Customer;

/*
question 01 from Aggregate function 

Get Western Province -> max salary, min salary, sum salary, avg salary, count.
 */
 
-- Answer 
SELECT count(*),max(salary),min(salary),sum(salary),avg(salary) FROM Customer
WHERE province = 'Western';

-- ===========================================================================
-- GROUP BY clause
-- ------------------

-- Province. Sum. Avg. Cust_count

SELECT province, sum(salary), avg(salary), count(CustID) FROM Customer
GROUP BY province;


-- 1.Find order count by each customer.

SELECT CustId, count(orderID) FROM Orders GROUP BY CustId ORDER BY 2 desc;

-- 2.Find the order count which has been placed in May 2008.

SELECT count(OrderId) FROM Orders WHERE year(OrderDate) = 2008 AND monthname(OrderDate) = 'May';

-- 3.Find the most movable 10 items in the shop.


SELECT ItemCode, count(OrderId) FROM OrderDetail GROUP BY ItemCode ORDER BY 2 desc LIMIT 10; 

-- 4.Find the least movable 10 items in the shop.


SELECT ItemCode, count(OrderId) FROM OrderDetail GROUP BY ItemCode ORDER BY 2 asc LIMIT 10; 

-- 5.Find the item count of each order.

SELECT OrderId, count(ItemCode) FROM OrderDetail GROUP BY OrderId;

