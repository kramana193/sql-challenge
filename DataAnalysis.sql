-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from salaries
Inner Join employees
on employees.emp_no = salaries.emp_no
Order by salary desc


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

Select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

Select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from departments
join dept_manager
on dept_manager.dept_no = departments.dept_no
Inner join employees 
on dept_manager.emp_no = employees.emp_no 

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
Join dept_emp
on departments.dept_no = dept_emp.dept_no
Join employees 
on employees.emp_no = dept_emp.emp_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".

Select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name Like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

drop view if exists q6

CREATE VIEW q6 AS 
Select emp_no, dept_no
from dept_emp
where dept_no in (select dept_no 
				  from departments 
				  where dept_name = 'Sales')

Select * from q6


Select q6.emp_no, employees.last_name, employees.first_name, departments.dept_name
from q6
Join employees 
on q6.emp_no = employees.emp_no
Join departments
on q6.dept_no = departments.dept_no

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

drop view if exists q7

CREATE VIEW q7 AS 
Select emp_no, dept_no
from dept_emp
where dept_no in (select dept_no 
				  from departments 
				  where dept_name in ('Sales', 'Development'))

Select * from q7


Select q7.emp_no, employees.last_name, employees.first_name, departments.dept_name
from q7
Join employees 
on q7.emp_no = employees.emp_no
Join departments
on q7.dept_no = departments.dept_no

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

Select last_name, count(last_name)
from employees
Group by last_name
order by count(last_name) desc












