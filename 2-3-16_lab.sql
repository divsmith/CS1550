create database cs1550;
use cs1550;

create table Pet(Pet_ID int auto_increment not null,
				Owner_ID int not null,
                Pet_Name varchar(40) not null,
                Type_ID int not null,
                Sex enum('M', 'F') not null,
                Birth_Date date not null,
                Death_Date date,
                primary key (Pet_ID));
                
create table Owner(Owner_ID int auto_increment not null,
					Name varchar(40) not null,
                    primary key (Owner_ID));
                    
create table Visit(Visit_ID int auto_increment not null,
					Pet_ID int not null,
                    Visit_Date date not null,
					Visit_Type int not null,
                    Details varchar(100),
                    primary key (Visit_ID));
                    
create table Vist_Type(Type_ID int auto_increment not null,
						Type_Description varchar(40),
                        primary key (Type_ID));
                        
create table Pet_Type(Type_ID int auto_increment not null,
						Type_Description varchar(40),
                        primary key (Type_ID));
                        
                        