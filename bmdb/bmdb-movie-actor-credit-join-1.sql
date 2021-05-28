-- homework 5/26 3 table join

select m.title, m.year, a.firstname, a.lastname, c.role
	from movie m
    join credit c on c.MovieId= m.Id
    join actor a on c.ActorId= a.Id;