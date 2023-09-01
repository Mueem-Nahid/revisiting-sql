EXPLAIN ANALYSE
SELECT employee_id
FROM employee;
EXPLAIN ANALYSE
SELECT employee_id,
   employee_name
FROM employee
WHERE employee_name = 'JwDWNgCvUd';
-- creating index
CREATE INDEX name_idx on employee(employee_name);