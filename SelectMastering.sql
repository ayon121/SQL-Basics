-- Creating a Table of Student
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    enrolled_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Inserting Random Data
INSERT INTO student (first_name, last_name, email, date_of_birth, enrolled_date, is_active) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '2002-05-14', '2021-09-01 10:00:00', TRUE),
('Bob', 'Smith', 'bob.smith@example.com', '2001-11-22', '2020-08-15 09:30:00', TRUE),
('Carol', 'Davis', 'carol.davis@example.com', '2003-03-08', '2022-01-10 11:45:00', TRUE),
('David', 'Wilson', 'david.wilson@example.com', '2000-07-19', '2019-06-20 08:15:00', FALSE),
('Eve', 'Brown', 'eve.brown@example.com', '2002-12-03', '2021-10-05 14:20:00', TRUE);


-- Selecting All Data
SELECT * from student;

-- Selecting particular column from table
SELECT first_name , email , is_active FROM student;


-- selecting a column as a new name
SELECT email AS "Student Email" , is_active FROM student;


-- Selecting by ascending way. 
SELECT * FROM student ORDER BY first_name ASC;



-- Selecting by decending way. 
SELECT * FROM student ORDER BY first_name DESC;

-- Seeing Unique Values In Column
SELECT DISTINCT is_active FROM student;

-- selecting useing where
SELECT * FROM student 
    WHERE is_active = true;

-- useing multiple condition
SELECT * FROM student 
    WHERE is_active = true AND first_name = 'Alice';

-- using OR Condition
SELECT * FROM student 
    WHERE is_active = FALSE OR first_name = 'Alice';



-- making  Uppercase  first_name
SELECT upper(first_name) FROM student;





-- -----------------------------------------------------------------------------------------------------
-- Scalar Function
-- In SQL, a scalar function (often called a scalar-valued function)
--  is a function that returns a single value (scalar), rather than a table or a set of rows.
-- A scalar function:
-- Takes one or more inputs
-- Returns one single value
-- Used in SELECT, WHERE, etc.
-- Scaler Function	Example	
-- LOWER()	LOWER('HELLO') → 'hello'	Converts to lowercase
-- UPPER()	UPPER('hello') → 'HELLO'	Converts to uppercase
-- LENGTH()	LENGTH('hello') → 5	Returns string length
-- CONCAT()	CONCAT('a', 'b') → 'ab'	Joins strings
SELECT concat(first_name , ' ' , last_name ) FROM student;
-- -----------------------------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------------------------
-- Aggregate Functions
-- An aggregate function in SQL is a function that performs a calculation on a group of rows and returns a single value.
-- It is commonly used with GROUP BY to summarize or analyze data.
--  Common Aggregate Functions
-- COUNT()	Counts number of rows	COUNT(*)
-- SUM()	Adds up values	SUM(price)
-- AVG()	Calculates the average	AVG(score)
-- MIN()	Finds the smallest value	MIN(age)
-- MAX()	Finds the largest value	MAX(salary)
SELECT COUNT(*) AS total_students FROM student;
-- -----------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------
-- seting bob last_name null
ALTER TABLE student
ALTER COLUMN email DROP NOT NULL;
UPDATE student
SET email = NULL
WHERE first_name = 'Bob';

-- filtering column where email is not null
SELECT * FROM student
WHERE email IS NOT NULL;
-- filtering column where email is  null
SELECT * FROM student
WHERE email IS NULL;
-------------------------------------------------------------------------------------------------------






-- COALESCE is a very useful SQL function that returns the first non-null value from a list of expressions
SELECT 
  first_name,
  last_name,
  COALESCE(email, 'no email provided') AS contact_email
FROM student;







-- IN keyword in SQL is used to match a value against a list of values — it's a shorthand for multiple OR conditions.
SELECT *
FROM student
WHERE first_name IN ('Alice', 'Carol', 'Eve');





-- BETWEEN keyword in SQL is used to filter the results within a range — it works for numbers, dates, and even text.
SELECT *
FROM student
WHERE date_of_birth BETWEEN '2000-01-01' AND '2002-12-31';




--------------------------------------------------------------------------------------------------------
-- The LIKE keyword in SQL is used for pattern matching in text columns
SELECT *
FROM student
WHERE first_name LIKE 'A%';
-- More Examples
-- Pattern	            Meaning	                        Result
-- 'A%'     --------- 	Starts with "A"	                Alice,Aaron
-- '%son'   --------- 	Ends with "son"	                Johnson,Wilson
-- '%ar%'   ---------   Contains "ar" anywhere	        Carol, Barbara
-- 'B_b'	---------   Starts with B, any one char, then b	    Bob, Bab (matches 3-letter names like Bob)
-----------------------------------------------------------------------------------------------------------






-----------------------------------------------------------------------------------------------------------
-- The LIMIT keyword in SQL is used to restrict the number of rows returned by a query.
SELECT * FROM student LIMIT 3;
-- how you use LIMIT and OFFSET together in SQL to paginate results.
SELECT * FROM student
    ORDER BY id LIMIT 3 OFFSET 2;
-- Skips the first 2 rows (students with id 1 and 2)
-- Returns the next 3 rows (students with id 3, 4, and 5)


-- Use Case: Pagination
-- Page 1: LIMIT 3 OFFSET 0 → rows 1 to 3
-- Page 2: LIMIT 3 OFFSET 3 → rows 4 to 6
-- Page 3: LIMIT 3 OFFSET 6 → rows 7 to 9
-----------------------------------------------------------------------------------------------------------





-- The DELETE keyword in SQL is used to remove rows from a table
DELETE FROM student
    WHERE first_name = 'Bob';



-- The UPDATE keyword in SQL is used to modify existing records in a table.
UPDATE student
SET email = 'alice.newemail@example.com'
WHERE first_name = 'Alice';


