create table REP(
	REP_NUM int not null auto_increment,
    LAST_NAME varchar(100) not null,
    FIRST_NAME varchar(100) not null,
    STREET varchar(100) not null,
    CITY varchar(100) not null,
    STATE char(2) not null,
    ZIP int not null,
    COMMISSION decimal(10, 2) not null,
    RATE decimal(2, 2) not null,
    primary key ( REP_NUM )
);

create table CUSTOMER(
	CUSTOMER_NUM int not null auto_increment,
    CUSTOMER_NAME varchar(100) not null,
    STREET varchar(100) not null,
    CITY varchar(100) not null,
    STATE char(2) not null,
    ZIP int not null,
    BALANCE decimal(10, 2) not null,
    CREDIT_LIMIT decimal (10, 2) not null,
    REP_NUM int not null,
    primary key ( CUSTOMER_NUM )
);

create table ORDERS(
	ORDER_NUM int not null auto_increment,
    ORDER_DATE date not null,
    CUSTOMER_NUM int not null,
    primary key ( ORDER_NUM )
);

create table ORDER_LINE(
	ORDER_LINE_ID int not null auto_increment,
    ORDER_NUM int not null,
    PART_NUM int not null,
    NUM_ORDERED int not null,
    QUOTED_PRICE decimal(7, 2) not null,
    primary key ( ORDER_LINE_ID )
);

create table PART(
	PART_NUM int not null auto_increment,
    DESCRIPTION varchar(100) not null,
    ON_HAND int not null,
    CLASS char(2) not null,
    WAREHOUSE int not null,
    PRICE decimal (7, 2) not null,
    primary key ( PART_NUM )
);