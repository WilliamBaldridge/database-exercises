USE employees;


SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena'
GROUP BY hire_date;

SELECT *
FROM employees
WHERE first_name = 'Irena'
GROUP BY gender;

SELECT COUNT(hire_date)
FROM employees
WHERE first_name = 'Irena';


SELECT DISTINCT title
FROM titles;

SELECT DISTINCT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
GROUP BY last_name, first_name
ORDER BY last_name;

SELECT COUNT(*), last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY last_name;

SELECT COUNT(*), gender
FROM employees
WHERE (
    first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya'
          )
GROUP BY gender
ORDER BY gender;

# use table alias to use WHERE clause with an aggregate function (i.e. SUM() or COUNT() )
SELECT COUNT(*), gender
FROM employees AS e
WHERE (
                  e.first_name = 'Irena'
              OR e.first_name = 'Vidya'
              OR e.first_name = 'Maya'
          )
GROUP BY gender
ORDER BY gender;