create database csis1550;

use csis1550;

create table Branch(
	branch_num int not null,
    branch_name varchar(45) not null,
    branch_location varchar(45) not null,
    num_employees int,
    primary key (branch_num)
);

create table Publisher(
	publisher_code char(2) not null,
    publisher_name varchar(45) not null,
    city varchar(45) not null,
    primary key (publisher_code)
);

create table Author(
	author_num int not null,
    author_last varchar(45) not null,
    author_first varchar(45) not null,
    primary key (author_num)
);

create table Book(
	book_code char(4) not null,
    title varchar(45) not null,
    publisher_code char(2) not null,
    book_type char(3) not null,
    price decimal(5,2) not null,
    paperback boolean not null,
    primary key (book_code)
);

create table Wrote(
	wrote_num int not null,
	book_code char(4) not null,
    author_num int not null,
    sequence int not null,
    primary key (wrote_num)
);

create table Inventory(
	inventory_num int not null,
    book_code char(4) not null,
    branch_num int not null,
    on_hand int not null,
    primary key (inventory_num)
);

show columns from Branch;
show columns from Publisher;
show columns from Author;
show columns from Book;
show columns from Wrote;
show columns from Inventory;
