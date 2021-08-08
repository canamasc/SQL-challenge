-- Salary table
--DROP TABLE IF EXISTS salaries; 
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT
); 

-- employee table
--DROP TABLE IF EXISTS employees; 
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR(20),
	last_name VARCHAR,
	sex VARCHAR(2),
	hire_date VARCHAR
); 

-- Departments table
--DROP TABLE IF EXISTS departments; 
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR
); 

-- Department employees
--DROP TABLE IF EXISTS dept_emp; 
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
); 

-- Department managers
--DROP TABLE IF EXISTS dept_manager; 
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
); 

-- titles table
--DROP TABLE IF EXISTS titles; 
CREATE TABLE titles (
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title VARCHAR
); 

