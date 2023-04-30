-- Changing Date Style Frmat to import data
-- ALTER DATABASE "sql_Challenge_v3" SET datestyle = "ISO, MDY";


--Checks to ensure data set were imported successfully (Ran one by one)
	Select * from departments;
	Select * from dept_emp;
	Select * from dept_manager;
	Select * from employees;
	Select * from salaries;
	Select * from titles;


--Task 1: List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--Task2: List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-1-1' and '1986-12-31'
	ORDER BY last_name ASC;
-- 	Could order by hire date by: Changing Line 24 with the line below
-- 		ORDER BY hire_date ASC;
		
		
--Task3: List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dm.dept_no, d.dept_name, dm.emp_no, dm.emp_no,  e.first_name, e.last_name
FROM dept_manager dm
JOIN employees e
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
ORDER BY d.dept_name ASC;


--Task 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
	--Also included department name
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
ORDER BY d.dept_no ASC;


--Task 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--Task 6: List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY d.dept_name ASC;

--Task 7:  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no ASC;


--Task 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, count(emp_no) as num_employees_with_same_last_name
FROM employees
GROUP BY last_name
ORDER BY num_employees_with_same_last_name DESC;

--Checking to see if we can also group by first name -->Task 9: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT first_name, count(emp_no) as num_employees_with_same_first_name
FROM employees
GROUP BY first_name
ORDER BY num_employees_with_same_first_name DESC;

