--1. List the employee number, last name, first name, sex, and salary of each employee (2 points)
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from   Employees e  
	join Salaries s 
		on e.emp_no= s.emp_no;
		
--2. List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
select first_name,last_name,hire_date
from   Employees 
where extract('year' from hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
select d.*,dm.emp_no ,e.last_name, e.first_name
from  Departments d
join  Dept_manager dm on d.dept_no= dm.dept_no
join  employees e on e.emp_no= dm.emp_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
select distinct e.emp_no ,e.last_name, e.first_name,d.dept_name
from   employees e 
join  Dept_emp de on e.emp_no= de.emp_no
join Departments d on de.dept_no= d.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
select first_name,last_name,sex
from   Employees
where first_name = 'Hercules' and last_name like 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name (2 points)
select distinct e.emp_no ,e.last_name, e.first_name,d.dept_name
from   employees e 
join  Dept_emp de on e.emp_no= de.emp_no
join Departments d on de.dept_no= d.dept_no
where dept_name ='Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
select distinct e.emp_no ,e.last_name, e.first_name,d.dept_name
from   employees e 
join  Dept_emp de on e.emp_no= de.emp_no
join Departments d on de.dept_no= d.dept_no
where dept_name in ('Sales','Development');

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
select count (distinct emp_no) as frequency_counts ,last_name
from   employees 
group by last_name
order by frequency_counts desc;