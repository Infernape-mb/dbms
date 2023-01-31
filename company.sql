create database if not exists company;
use company;

create table if not exists employee
(
	ssn integer not null primary key,
	ename char(20) not null,
	address varchar(30),
	sex char(10) ,
	salary integer ,
	superssn integer(6),
	dno integer(5)

);

create table if not exists department 
(
	dno integer not null primary key,
	dname varchar(20),
	mgrssn integer not null,
	mgrstartdate DATE,
	foreign key (mgrssn) references employee(ssn) 
);

create table if not exists dlocation
(
	dno integer not null,
	dloc varchar(30),
	foreign key (dno) references department(dno) on delete cascade
);

create table if not exists project
(
	pno integer not null primary key,
	pname varchar(20),
	ploc varchar(25),
	dno integer not null,
	foreign key (dno) references department(dno)
	on delete cascade
);

create table if not exists workson
(
	ssn integer not null,
	pno integer not null,
	hours integer ,
	foreign key (ssn) references employee(ssn),
	foreign key (pno) references project(pno) 
);

insert into employee values
(000,"kartik","nelamangal,bangalure","M",150000,002,1),
(001,"Ramesh","mysuru","M",320000,002,1),
(002,"Sushma","siddapur","F",4500000,null,1),
(003,"Radhika","mumbai","F",340000,004,2),
(004,"madhu","sirsi","M",10000000,null,2),
(005,"partha","hubli","M",34000,004,3),
(006,"rohan","mandya","M",230000,null,3);

insert into department values 
(1,"R&D",002,"2022-01-01"),
(2,"management",004,"2022-02-12"),
(3,"marketing",006,"2018-05-06");

insert into dlocation values 
(1,"Uttara halli,Bangalure"),
(2,"Banashankari,Bangalure"),
(3,"pune,Maharashtra");

insert into project values
(200,"new team","pune,Maharashtra",2),
(100,"quantum computing","Uttara halli,Bangalure",1);

insert into workson values
(000,100,10),
(001,100,12),
(002,100,15),
(003,200,7),
(004,200,13);

--1.	Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’, either as a worker or as a manager of the department that controls the project. 
select p.pno from project p 
join employee on p.dno=employee.dno and ename like "%ma";

--2.	Show the resulting salaries if every employee working on the ‘IoT’ project is given a 10 percent raise. 
update employee 
set salary=salary*1.1
where dno in (select dno from project where pname="quantum computing");

--3.	Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the maximum salary, the minimum salary, and the average salary in this department 

select sum(salary)as total_salary,max(salary)as maximum_salary,min(salary) as minimum_salary,round(avg(salary),8)as average_salary from employee 
where dno in (select dno from department where dname="R&D");

--4.	Retrieve the name of each employee who works on all the projects controlled by department number 5 (use NOT EXISTS operator).
select ename from employee where  exists  (select dno from project where dno=1 and employee.dno=project.dno);

--5.	For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than Rs. 6,00,000.
select department.dno,count(*) from employee
join department on department.dno=employee.dno
where employee.salary>1000
group by department.dno 
having count(*)<3;