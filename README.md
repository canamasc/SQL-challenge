# SQL-challenge
Data Engineering &amp; Analysis Project

Creates employee database with 6 tables for employees, salaries, titles, departments, managers, etc. (Entities and attributes clearly depicted in DBD-export image, along with their relationship rules).

Queries SQL file showcases how to filter tables by both rows and columns, using GROUP BYs with aggregate functions, string operators, subqueries, JOINS, and views. 

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

DataBaseAnalysis Jupyter NB file imports the database using sqlalchemy library, and uses queries to create dataframes and uses PANDAS library (groupby, plots) to further analyze data and create visualizations (histogram of most common salary ranges, average salary by employee title). 
