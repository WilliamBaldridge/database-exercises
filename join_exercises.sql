USE employees;

# shows each department along with the name of the current manager for that department.
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) as 'Department Manager'
FROM employees as e
         JOIN dept_manager as dm on e.emp_no = dm.emp_no
         JOIN departments as d on dm.dept_no = d.dept_no
WHERE dm.to_date > NOW()
ORDER BY dept_name;

# Find the name of all departments currently managed by women.
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) as 'Department Manager'
FROM employees as e
         JOIN dept_manager as dm on e.emp_no = dm.emp_no
         JOIN departments d on dm.dept_no = d.dept_no
WHERE dm.to_date > NOW()
  AND e.gender = 'f'
ORDER BY dept_name;


# Find the current titles of employees currently working in the Customer Service department.
SELECT t.title as 'Employee title', COUNT(e.emp_no) as Total
FROM employees as e
         JOIN titles as t on t.emp_no = e.emp_no
         JOIN dept_emp as de on e.emp_no = de.emp_no
         JOIN departments as d on de.dept_no = d.dept_no
WHERE t.to_date > NOW()
  and de.to_date > NOW()
  and d.dept_name = 'Customer Service'
group by t.title;

SELECT *
FROM departments;

SELECT t.title as 'Employee title', COUNT(t.emp_no) as Total
FROM titles as t
         JOIN dept_emp as de on t.emp_no = de.emp_no
         JOIN departments as d on de.dept_no = d.dept_no
WHERE de.to_date > NOW()
  and t.to_date > NOW()
  and d.dept_no = 'd009'
group by t.title;

# Find the current salary of all current managers.
SELECT d.dept_name                            as 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) as 'Department Manager',
       s.salary                               as Salary
FROM employees as e
         JOIN salaries as s on e.emp_no = s.emp_no
         JOIN dept_manager as dm on s.emp_no = dm.emp_no
         JOIN departments as d on dm.dept_no = d.dept_no
WHERE dm.to_date > NOW()
  AND s.to_date > NOW()
GROUP BY dept_name
ORDER BY dept_name;

# Bonus Find the names of all current employees, their department name, and their current manager's name.
select concat(e1.first_name, ' ', e1.last_name) as Employee,
       concat(d.dept_name)                          as Department,
       concat(e2.first_name, ' ', e2.last_name)                 as Manager
from employees as e1
         join dept_emp as de on de.emp_no = e1.emp_no
         join departments as d on d.dept_no = de.dept_no
         join dept_manager as dm on dm.dept_no = d.dept_no
         join employees as e2 on e2.emp_no = dm.emp_no
where de.to_date > now()
  and dm.to_date > now()
order by d.dept_name;