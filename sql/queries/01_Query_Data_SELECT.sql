/* 
==========================
SQL SELECT Query
==========================
The SELECT statement in SQL is used to retrieve data from a database.

Table of Contents:
1. SELECT ALL COLUMNS
2. SELECT SPECIFIC COLUMNS
3. WHERE CLAUSE
4. ORDER BY
5. GROUP BY
6. HAVING
7. DISTINCT
8. TOP
9. Combining Queries
10. COOL STUFF - Additional SQL Features
*/

/*
==========================
SELECT Statement
==========================
The SELECT statement is used to select data from a database.

Syntax
SELECT column1, column2, ...
FROM table_name;
*/

-- SELECT ALL COLUMNS
Show DATABASES;
SELECT * FROM customers;

SELECT * FROM orders;

/*
Selecting Specific Columns
-- Retrieve each customer's name, country and score.
Note:
-- There is no comma after the last column
*/

-- Retrieve each customer's name, country, and score.
SELECT first_name, country, score FROM customers;

/*
==========================
WHERE Clause
==========================
The WHERE clause is used to filter records.
It is used to extract only those records that fulfill a specified condition

Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition;

Note: Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.
*/

-- Retrieve customers with a score not equal to 0
SELECT * FROM customers WHERE `score` != 0;

-- Retrieve customers from Germany
SELECT * FROM customers WHERE `country` = 'Germany';

-- Retrieve the name and country of customers from Germany
SELECT `first_name`, `country`
from customers
WHERE
    `country` = 'Germany';

/*
Operator	Description
=	        Equal	
>	        Greater than	
<	        Less than	
>=	        Greater than or equal	
<=	        Less than or equal	
<>	        Not equal. Note: In some versions of SQL this operator may be written as !=	
BETWEEN	    Between a certain range	
LIKE	    Search for a pattern	
IN	        To specify multiple possible values for a column
*/

/* 
==========================
ORDER BY
==========================
The ORDER BY keyword is used to sort the result-set in ascending or descending order.
ASC ==> lowest to Highst
DESC ==> Highst to lowest

Syntax
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
*/

-- Retrieve all customers and sort the results by the highest score first
SELECT * FROM customers ORDER BY `score` DESC;

-- Retrieve all customers and sort the results by the lowest score first.
SELECT * FROM customers ORDER BY `score` ASC;

-- Retrieve all customers and sort the results by the country
SELECT * FROM customers ORDER BY `country` ASC;

-- Retrieve all customers and sort the results by the country and then by the highest score.
SELECT * FROM customers ORDER BY `country` ASC, `score` DESC;

--Retrieve the name, country, and score of customers whose score is not equal to 0 and sort the results by the highest score first.

SELECT `first_name`, `country`, `score`
from customers
Where
    `score` != 0
ORDER BY `score` DESC;

/* 
==========================
GROUP BY
==========================
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
aggregates a column by another column.
The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

Syntax
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
*/

-- Find the total score for each country
use mydatabase;
-- Note: All columns in the SELECT must be either aggregated or included in the GROUP BY
SELECT `country`, SUM(`score`) AS `total_score`
from customers
GROUP BY
    `country`;

-- Find the total score for each country order by score highst
SELECT `country`, SUM(`score`) AS `total_score`
FROM customers
GROUP BY
    `country`
ORDER BY `total_score` DESC;

-- Find the total score and total number of customers for each country
/*
معني الكلام اليه تحت ده
هات كل 
country
و اجمعلي ال 
score
بتعها و حطه ف 
total_score
و هات كل 
id
و عدهم و شوفهم كام و حطه ف 
total_customers
*/
SELECT
    `country`,
    SUM(`score`) AS `total_score`,
    COUNT(id) AS `total_customers`
from customers
GROUP BY
    `country`;

/*
==========================
HAVING
==========================
Using HAVING to filter data after aggregation, can use only with GROUP BY
The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

Syntax
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
*/

-- Find the average score for each country
SELECT `country`, AVG(`score`) AS `avg_score`
FROM customers
GROUP BY
    `country`;

-- Find the average score for each country, Considering only customers with a score not equal to 0.
use mydatabase;

SELECT `country`, AVG(`score`) AS `avg_score`
FROM customers
WHERE
    score != 0
GROUP BY
    `country`;

/*
Find the average score for each country, Considering only customers with a score not equal to 0
return only these countries with an average score greater than 430
*/
SELECT `country`, AVG(`score`) AS `avg_score`
FROM customers
WHERE
    `score` != 0
GROUP BY
    `country`
HAVING
    `avg_score` > 430;

/*
==========================
DISTINCT
==========================
Removes Duplicates in data (Repeated values)
Each value appera only once in the reusalt

Syntax
SELECT DISTINCT column1, column2, ...
FROM Table_name
*/

-- Return Unique list of all countries
SELECT DISTINCT `country` from customers;

/*
==========================
LIMT
==========================
restrict the number of rows Returned
is useful on large tables with thousands of records. Returning a large number of records can impact performance

MySQL Syntax:

SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;
*/

-- Retrieve only 3 Customers
SELECT * from customers LIMIT 3;

-- Retrieve the Top 3 Customers with the Highest Scores
SELECT * from customers ORDER BY `score` DESC LIMIT 3;

-- Retrieve the Lowest 2 Customers based on the score
SELECT * from customers ORDER BY `score` ASC LIMIT 3;

-- Get the Two Most Recent Orders
SELECT * FROM orders ORDER BY `order_date` LIMIT 2;

/* Calculate the average score for each country 
considering only customers with a score not equal to 0
and return only those countries with an average score greater than 430
and sort the results by the highest average score first. */
SELECT `country`, AVG(`score`) AS `avg_score`
FROM customers
WHERE
    `score` != 0
GROUP BY
    `country`
HAVING
    `avg_score` > 430
ORDER BY `avg_score` DESC;

/* Selecting Static Data */
-- Select a static or constant value without accessing any table
SELECT 123 AS static_number;

SELECT 'Hello' AS static_string;

-- Assign a constant value to a column in a query
SELECT id, first_name, 'New Customer' AS customer_type
FROM customers;