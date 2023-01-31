-- select the colors of boats reserved by albert
select color from boats where bid in (select bid from rservers where s_id in (select s_id from sailors where sname="Sailor_1"));

--2.	Find all sailor id’s of sailors who have a rating of at least 8 or reserved boat 103
select s_id from sailors where rating>=5 
union
select s_id from rservers where bid="B333";

--3.	Find the names of sailors who have not reserved a boat whose name contains the string “storm”. Order the names in ascending order.
select s.sname from sailors s where s_id not in (select r.s_id from rservers r );

--5. 	Find the name and age of the oldest sailor.
select s.sname,s.age from sailors s where s.age in (select max(age) from sailors );

--6.	For each boat which was reserved by at least 5 sailors with age >= 40, find the boat id and the average age of such sailors.
select r.bid,avg(age) from boats b,sailors s, rservers r where r.s_id in (select s_id from sailors where age>=25 )
group by r.bid;
--or
select b.bid , avg(s.age)
from sailors s, boats b, rservers r
WHERE r.s_id=s.s_id and r.bid=b.bid and s.age>=24
group by b.bid;

--create a view
create view alldetails as 
select s.sname,b.bname from sailors s,boats b,rservers r where s.s_id=r.s_id and r.bid=b.bid;

--triggers 
delimiter //
create trigger boatdelete before delete on boats for each row 
begin
 if old.bid in (select bid from rservers)
 then 
 signal sqlstate '45000'
 set message_text="Can't delete this row!!";
 end if;
 end//