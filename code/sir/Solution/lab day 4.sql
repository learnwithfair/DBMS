use store
select * from item
delete from item where item_id='P00004'

insert Item(item_id ,item_name,item_catagory,item_price ,item_qoh )
values('P00011','tofail b','Tab',14,30)
create trigger trg_test on item for insert 
as 
 begin
 print'one item insert into item table'
end


select * from transactions

CREATE TRIGGER trg_update_item ON Transactions FOR INSERT
AS
BEGIN
DECLARE @item_id char(6), @tranamount int, @tran_type char(1),@cusld_id char(6),@price money
SELECT @item_id=item_id, @tranamount=tran_quality, @tran_type=tran_type,@cusld_id =cusl_id FROM INSERTED
Select @price=item_price from item where item_id=@item_id
 IF (@tran_type ='S')
     begin
       UPDATE Item SET item_qoh=item_qoh- @tranamount WHERE item_id=@item_id 
       update  CustomerAndSuppliers set sales_amnt=sales_amnt+@price*@tranamount where cusl_id=@cusld_id
     end
 ELSE
   begin
    UPDATE Item SET item_qoh=item_qoh+ @tranamount WHERE item_id=@item_id
    update  CustomerAndSuppliers set proc_amnt=proc_amnt+@tranamount*@price where cusl_id=@cusld_id
    end
END

drop  TRIGGER trg_update_item

insert transactions(tran_id ,item_id,cusl_id,tran_type,tran_quality)
 values('T000000006','P00003','S00002','S',5)


select * from transactions
select * from CustomerAndSuppliers
select * from item


--show the trigger name  command
--select * from sys.triggers
--SELECT *  FROM sys.procedures



CREATE TRIGGER trg_update_item ON Transactions FOR INSERT
AS
BEGIN
DECLARE @item_id char(6), @tranamount int, @tran_type char(1)
SELECT @item_id=item_id, @tranamount=tran_quality, @tran_type=tran_type FROM INSERTED
IF (@tran_type ='S')
UPDATE Item SET item_qoh=item_qoh- @tranamount WHERE item_id=@item_id
ELSE
UPDATE Item SET item_price=item_price+ @tranamount WHERE item_id=@item_id
END