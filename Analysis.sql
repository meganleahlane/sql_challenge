-- DATA ANALYSIS --

--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

SELECT * from employees;
SELECT * from salaries;

SELECT e.emp_no, 
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;

-- List employees who were hired in 1986.

SELECT * 
FROM employees
WHERE 
	hire_date >= '1986-01-01'
	AND hire_date <= '1986-12-31';

--List the manager of each department with the following 
--information: department number, department name, 
--the manager's employee number, last name, 
--first name, and start and end employment dates.

SELECT * FROM departments
SELECT * FROM dept_manager
SELECT * FROM employees

SELECT dm.dept_no
, d.dept_name
, dm.emp_no
, e.last_name
, e.first_name
, dm.from_date
, dm.to_date
FROM dept_manager AS dm	
	LEFT JOIN departments AS d ON dm.dept_no = d.dept_no
	INNER JOIN employees AS e ON dm.emp_no = e.emp_no;

--4. List the department of each employee with the following 
--information: employee number, last name, first name, and 
--department name.

SELECT * FROM dept_emp;

SELECT e.emp_no
, e.last_name
, e.first_name
, d.dept_name
FROM employees AS e
	LEFT JOIN dept_emp AS de on e.emp_no = de.emp_no
	LEFT JOIN departments AS d ON de.dept_no = d.dept_no;
	
--5. List all employees whose first name is "Hercules" and 
--last names begin with "B."

SELECT *
FROM employees 
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

	
--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT * FROM dept_emp;

CREATE VIEW sales_emp_inner AS
SELECT de.emp_no
, e.last_name
, e.first_name
, d.dept_name
FROM dept_emp de
	INNER JOIN employees e ON e.emp_no = de.emp_no
	INNER JOIN departments d ON de.dept_no = d.dept_no
	WHERE de.dept_no = 'd007'
;

--SELECT COUNT(emp_no) FROM sales_emp_inner;

--7. List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.

SELECT de.emp_no
, e.last_name
, e.first_name
, d.dept_name
FROM dept_emp de
	INNER JOIN employees e ON e.emp_no = de.emp_no
	INNER JOIN departments d ON de.dept_no = d.dept_no
	WHERE de.dept_no = 'd007'
	OR de.dept_no = 'd005'
;

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) as "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;


