# Parker Smith
# CS1550-003
# 4/13/16
# Performance Lab

# 1
create or replace view SalaryHistory as (
select concat(e.first_name, ' ', e.last_name) as FullName, concat('$', format(s.Salary, 0)) as Salary, s.from_date as SalaryStartDate

from employees e

	join salaries s
    
		on e.emp_no = s.emp_no
);

# 2
create or replace view DepartmentsCount as (
select concat(man.first_name, ' ', man.last_name) as Manager, d.dept_name as Department, count(de.dept_no) as NumberEmployees

from departments d

	join dept_manager dm
    
		on d.dept_no = dm.dept_no
        
			and curdate() between dm.from_date and dm.to_date
            
	join employees man
    
		on man.emp_no = dm.emp_no
        
	join dept_emp de
    
		on de.dept_no = d.dept_no
        
			and curdate() between de.from_date and dm.to_date
        
group by de.dept_no
);

# 3
create or replace view EmployeeInformation as(
select concat(e.first_name, ' ', e.last_name) as FullName, t.title as Title, d.dept_name as Department, concat('$', format(s.Salary, 0)) as Salary

from employees e

	join dept_emp de
    
		on e.emp_no = de.emp_no
        
			and curdate() between de.from_date and de.to_date
            
	join departments d
    
		on d.dept_no = de.dept_no
        
	join salaries s
    
		on s.emp_no = e.emp_no
        
			and curdate() between s.from_date and s.to_date
            
	join titles t
    
		on t.emp_no = e.emp_no
        
			and curdate() between t.from_date and t.to_date
);

# 4
create index last_name_index

on employees (last_name);


# 5
create index salaries_date

on salaries (from_date, to_date);

create index dept_emp_date

on dept_emp (from_date, to_date);

create index dept_manager_date

on dept_manager (from_date, to_date);

create index title_date

on titles (from_date, to_date);

