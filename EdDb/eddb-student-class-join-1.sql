select * from class;
select * from student;
select * from studentclass;

select s.Firstname, s.Lastname, c.code
	from student s
    join studentclass sc on s.Id= sc.StudentId
    join class c on sc.ClassId=c.Id;
    
 -- class review
 -- select firstname, lastname, code, subject 
 --    from student
 --    join studentclass
 --    on studentid= student.id
 --    join class
 --    on classid= class.id;