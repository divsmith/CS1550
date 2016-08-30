# Parker Smith
# 3/21/16
# CS1550-003
# Chapter 4 Henry Books Single Table Queries



# 1.
select book_code, title

from Book;


# 2.
select * from Publisher;	


# 3.
select publisher_name

from Publisher

where city = 'Boston';


# 4.
select publisher_name

from Publisher

where city != 'Boston';


# 5.
select branch_name

from Branch

where num_employees >= 9;


# 6.
select book_code, title

from Book

where book_type = 'SFI';


# 7.
select book_code, title

from Book

where book_type = 'SFI'

	and paperback = true;


# 8.
select book_code, title

from Book

where book_type = 'SFI'

	or publisher_code = 'SC';
    

# 9.
select book_code, title, price

from Book

where price between 20 and 30;


# 10.
select book_code, title

from Book

where book_type = 'MYS'

	and price < 20;
    
    
    
# 11.
select book_code, title, concat('$', format((price * 0.90), 2)) as Discounted_Price

from Book;


# 12.
select publisher_name 

from Publisher

where publisher_name like '% and %';



# 13.
select book_code, title

from Book

where book_type in ('SFI', 'MYS', 'ART');



# 14.
select book_code, title

from Book

where book_type in ('SFI', 'MYS', 'ART')

order by title;


# 15.
select book_code, title, price

from Book

where book_type in ('SFI', 'MYS', 'ART')

order by price desc, title;



# 16.
select distinct book_type

from Book;



# 17.
select count(*)

from Book

where book_type = 'SFI';



# 18.
select book_type, format(avg(price), 2)as avg_price

from Book

group by book_type;



# 19.
select book_type, format(avg(price), 2) as avg_price

from Book

where paperback = true

group by book_type;


# 20.
select book_type, format(avg(price), 2) as avg_price

from Book

where paperback = true

group by book_type

having avg_price > 10;


# 21.
select book_code, title

from Book

where price = (select max(price) from Book);


# 22.
select title, price

from Book

where price = (select min(price) from Book);


# 23.
select (sum(num_employees)) as Total_Employees

from Branch;