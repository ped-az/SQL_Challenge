# SQL_Challenge
SQL Analysis on Pewlett Hackard Employees (Fictional Company)


# Background
As a new hire at Pewlett Hackard, my first task was to conduct a research project on all the employees who were active throughout the 1980's and the 1990's. By running a series of SQL Postgres queries, I was able to develop key insights from 6 different data sources (csv.files in data folder). 

# Tools
By utalising QuickDBD, a chema was created linking the six csv files across a series of frimary and foreign keys. This was the basis of the analysis. 
    Refer to the Visual Schema (Png) file for a visual representaiton of how the data was integrated. 

# Importing Data: 
Once the Schema and tables were created for the Database, the six csv's were manually imported utalising the import command. 
    Note: The date had to be reformated across the database by utalising the following command: 

        ALTER DATABASE "sql_Challenge_v3" SET datestyle = "ISO, MDY";
    
    Once Inputed, a manual check was performed across all 6 files by displaying the results on PGAdmin

        Select * from departments;
	    Select * from dept_emp;
	    Select * from dept_manager;
	    Select * from employees;
	    Select * from salaries;
	    Select * from titles;

# Analysis  - A total of 8 queries were performed throgh Postgres (SQL). 

Task 1: List the employee number, last name, first name, sex, and salary of each employee.

    
    SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
    FROM employees e
    JOIN salaries s
    ON e.emp_no = s.emp_no;


task 2: List the first name, last name, and hire date for the employees who were hired in 1986.
   
    SELECT first_name, last_name, hire_date 
    FROM employees
    WHERE hire_date BETWEEN '1986-1-1' and '1986-12-31'
        ORDER BY last_name ASC;
    -- 	Could order by hire date by: Changing Line 24 with the line below
    -- 		ORDER BY hire_date ASC;


Task 3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
   
    SELECT dm.dept_no, d.dept_name, dm.emp_no, dm.emp_no,  e.first_name, e.last_name
    FROM dept_manager dm
    JOIN employees e
    ON dm.emp_no = e.emp_no
    JOIN departments d
    ON dm.dept_no = d.dept_no
    ORDER BY d.dept_name ASC;


Task 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
    
    SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    JOIN departments d
    ON d.dept_no = de.dept_no
    ORDER BY d.dept_no ASC;


Task 5: List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
    
    SELECT first_name, last_name, sex
    FROM employees 
    WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
    ORDER BY last_name ASC;


TAsk 6: List each employee in the Sales department, including their employee number, last name, and first name.
    
    SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    JOIN departments d
    ON d.dept_no = de.dept_no
    WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
    ORDER BY d.dept_name ASC;




Task 7: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
    
    SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
    FROM employees e
    JOIN dept_emp de 
    ON e.emp_no = de.emp_no
    JOIN departments d
    ON d.dept_no = de.dept_no
    WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
    ORDER BY e.emp_no ASC; 

Task 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
    
    SELECT last_name, count(emp_no) as num_employees_with_same_last_name
    FROM employees
    GROUP BY last_name
    ORDER BY num_employees_with_same_last_name DESC;

# Results: 
Refer to Results Tab labeled per Task 

# Bonus
Engine was created to access Postgress DataFrame through VS.