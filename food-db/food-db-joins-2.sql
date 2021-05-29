-- homework review, list line items for an order, with subtotals
-- add concat and clean up headers
select orderticketID, concat(lastname, ', ', firstname) as 'Customer Name', cat.name as Category, 
mi.name as Item, concat('$',price) as Price, quantity as Qty, concat('$', (price * Quantity)) as Subtotal
	from lineitem
    join menuitem mi
	on MenuItemId= mi.id
    join orderticket ot
    on orderticketid= ot.id
    join customer c
    on customerid= c.id
    join category cat
    on categoryid= cat.id
	where orderticketid= 4;