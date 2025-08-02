create table customers (id int auto_increment,name varchar(20),email varchar(20) unique,city varchar(30),created_at date,constraint primary key(id));
create table products(id int auto_increment,name varchar(20),category varchar(20),price int check(price>0),stock int check(stock>=0),constraint primary key(id)); 
create table orders(id int auto_increment primary key,customers_id int ,foreign key(customers_id) references customers(id),order_date timestamp default current_timestamp,total_amount int check(total_amount>0));
create table order_items(id int auto_increment primary key,order_id int,foreign key(order_id) references orders(id),product_id int,foreign key(product_id) references products(id),quantity int check(quantity>0),price_each int);
create table logs(id int auto_increment primary key,message text,logged_at timestamp default current_timestamp);

-- insert datas in it
INSERT INTO customers (name, email, city)VALUES ('Arjun', 'arjun@gmail.com', 'Delhi'),('Meera', 'meera@gmail.com', 'Mumbai'),('Ravi', 'ravi@yahoo.com', 'Chennai');
INSERT INTO products (name, category, price, stock)VALUES('iPhone 14', 'Mobile', 79999, 10),('Samsung Galaxy', 'Mobile', 59999, 5),('Dell Laptop', 'Laptop', 70000, 3),('Boat Earphones', 'Accessories', 999, 20);
INSERT INTO orders (customers_id, total_amount)VALUES(1, 139998),(2, 999),(1, 70000); 
INSERT INTO order_items (order_id, product_id, quantity, price_each)VALUES (1, 1, 1, 79999),(1, 2, 1, 59999), (2, 4, 1, 999),(3, 3, 1, 70000);
