------------------------------------------------------------------------
-- A foreign key in SQL is used to create a relationship between two tables.
--  It ensures referential integrity, meaning values in one table must match values in another.

SELECT * from student;

-- creating a table where student Id will be foreign key
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    subject TEXT NOT NULL,
    score INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

-- Inserting data in grades
INSERT INTO grades (student_id, subject, score) VALUES
(1, 'Math', 88 );

SELECT * FROM grades;

-- deleting grades TABLE
DROP TABLE grades;




---------------------------------------------------------------------------------------------------------------------------
-- ON DELETE CASCADE is a powerful feature in SQL that automatically deletes child rows when the parent row is deleted.
--  It’s especially useful when dealing with foreign key relationships.
-- Let's create a posts table and show how to use ON DELETE CASCADE so that if a student is deleted,
--  all their posts are automatically removed.
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    title TEXT NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE
);

-- Insert posts
INSERT INTO posts (student_id, title, content) VALUES
(1, 'Alice’s First Post', 'This is Alice’s post.'),
(1, 'Alice’s Second Post', 'Another one.'),
(3, 'Bob’s Post', 'Bob’s only post.');

SELECT * FROM posts

-- deleting data from student
DELETE FROM student WHERE id = 1;
-- This will automatically delete all posts created by Alice (student_id = 1) from the posts table
---------------------------------------------------------------------------------------------------------------------------

