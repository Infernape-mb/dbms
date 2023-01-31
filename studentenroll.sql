create table if not exists student(
	regno varchar(15) not null primary key,
	sname char(20) not null,
	major char(20) not null,
	bdate date
);

create table if not exists course(
	c_id INTEGER not null primary key,
	cname char(20) not null,
	dept char(20) not null
);


CREATE TABLE IF NOT EXISTS text_book (
    bookISBN INTEGER NOT NULL PRIMARY KEY,
    book_title VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL
);

create table if not exists enroll
(
	reg varchar(20) not null,
	course integer not null,
	sem integer,
	marks integer not null,
	FOREIGN key (reg) references student(regno) on DELETE CASCADE,
	Foreign key (course) references course(c_id) on delete cascade
);

CREATE TABLE IF NOT EXISTS book_adoption (
    c_id INTEGER NOT NULL,
    sem INTEGER ,
    bookISBN INTEGER NOT NULL,
    FOREIGN KEY(bookISBN) REFERENCES text_book(bookISBN)
    ON DELETE CASCADE,
    FOREIGN KEY(c_id) REFERENCES course(c_id) ON DELETE CASCADE
);

INSERT INTO student VALUES
("01HF235", "Student_1", "Computer Engineering", "2001-05-15"),
("01HF354", "Student_2", "Literature", "2002-06-10"),
("01HF254", "Student_3", "Philosophy", "2000-04-04"),
("01HF653", "Student_4", "History", "2003-10-12"),
("01HF234", "Student_5", "Economics", "2001-10-10");

INSERT INTO course VALUES
(001, "Computer Engineering", "CS"),
(002, "Literature", "English"),
(003, "Philosophy", "Philosphy"),
(004, "History", "Social Science"),
(005, "Economics", "Social Science");

INSERT INTO enroll VALUES
("01HF235", 001, 5, 85),
("01HF354", 002, 6, 87),
("01HF254", 003, 3, 95),
("01HF653", 004, 3, 80),
("01HF234", 005, 5, 75);


INSERT INTO text_book VALUES
(241563, "Operating Systems", "McGraw Hill", "Silberschatz"),
(532678, "Merchant of Venice", "Oxford", "Shakesphere"),
(453723, "Immanuel Kant", "Delphi Classics", "Immanuel Kant"),
(278345, "History of the world", "The Times", "Richard Overy"),
(426784, "Behavioural Economics", "Hot Science", "David Orrel");

INSERT INTO book_adoption VALUES
(001, 5, 241563),
(002, 6, 532678),
(003, 3, 453723),
(004, 3, 278345),
(001, 6, 426784);