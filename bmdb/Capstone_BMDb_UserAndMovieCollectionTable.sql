USE bmdb;

-- add tables to bmdb:  user, movie_collection
Create table User (
ID 					integer 			primary key auto_increment,
Username			varchar(20) 		not null unique,
Password 			varchar(10) 	not null,
FirstName 			varchar(20) 	not null,
LastName 			varchar(20) 	not null,
PhoneNumber 		varchar(12) 	not null,
Email 				varchar(75) 	not null,
CollectionValue		decimal(10,2)	not null default 0
);

insert into user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email) VALUES
	(1, 'admin', 'admin', 'System', 'Admin', 'XXX-XXX-XXXX', 'admin@test.com'),
	(2, 'lcrook', 'techtime', 'Linda', 'Crook', '937-830-9337', 'lindacrook.44@gmail.com');
    
Create table MovieCollection (
ID 					integer			primary key auto_increment,
UserID				integer			not null,
MovieID				integer			not null,
PurchasePrice 		decimal(4,2) 	not null,
Foreign Key (UserID) references User(ID),
Foreign Key (MovieID) references Movie(ID)
);

insert into MovieCollection (UserID, MovieID, PurchasePrice) VALUES
	(2, 3, 19.99),
	(2, 2, 32.99);
