------------------------------------------VIEW-------------------------------------------------------

-- A view is a virtual table based on the result of a SELECT query.
-- It does not store data itself.
-- It pulls data from existing tables whenever you query it.
-- You can treat it like a regular table in your SELECT queries.




-- Why Use a View?
-- Simplify complex queries
-- Improve readability
-- Restrict access to sensitive columns
-- Re-use common queries



SELECT * from employees;
CREATE View dept_avg_salary
AS
SELECT department_name, avg(salary) FROM employees GROUP BY department_name;
SELECT * from dept_avg_salary;






CREATE View test_view
AS
SELECT employee_name, salary, department_name 
FROM employees 
WHERE department_name in 
(SELECT department_name FROM employees WHERE department_name LIKE '%R%');

SELECT * from test_view;