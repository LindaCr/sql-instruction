-- calculate total for an order
-- individual ticket
select orderticketID, name, price, quantity, sum(price * quantity) as total
	from lineitem
    join menuitem mi
    on MenuItemId= mi.id
    where orderticketid= 2
    group by orderticketid;
    
-- all tickets

select orderticketID, name, price, quantity, sum(price * quantity) as total
	from lineitem
    join menuitem mi
    on MenuItemId= mi.id
    -- where orderticketid= 2
    group by orderticketid;
