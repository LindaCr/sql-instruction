-- basic where clause
select * from student
	where statecode= 'KY';
    
-- where clause w/ or
select * from student
	where statecode= 'KY' or statecode= 'IN';
        
-- where clause w/ in
select * from student
	where statecode in ('KY', 'IN');
    
-- where clause w/ not
-- select * from student
-- 	where statecode not= 'KY'; doesn't work

-- where clause w/ not
select * from student	
	where statecode!= 'KY';
    
-- where clause w/ not
select * from student
	where not statecode= 'KY';
    
-- where clause w/ between
select * from student
	where gpa between 2.0 and 3.0
    order by gpa;
    
-- where clause w/ like
select * 
	from student
-- where lastname like 'B%'
where lastname like 'B%s';

-- where clause w/ underscore - states starting with 'I'
select * 
	from student
    where statecode like 'I_';
    
	order by lastname;
