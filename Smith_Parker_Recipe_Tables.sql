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


create table recipes (
	id int auto_increment not null,
    recipe_name varchar(20),
    description varchar(100),
    favorite varchar(1),
    group_id int,
    
    primary key (id),
    foreign key (group_id) references groups(id)
);

create table recipe_ingredient (
	id int auto_increment not null,
    recipe_id int,
    ingredient varchar(100),
    measurement varchar(20),
    base_quantity int,
    
    primary key (id),
    foreign key (recipe_id) references recipes(id)
);