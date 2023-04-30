-- Creating "Titles" Table --> Referecne from titles.csv
CREATE TABLE titles (
	title_id char(5) PRIMARY KEY,
	title varchar(30)
);

-- Creating "Employees" Table --> Referecne from employees.csv
CREATE TABLE employees (
	emp_no varchar(10) PRIMARY KEY,
	emp_title_id char(5) references titles(title_id),
	birth_date date,
	first_name varchar(50),
	last_name varchar(50),
	sex varchar(1),
	hire_date date
);

-- Creating "Departments" Table --> Referecne from departments.csv
CREATE TABLE departments (
	dept_no char(5) PRIMARY KEY,
	dept_name varchar(30)
);

-- Creating "Department Manager's" Table --> Referecne from dept_manager.csv
CREATE TABLE dept_manager (
	dept_no char(5) references departments(dept_no),
	emp_no varchar(10)
);

-- Creating "Department Employee" Tables --> Referecne from dept_emp.csv
CREATE TABLE dept_emp (
	emp_no varchar(10) references employees(emp_no),
	dept_no char(5) references departments(dept_no)
);

-- Creating "Salary" Table --> Referecne from salaries.csv
CREATE TABLE salaries (
	emp_no varchar(10) references employees(emp_no),
	salary int
);