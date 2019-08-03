-- Data Analysis
-- List the employee numbers, last names, first names, gender, and salaries
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no;
	
-- List the employees who were hired in 1986
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- List the manager of each department with the dept_no, dept_name, emp_no, first_name, last_name, from_date, and to_date
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name,
	   dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no
JOIN employees
	ON dept_manager.emp_no = employees.emp_no;
	
-- List the department of each employee with the emp_no, last_name, first_name, dept_name
SELECT dept_manager.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no
JOIN employees
	ON dept_manager.emp_no = employees.emp_no;
	
-- List all employees with the first name "Hercules" and last name starting with "B"
SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department with their emp_no, last_name, first_name, and dept_name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp
	ON departments.dept_no = dept_emp.dept_no
JOIN employees
	ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments with their emp_no, last_name, first_name, and dept_name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp
	ON departments.dept_no = dept_emp.dept_no
JOIN employees
	ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the freguency count of employee last names in descending order
SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;