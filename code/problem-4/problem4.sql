select dept_name,AVG(salary) as avg_salary from instructor group by dept_name;

select dept_name,AVG(salary) as avg_salary from instructor group by dept_name having AVG(salary)>42000;

select * from instructor order by salary desc,name asc;

create view faculty as select ID,name,dept_name from instructor;
select * from faculty;
create index dept_index on instructor(dept_name);

create procedure instructor_proc
as 
begin
select name as authors_name from instructor where ID='101'
end
exec instructor_proc
select * from instructor