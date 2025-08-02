-- creating view that shows customer order summary
create view customer_order_summary as
select c.id as customer_id,c.name,count(o.id) as total_orders,sum(o.total_amount) as total_amount from customers c join orders o on c.id=o.customers_id group by c.name,c.id;
    --  check
select *from customer_order_summary;
