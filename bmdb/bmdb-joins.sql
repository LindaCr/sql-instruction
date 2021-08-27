select * from movie m
join credit c
on m.Id= c.MovieId;

select m.Title, m.Year, c.Role
from movie m
join credit c
on m.Id= c.MovieId
order by Year;