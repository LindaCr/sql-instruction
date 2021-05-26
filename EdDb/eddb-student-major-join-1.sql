-- join views
-- join student and major...
-- a list of all students and their respective majors
select * 
	from student s
    join major m
    on s.MajorId= m.Id;
    
select firstname, lastname, code, description
	from student s
    join major m
    on s.MajorId= m.Id;
