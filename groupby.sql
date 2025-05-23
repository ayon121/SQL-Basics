------------------------------------------------------------------------------------------------------------
-- The GROUP BY keyword in SQL is used to group rows that have the same values in specified columns into
--  summary rows — typically used with aggregate functions like COUNT(), SUM(), AVG(), etc.


-- Count How Many Students Are Active vs Inactive
SELECT is_active, COUNT(*) AS student_count
FROM student
GROUP BY is_active;



--  The HAVING keyword in SQL is used to filter groups after aggregation — it's like a WHERE clause, but for use with GROUP BY.
--  Only Show Name Groups with More Than 1 Student
SELECT first_name, COUNT(*) AS count
FROM student
GROUP BY first_name
HAVING COUNT(*) > 1;

-- Inactive Groups Only
SELECT is_active, COUNT(*) AS total
FROM student
GROUP BY is_active
HAVING is_active = false;

