select * from major;

select * from student
	where SAT<= 1000;

select * from instructor;

select Lastname, Firstname, YearsExperience from Instructor
	order by Lastname ASC;

select * from StudentClass;

select * from ClassGrade;

select * from Student;

select * from Class;

select * from Instructor;

-- list of student and class enrollment
select Firstname, Lastname, Code, Subject from Student s
	join StudentClass sc
	on sc.StudentId= s.ID
	join class c
	on sc.ClassId= c.ID;

-- list of student and grades
select Firstname, Lastname, Code, ClassGradeValue from Student s
	join Studentclass sc
	on sc.StudentID= s.ID
	join class c
	on sc.ClassID= c.ID;

-- list student, class enrollment, grade, and instructor
select s.Firstname, s.Lastname, c.Code, sc.ClassGradeValue, i.Firstname, i.Lastname from student s
	join studentclass sc
	on sc.StudentID= s.ID
	join class c
	on sc.ClassID= c.ID
	join Instructor i
	on c.InstructorId= i.ID;

-- outer join-report all students, their class enrollment, including students with no classes enrolled
select Firstname, Lastname, Code, Subject from student s
	left outer join StudentClass sc
	on sc.StudentId= s.ID
	left outer join class c
	on sc.ClassID= c.ID;
	
	