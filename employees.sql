-- Salary table
DROP TABLE salaries; 
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT
); 

-- employee table
--DROP TABLE employees; 
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
--DROP TABLE departments; 
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR
); 

-- Department employees
DROP TABLE dept_emp; 
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
); 

-- Department managers
DROP TABLE dept_manager; 
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
); 

-- titles table
--DROP TABLE titles; 
CREATE TABLE titles (
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title VARCHAR
); 

-- Question 1, get each employee's emp_no, last and first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

-- Question 2, get first name, last name, hire date for employees hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';


-- Question 3, get manager of each dept with dept_no, dept_name, 
-- manager's no., last name and first name
-- Nested statement joins gets managers and departments, outer statement
-- gets name info for the manager (i.e employee)
SELECT k.dept_no, k.dept_name, e.emp_no, e.last_name, e.first_name 
FROM (SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager m
LEFT JOIN departments d
ON m.dept_no = d.dept_no) k
LEFT JOIN employees e
ON e.emp_no = k.emp_no;

-- Question 4, list department of each employee with:
-- emp_no, last name, first name, and dept_name
-- first merge dept_emp with departments
-- then add dept. names to employees table

SELECT e.emp_no, e.last_name, e.first_name, k.dept_name FROM
employees e LEFT JOIN (SELECT p.emp_no, p.dept_no, d.dept_name
FROM dept_emp p LEFT JOIN departments d
ON p.dept_no = d.dept_no) k 
ON e.emp_no = k.emp_no;

-- Question 5, list first/last name, sex for employees w first name = Hercules
-- AND last name starts with B

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Question 6, list employees in Sales dept, with emp_no, full name, and dept. name
-- Recycle query from Q4 and just filter for department
SELECT e.emp_no, e.last_name, e.first_name, k.dept_name FROM
employees e LEFT JOIN (SELECT p.emp_no, p.dept_no, d.dept_name
FROM dept_emp p LEFT JOIN departments d
ON p.dept_no = d.dept_no) k 
ON e.emp_no = k.emp_no
WHERE k.dept_name = 'Sales';

-- Question 7, list all employees in Sales and Development, with emp_no, full name, dept name
SELECT e.emp_no, e.last_name, e.first_name, k.dept_name FROM
employees e LEFT JOIN (SELECT p.emp_no, p.dept_no, d.dept_name
FROM dept_emp p LEFT JOIN departments d
ON p.dept_no = d.dept_no) k 
ON e.emp_no = k.emp_no
WHERE k.dept_name = 'Sales' OR k.dept_name = 'Development';

-- Question 7 assuming  single employee has to be in both departments
SELECT o.emp_no, o.dept_no, d.dept_name FROM
(SELECT * FROM dept_emp 
WHERE emp_no IN (
	SELECT emp_no FROM dept_emp
	GROUP BY emp_no HAVING count(*) > 1)) o
LEFt JOIN departments d ON d.dept_no = o.dept_no
ORDER BY emp_no;


-- Question 8, list freq. count of employee last names
SELECT last_name, count(last_name) as last_name_count 
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;