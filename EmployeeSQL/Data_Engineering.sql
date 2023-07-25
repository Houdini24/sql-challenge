--DROP TABLE titles;
--Create Table for titles.csv
CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR,
    PRIMARY KEY (title_id)
);
SELECT * FROM titles

--DROP TABLE departments;
--Create Table for departments.csv
CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR,
    PRIMARY KEY (dept_no)
);
SELECT * FROM departments


--DROP TABLE employees;
-- Create Table for employees.csv
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
	sex VARCHAR(1),
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
SELECT * FROM employees


--DROP TABLE dept_emp;
--Create Table for dept_emp.csv
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
SELECT * FROM dept_emp

--DROP TABLE dept_manager;
--Create Table for dept_manager.csv
CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM dept_manager

--DROP TABLE salaries;
--Create Table for salaries.csv
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM salaries