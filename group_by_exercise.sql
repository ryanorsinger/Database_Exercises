use codeup_test_db;

SELECT concat(count(first_name), ' ', gender)
FROM employees
WHERE first_name IN ('Vidya', 'Maya', 'Irena')
GROUP BY gender

SELECT concat(first_name, ' ', last_name) AS 'full_name' FROM employees
WHERE last_name LIKE 'e%e';

SELECT concat(first_name, ' ', last_name) AS full_name, datediff(now(), hire_date) AS 'DAYS IN THE SALT MINES'
FROM employees
WHERE birth_date LIKE '%12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
