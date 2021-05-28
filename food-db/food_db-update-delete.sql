-- update total of order ticket id 1 to $11
select * from orderticket where id= 1;
update orderticket
	set total= 11
    where id= 1;

-- delete bad line of data    
delete from category
	where id= 7;