/* ==========================
SQL Data Definition Language (DDL)
-------------------------------------------------------------------------------
This guide covers the essential DDL commands used for defining and managing
database structures, including creating, modifying, and deleting tables.

Table of Contents:
1. CREATE - Creating Tables
2. ALTER - Modifying Table Structure
3. DROP - Removing Tables
==========================
*/

/* 
======================
CREATE
======================
The CREATE TABLE statement is used to create a new table in a database

Syntax
CREATE TABLE table_name (
column1 datatype,
column2 datatype,
column3 datatype,
....
);
*/
use mydatabase;

/* Create a new table called persons 
with columns: id, person_name, birth_date, and phone */
CREATE TABLE IF NOT EXISTS persons (
    id INT NOT NULL,
    person_name VARCHAR(20) NOT NULL,
    birth_date DATE NULL,
    phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)
);

SELECT * FROM persons;

/*
======================
ALTER
======================
Workon the defenation of the table
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table, also used to add and drop various constraints on an existing table.

ADD Column

syntax:
ALTER TABLE table_name
ADD column_name datatype;

-----------------------------
DROP COLUMN

syntax:
ALTER TABLE table_name
DROP COLUMN column_name;

-----------------------------
MODIFY 
change the data type of a column in a table

syntax:
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;
*/

-- Add a new column called email to the persons table
ALTER TABLE persons ADD `email` VARCHAR(50) NOT NULL;

SELECT * FROM persons;
-- Remove the column phone from the persons table
ALTER TABLE persons DROP `phone`;

-- Re-Add a new column called phone to the persons table
ALTER TABLE persons ADD `phone` VARCHAR(15) NOT NULL;

-- Change the data type of the column named "birth_date" in the "persons" table.
ALTER TABLE persons MODIFY `birth_date` VARCHAR(15) NULL;

-- Re-MODIFY he data type of the column named "birth_date" in the "persons" table.
ALTER TABLE persons MODIFY `birth_date` DATE NULL;

/*
======================
DROP
======================
The DROP TABLE statement is used to drop an existing table in a database.

Syntax
DROP TABLE table_name;
*/

-- Delete the table persons from the database
DROP TABLE persons;