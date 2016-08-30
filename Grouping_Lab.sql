select title as Title, concat('$', format(max(salary), 0)) as MaxSalary, concat('$', format(avg(salary), 0)) as AvgSalary

from titles

	join salaries
    
		on titles.emp_no = salaries.emp_no
        
group by title;




select dept_name as DepartmentName, count(distinct emp_no) as NumberOfEmployees

from departments as d

	join dept_emp as de
    
		on d.dept_no = de.dept_no
        
where curdate() between de.from_date and de.to_date

group by d.dept_name;





select dept_name as DepartmentName, (concat(first_name, ' ', last_name)) as ManagerFullName,

		concat('$', format(max(s.salary), 0)) as HighestPaidEmployeeSalary

from departments as d

	join dept_manager as dm
    
		on dm.dept_no = d.dept_no
        
	join employees as e
    
		on e.emp_no = dm.emp_no
        
	join dept_emp as de
    
		on de.dept_no = d.dept_no
        
	join salaries as s
    
		on s.emp_no = de.emp_no
        
where curdate() between dm.from_date and dm.to_date

	and curdate() between s.from_date and s.to_date

group by dept_name;




select dept_name as DepartmentName, concat(first_name, ' ', last_name) as EmployeeName, concat('$', format(avg(s.salary), 0)) as AverageSalary

from departments as d

	join dept_emp as de
    
		on de.dept_no = d.dept_no
        
	join employees e
    
		on e.emp_no = de.emp_no
        
	join salaries s
    
		on s.emp_no = e.emp_no
        
group by first_name, last_name, d.dept_no;