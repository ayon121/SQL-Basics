-- Active: 1747939035726@@127.0.0.1@5432@ayon_db
SELECT * FROM  person

-- adding a new comlumn in exiting table
ALTER TABLE person 
    ADD COLUMN email VARCHAR(50) DEFAULT 'demo@gmail.com' NOT NULL;




-- inserting new data
INSERT INTO person(id , user_name , age , email) VALUES (5 , 'Ayon5' , 29 , 'ayon@gmail.com');




-- -- delete column
ALTER TABLE person 
    DROP COLUMN email;




-- Renaming Column
ALTER Table person 
    RENAME COLUMN age to user_age;





-- -- Changing Column Type
ALTER Table person
    ALTER COLUMN  user_name TYPE VARCHAR(1000);




-- -- Setting Constraint of a Column
ALTER Table person
    ALTER COLUMN  user_age SET NOT NULL






-- Removing Constraint of a Column
ALTER Table person
    ALTER COLUMN  user_age DROP NOT NULL






-- -- Adding Unique Constraint in a Column
ALTER Table person
    ADD constraint unique_username UNIQUE(user_name);




-- Adding Unique Constraint in a Column
ALTER Table person
    ADD constraint pk_id UNIQUE(id);




-- truncate table - it means table will remain same. But all the data of the table will be deleted
TRUNCATE TABLE  person
