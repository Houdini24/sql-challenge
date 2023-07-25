------------------- DATA ANALYSIS ----------------------

--List the employee number, last name, first name, sex, and salary of each employee
CREATE VIEW empl_salary AS 
SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT * from empl_salary


--List the first name, last name, and hire date for the employees who were hired in 1986 
CREATE VIEW empl_hire_date AS 
SELECT 
	employees.first_name,
	employees.last_name, 
	employees.hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986

SELECT * from empl_hire_date


--List the manager of each department along with their department number, department name, employee number, last name, and first name
CREATE VIEW manager_info AS 
SELECT 
	dept_manager.emp_no,
	dept_manager.dept_no,  
	departments.dept_name, 
	employees.last_name, 
	employees.first_name
FROM dept_manager
INNER JOIN departments ON 
dept_manager.dept_no = departments.dept_no 
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no

SELECT * from manager_info

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
CREATE VIEW empl_dept AS 
SELECT 
	dept_emp.dept_no,
	dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no

SELECT * from empl_dept

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
CREATE VIEW Hercules AS
SELECT 
	employees.first_name, 
	employees.last_name, 
	employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND
employees.last_name LIKE 'B%'

SELECT * from Hercules


--List each employee in the Sales department, including their employee number, last name, and first name
CREATE VIEW sales_empl AS 
SELECT 
	departments.dept_name, 
	dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'

SELECT * from sales_empl

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
CREATE VIEW sales_dev AS 
SELECT 
	departments.dept_name, 
	dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR
departments.dept_name = 'Development'

SELECT * from sales_dev

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
CREATE VIEW freq_count AS
SELECT 
	last_name AS "Employee Last Name",
	COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY (last_name)
ORDER BY "Count of Last Name" DESC;

SELECT * from freq_count