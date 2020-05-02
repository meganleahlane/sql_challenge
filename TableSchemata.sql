DROP TABLE if exists dept_manager;
DROP TABLE if exists departments;
DROP TABLE if exists titles;
DROP TABLE if exists salaries;
DROP TABLE if exists dept_emp;
DROP TABLE if exists employees;


CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);


CREATE TABLE departments (
	dept_no VARCHAR(50) NOT NULL,
	dept_name VARCHAR(55),
	PRIMARY KEY (dept_no)
);


CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	PRIMARY KEY (emp_no, dept_no, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_manager (
	dept_no VARCHAR(50) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (dept_no, emp_no, from_date),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(55) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, from_date),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM employees;
SELECT * FROM departments; 
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM titles; 
SELECT * FROM salaries; 