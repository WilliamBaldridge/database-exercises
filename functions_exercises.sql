USE employees;



SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

SELECT CONCAT(last_name, ', ', first_name) AS 'Last name, first name'
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
ORDER BY emp_no;

SELECT *
FROM employees
WHERE DAY(birth_date) = 25
  AND MONTH(birth_date) = 12;

SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999
  AND (
        month(birth_date) = 12
        AND day(birth_date) = 25
    );

SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999
  AND (
        month(birth_date) = 12
        AND day(birth_date) = 25
    )
ORDER BY birth_date, hire_date DESC;

SELECT *, DATEDIFF(NOW(), hire_date) AS 'Days employed'
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999
  AND (
            month(birth_date) = 12
        AND day(birth_date) = 25
    )
ORDER BY birth_date, hire_date DESC;