-- homework 5/27 inserting table info

insert into customer values
	(2, 'jj001', 'Johnson', 'Johnny', 'johnny45@gmail.com', '555-888-9999'),
    (3, 'ss001', 'Shearer', 'Suzy', 'suzy23@gmail.com', '213-345-9978'),
    (4, 'bb001', 'Brown', 'Becky', 'thebeckster11@gmail.com', '546-628-2285');
    
    
insert into orderticket (ID, customerid) values
	(2, 4),
    (3, 3),
    (4, 2);
    
    
insert into lineitem values
	(4, 2, 11, 2),
    (5, 3, 12, 2),
    (6, 4, 21, 4);

update orderticket
	set total= 23.98
    where id= 2;
 
 update orderticket
	set total= 25.98
    where id= 3;
    
update orderticket
	set total= 11.96
    where id= 4;


