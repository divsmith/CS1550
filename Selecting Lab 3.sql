select dept_name, first_name, last_name

from departments d

	join dept_manager dm
    
		on dm.dept_no = d.dept_no
        
	join employees e
    
		on e.emp_no = dm.emp_no
        
where dm.to_date = '9999-01-01';