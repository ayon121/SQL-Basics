---------------------------------------------------------------------------------------------------------------------------
SELECT * FROM student;

SELECT * FROM posts;


-- -- Let's use a JOIN to combine data from the student and posts tables.
-- We want to get each student's first_name and their corresponding post title, using the relationship between:
-- student.id
-- posts.student_id
SELECT  first_name, title FROM  student JOIN posts  ON  student.id = posts.student_id;

-- to see full joint key
SELECT  * FROM  student JOIN posts  ON  student.id = posts.student_id;

-- best practice for this
SELECT student.first_name, posts.title FROM  student JOIN  posts  ON student.id = posts.student_id;

-- --when you write just JOIN without specifying the type, it's treated as an INNER JOIN by default. ----





-- A LEFT JOIN is used to get all rows from the left table (e.g., student) and the matching rows from 
-- the right table (e.g., posts). If there’s no match in the right table, it returns NULL for those columns
-- adding a null value student_id post
ALTER TABLE posts ALTER COLUMN student_id DROP NOT NULL;
INSERT INTO posts (student_id, title, content)
VALUES (null, 'Untitled Post', 'joss');
-- ---------------- Left Join -----------------
SELECT * FROM student LEFT JOIN  posts  ON student.id = posts.student_id;





-- A RIGHT JOIN returns all rows from the right table, and the matching rows from the left table.
-- If there’s no match, you'll get NULL values for the left table's columns.
SELECT * FROM student RIGHT JOIN posts ON student.id = posts.student_id;





-- A FULL JOIN (also called FULL OUTER JOIN) returns:
-- All rows from both tables
-- Matches where possible
-- If there's no match, fills with NULL on the side with no match
SELECT * FROM student FULL JOIN posts ON student.id = posts.student_id;













---------------------------------------------------------------------------------------------------------------------------


