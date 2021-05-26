-- example of outer join
-- select firstname, lastname, description from student
-- 	left outer join major
--     on majorid= major.id;

select * from class
	left outer join instructor
    on instructorId= instructor.id;