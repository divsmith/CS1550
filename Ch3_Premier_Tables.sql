create database Premier;

use Premier;

create table Rep(
	Rep_Num int auto_increment not null,
    Last_Name varchar(45),
    First_Name varchar(45),
    Street varchar(45),
    City varchar(45),
    State char(2),
    Zip char(5),
    Commission decimal(8, 2),
    Rate decimal(3, 2),
    primary key (Rep_Num)
);

create table Customer(
	Customer_Num int not null,
    Customer_Name varchar(100),
    Street varchar(45),
    City varchar(45),
    State char(2),
    Zip char(5),
    Balance decimal(8, 2),
    Credit_Limit decimal(10, 2),
    Rep_Num int,
    primary key (Customer_Num)
);

create table Orders(
	Order_Num int not null,
    Order_Date date,
    Customer_Num int,
    primary key (Order_Num)
);

create table Order_Line(
	Order_Line_Num int not null,
    Order_Num int,
    Part_Num char(4),
    Num_Ordered int,
    Quoted_Price decimal(7, 2),
    primary key (Order_Line_Num)
);

create table Part(
	Part_Num char(4) not null,
    Description varchar(45),
    On_Hand int,
    Class char(2),
    Warehouse int,
    Price decimal (7, 2),
    primary key (Part_Num)
);