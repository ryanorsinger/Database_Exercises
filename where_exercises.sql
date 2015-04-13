SELECT first_name AS 'Employees with first names Irena, Vidya, or Maya'
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');


select * from employees where last_name like '%E';

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'

SELECT * FROM employees
WHERE birth_date LIKE '%-12-25'

SELECT last_name FROM employees WHERE last_name LIKE '%q%'


select * from employees
where first_name = 'Irena', 'Vidya')

SELECT * FROM employees WHERE first_name IN ('Vidya', 'Maya', 'Irena') AND gender = 'M'

select * from employees where last_name like 'E%' or last_name like '%e';

SELECT * FROM employees WHERE last_name LIKE '%q%' AND (last_name NOT LIKE '%qu%');

