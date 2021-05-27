-- create and select the database
DROP DATABASE IF EXISTS food_db;
CREATE DATABASE food_db;
USE food_db;

-- create Customer table
-- DROP TABLE IF EXISTS Customer;
Create table Customer (
ID 					integer 		primary key auto_increment,
CustomerNumber 		varchar(255) 	not null unique,
LastName 			varchar(255) 	not null,
FirstName 			varchar(255) 	not null,
Email 				varchar(255) 	not null,
Phone				varchar(255)	
-- CONSTRAINT ucustomernumber unique (CustomerNumber)
);

-- create Category table
-- DROP TABLE IF EXISTS Category;
Create table Category (
ID 			integer 		primary key auto_increment,
Name 		varchar(255) 	not null
);

-- create OrderTicket table
-- business rule - combo of customerid+ orderdate must be unique
Create table OrderTicket (
ID 				integer 			primary key auto_increment,
CustomerId 		integer 			not null,
OrderDate 		timestamp 			not null,
Status		 	varchar(1)			not null,
Total			decimal				not null,
Foreign Key (CustomerId) references Customer(ID),
CONSTRAINT customerid_orderdate unique (CustomerId,OrderDate)
);

-- create MenuItem table
Create table MenuItem (
ID				integer				primary key auto_increment,
CategoryId		integer				not null,
Name			varchar(255)		not null,
Price			decimal				not null,
Calories		integer				not null,
Foreign Key (CategoryId) references Category(ID),
CONSTRAINT categoryId_name unique (CategoryId,Name)
);

-- create LineItem table
Create table LineItem (
ID						integer				primary key auto_increment,
OrderTicketId			integer				not null,
MenuItemId				integer				not null,
Quantity				integer				not null,
Foreign Key (OrderTicketId) references OrderTicket(ID),
Foreign Key (MenuItemId) references MenuItem(ID),
CONSTRAINT orderticketId_menuItemId unique (OrderTicketId,MenuItemId)
);


    

-- create a user and grant privileges to that user
-- DROP USER IF EXISTS bmdb_user@localhost;
-- CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
-- GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
