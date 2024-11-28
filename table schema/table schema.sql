--Drp tables if already exist in the Database.
drop table if exists Dept_manager;
drop table if exists  Dept_emp;
drop table if exists   Salaries;
drop table if exists  Departments;
drop table if exists  Employees;
drop table if exists titles;

--Create Departments table. 

CREATE TABLE IF NOT EXISTS Departments
(
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_no)
);

--Create Titles table. 
drop table if exists titles;
CREATE TABLE titles (
    title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    PRIMARY KEY (title_id)
);


--Create Employees table. 
drop table if exists  Employees;
CREATE TABLE IF NOT EXISTS Employees
(
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date date NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)

);
--Create Dept_manager table. 
drop table if exists Dept_manager;
CREATE TABLE IF NOT EXISTS Dept_manager
(
    dept_no VARCHAR(10) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
--Create Dept_emp table. 
drop table if exists Dept_emp;
CREATE TABLE IF NOT EXISTS Dept_emp
(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

--Create Salaries table. 
drop table if exists  Salaries;
CREATE TABLE IF NOT EXISTS Salaries
(
    emp_no INTEGER NOT NULL,
    salary NUMERIC NOT NULL,
    PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)

);







