# SQL-DQL-
Thogakade SQL Practice: Repository with SQL documents for DQL operations on the "Thogakade" database. 
                        Enhance your SQL skills by querying, filtering, joining, and sorting data. 
                        Perfect for beginners and experienced developers. Sharpen your SQL proficiency and become a querying expert.

SQL- DQL (DATA QUERY LANGUAGE)
--------------------------------------
* It refers to the subset of SQL (Structured Query Language) statements that are used to retrieve data from a
 database. DQL allows you to specify the criteria and conditions for selecting and retrieving specific data from one or
 more database tables.

Some common DQL statements in MySQL include:

•	SELECT: Used to retrieve data from one or more tables based on specified criteria.

•	FROM: Specifies the table or tables from which to retrieve data.

•	WHERE: Specifies the conditions that must be met for a row to be included in the result set.

•	ORDER BY: Sorts the result set based on one or more columns.

•	GROUP BY: Groups the result set based on one or more columns.

•	HAVING: Specifies additional conditions that must be met by grouped rows.

SQL functions
-------------------
* There are 2 kinds of functions in SQL.

1.Normal functions

•	Version()
•	curDate()
•	year()
•	month()
•	monthname()
•	datename()
•	datediff()

2.Aggregate functions

•	Count()
•	Max()
•	Sum()
•	Min()
•	Avg()

Difference between HAVING clause and WHERE clause.

Where- The HAVING clause is used to filter columns from the source tables before any grouping or aggregation occurs

ex : SELECT CustName, dob FROM Customer WHERE salary >= 75000; // pre-filter , working perfectly

Having - The WHERE clause is used to filter columns from the source tables first, and then after that it focuses on the grouping 
        or aggregation process. but if we haven’t filtered any column names that have a connection to the grouping of the aggregation 
        process it gives an error.

 ex : SELECT CustName,dob FROM Customer HAVING salary >= 75000; // post filter ,gives an  error


	

