# Parker Smith
# 4/4/16
# CS1550-003 Henry Books Chapter 5 Multi Table Queries


# 1.
select book_code, title, b.publisher_code, publisher_name

from Book b

	join Publisher p
    
		on b.publisher_code = p.publisher_code
        
order by publisher_name;
     
     
# 2.
select book_code, title, price

from Book b

	join Publisher p
    
		on b.publisher_code = p.publisher_code
        
where p.publisher_name = 'Plume';


# 3.
select book_code, title, price

from Book b

	join Publisher p
    
		on b.publisher_code = p.publisher_code
        
where p.publisher_name = 'Plume'

	and b.price >= 14.00;
    
    
# 4.
select b.book_code, title, on_hand

from Book b

	join Inventory i
    
		on b.book_code = i.book_code
        
where i.branch_num = 4;


# 5.
select title

from Book b

	join Publisher p
    
		on b.publisher_code = p.publisher_code
        
where p.publisher_name = 'Jove Publications'

	and b.book_type = 'PSY';
    
    
# 6.
select title

from Book b

where b.book_code in (select bb.book_code

						from Book bb
                    
							join Wrote w
                        
								on bb.book_code = w.book_code
                            
							join Author a
                        
								on a.author_num = w.author_num
                            
						where a.author_num = 18);
                        
                        
# 7.
select title

from Book b

where exists (select *

				from Book bb
                    
					join Wrote w
                        
						on bb.book_code = w.book_code
                            
					join Author a
                        
						on a.author_num = w.author_num
                            
					where a.author_num = 18
                        
						and bb.book_code = b.book_code);
                        
                        
# 8.
select b.book_code, title

from Book b

	join Inventory i
    
		on b.book_code = i.book_code
        
	join Wrote w
    
		on b.book_code = w.book_code
        
where i.branch_num = 2

	and w.author_num = 20;
    
    
# 9.
select f.book_code, s.book_code

from Book f

	join Book s
    
		on f.price = s.price
        
where f.book_code < s.book_code
        
order by f.book_code, s.book_code;


# 10.
select b.title, a.author_last, i.on_hand

from Book b

	join Wrote w
    
		on b.book_code = w.book_code
        
	join Author a
    
		on a.author_num = w.author_num
        
	join Inventory i
    
		on i.book_code = b.book_code
        
where i.branch_num = 4;


# 11.
select b.title, a.author_last, i.on_hand

from Book b

	join Wrote w
    
		on b.book_code = w.book_code
        
	join Author a
    
		on a.author_num = w.author_num
        
	join Inventory i
    
		on i.book_code = b.book_code
        
where i.branch_num = 4

	and b.paperback = true;
    
    
# 12.
select b.book_code, b.title

from Book b

where b.price > 10.00

union

select b.book_code, b.title

from Book b

	join Publisher p
    
		on b.publisher_code = p.publisher_code
        
where p.city = 'Boston';


# 13.
select b.book_code, b.title

from Book b

	join Publisher p
    
		on b.publisher_code = p.publisher_code
        
where p.city = 'Boston'

	and b.price > 10.00;
    
    
# 14.
select b.book_code, b.title

from Book b

	join Publisher p
    
		on b.publisher_code = p.publisher_code
        
where p.city != 'Boston'

	and b.price > 10.00;
    
    
# 15.
select b.book_code, title

from Book b

where b.price > (select max(price)

				from Book
                
				where book_type = 'HOR');
                
                
# 16.
select b.book_code, title

from Book b

where b.price > (select min(price)

				from Book
                
				where book_type = 'HOR');
                
                
# 17.
select b.book_code, title, on_hand

from Book b

	left join Inventory i
    
		on b.book_code = i.book_code
        
			and i.branch_num = 2
            
order by b.book_code;