/* 
	Parker Smith 3/7/16
	CSIS 1550-003
    Single-Table Queries Premier
*/


/* 1. */
select Part_Num, Description, Price

from Part;



/* 2. */
select * from Orders;



/* 3. */
select Customer_Name

from Customer

where Credit_Limit <= 7500.00;



/* 4. */
select Order_Num

from Orders

where Customer_Num = 148

	and Order_Date = '2007-10-20';
 
 

/* 5. */
select Customer_Num, Customer_Name

from Customer

where Rep_Num = 35
	
    or Rep_Num = 65;
    


/* 6. */
select Part_Num, Description

from Part

where Class != 'SG';



/* 7. */
select Part_Num, Description, On_Hand

from Part

where On_Hand >= 10

	and On_Hand <= 25;
    
    
select Part_Num, Description, On_Hand

from Part

where On_Hand between 10 and 25;



/* 8. */
select Part_Num, Description, On_Hand, (On_Hand * Price) as On_Hand_Value

from Part;



/* 9. */
select Part_Num, Description, (On_Hand * Price) as On_Hand_Value

from Part

having On_Hand_Value >= 7500.00;



/* 10. */
select Part_Num, Description

from Part

where Class in ('AP', 'SG');



/* 11. */
select Customer_Num, Customer_Name

from Customer

where Customer_Name like 'K%';



/* 12. */
select * 

from Part

order by Description;



/* 13. */
select * 

from Part

order by Class, Part_Num;


/* 14. */
select count(*)

from Customer

where Balance > Credit_Limit;



/* 15. */
select sum(Balance)

from Customer

where Balance < Credit_Limit

	and Rep_Num = 65;
    
    
    
/* 16. */
select Part_Num, Description, (On_Hand * Price) as On_Hand_Value

from Part

where On_Hand > (
				   select avg(On_Hand)

				   from Part
                 );
                 
                 
                 
/* 17. */
select max(Price)

from Part;



/* 18. */
select Part_Num, Description, Price

from Part

where Price = (
				select max(Price)
                
                from Part
			   );
               
               
               
/* 19. */
select Rep_Num, sum(Balance)

from Customer

group by Rep_Num

order by Rep_Num;



/* 20. */
select Rep_Num, sum(Balance) as Rep_Balance

from Customer

group by Rep_Num

having Rep_Balance > 10000.00;



/* 21. */
select Part_Num

from Part

where Description = null;