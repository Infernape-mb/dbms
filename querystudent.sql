--2.	Produce a list of text books (include Course #, Book-ISBN, Book-title) in the alphabetical order for courses offered by the ‘CS’ department that use more than two books. 
select * from text_book where bookISBN in(select bookISBN from book_adoption where c_id in (select c_id from course ));

--4.	List the students who have scored maximum marks in ‘DBMS’ course.
select * from student  where regno in (select reg from enroll where course in (select c_id from course where cname="Botony"));
--or 
select * from student s,enroll e,course c where s.regno=e.reg and e.course=c.c_id and c.cname="Botony";

--5.	Create a view to display all the courses opted by a student along with marks obtained. 
create view details as select s.regno,s.sname,s.major,s.bdate,course.c_id,course.cname,course.dept,enroll.marks from student s 
inner join enroll  on s.regno=enroll.reg
inner join course  on enroll.course=course.c_id;

--trigger to prevent student who are underage from entering details to student table
DELIMITER //
CREATE TRIGGER newentry
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
 IF NEW.bdate >= "2005-01-01" THEN 
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = "You are too young for this course";
 END IF;
END //
DELIMITER ;
