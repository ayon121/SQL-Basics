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

