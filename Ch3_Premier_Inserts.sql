insert into Rep values(20, 'Kaiser', 'Valerie', '624 Randall', 'Grove', 'FL', '33321', 20542.50, 0.05);
insert into Rep values(35, 'Hull', 'Richard', '532 Jackson', 'Sheldon', 'FL', '33553', 39216.00, 0.07);
insert into Rep values(65, 'Perez', 'Juan', '1626 Taylor', 'Fillmore', 'FL', '33336', 23487.00, 0.05);

insert into Customer values(148, 'Al\'s Appliance and Sport', '2837 Greenway', 'Fillmore', 'FL', '33336', 6550.00, 7500.00, 20);
insert into Customer values(282, 'Brookings Direct', '3827 Devon', 'Grove', 'FL', '33321', 431.00, 1000.00, 35);
insert into Customer values(356, 'Ferguson\'s', '382 Wildwood', 'Northfield', 'FL', '33146', 5785.00, 7500.00, 65);
insert into Customer values(408, 'The Everything Shop', '1828 Raven', 'Crystal', 'FL', '33503', 5285.25, 5000.00, 35);
insert into Customer values(462, 'Bargains Galore', '3829 Central', 'Grove', 'FL', '33321', 3412.00, 10000.00, 65);
insert into Customer values(524, 'Kline\'s', '838 Ridgeland', 'Fillmore', 'FL', '33336', 12762.00, 15000.00, 20);
insert into Customer values(608, 'Johnson\'s Department Store', '372 Oxford', 'Sheldon', 'FL', '33553', 2106.00, 10000.00, 65);
insert into Customer values(687, 'Lee\'s Sport and Appliance', '282 Evergreen', 'Altonville', 'FL', '32543', 2851.00, 5000.00, 35);
insert into Customer values(725, 'Deerfield\'s Four Seasons', '282 Columbia', 'Sheldon', 'FL', '33553', 248.00, 7500.00, 35);
insert into Customer values(842, 'All Season', '28 Lakeview', 'Grove', 'FL', '33321', 8221.00, 7500.00, 20);

insert into Orders values(21608, '2007-10-20', 148);
insert into Orders values(21610, '2007-10-20', 356);
insert into Orders values(21613, '2007-10-21', 408);
insert into Orders values(21614, '2007-10-21', 282);
insert into Orders values(21617, '2007-10-23', 608);
insert into Orders values(21619, '2007-10-23', 148);
insert into Orders values(21623, '2007-10-23', 608);

insert into Order_Line values(1, 21608, 'AT94', 11, 21.95);
insert into Order_Line values(2, 21610, 'DR93', 1, 495.00);
insert into Order_Line values(3, 21610, 'DW11', 1, 399.99);
insert into Order_Line values(4, 21613, 'KL62', 4, 329.95);
insert into Order_Line values(5, 21614, 'KT03', 2, 595.00);
insert into Order_Line values(6, 21617, 'BV06', 2, 794.95);
insert into Order_Line values(7, 21617, 'CD52', 4, 150.00);
insert into Order_Line values(8, 21619, 'DR93', 1, 495.00);
insert into Order_Line values(9, 21623, 'KV29', 2, 1290.00);

insert into Part values('AT94', 'Iron', 50, 'HW', 3, 24.95);
insert into Part values('BV06', 'Home Gym', 45, 'SG', 2, 794.95);
insert into Part values('CD52', 'Microwave Oven', 32, 'AP', 1, 165.00);
insert into Part values('DL71', 'Cordless Drill', 21, 'HW', 3, 129.95);
insert into Part values('DR93', 'Gas Range', 8, 'AP', 2, 495.00);
insert into Part values('DW11', 'Washer', 12, 'AP', 3, 399.99);
insert into Part values('FD21', 'Stand Mixer', 22, 'HW', 3, 159.95);
insert into Part values('KL62', 'Dryer', 12, 'AP', 1, 349.95);
insert into Part values('KT03', 'Dishwasher', 8, 'AP', 3, 595.00);
insert into Part values('KV29', 'Treadmill', 9, 'SG', 2, 1390.00);



















