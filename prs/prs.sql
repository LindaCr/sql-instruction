-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- create User table
-- DROP TABLE IF EXISTS User;
Create table User (
ID 				integer 		primary key auto_increment,
Username 		varchar(20) 	not null unique,
Password		varchar(10) 	not null,
FirstName 		varchar(20) 	not null,
LastName 		varchar(20) 	not null,
Phone			varchar(12)		not null,
Email			varchar(75)		not null,
Reviewer		bit				not null,
Admin			bit				not null
);


-- create Vendor table
Create table Vender (
ID 			integer 		primary key auto_increment,
Code	 	varchar(10) 	not null unique,
Name	 	varchar(255) 	not null,
Address 	varchar(255) 	not null,
City	 	varchar(255)	not null,
State		varchar(2)		not null,
Zip			varchar(5)		not null,
Phone		varchar(12)		not null,
Email		varchar(100)	not null
);


-- create request table
Create table Request (
ID 					integer 			primary key auto_increment,
UserID	 		 	integer 			not null,
Description 		varchar(100) 		not null,
Justification		varchar(255)		not null,
DateNeeded			date				not null,
DeliveryMode		varchar(25)			not null,
Status				varchar(20)			not null,
Total				decimal(10,2)		not null,
SubmittedDate		datetime			not null,
ReasonForRejection	varchar(100),

Foreign Key (UserID) references User(ID)
);

 -- create product table
 Create table Product (
 ID				integer			primary key auto_increment,
 VendorID		integer			not null,
 PartNumber		varchar(50)		not null,
 Name			varchar(150)	not null,
 Price			decimal(10,2)	not null,
 Unit			varchar(255),
 PhotoPath		varchar(255),
 
 Foreign Key (VendorID) references Vender(ID),
 CONSTRAINT	vendor_part unique (VendorID, PartNumber)
 );
 
 -- create lineitem table
 Create table LineItem (
 ID				integer			primary key auto_increment,
 RequestID		integer			not null,
 ProductID		integer			not null,
 Quantity		integer			not null,
 
 Foreign Key (RequestID) references Request(ID),
 Foreign Key (ProductID) references Product(ID),
 CONSTRAINT req_pdt unique (RequestID, ProductID)
 );
    

-- create a user and grant privileges to that user
DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;
