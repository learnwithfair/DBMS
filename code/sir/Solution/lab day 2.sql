use pubs
select * from authors
select * from titles
select * from publishers
select * from titleauthor
select * from jobs
select * from pub_info
select pub_name from publishers


select title_id from titleauthor where au_id in (select au_id from  authors where au_id='172-32-1176') where title_id in (select title_id from titles ))--where pub_id='1389'))


SELECT title,au_lname FROM authors  JOIN titleauthor ON authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id JOIN publishers ON titles.pub_id=publishers.pub_id
SELECT title, pub_name  FROM titles inner JOIN publishers ON titles.pub_id=publishers.pub_id
SELECT au_lname, pub_name FROM authors, publishers where  authors.city=publishers.city
SELECT au_lname,authors.city, pub_name,publishers.city FROM authors, publishers where  authors.city=publishers.city
select  au_lname, pub_name 

select au_lname,au_ord from authors where authors.au_id in(select au_id from titleauthor)

SELECT au_lname,au_ord FROM authors  JOIN titleauthor ON authors.au_id=titleauthor.au_id

from authors, publishers 
where authors.city = 'Berkeley' or publishers.city='Berkeley'
SELECT AVG(royalty) from TITLES
select* from titles
 SELECT * FROM titles WHERE royalty = (SELECT avg(royalty) FROM titles)
SELECT * FROM titles WHERE royalty = (SELECT max(royalty) FROM titles)
create database store
create TABLE CustomerAndSuppliers
(
cusl_id CHAR(6) PRIMARy KEY CHECK (cusl_id LIKE('[CS][0-9][0-9][0-9][0-9][0-9]')),
cusl_fname CHAR(15) NOT NULL,
cusl_lname VARCHAR (15),
cusl_address TEXT,
cusl_telno CHAR(12) CHECK(cusl_telno LIKE('[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
cusl_city CHAR(12) DEFAULT 'Rajshahi',
sales_amnt MONEY CHECK(sales_amnt>=0),
proc_amnt MONEY CHECK(proc_amnt>=0)
)
select * from customerAndsuppliers
INSERT customerAndsuppliers
(cusl_id,cusl_fname,cusl_lname,cusl_address,cusl_telno,cusl_city,sales_amnt,proc_amnt) VALUES
('S00003','tofail','ahmed','kushtia,kushtia ','017-22633140','Kushtia',7,19)
----insert default value
---or /*

INSERT CustomerAndSuppliers
(cusl_id,cusl_fname,cusl_lname,cusl_address,cusl_telno,sales_amnt,proc_amnt) VALUES
('C00007','Iqbal','Hossain','221/B Dhanmondi','017-00000000',10,10)

create table Item
(
item_id char(6) primary key check (item_id like ('[P][0-9][0-9][0-9][0-9][0-9]')),
item_name char(12),
item_catagory char(10),
item_price float check(item_price>=0),
item_qoh int check(item_qoh>=0),
item_last_sold datetime  default getdate()
)
insert Item(item_id ,item_name,item_catagory,item_price ,item_qoh ,item_last_sold)
values('P00009','tofail','phone',57.8,23,'3-2-15')
insert Item(item_id ,item_name,item_catagory,item_price ,item_qoh )
values('P00002','tofail ah','laptop',56.8,23)
select * from Item

create table Transactions
(
tran_id char(10) primary key check (tran_id like '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id char(6) foreign key references Item(item_id), 
cusl_id char(6) foreign key references customerAndsuppliers(cusl_id) ,
tran_type char(1),
tran_quality int check (tran_quality>=0),
tran_date datetime default getdate()

)

drop table transactions 

insert transactions(tran_id ,item_id,cusl_id,tran_type,tran_quality) values('T000000001','P00002','C00005','s',10)






