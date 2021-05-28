-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table Movie (
ID 			integer 		primary key auto_increment,
Title 		varchar(255) 	not null unique,
Year 		integer 		not null,
Rating 		varchar(5) 		not null,
Director 	varchar(255) 	not null
-- CONSTRAINT utitle unique (Title)
);

-- create Actor table
-- DROP TABLE IF EXISTS Actor;
Create table Actor (
ID 			integer 		primary key auto_increment,
FirstName 	varchar(255) 	not null,
LastName 	varchar(255) 	not null,
Gender 		varchar(1) 		not null,
BirthDate 	date 			not null,
CONSTRAINT unq_actor unique (FirstName, LastName, BirthDate)
);

-- create Credits table
-- business rule - combo of actor+movie must be unique
Create table Credit (
ID 				integer 			primary key auto_increment,
ActorID 		integer 			not null,
MovieID 		integer 			not null,
Role		 	varchar(255)		not null,
Foreign Key (ActorID) references Actor(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT act_mov unique (ActorID, MovieID)
);

-- Add some movies
 insert into Movie VALUES
 	(1, 'Revenge of the Nerds', 1984, 'R', 'Jeff Kanew'),
 	(2, 'Avengers Infinity War', 2018, 'PG-13', 'Anthony Russo, John Russo'),
    (3, '10 Things I Hate About You', 1999, 'PG-13', 'Gil Junger'),
    (4, 'The Fast and the Furious', 2001, 'PG-13', 'Rob Cohen'),
    (5, 'A Night at the Roxbury', 1998, 'PG-13', 'John Fortenberry'),
    (6, 'Napolean Dynamite', 2004, 'PG', 'Jared Hess'),
    (7, 'Breakfast at Tiffany''s', 1961, 'PG', 'Blake Edwards');
    
-- Add some actors
 insert into Actor VALUES
 	(1, 'Robert', 'Downey Jr.', 'M', '1965-4-4'),
 	(2, 'Chris', 'Hemsworth', 'M', '1983-09-11'),
    (3, 'Scarlett', 'Johansson', 'F', '1984-11-22'),
 	(4, 'Robert', 'Carradine', 'M', '1954-3-24'),
 	(5, 'Anthony', 'Edwards', 'M', '1962-7-19'),
    (6, 'Heath', 'Ledger', 'M', '1979-04-04'),
    (7, 'Julia', 'Stiles', 'F', '1981-03-28'),
    (8, 'Vin', 'Diesel', 'M', '1967-07-18'),
    (9, 'Paul', 'Walker', 'M', '1973-09-12'),
    (10, 'Will', 'Ferrell', 'M', '1967-07-16'),
    (11, 'Chris', 'Kattan', 'M', '1970-10-19'),
    (12, 'Jon', 'Heder', 'M', '1977-10-26'),
    (13, 'Efren', 'Ramirez', 'M', '1973-10-02');
    
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
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;
