-- Data Engineering
-- Create the tables by specifying the data types and primary keys, and then import the csv's
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
   	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
   	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

-- Add the foreign keys to the tables that need them
ALTER TABLE dept_emp ADD 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD 
FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD 
FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE salaries ADD 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE titles ADD 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

-- Display all the tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;