-- create and select the database
use master;
go
alter database bmdb set single_user with rollback immediate
go
DROP DATABASE IF EXISTS bmdb;
go
CREATE DATABASE bmdb;
go
USE bmdb;
go

-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table Movie (
ID 			int		 		primary key identity (1,1),
Title 		varchar(255) 	not null unique,
Year 		int		 		not null,
Rating 		varchar(5) 		not null,
Director 	varchar(255) 	not null
-- CONSTRAINT utitle unique (Title)
);

-- create Actor table
-- DROP TABLE IF EXISTS Actor;
Create table Actor (
ID 			int		 		primary key identity (1,1),
FirstName 	varchar(255) 	not null,
LastName 	varchar(255) 	not null,
Gender 		varchar(1) 		not null,
BirthDate 	date 			not null,
CONSTRAINT unq_actor unique (FirstName, LastName, BirthDate)
);

-- create Credits table
-- business rule - combo of actor+movie must be unique
Create table Credit (
ID 				int		 			primary key identity (1,1),
ActorID 		int		 			not null,
MovieID 		int		 			not null,
Role		 	varchar(255)		not null,
Foreign Key (ActorID) references Actor(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT act_mov unique (ActorID, MovieID)
);

-- Add some movies
 insert into Movie (Title, Year, Rating, Director) VALUES
 	('Revenge of the Nerds', 1984, 'R', 'Jeff Kanew'),
 	('Avengers Infinity War', 2018, 'PG-13', 'Anthony Russo, John Russo'),
    ('10 Things I Hate About You', 1999, 'PG-13', 'Gil Junger'),
    ('The Fast and the Furious', 2001, 'PG-13', 'Rob Cohen'),
    ('A Night at the Roxbury', 1998, 'PG-13', 'John Fortenberry'),
    ('Napolean Dynamite', 2004, 'PG', 'Jared Hess'),
    ('Breakfast at Tiffany''s', 1961, 'PG', 'Blake Edwards');
    
-- Add some actors
 insert into Actor (FirstName, LastName, Gender, BirthDate) VALUES
 	('Robert', 'Downey Jr.', 'M', '1965-4-4'),
 	('Chris', 'Hemsworth', 'M', '1983-09-11'),
    ('Scarlett', 'Johansson', 'F', '1984-11-22'),
 	('Robert', 'Carradine', 'M', '1954-3-24'),
 	('Anthony', 'Edwards', 'M', '1962-7-19'),
    ('Heath', 'Ledger', 'M', '1979-04-04'),
    ('Julia', 'Stiles', 'F', '1981-03-28'),
    ('Vin', 'Diesel', 'M', '1967-07-18'),
    ('Paul', 'Walker', 'M', '1973-09-12'),
    ('Will', 'Ferrell', 'M', '1967-07-16'),
    ('Chris', 'Kattan', 'M', '1970-10-19'),
    ('Jon', 'Heder', 'M', '1977-10-26'),
    ('Efren', 'Ramirez', 'M', '1973-10-02');
    
-- Add movie credits for actors
 insert into Credit (ActorID, MovieID, Role) VALUES
 	(1, 2, 'Tony Stark - Iron Man'),
    (2, 2, 'Thor'),
    (3, 2, 'Natasha Romanoff - Black Widow'),
    (4, 1, 'Lewis'),
    (5, 1, 'Gilbert'),
    (6, 3, 'Patrick Verona'),
    (7, 3, 'Kat Stratford'),
    (8, 4, 'Dom Torreto'),
    (9, 4, 'Brian O''Connor'),
    (10, 5, 'Steve Butabi'),
    (11, 5, 'Doug Butabi'),
    (12, 6, 'Napolean Dynamite'),
    (13, 6, 'Pedro');
    

-- create a user and grant privileges to that user
-- DROP USER IF EXISTS bmdb_user@localhost;
-- CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
-- GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
