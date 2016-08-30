# Parker Smith
# CS1550-003
# Subquery Lab


# 1.
select distinct e.emp_no, birth_date, first_name, last_name, gender, hire_date

from employees e

	join dept_emp de
		
        on e.emp_no = de.emp_no

where (select count(*)

		from dept_emp de2
        
        where e.emp_no = de2.emp_no
        
        group by de2.emp_no) = 2;
        
        
# 2.
select e.first_name, e.last_name

from employees e

	join dept_emp de
    
		on e.emp_no = de.emp_no
        
	join dept_manager dm
    
		on de.dept_no = dm.dept_no
        
	join employees dmanager
    
		on dmanager.emp_no = dm.emp_no
        
where de.dept_no = (select dept_no

					from dept_manager dm
                    
						join employees e
                        
							on dm.emp_no = e.emp_no
                            
					where e.first_name = 'Leon'
                    
						and e.last_name = 'DasSarma'
                        
                        and curdate() between dm.from_date and dm.to_date
                    );
                    
                    
                    
# 3.
select first_name, last_name, d.dept_name as First_Department_Name

from employees ee

	join dept_emp de
    
		on ee.emp_no = de.emp_no
        
	join departments d
    
		on d.dept_no = de.dept_no
        
where d.dept_no = (select d.dept_no

					from employees e

					join dept_emp de
		
						on e.emp_no = de.emp_no
        
					join departments d
    
						on d.dept_no = de.dept_no
        
					where from_date = (select min(from_date)

										from dept_emp de
                    
										where de.emp_no = e.emp_no)
                    
							and e.emp_no = ee.emp_no
                    
					group by e.emp_no)
                                        
group by first_name, last_name;


# 4.
select d.dept_name as Department_Name, concat('$', format(Average_Salary, 2)) as Average_Salary

from departments d

	join (select avg(salary)as Average_Salary, dept_no
    
			from salaries s
            
				join dept_emp de
                
					on s.emp_no = de.emp_no
                    
			group by de.dept_no) as s
            
	on s.dept_no = d.dept_no;
    
    
# 5.
select dept_name

from (select distinct dept_no

		from dept_emp de
        
			join employees e
            
				on e.emp_no = de.emp_no
                
		where e.first_name = 'Rosita'
        
			and e.last_name = 'Merle') as dn
            
	join departments d
    
		on d.dept_no = dn.dept_no;
            
            
# 6.
select distinct first_name as First_Name, 

		last_name as Last_Name, 
        
        (select max(de.from_date)

		from dept_emp as de

		where de.emp_no = e.emp_no) as Current_Department_Start,
        
        (select max(de.from_date)

		from dept_emp as de

		where de.to_date < (select max(to_date)
        
							from dept_emp dd
                            
                            where dd.emp_no = de.emp_no)
                                                                    
			and de.emp_no = e.emp_no) as Previous_Department_Start,
            
		(datediff((select Current_Department_Start), (select Previous_Department_Start))) as Days_In_Previous_Department

from employees e

	join dept_emp de
    
		on e.emp_no = de.emp_no
        
	join departments d
    
		on d.dept_no = de.dept_no;
	
            
	