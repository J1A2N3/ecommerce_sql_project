-- create function to check stock_status

delimiter //
create function check_stock( pid int)
returns varchar(20)
deterministic
begin
declare stock_qty int;
select stock into stock_qty from products where id=pid;
if(stock_qty=0) then
	return 'out of stock';
elseif (stock_qty<5) then
	return 'low stock';
else
	return 'in stock';
end if;
end;
//
delimiter ;

		-- check
SELECT check_stock(2); 
