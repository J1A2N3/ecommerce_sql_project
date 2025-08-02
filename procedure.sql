-- to create a procedure whenever an user purchases a product ,record in orders ,fetch products rate ,after purchasing add them in order_items ,update stock amount 
-- help of transactions
delimiter //
create procedure place_order(in cid int,in pid int,in qty int)
begin
declare current_stock int;
declare prod_price int;
declare order_id int;
start transaction;
select stock into current_stock from products where id=pid;
if(current_stock<qty)then
	rollback;
	select 'no sufficient stock' as status;
else
	select price into prod_price from products where id=pid;
	INSERT INTO orders (customers_id, total_amount)VALUES(cid,qty*prod_price);

	set  order_id=last_insert_id();
    insert into order_items(order_id,product_id,quantity,price_each)values(order_id,pid,qty,prod_price);
    
    update products set stock=stock-qty where id=pid;
    
    commit;
    select 'transaction completed' as status;
end if;
end;
//
delimiter ;
	-- check
call place_order(3,4,2);
