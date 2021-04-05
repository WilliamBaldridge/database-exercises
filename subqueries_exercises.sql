USE employees;


select CONCAT(first_name, ' ', last_name) as Name, hire_date, emp_no
from employees
where hire_date IN (
    select hire_date
    from employees
    where emp_no = 101010
);

SELECT title, COUNT(DISTINCT title) as unique_titles # aggregate function chops off displaying more than 1 title
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    Where first_name = 'Aamod'
);

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
      AND gender = 'f'
);

SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F'
    )
      AND to_date > NOW()
);

SELECT dept_name
FROM departments as d
         JOIN dept_manager as dm on dm.dept_no = d.dept_no
WHERE dm.emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE gender = 'f'
#       AND to_date > NOW()
)
  AND to_date > NOW();


SELECT first_name, last_name
FROM employees as e
WHERE emp_no in (
    SELECT emp_no
    FROM salaries
    Where to_date > NOW()
    AND salary = (SELECT max(salary) FROM salaries)
    );
