# Parker Smith
# 4/17/16
# CS1550-003
# Recipe Table Creation

create table groups (
	id int auto_increment not null,
    group_name varchar(20),
    favorite varchar(1),
    
    primary key (id)
);

create table ingredients (
	id int auto_increment not null,
    ingredient_name varchar(45),
    
    primary key (id)
);

create table recipes (
	id int auto_increment not null,
    recipe_name varchar(20),
    description varchar(100),
    favorite varchar(1),
    group_name varchar(20),
    
    primary key (id)
);

create table recipe_ingredient (
	id int auto_increment not null,
    recipe_name varchar(20),
    base_quantity int,
    measurement varchar(20),
    ingredient varchar(100),
    
    primary key (id)
);