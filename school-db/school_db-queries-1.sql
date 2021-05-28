select * from student;

select * from student
order by lastname, firstname;

-- distinct keyword
select distinct(state) from student;

-- count function
select count(*) from student;

-- how many students from ohio
select count(*) from student
	where state= 'OH';
    
-- how many students per state
select state, count(state)
	from student
	group by state
    order by count(state) desc;
    
-- max statement birthdate
select max(birthday) from student;

select min(birthday) from student;

-- most common middle initial
select middleinitial, count(middleinitial) from student
	group by middleinitial
    order by count(middleinitial) desc
    limit 1;
    
-- students and courses they're enrolled in
select lastname, firstname, courseid, grade, subject, name 
	from student s
    join enrolled e
    on e.studentid= s.id
    join course c
    on e.courseid= c.id
    order by grade, lastname;


