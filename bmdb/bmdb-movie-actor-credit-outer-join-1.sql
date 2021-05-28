-- homework 5/26 outer join, don't think any nulls will exist, all movies have listed actors
-- list all movies and the actors who star in them, but also list movies w/o assigned actors

select m.title, a.firstname, a.lastname
	from movie m
	left outer join credit c
    on c.MovieId= m.Id
    left outer join actor a
    on c.ActorId= a.Id;