/* ==============================================================================
SQL Data Manipulation Language (DML)
-------------------------------------------------------------------------------
This guide covers the essential DML commands used for inserting, updating, 
and deleting data in database tables.

Table of Contents:
1. INSERT - Adding Data to Tables
2. UPDATE - Modifying Existing Data
3. DELETE - Removing Data from Tables
=================================================================================
*/

/* 
================================ 
INSERT
================================ 
The INSERT INTO statement is used to insert new records (row) in a table.

Syntax
1 - Specify both the column names and the values to be inserted
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-------

2 -  If you are adding values for all the columns of the table, make sure the order of the values is in the same order as the columns in the table
INSERT INTO table_name
VALUES (value1, value2, value3, ...);

*/

-- Insert new records into the customers table
SELECT * FROM customers;

INSERT INTO
    customers (
        id,
        first_name,
        country,
        score
    )
VALUES (6, 'Adel', 'Egypt', 550);

INSERT INTO
    customers
VALUES (7, 'Hager', 'Egypt', 490),
    (8, 'Maryam', 'USA', 400);

INSERT INTO
    customers
VALUES (9, 'Yasser', 'Canada', 500),
    (10, 'Hand', 'Truka', 700);

/*
INSERT DATA USING SELECT
Moving Data From One Table to Another 
Copy data from the 'customers' table into 'persons'
*/
INSERT INTO
    persons (
        id,
        person_name,
        birth_date,
        email,
        phone
    )
SELECT id, first_name, NULL, 'Unknown', 'Unknown'
FROM customers;

/*
================================ 
UPDATE
================================

Syntax 

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

Note: 
Without the condition, all roses will be updated.
*/

-- Change the score of customer with ID 6 to 0

SELECT * from mydatabase.customers;

UPDATE customers SET `score` = 650 WHERE `id` = 6;

-- Change the score of customer with ID 10 to 0 and update the country to 'UK'
UPDATE customers SET `country` = 'UK', `score` = 0 WHERE id = 10

-- make the customer with id 5 his score to null

-- Update all customers with a NULL score by setting their score to 0
UPDATE customers SET `score` = 0 WHERE `score` IS NULL;

/*
================================ 
DELETE
================================

Syntax 

DELETE FROM table_name WHERE condition;

Note: always use WHERE to avoid deleting all rwos
*/

DELETE FROM customers WHERE id > 5;