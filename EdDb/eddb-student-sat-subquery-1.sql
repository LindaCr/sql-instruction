select avg(SAT)
	from student;
    
select * from student
	where SAT<= (select avg(SAT) from student)
    order by SAT;