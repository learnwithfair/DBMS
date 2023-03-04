
--customers Table Creating Start
CREATE TABLE customers
(
cusl_id CHAR (6) PRIMARY KEY CHECK (cusl_id LIKE '[A-Z][0-9][0-9][0-9][0-9][0-9]'),
cusl_fname CHAR(15) NOT NULL,
cusl_lname VARCHAR (15),
cusl_address TEXT,
cusl_telno CHAR (20) CHECK (cusl_telno LIKE '+88[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cusl_city CHAR (22) DEFAULT 'Lalmonirhat',
sales_amnt MONEY CHECK (sales_amnt>=0),
proc_amnt MONEY CHECK (proc_amnt>=0)
)

--customers Table Insert Start
insert into customers
(cusl_id,cusl_fname,cusl_lname,cusl_address,cusl_telno,cusl_city,sales_amnt,proc_amnt) VALUES
('P00002','RAHATUL','RABBI','221/B Dhanmondi','+88017-00000000','Dhaka',0,0);

insert into customers VALUES
('C00005','IMRAN','Hossain','221/B Dhanmondi','+88017-00000000','Dhaka',0,0);

--customers Table Display Start
select * from customers;

--CustomerAndSuppliers Table Creating Start
CREATE TABLE customers2
(
cusl_id CHAR (6) PRIMARY KEY CHECK (cusl_id LIKE '[CS][0-9][0-9][0-9][0-9][0-9]'),
cusl_fname CHAR(15) NOT NULL,
cusl_lname VARCHAR (15),
cusl_address TEXT,
cusl_telno CHAR (12) CHECK (cusl_telno LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cusl_city CHAR (17) DEFAULT 'Lalmonirhat',
sales_amnt MONEY CHECK (sales_amnt>=0),
proc_amnt MONEY CHECK (proc_amnt>=0)
);

--customers2 Table Insert Start
insert into customers2
(cusl_id,cusl_fname,cusl_lname,cusl_address,cusl_telno,cusl_city,sales_amnt,proc_amnt) VALUES
('C00001','Iqbal','Hossain','221/B Dhanmondi','017-00000000','Dhaka',0,0);


--customers2 Table Display Start
SELECT * from customers2;

--Items Table Creating Start
CREATE TABLE Items
(
item_id CHAR (6) PRIMARY KEY CHECK (item_id LIKE '[P][0-9][0-9][0-9][0-9][0-9]'),
item_name CHAR(12) NOT NULL,
item_category VARCHAR (10),
item_price FLOAT(12) check(item_price>=0),
item_qoh INT CHECK (item_qoh>=0),
item_last_sold DATE DEFAULT getdate(),
);
--Items Table Inserting Start

insert into Items
(item_id,item_name,item_category,item_price,item_qoh) VALUES
('P00005','RAHATUL','STUDENT','5241.2','45');

insert into Items
(item_id,item_name,item_category,item_price,item_qoh) VALUES
('P00002','RAHATUL','STUDENT','5241.2','45');
--Items Table Display Start
SELECT * from Items;

--Transactions Table Creating Start
CREATE TABLE Transactions
(
tran_id CHAR (10) PRIMARY KEY CHECK (tran_id LIKE '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id CHAR(6) FOREIGN KEY(item_id) REFERENCES Items(item_id),
cusl_id CHAR (6) FOREIGN KEY(cusl_id) REFERENCES customers2(cusl_id),
tran_type CHAR(1),
ran_quantity INT CHECK (ran_quantity>=0),
tran_date DATETIME DEFAULT getdate(),
);
--Transactions Table Inserting Start
insert into Transactions
(tran_id,item_id,cusl_id,tran_type,ran_quantity) VALUES
('T000052149','P00005','C00001','S',12);

insert into Transactions
(tran_id,item_id,cusl_id,tran_type,ran_quantity) VALUES
('T000052142','P00002','C00001','O',12);
--Transactions Table Display Start
SELECT * from Transactions;



create trigger test on Transactions for insert
as
begin
declare @item_id char(5), @amount char(12), @tran_type char(1)
select @item_id=item_id,@amount=ran_quantity,@tran_type=tran_type from inserted
if (@tran_type='S')
	update Items set item_qoh=item_qoh - @amount where item_id=@item_id;
else
	update Items set item_qoh=item_qoh+ @amount where item_id=@item_id;
end

