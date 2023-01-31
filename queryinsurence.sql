--1.	Find the total number of people who owned cars that were involved in accidents in 2021.
select count(reg_no) from participated p,accident a where p.report_no=a.report_no and a.acc_date>="2020-01-01";
--2.	Find the number of accidents in which the cars belonging to “Smith” were involved. 
select count(a.report_no) from accident a, participated pt,person p where 
pt.d_id in (select d_id from person where d_name="Driver_1")
and 
a.report_no=pt.report_no; 
--or
select count(d_id) from person p
where 
p.d_name="Driver_1" and
p.d_id in (select d_id from participated inner join accident on accident.report_no=participated.report_no);

--3.	Add a new accident to the database; assume any values for required attributes. 
INSERT into accident values 
();

--4.	Delete the Maruti belonging to “Smith”
delete from car c 
where c.model="Alto"
and 
c.reg_no in (select reg_no from owns where d_id in (select d_id from person where d_name="Driver_4"));

--5.	Update the damage amount for the car with license number “KA09MA1234” in the accident with report
update participated set damage=30000 where reg_no="KA-20-AB-4773";

delimiter//
create trigger