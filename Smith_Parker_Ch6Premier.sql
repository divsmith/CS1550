# Parker Smith
# CS1550-003
# Updating Premier Products

# 1
create table NonAppliance(
	Part_Num char(4) not null,
    Description varchar(45),
    On_Hand int,
    Class char(2),
    Price decimal (7, 2),
    primary key (Part_Num)
);

# 2
insert into NonAppliance(Part_Num, Description, On_Hand, Class, Price)

select Part_Num, Description, On_Hand, Class, Price

from Part

where class != 'AP';

# 3
update NonAppliance

set Description = 'Deluxe Iron'

where Part_Num = 'AT94';

# 4
update NonAppliance

set Price = Price * 1.02;

# 5
insert into NonAppliance values('TL92', 'Trimmer', 11, 'HW', 29.95);

# 6
delete from NonAppliance

where Class = 'SG';

# 7
update NonAppliance

set Class = null

where Part_Num = 'FD21';

# 8
alter table NonAppliance

add On_Hand_Value decimal(7, 2);

update NonAppliance 

set On_Hand_Value = On_Hand * Price;

# 9
alter table NonAppliance

modify Description varchar(65);

# 10
drop table NonAppliance;