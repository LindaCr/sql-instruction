Use bmdb;
-- bmdb - add genre and movie genre tables
-- NOTE:  You must run the bmdb create script first!

-- create Genre table
drop table if exists moviegenre;
drop table if exists genre;
Create table Genre (
ID 				integer 			primary key auto_increment,
Name		 	varchar(25)			not null unique
);

-- create MovieGenre table
-- business rule - combo of genre+movie must be unique
Create table MovieGenre (
ID 				integer 			primary key auto_increment,
MovieID 		integer 			not null,
GenreID 		integer 			not null,
Foreign Key (GenreID) references Genre(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT gnr_mov unique (GenreID, MovieID)
);

-- add genres
insert genre values (1, 'Action');
insert genre values (2, 'Comedy');
insert genre values (3, 'Romance');
insert genre values (4, 'Crime');
insert genre values (5, 'Thriller');
insert genre values (6, 'Sci-Fi');
insert genre values (7, 'Historical fiction');
insert genre values (8, 'Fantasy');
insert genre values (9, 'Adventure');
insert genre values (10, 'Drama');
insert genre values (11, 'Historical');
insert genre values (12, 'Horror');
insert genre values (13, 'Mystery');
insert genre values (14, 'Animation');
insert genre values (15, 'Film Noir');
insert genre values (16, 'Documentary');
insert genre values (17, 'Biography');
insert genre values (18, 'Family');
insert genre values (19, 'War');
insert genre values (20, 'Western');
insert genre values (21, 'Superhero');
insert genre values (22, 'Sport');
insert genre values (23, 'Musical');
insert genre values (24, 'Short Film');