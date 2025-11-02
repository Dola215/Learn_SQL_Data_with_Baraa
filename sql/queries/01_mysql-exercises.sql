CREATE DATABASE IF NOT EXISTS revision_exercises;

USE revision_exercises;

DROP TABLE if EXISTS customers;

DROP TABLE if EXISTS orders;

DROP TABLE if EXISTS products;

CREATE TABLE customers (
    id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    score INT NULL
);

CREATE TABLE orders (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO
    customers (
        id,
        first_name,
        country,
        score
    )
VALUES (1, 'Alice', 'Germany', 450),
    (2, 'Bob', 'USA', 510),
    (3, 'Charlie', 'Germany', 380),
    (4, 'David', 'USA', 620),
    (5, 'Eve', 'Canada', 500),
    (6, 'Adel', 'Egypt', 550),
    (7, 'Hager', 'Egypt', 490),
    (8, 'Maryam', 'USA', 400),
    (9, 'Yasser', 'Canada', 500),
    (10, 'Hannah', 'UK', 700),
    (11, 'Frank', 'Germany', 45);

INSERT INTO
    orders (
        order_id,
        customer_id,
        order_date,
        total_amount
    )
VALUES (101, 1, '2025-10-01', 50.00),
    (102, 2, '2025-10-01', 120.50),
    (103, 1, '2025-10-05', 30.00),
    (104, 3, '2025-10-06', 200.00),
    (105, 5, '2025-10-10', 45.99),
    (106, 9, '2025-10-10', 150.00),
    (107, 10, '2025-10-11', 88.00);

-- Products
INSERT INTO
    products (
        product_id,
        product_name,
        price
    )
VALUES (1001, 'Laptop Bag', 45.00),
    (1002, 'Wireless Mouse', 25.50),
    (1003, 'USB Hub', 15.00),
    (1004, 'Monitor Stand', 55.00);

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM products;

-- 1. Selection: Retrieve the first name and score of the top 5 customers with the highest scores.
-- Hint: Use ORDER BY and LIMIT.
-- Your Query:
SELECT first_name, score FROM customers ORDER BY score DESC LIMIT 5;

-- 2. Filtering (Logical AND): Find all customers from the 'USA' whose score is greater than 500.
-- Your Query:
SELECT * FROM customers WHERE `country` = 'USA' AND `score` > 500;

-- 3. Filtering (Range BETWEEN): Find all orders placed between '2025-10-01' and '2025-10-07' (inclusive).
-- Your Query:
SELECT *
FROM orders
WHERE
    order_date BETWEEN '2025-10-01' and '2025-10-07';

-- 4. Filtering (Pattern LIKE): Find all customers whose first name starts with 'A' and ends with 'e'.
-- Your Query:
SELECT * FROM customers WHERE first_name LIKE 'A%e';

-- 5. Set Filtering (IN): Find all customers whose country is either 'Germany', 'Egypt', or 'UK'.
-- Your Query:
SELECT * FROM customers WHERE country IN ("Germany", "Egypt", "Uk");

-- 6. Uniqueness (DISTINCT): List all unique countries where customers are located.
-- Your Query:
SELECT DISTINCT country FROM customers;

-- --- SECTION B: GROUPING & AGGREGATION (COUNT, SUM, AVG, GROUP BY, HAVING) ---

-- 7. Grouping & Count: Find the total number of customers for each country, and sort the results by the country name (A-Z).
-- Hint: Use COUNT() and GROUP BY.
-- Your Query:
SELECT * from customers;

SELECT country, COUNT(id)
FROM customers
GROUP BY
    country
ORDER BY country ASC

-- 8. Grouping & Average: Calculate the average score for customers in the 'USA'.
-- Your Query:
SELECT country, AVG(score)
FROM customers
WHERE
    country = 'USA'
GROUP BY
    country;

-- 9. Grouping & Filtering (HAVING): Find the countries where the *total* score of customers is less than 900.
-- Hint: You need SUM() and GROUP BY, then filter the result with HAVING.
-- Your Query:
SELECT country, SUM(score)
FROM customers
GROUP BY
    country
HAVING
    SUM(score) < 900;

-- 10. Complex Aggregation: Find the total number of orders placed on each `order_date`, but only return results where more than one order was placed on that day.
-- Your Query:
SELECT * from orders;

SELECT order_date, COUNT(order_id) AS orders_count
FROM orders
GROUP BY
    order_date
HAVING
    COUNT(order_id) > 1;

-- --- SECTION C: DML (INSERT, UPDATE, DELETE) ---

-- 11. INSERT: Add a new product to the `products` table: ID 1005, Name 'Mechanical Keyboard', Price 75.00.
-- Your Query:

INSERT INTO
    products (
        product_id,
        product_name,
        price
    )
VALUES (
        1005,
        "Mechanical Keyboard",
        75.00
    );

-- 12. UPDATE: Change the `score` of the customer with ID 1 to 550.
-- Your Query:
UPDATE customers SET score = 550 WHERE id = 1;

-- 13. DELETE: Delete the customer named 'Charlie' (use the first_name and country to identify them).
-- Your Query:
DELETE FROM customers
WHERE
    first_name = 'Charlie'
    AND country = 'Germany';

-- --- SECTION D: DDL (ALTER TABLE) ---

-- 14. ALTER TABLE (Add Column): Add a new column named `status` (VARCHAR(20) NULL) to the `orders` table.
-- Your Query:
ALTER TABLE orders ADD COLUMN status VARCHAR(20) NULL;

-- 15. ALTER TABLE (Modify Column): Change the data type of the `orders` column in the `orders` table to `DECIMAL(10, 0)` (This will remove the cents/decimals).
-- Your Query:
ALTER Table orders MODIFY COLUMN total_amount DECIMAL(10, 0);

-- 16. FINAL CHECK: Select all columns from the `orders` table to see the new `status` column and the modified `total_amount` data type.
-- Your Query:
SELECT * from orders;