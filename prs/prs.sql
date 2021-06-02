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
Create table Vendor (
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
SubmittedDate		timestamp			not null default current_timestamp,
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
 
 Foreign Key (VendorID) references Vendor(ID),
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
 
 -- Add 'SYSTEM' user
insert into user (Username, Password, FirstName, LastName, Phone, Email, Reviewer, Admin) VALUES
	('sblessing', 'login', 'Sean', 'Blessing', '513-600-7096', 'sean@blessingtechnology.com', 1, 1),
    ('lcrook', 'techtime', 'Linda', 'Crook', '848-555-7721', 'system@test.com',0,0),
    ('mjowers', 'margaritas', 'Michelle', 'Jowers', '439-555-3451', 'system@test.com', 0, 0),
    ('mchilders', 'developer', 'Matthew', 'Childers', '212-555-8757', 'system@test.com', 0, 0),
    ('npatel', 'funnyguy', 'Naimish', 'Patel', '584-555-4530','system@test.com', 0, 0),
    ('srace', 'coolsnake', 'Seth', 'Race', '674-555-9076','system@test.com', 0, 0),
    ('dmotley', 'snackguy', 'Dylan', 'Motley', '343-555-2166','system@test.com', 0, 0);
    
insert into vendor (Code, Name, Address, City, State, Zip, Phone, Email) values
	('OD-1001', 'Office Depot', '6600 North Military Trail', 'Boca Raton', 'FL', '33496', '800-463-3768', 'ecsupport@officedepot.com'),
    ('BB-1001', 'Best Buy', '4435 Aicholtz Rd.', 'Cincinnati', 'OH', '45245', '888-237-8289', 'geeksquad@bestbuy.com'),
    ('ST-1001', 'Staples', '500 Staples DR.', 'Framingham', 'MA', '01702', '508-253-5000', 'support@orders.staples.com'),
    ('AM-1001', 'Amazon', '410 Terry Ave. North', 'Seattle', 'WA', '98109', '206-266-1000', 'cis@amazon.com');
    
insert into product (VendorID, PartNumber, Name, Price, Unit) values
	(1, '205173', 'Logitech K120 Keyboard', 16.99, '1'),
    (1, '415086', 'Logitech M100 Mouse', 9.99, '1'),
    (1, '7770469', 'HP Business Monitor', 166.99, '1'),
    (1, '314872', 'Ativa Micro-Shredder', 109.99, '1'),
    (1, '810838', 'Manila File Folder', 8.79, '100 pk'),
    (1, '760805', 'HP Laser Jet ProM227fdn Monochrome Laser Multifunction Copier', 239.89, '1'),
    (2, '6460201', 'Dell Inspirion 15.6" Laptop Intel Core i5 12GB Memory',579.99, '1'),
    (2, '6423484', 'Dell Inspirion 3880 Desktop Intel Core i7-10700 12GB',899.99, '1'),
    (2, '3720002', 'Rocketfish 4'' 4K UltraHD/HDR HDMI Cable', 24.99, '1'),
    (3, '135848', 'Tru Red 8.5"x11" Copy Paper', 47.49, '8 reams'),
    (3, '2758187', 'HP2024 Black Standard Yield Toner Cartridge', 64.89, '1'),
    (3, '78854', 'OfficeMate Adjustable Punch 11 sheet capacity', 10.29, '1'),
    (3, '504308', 'Swingline Desktop Stapler', 7.99, '1'),
    (4, 'B0788F3R8X', 'Keurig K-elite Coffee Maker Single Serve Brushed Silver', 139.99, '1'),
    (4, 'B088TDDJRF', 'SMUGDESK Ergonomic Swivel Office Chair with Wheels and Arms', 72.99, '1');
    
insert into Request (UserID, Description, Justification, DateNeeded, DeliveryMode, Status, Total) values
	(2, 'HDMI cable', 'old cord frayed', '2021/06/10', 'Delivery', 'New', 24.99),
    (5, 'Dell Laptop', 'new hire needs for work', '2021/07/01', 'Pickup', 'New', 579.99),
    (3, 'Stapler', 'need for reports', '2021/06/24', 'Delivery', 'New', 7.99);
    
insert into LineItem (RequestID, ProductID, Quantity) values
	(1, 9, 1),
    (2, 7, 1),
    (3, 13, 1);
	
    
    

-- create a user and grant privileges to that user
DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;
