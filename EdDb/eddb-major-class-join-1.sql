select * from major;
select * from class;
select * from majorclass;

select m.description, c.code, c.subject
	from major m
    join majorclass mc on m.Id= mc.MajorId
    join class c on mc.ClassId= c.Id;
    
    
-- class review
-- select description, c.code, subject 
--    from major m
--    join majorclass
--    on majorid= m.id
--    join class c
--    on classid= c.id
--    where Description= 'General Business';
    