-- listing customers who placed atleast one product
select c.id as customer_id,name,email,count(o.id) as total_orders  from customers c join orders o on c.id=o.customers_id group by c.id;

--  listing 3 top selling products by total quantity sold
select p.id as product_id,name,sum(oi.quantity) as quantity from products p join order_items oi on p.id=oi.product_id group by p.id order by quantity desc limit 3; 

-- total revenue per category
select p.id as product_id ,name ,sum(oi.quantity*oi.price_each) as total_revenue from products p join order_items oi on p.id=oi.product_id group by p.id order by total_revenue desc;
