use codeup_test_db;

select last_name from employees group by last_name DESC limit 10;

SELECT * FROM employees
WHERE birth_date LIKE '%12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31' GROUP BY birth_date ASC, hire_date ASC LIMIT 5;
