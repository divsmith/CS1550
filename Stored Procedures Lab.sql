# Parker Smith
# 4-9-16
# Stored Procedures Lab

# 1
drop procedure if exists getEmployeeData;

delimiter //
create procedure `getEmployeeData` (first_name varchar(100), last_name varchar(100))
begin
	select distinct *

	from employees e

	join dept_emp de
    
		on e.emp_no = de.emp_no
        
	join departments d
    
		on de.dept_no = d.dept_no
        
	join salaries s
    
		on s.emp_no = e.emp_no
        
	where e.first_name = first_name

		and e.last_name = last_name;
end //


# 2
drop procedure if exists getEmployeesForManager;

delimiter //
create procedure `getEmployeesForManager` (first_name varchar(100), last_name varchar(100))
begin
	select e.first_name, e.last_name

	from employees e

	join dept_emp de
    
		on e.emp_no = de.emp_no
        
	join dept_manager dm
    
		on de.dept_no = dm.dept_no
        
			and curdate() between dm.from_date and dm.to_date
        
	join employees manager
    
		on manager.emp_no = dm.emp_no
        
	where manager.first_name = first_name

		and manager.last_name = last_name;
end //


# 3
delimiter //
create procedure `updateEmployeeInfo` (emp_no int, first_name varchar(100), last_name varchar(100), birth_date date, gender enum('M', 'F'))
begin
	update employees e
	
	set e.first_name = first_name,
		e.last_name = last_name,
		e.birth_date = birth_date,
		e.gender = gender
		
	where e.emp_no = emp_no;
    
end //

# 4
delimiter //
create procedure `addDepartment` (dept_name varchar(100))
begin
	insert into departments values((select concat('d0', cast((cast(substring(max(m.dept_no), 2, 3) as unsigned) + 1)as char(4))) from departments m), dept_name);
end //


# 5
delimiter //
create procedure `moveDepartment` (emp_no int, new_dept_name varchar(100))
begin
	update dept_emp demp

	set demp.to_date = curdate()

	where demp.emp_no = emp_no

		and demp.to_date = (select max(de.to_date)
    
						from (select to_date, emp_no from dept_emp) de
                        
                        where de.emp_no = emp_no)
                        
		and demp.to_date not between demp.from_date and curdate();
                        
	insert into dept_emp values(10029, (select d.dept_no

									from departments d
                                    
                                    where d.dept_name = new_dept_name), curdate(), '9999-01-01');
end //
