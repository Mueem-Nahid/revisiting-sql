-- Active: 1692888528440@@127.0.0.1@5432@my_new_db
CREATE TABLE users (
   user_id SERIAL PRIMARY KEY,
   username VARCHAR(20) UNIQUE NOT NULL,
   email VARCHAR(50) UNIQUE NOT NULL
) CREATE TABLE students (
   user_id SERIAL,
   username VARCHAR(20) UNIQUE NOT NULL,
   email VARCHAR(50) UNIQUE NOT NULL,
   PRIMARY KEY(user_id, username)
) -- default value
CREATE TABLE users2 (
   user_id SERIAL PRIMARY KEY,
   username VARCHAR(20) UNIQUE NOT NULL,
   email VARCHAR(50) UNIQUE NOT NULL,
   age INT DEFAULT 18
) -- delete all rows of a TABLE
TRUNCATE TABLE users2;
INSERT INTO users2 (username, email, age)
VALUES ('adasd', 'sd@gmail.com', 22),
   ('a3sd', 's3d@gmail.com', 55),
   ('aas', 's2d@gmail.com', 22),
   ('rtr', 'std@gmail.com', 22),
   ('adaddsd', 'suud@gmail.com', 22),
   ('adaffsd', 'sdmm@gmail.com', 22);
-- How to alter TABLE
-- ------------------------
-- add a column , drop a column, change data type of a COLUMN
-- rename a column, set default value for a COLUMN
-- add CONSTRAINTS to a COLUMN, drop CONSTRAINTS for a COLUMN
-- table RENAME
-- ALTER TABLE table_name action
-- add a column
ALTER TABLE users2
ADD COLUMN password VARCHAR(100) DEFAULT 'mueem1234' NOT NULL;
-- drop a column
ALTER TABLE users2 DROP COLUMN age;
-- add column and alter column type
ALTER Table users2
ADD COLUMN demo INT;
ALTER Table employee
ADD COLUMN salary INT;
ALTER TABLE users2
ALTER COLUMN demo type FLOAT;
-- alter default VALUE
ALTER Table users2
ALTER COLUMN demo
SET DEFAULT 2.5;
INSERT INTO users2
VALUEs(99, 'ddd', 'ddd@gmail.com', 'psdadd');
-- remove default value of a COLUMN
ALTER Table users2
ALTER COLUMN demo DROP DEFAULT;
-- rename a column
ALTER TABLE users2
   RENAME COLUMN demo to cgpa;
-- add not null constraints
ALTER TABLE users2
ALTER COLUMN email
SET NOT NULL;
-- drop not null  CONSTRAINT
ALTER TABLE users2
ALTER COLUMN email DROP NOT NULL;
-- add unique CONSTRAINT
ALTER TABLE users2
ADD CONSTRAINT unique_email UNIQUE(email);
-- drop unique CONSTRAINT
ALTER TABLE users2 DROP CONSTRAINT unique_email;
SELECT *
FROM users2;
-- Foreign Key constraints
CREATE TABLE Employee(
   employee_id SERIAL PRIMARY KEY,
   employee_name VARCHAR(20) NOT NULL,
   department_id INT,
   CONSTRAINT fk_constraint_dept FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
CREATE TABLE Department(
   department_id SERIAL PRIMARY KEY,
   department_name VARCHAR(20) NOT NULL
);
INSERT INTO Department
VALUES (1, 'CSE'),
   (2, 'EEE'),
   (3, 'ECE'),
   (4, 'Civil');
INSERT INTO Employee
VALUES (6, 'Hasan', 3),
   (2, 'Hazrat', 2),
   (3, 'Hridoy', 1),
   (4, 'Kate', 2),
   (5, 'Abir', 3);
SELECT *
FROM Department;
SELECT *
FROM Employee;
-- delete row
DELETE FROM Employee
WHERE employee_id = 6;
DELETE FROM department;
CREATE TABLE courses (
   course_id SERIAL PRIMARY KEY,
   course_name VARCHAR(50) NOT NULL,
   description VARCHAR(255),
   published_date DATE
);
-- date format YYYY-MM-DD
INSERT INTO courses(course_name, description, published_date)
VALUES ('English', 'This is description', '2020-05-13'),
   ('Bangla', 'This is description', '2020-05-13'),
   ('Math', 'This is description', '2020-05-13'),
   ('Science', 'This is description', '2020-05-13'),
   ('ICT', 'This is description', '2020-05-13'),
   ('Islam', 'This is description', '2020-05-13');
-- update
UPDATE courses
set description = 'This is English 101 course.',
   course_name = 'English 101'
WHERE course_id = 1;
UPDATE employee
SET salary = 25000
WHERE employee_id = 5;
-- duplicate value : ditinct
SELECT DISTINCT published_date
from courses;
-- not equal
SELECT *
from courses
WHERE course_name <> 'ICT';
SELECT *
FROM courses;
-- sorting , limit, offset
select *
from courses
ORDER BY course_name ASC
LIMIT 2 OFFSET 3;
-- in, not in, between, like
SELECT *
from courses
WHERE course_id IN(2, 33, 4);
SELECT *
from courses
WHERE course_id NOT IN(2);
-- like
SELECT *
from courses
WHERE course_name LIKE 'B%';
-- specific position
SELECT *
FROM courses
WHERE course_name LIKE '_a%';
SELECT *
FROM courses
WHERE course_name LIKE 'I%T';
-- join
SELECT employee_id,
   employee_name,
   department.department_id,
   department_name,
   AVG(salary) as avg_salary
FROM employee
   INNER JOIN department ON department.department_id = employee.department_id
GROUP BY employee_id,
   department.department_id;
-- aggregate function
SELECT AVG(salary) as avg_salary
FROM employee;
SELECT department_id,
   AVG(salary)
from employee
GROUP BY department_id;
SELECT d.department_name,
   AVG(salary),
   sum(salary),
   max(salary),
   count(*)
from employee e
   FULL JOIN department d on e.department_id = d.department_id
GROUP BY d.department_name;
-- having
SELECT d.department_name,
   AVG(salary),
   sum(salary),
   max(salary),
   count(*)
from employee e
   FULL JOIN department d on e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(salary) >= 40000;
-- sub query in where
SELECT *
FROM employee
WHERE salary = (
      SELECT max(salary)
      FROM employee
   );
SELECT *
FROM employee
WHERE salary IN (
      SELECT salary
      FROM employee
      WHERE employee_name LIKE 'H%'
   );
SELECT *
from employee
WHERE salary > (
      SELECT AVG(salary)
      from employee
   );
-- sub query in column
SELECT employee_name,
   (
      SELECT AVG(salary)
      FROM employee
   )
from employee;
-- sub query in from
SELECT department_id,
   avg_salary
from (
      SELECT department_id,
         AVG(salary) as avg_salary
      from employee
      GROUP BY department_id
   ) as temp_table;
-- using this temporary table we can join with another table
SELECT tempTable.department_id,
   avg_salary,
   department_name
from (
      SELECT department_id,
         AVG(salary) as avg_salary
      from employee
      GROUP BY department_id
   ) as tempTable
   JOIN department d on d.department_id = tempTable.department_id;
-- views
CREATE VIEW department_avg_salary AS
SELECT tempTable.department_id,
   avg_salary,
   department_name
from (
      SELECT department_id,
         AVG(salary) as avg_salary
      from employee
      GROUP BY department_id
   ) as tempTable
   JOIN department d on d.department_id = tempTable.department_id;
SELECT *
FROM department_avg_salary;