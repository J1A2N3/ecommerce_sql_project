-- creating trigger to reduce stock count if customer purchases an item 

delimiter //
create trigger reduce_stock
after insert on order_items 
for each row
begin
declare current_stock int;
update products set stock=stock-new.quantity where id=new.product_id;
select stock into current_stock from products where id=new.product_id;
if(current_stock=0)
then
insert into logs(message)values(concat('product id',new.product_id,'is out of stock'));
end if;
end;
//
delimiter ;

   -- check
INSERT INTO order_items (order_id, product_id, quantity, price_each)VALUES (3, 3, 3, 70000);
SELECT * FROM logs;
