-- redo on homework(5/26) w/ movie w/o actor

select m.title, a.firstname, a.lastname
	from movie m
	left outer join credit c
    on c.MovieId= m.Id
    left outer join actor a
    on c.ActorId= a.Id;