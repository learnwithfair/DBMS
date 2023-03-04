use master;
create database university_190609
use university_190609
-- Create Table
create table department(
dept_name varchar(20),
building varchar(15), 
budget numeric(12,2), 
primary key(dept_name));
--Insert Value in Table
insert into department values('ICE','Watson',90000);
insert into department values('CSE','Taulor',100000);
insert into department values('EECE','Packard',50000);
--To Display all value of Department Table
select * from department;

--To Delete Department Table with one tuple
delete from department where dept_name='EEE';


-- To update Department table
update department set budget=budget*1.5 where budget<85000;




