select first_name, last_name, dept_no

from employees e

	join dept_emp de
    
    on e.emp_no = de.emp_no;
