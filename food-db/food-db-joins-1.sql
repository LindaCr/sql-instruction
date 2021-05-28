-- homework 5/27 joins

select c.name, m.name, m.price
	from category c
    join menuitem m
    on m.categoryid= c.id;
    
select c.customernumber, c.lastname, o.orderdate, o.status
	from customer c
    join orderticket o
    on o.customerid= c.id;