SELECT * FROM eddb.student;

select s.Firstname, s.Lastname, m.Code, m.Description
from student s
join major m
on s.MajorId= m.Id
order by Firstname asc;