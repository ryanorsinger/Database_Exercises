use employees;

-- Find all current employees with the same hire date as employee 101010
SELECT *
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
) AND emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE TO_date > now()
);


-- Find all the current titles held by employees with the first name 'Aamod'
SELECT *
FROM titles
WHERE to_date > now()
AND emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);


-- Find all current department managers that are female
SELECT *
FROM dept_manager
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE gender = 'F'
) AND to_date > now();


-- Find all the department names that currently have female managers
SELECT *
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE to_date > now()
    AND
    emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F'
    )
)

-- Average salary of female employees, avg salary of male employees
SELECT gender, sum(salary) / count(salary) AS "historic average salary"
FROM employees AS e
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
GROUP BY e.gender

SELECT gender, sum(salary) / count(salary) AS "current average salaries"
FROM employees AS e
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
WHERE e.emp_no IN (
    SELECT emp_no
   FROM titles
   WHERE to_date > now()
) GROUP BY e.gender

-- current average salaries of male vs. female salaries
SELECT gender, sum(salary) / count(salary) AS "current average salaries"
FROM employees AS e
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
  JOIN titles AS t
    ON e.emp_no = t.emp_no
   WHERE t.to_date > now()
 GROUP BY e.gender

-- Average salary of female managers vs. male managers
SELECT e.gender, sum(salary) / count(salary) AS 'historic average manager salary'
FROM employees AS e
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
WHERE e.emp_no IN (
    SELECT emp_no
    FROM dept_manager
) GROUP BY e.gender

-- Average salary of female vs. male current managers
SELECT e.gender, sum(salary) / count(salary) AS 'current average manager salary'
FROM employees AS e
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
  JOIN titles AS t
    ON e.emp_no = t.emp_no
WHERE e.emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > now()
)
GROUP BY e.gender
