--1.	List the Order# and Ship_date for all orders shipped from Warehouse# "W2".
select o.order_id,o.o_date from orders o,shipment s 
where o.order_id=s.order_id
and s.w_id=101;

--2.	List the Warehouse information from which the Customer named "Kumar" was supplied his orders. Produce a listing of Order#, Warehouse#.
select o.order_id,s.w_id from orders o,shipment s,customer c where 
c.cust_id=o.cust_id and c.cname="C1" and
o.order_id=s.order_id;

--3.	Produce a listing: Cname, #ofOrders, Avg_Order_Amt, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer. (Use aggregate functions)
select c.cname,count(o.cust_id),avg(order_amt) from customer c, orders o
where c.cust_id=o.order_id 
group by c.cname;

--4.	Delete all orders for customer named "Kumar".
delete from orders where 
orders.cust_id in (select cust_id from customer where cname="Kumar"); 

--5.	Find the item with the maximum unit price.
select * from item where unit_price in (select max(unit_price)from item);