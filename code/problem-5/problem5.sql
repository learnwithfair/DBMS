print('Instructor Table:');
select * from instructor;

select * from department;


--Cartesian Product
select building, department.dept_name,salary from department,instructor where department.dept_name=instructor.dept_name;

--Join Operation
select salary,building from department join instructor on department.dept_name=instructor.dept_name;

select * from department join instructor on department.dept_name=instructor.dept_name;

--left outer join
select * from department left outer join instructor on department.dept_name=instructor.dept_name;

--Right outer join
select * from department right outer join instructor on department.dept_name=instructor.dept_name;


--Full outer join
select * from department full outer join instructor on department.dept_name=instructor.dept_name;