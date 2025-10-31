/* 
================================
SQL Filtering Data
================================


This document provides an overview of SQL filtering techniques using WHERE
and various operators for precise data retrieval.

Table of Contents:
1. Comparison Operators
- =, <>, >, >=, <, <=
2. Logical Operators
- AND, OR, NOT
3. Range Filtering
- BETWEEN
4. Set Filtering
- IN
5. Pattern Matching
- LIKE
*/

/* 
======================= 
COMPARISON OPERATORS
=======================

*/
-- Retrieve all customers from Germany.
SELECT * FROM customers WHERE country = 'Germany';

-- Retrieve all customers who are not from Germany.
SELECT * FROM customers WHERE country <> 'Germany';

-- Retrieve all customers with a score greater than 500.
SELECT * FROM customers WHERE score > 500;

-- Retrieve all customers with a score of 500 or more.
SELECT * FROM customers WHERE score >= 500 ORDER BY score DESC;

-- Retrieve all customers with a score less than 500.
SELECT * FROM customers WHERE score < 500 ORDER BY score ASC;

-- Retrieve all customers with a score of 500 or less.
SELECT * FROM customers WHERE score <= 500 ORDER BY score ASC;

/* 
======================= 
LOGICAL OPERATORS
=======================
AND     -> ALL condation must be true
OR      -> At least one condition must be TRUE 
NOT     -> (Reverse) Excludes matching values
BETWEEN -> Check if a value is within a range 
IN      -> Check if a value exists in a list 
LIKE    -> Search for a pattern in text
*/

-- Retrieve all customers who are from the USA and have a score greater than 500.
SELECT * FROM customers WHERE `country` = 'USA' AND `score` > 500;

-- Retrieve all customers who are either from the USA or have a score greater than 500.
SELECT * FROM customers WHERE `country` = 'USA' OR `score` > 500;

-- Retrieve all customers with a score not less than 500.
SELECT * FROM customers WHERE NOT score < 500;

-- Retrieve all customers whose score falls in the range between 100 and 500.
SELECT * from customers WHERE `score` BETWEEN 100 AND 500;

-- Alternative method (Equivalent to BETWEEN)
SELECT * FROM customers WHERE score >= 100 AND score <= 500;

-- Retrieve all customers from either Germany or the USA.
SELECT * FROM customers WHERE `country` IN ("USA", "Germany");

-- Find all customers whose first name starts with 'M'.
SELECT * FROM customers WHERE `first_name` LIKE 'M%';

-- Find all customers whose first name ends with 'n'.
SELECT * FROM customers WHERE `first_name` LIKE '%n';

-- Find all customers whose first name contains 'r'.
SELECT * FROM customers WHERE `first_name` LIKE '%r%';

-- Find all customers whose first name has 'r' in the third position.
SELECT * FROM customers WHERE `first_name` LIKE '__r%';