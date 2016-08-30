# Parker Smith
# 3/28/16
# CS1550-003
# Premier Products Multi-Table Queries

# 1.
select Order_Num, Order_Date, o.Customer_Num, Customer_Name

from Orders o

	join Customer c
    
		on o.Customer_Num = c.Customer_Num;
    
    
# 2.
select Order_Num, Customer_Name

from Orders o

	join Customer c
    
		on o.Customer_Num = c.Customer_num
    
where Order_Date = '2007-10-21';


# 3.
select o.Order_Num, Order_Date, p.Part_Num, Num_Ordered, Quoted_Price

from Orders o

	join Order_Line ol
    
		on o.Order_Num = ol.Order_num
    
    join Part p
    
		on ol.Part_Num = p.Part_Num;
        
        
        
# 4.
select c.Customer_Num, Customer_Name

from Customer c

	join Orders o

			on c.Customer_Num = o.Customer_Num
            
where Order_Num in (select Order_Num

					from Orders
                    
                    where Order_Date = '2007-10-21');
                    
                    
# 5.
select Customer_Num, Customer_Name

from Customer c
            
where exists (select *

				from Orders o
                
                where o.Customer_Num = c.Customer_Num
                
					and Order_Date = '2007-10-21');
                    
                    
# 6.
select Customer_Num, Customer_Name

from Customer c
            
where not exists (select *

				from Orders o
                
                where o.Customer_Num = c.Customer_Num
                
					and Order_Date = '2007-10-21');
                    
                    
# 7.
select o.Order_Num, Order_Date, p.Part_Num, p.Class

from Orders o

	join Order_Line ol
    
		on o.Order_Num = ol.Order_Num
        
	join Part p
    
		on ol.Part_Num = p.Part_Num;


# 8.
select o.Order_Num, Order_Date, p.Part_Num, p.Class

from Orders o

	join Order_Line ol
    
		on o.Order_Num = ol.Order_Num
        
	join Part p
    
		on ol.Part_Num = p.Part_Num
        
order by p.Class, o.Order_Num;


# 9.
select distinct r.Rep_Num, r.Last_Name, r.First_Name

from Rep r
        
where exists (select * 

				from Customer c
                
                where c.Rep_Num = r.Rep_Num
                
					and Credit_Limit = 5000.00);


# 10.
select distinct r.Rep_Num, r.Last_Name, r.First_Name

from Rep r

	join Customer c
    
		on r.Rep_Num = c.Rep_Num
        
where c.Credit_Limit = 5000.00;


# 11.
select c.Customer_Num, c.Customer_Name

from Customer c

	join Orders o
    
		on c.Customer_Num = o.Customer_Num
        
	join Order_Line ol
    
		on o.Order_Num = ol.Order_Num
        
	join Part p
    
		on p.Part_Num = ol.Part_Num
        
where p.Description = 'Gas Range';


# 12.
select f.Part_Num, f.Description, f.Class, s.Part_Num, s.Description, s.Class

from Part f, Part s

where f.Class = s.Class

	and f.Part_Num < s.Part_Num;
    
    
# 13.
select Order_Num, Order_Date

from Orders o

	join Customer c
    
		on o.Customer_Num = c.Customer_Num
        
where c.Customer_Name = "Johnson's Department Store";


# 14.
select o.Order_Num, o.Order_Date

from Orders o

	join Order_Line ol
    
		on o.Order_Num = ol.Order_Num
        
	join Part p
    
		on ol.Part_Num = p.Part_Num
        
where p.Description = 'Iron';


# 15.
select Order_Num, Order_Date

from Orders o, Customer c

where o.Customer_Num = c.Customer_Num

	and c.Customer_Name = "Johnson's Department Store"
    
union

select o.Order_Num, Order_Date

from Orders o, Order_Line ol, Part p

where ol.Order_Num = o.Order_Num

	and ol.Part_Num = p.Part_Num
    
    and p.Description = 'Gas Range';
    
    
# 16.
select o.Order_Num, Order_Date

from Orders o

	join Customer c
    
		on c.Customer_Num = o.Customer_Num

	join Order_Line ol
    
		on ol.Order_Num = o.Order_Num
        
	join Part p
    
		on p.Part_Num = ol.Part_Num
        
where c.Customer_Name = "Johnson's Department Store"

	and p.Description = 'Gas Range';
    
    
# 17.
select distinct o.Order_Num, Order_Date

from Orders o

	join Customer c
    
		on c.Customer_Num = o.Customer_Num

	join Order_Line ol
    
		on ol.Order_Num = o.Order_Num
        
	join Part p
    
		on p.Part_Num = ol.Part_Num
        
where c.Customer_Name = "Johnson's Department Store"

	and p.Description != 'Gas Range';


# 18.
select Part_Num, Description, Price, On_Hand, Class

from Part

where Price > all (select Price

					from Part
                    
                    where Class = 'AP');
                    
                    
# 19.
select Part_Num, Description, Price, On_Hand, Class

from Part

where Price > any (select Price

					from Part
                    
                    where Class = 'AP');
                    
                    # The 'any' operator matches any item that has a price
                    # greater than any of the AP class items.
                    

# 20.
select p.Part_Num, p.Description, p.On_Hand, o.Order_Num, Num_Ordered
                                                                
from Part p

	left join Order_Line ol
    
		on ol.Part_Num = p.Part_Num
        
	left join Orders o
    
		on o.Order_Num = ol.Order_Num;