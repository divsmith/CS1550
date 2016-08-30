select first_name, last_name, title, salary

from employees e

	join titles t
    
		on e.emp_no = t.emp_no
    
    join salaries s
    
		on s.emp_no = e.emp_no
    
where t.to_date = '9999-01-01'

	and s.to_date = '9999-01-01';