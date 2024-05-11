create table Item
(
item_id char(5) primary key check(item_id like '[P][0-9][0-9][0-9][0-9]') not null,
item_name char(12),
item_catagory char(16),
item_price float check(item_price>=0),
item_qoh int check(item_qoh>=0),
item_last_sold datetime default getdate()  
)
select * from Item
insert into Item (item_id,item_name,item_catagory,item_price,item_qoh,item_last_sold) values
('P0003','tofail','electro',19.7,23,'5-12-2015')


CREATE PROC sp_showTitleAndAuthor
AS
BEGIN
SELECT "Authors Last Name"=au_lname FROM authors where au_id in (select au_id from
titleauthor where title_id='BU1032')
END
EXEC sp_showTitleAndAuthor
select *from authors

 alter proc sp_showTitleAndAuthor @titleid char(15)
as BEGIN
SELECT "Authors last name"=au_lname FROM authors WHERE au_id in(SELECT au_id from titleauthor WHERE title_id=@titleid)
END
EXEC sp_showTitleAndAuthor 'BU1111'

alter proc sp_showTitleAndAuthor --@titleied char(15)
as begin
declare @price money
select @price=price from titles --where title_id=@titleied
set @price=@price+.1*@price
if @price<=30
update titles set price=@price --where title_id=@titleied
end
exec sp_showTitleAndAuthor --'BU1032'
select * from titles


alter PROC sp_updatePrice @titleid char(15)
AS
BEGIN
DECLARE @price MONEY
SELECT @price=price from TITLES WHERE title_id=@titleid
set @price=@price+0.1*@price
IF @price<=25
  begin
  UPDATE titles SET price= @price WHERE title_id=@titleid
   update titles set messag='updated' WHERE title_id=@titleid
   end
else
  begin
   update titles set messag='not updated' WHERE title_id=@titleid
   end
END
EXEC sp_updatePrice 'BU7832'
alter table titles add messag text
select * from titles

alter PROC sp_showTitleAndAuthor
AS
BEGIN
SELECT "catagory"=item_catagory,"total number of item"=sum(item_qoh),"average price"=avg(item_price) from item group by item_catagory
END
EXEC sp_showTitleAndAuthor
select * from item
alter proc sp_showTitleAndAuthor @catagory_name char(15),@price_value money
as 
begin 
select * from item where item_catagory=@catagory_name and item_price<@price_value
end 
exec sp_showTitleAndAuthor 'laptop',56.8



alter proc sp_showTitleAndAuthor @catagory_name char(15),@price_value money
as 
begin 
 declare @price money
 select @price=avg(item_price) from item where item_catagory=@catagory_name
    
     while  @price<@price_value
        begin
          update item set item_price=item_price+item_price*.1 where item_catagory=@catagory_name
          select @price=avg(item_price) from item where item_catagory=@catagory_name
        end 
end
exec sp_showTitleAndAuthor 'phone',55.9
select avg(item_price) from item where item_catagory='phone'
select * from item



alter proc sp_showTitleAndAuthor_1 @catagory_name char(15),@price_value money
as 
begin 
select * from item where item_catagory=@catagory_name and item_price=@price_value
end 
exec sp_showTitleAndAuthor_1 'Tab',12.1

select * from item