use food_delivery;
show tables;
select * from orderone;
select * from ordertwo;
select * from customers_medium;
select * from restaurants;
select * from menu_items;

-- 1. DDL COMMANDS
-- 1.1 Create a table delivery partners

create table delivery_partners(partner_id varchar(70) primary key,partner_name varchar(70),ph_no int,city varchar(80));

-- 1.2 add a column email to customer table

alter table customers_medium add email varchar(90);


desc customers_medium;

-- 1.3 modify rating column to decimal(3,2)

alter table restaurants modify rating decimal(3,2);

desc restaurants;

-- 1.4  rename table name of menu_items to food_items

alter table menu_items rename to food_items;

-- 1.5 Drop delivery partners table

drop table  delivery_partners;

-----------------------------------------------------------------------------------

-- 2. DML COMMANDS

-- 2.1 insert a new customer record


insert into customers_medium values('C1111','London','2025-02-15',NULL);

-- or
insert into customers_medium(customer_id,city,signup_date)values('C15555','Kenya','2035-09-8')

desc customers_medium;

select * from customers_medium where city ='Kenya';

select * from food_items;

-- 2.2 update all cancelled orders to notdelivered
update ordertwo set status='Not delivered'  where status = 'cancelled';

-- 2.3 delete customers who signedup before 2022

delete from customers_medium where signup_date < '2023-01-01';

-- 2.4 insert a new restaurant

insert into restaurants values('R4523','AFRICAN','DINDIGUL',1.00);

-- 2.5 UPDATE restaurant rating for restaurant R001

update restaurants set rating = 7.90 where restaurant_id='R001';

---------------------------------------------------------------------------------

-- 3. AGGREGATE FUNCTIONS

-- 3.1 total number of customers

select count(*) as total_no_of_customers from customers_medium;

-- 3.2 find avg restaurant rating

select avg(rating) as avg_rest_rating from restaurants;

-- 3.3 find highest menu item price  -- table name changed to food_items

select * from food_items;

select max(price) as highest_price from food_items;

-- 3.4 find total revenue generated 

-- revenue = price*quantity
select sum(quantity*price) from orderone;

-- 3.5 maximum and minimum item price

select max(price) from orderone;
select min(price) from orderone;

-- or
select max(price) as maximum_price , min(price) as minimum_price from orderone;

-- 3.6 total orders placed by each customer
-- using group by 
select customer_id ,count(order_id) as total_orders_placed_by_each_customer  from ordertwo group by customer_id;

-- 3.7 find average order value
-- here we cannot directly take avg we have to calculate avg = sum/total that is count
-- why orderone table instead of ordertwo means orderone contains price,unatity to calculate order value so, only


select  sum(quantity*price) / count(distinct order_id) as AVG_ORDER_VALUE from orderone;

-- 3.8 total sales per restaurant

-- here we are taking orderone and ordertwo table and ofcoz, keeping orderid as foreign key
-- why not restaurant table means becoz restaurant table contains only res id and cuisine ,city it does not contain sales calculating metrics like qunatity,price,orderid,res id comparing to orderone and ordertwo



select ot.restaurant_id,SUM(oo.quantity*oo.price) as total_sales from ordertwo ot join orderone oo  on ot.order_id=oo.order_id group by ot.restaurant_id;

---------------------------------------------------------------------------------
-- 4.OPERATORS

-- 4.1 find restaurants with rating greater than 4

select * from restaurants where rating > 4;

-- 4.2 find customers from london or manchester

select * from restaurants where city = 'London' or city = 'Manchester';

-- 4.3 find menu items priced between 10 and 20

select * from food_items where price between 10 and 20;

-- 4.4 find orders whose status is 'Not delivered'

select * from ordertwo where status ='Not delivered';


-- 4.5 find restaurants with cuisine IN(Indian,chinese)

select * from restaurants where cuisine in ('Indian','Chinese');

-- 4.6 find customers whose city starts with 'L'

select * from customers_medium where city like 'L%';

--------------------------------------------------------------------------------------

-- 5. JOINS

-- 5.1 display customer details along with their orders

select c.customer_id,c.city,o.order_id from customers_medium c inner join ordertwo o on c.customer_id = o.customer_id;

-- 5.2 display rest details for each order

select o.order_id,r.restaurant_id,r.cuisine,r.city,r.rating from ordertwo o inner join restaurants r on o.restaurant_id = r.restaurant_id;

-- 5.3 show all ordered items with quantity

select o.order_id,f.item_id,o.quantity,o.price from orderone o inner join food_items f on o.item_id = f.item_id;

-- 5.4 find customer city and rest city for each order 

-- here three tables are using customer table, rest table,ordertwo table becoz ordertwo table contains rest id and rest table contains rest id as common and order two table and cust table conatiains cust id as common 

select ot.order_id,c.city as customer_city ,r.city as restaurant_city from ordertwo ot inner join customers_medium c on ot.customer_id = c.customer_id inner join restaurants r on r.restaurant_id = ot.restaurant_id;

-- 5.5 find all menu items belongs to restaurants

select *  from food_items;

select r.restaurant_id,r.cuisine,r.city,f.item_id,f.price from restaurants r inner join food_items f on r.restaurant_id=f.restaurant_id;

-- 5.6 find total revenue generated by each restaurant

select ot.restaurant_id,sum(oo.quantity *oo.price) as total_sales from orderone oo inner join ordertwo ot on oo.order_id = ot.order_id group by ot.restaurant_id;

-- 5.7 find top 10 customers by no of orders 

select c.customer_id,count(ot.order_id) as total_orders from customers_medium c inner join ordertwo ot on c.customer_id = ot.customer_id group by c.customer_id order by total_orders desc limit 10;

-- 5.8 find restaurant wise total orders

select r.restaurant_id ,count(ot.order_id) as total_orders from restaurants r inner join ordertwo ot on r.restaurant_id=ot.restaurant_id group by r.restaurant_id

---------------------------------------------------------------------------------

-- 6. SUBQUERIES

-- 6.1 find restaurants having rating above avg rating

select * from restaurants where rating > (select avg(rating) from restaurants);

select avg(rating) from restaurants;

-- 6.2 find customers who placed more orders than average 

select customer_id ,count(order_id) as total_orders from ordertwo group by customer_id having count(order_id) > (select avg(order_count) from(select count(order_id) as order_count from ordertwo group by customer_id)as avg_orders);

-- 6.3 find most expensive menu item

select * from food_items;

select * from food_items where price = (select max(price) from food_items);

-- 6.4 find rest with high sales 

select ot.restaurant_id,sum(oo.quantity * oo.price) as total_sales from orderone oo inner join ordertwo ot on oo.order_id = ot.order_id group by ot.restaurant_id order by total_sales desc limit 1

-- 6.5 find restaurants whose revenue exceeds avg revenue 
-- here revenue and total sales had same formula like quantity *price

select ot.restaurant_id, sum(oo.quantity * oo.price) as total_sales from orderone oo inner join ordertwo ot on oo.order_id = ot.order_id group by ot.restaurant_id having sum(oo.quantity * oo.price) > (select avg(total_sales) from(select ot.restaurant_id, sum(oo.quantity * oo.price ) as total_sales from orderone oo inner join ordertwo ot on oo.order_id =ot.order_id group by ot.restaurant_id)as avg_sales);

-- 6.6 find customers who neve placed an order 

select * from customers_medium where customer_id not in  (select customer_id from ordertwo);

-- 6.7 find second highest restaurant rating

select max(rating) as second_highest_rating from restaurants where rating < (select max(rating) from restaurants);

select max(rating) from restaurants;

-----------------------------------------------------------------------------------

-- 7. TCL commands 

-- 7.1 create a transaction and commit it commit means save it

start transaction;

update restaurants set rating =4.5 where restaurant_id ='R001';
commit;

select * from restaurants;

-- 7.2 use savepoint before updating orders

start transaction;

savepoint sp1;

update ordertwo set status ='Delivered' where order_id ='O00008';

rollback to sp1;

select * from ordertwo;

commit;

-- 7.3 demonstrate rollback

start transaction;

update ordertwo set status = 'Cancelled' where order_id ='O00001';

rollback;

-- if we commit the update query even if we rollback it ,it does not deleted in original table becoz of commit


---------------------------------------------------------------------------------

-- 8. INDEX

-- 8.1 create an index on customer_id in ordertwo table

create table ordersqw(order_id varchar(90),customer_id varchar(80),restaurant_id varchar(90));

insert into ordersqw values('w345','p4567','k5678'),('w321','u789','k6789');
select * from ordersqw;
show indexes from ordersqw;
CREATE INDEX oiu_customer on ordersqw(order_id);

-- 8.2 composite index creation
create index idxe_customer_restaurant on ordersqw(order_id,customer_id,restaurant_id);

-- 8.3 display all indexes created 
show indexes from ordersqw;

-- 8.4 drop an index

drop index oiu_customer on ordersqw;

------------------------------------------------------------------------------------

-- 9. VIEWS

-- 9.1 create a view for restaurant sales


select * from restaurant_sales

-- 9.2create view for cust placed more orders than avg


select * from more_order_avg;
select * from more_order_avg where customer_id = 'C1017' ;

-- 9.3drop a view

drop view restaurant_sales;

--------------------------------------------------------------------------------------

-- 10. Stored procedures

-- 10.1 create a procedure to calculate res revenue


call res_revenue;

-- 10.2 create a procedure to find most expensive food item

call exp_food();

-- 10.3 drop exp_food

drop procedure exp_food;

---------------------------------------------------------------------















