select * from actor;

select * from actor
where Id='6';

select * from actor
where Gender='M';

select * from actor
where BirthDate<'1975-01-01';

select * from actor
where FirstName like 'c%';

select * from actor
where Gender='M'
order by LastName desc;