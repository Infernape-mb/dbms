CREATE database if not EXISTS insurance;
USE insurance;
CREATE TABLE IF NOT EXISTS person (
d_id varchar(10) not null primary key,
d_name TEXT NOT NULL,
address TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS car (
reg_no varchar(20) not null primary key,
model TEXT NOT NULL,
year INTEGER
);

CREATE TABLE IF NOT EXISTS accident (
report_no INTEGER not null primary key,
acc_date DATE,
location TEXT
);

CREATE TABLE IF NOT EXISTS owns (
d_id varchar(10) not null,
reg_no varchar(20) not null,
foreign key(d_id) references person(d_id) on delete cascade,
foreign key(reg_no) references car(reg_no) on delete cascade
);

CREATE TABLE IF NOT EXISTS participated (
d_id varchar(10) not null,
reg_no varchar(20) not null,
report_no INTEGER NOT NULL,
damage_amt INTEGER NOT NULL,
foreign key(d_id) references person(d_id) on delete cascade,
foreign key(reg_no) references car(reg_no) on delete cascade,
foreign key(report_no) references accident(report_no) on delete cascade
);

INSERT INTO person VALUES
("D001", "Driver_1", "Kuvempunagar, Mysuru"),
("D002", "Driver_2", "Vijaynagar S2, Mysuru"),
("D003", "Driver_3", "Udaygiri, Mysuru"),
("D004", "Driver_4", "Rajivnagar, Mysuru"),
("D005", "Driver_5", "TIlaknagar, Mysuru");

INSERT INTO car VALUES
("KA-20-AB-4223", "Swift", 2020),
("KA-20-BC-5674", "Nano", 2017),
("KA-09-EP-6753", "Uva", 2015),
("KA-51-PL-2020", "Omni", 2019),
("KA-01-CM-2022", "Alto", 2018);

INSERT INTO accident VALUES
(43627, "2020-04-05", "Nazarbad, Mysuru"),
(56345, "2019-12-16", "Gokulam, Mysuru"),
(63744, "2020-05-14", "Vijaynagar Stage 2, Mysuru"),
(54634, "2019-08-30", "Kuvempunagar, Mysuru"),
(65738, "2021-01-21", "JSS Layout, Mysuru");

INSERT INTO owns VALUES
("D001", "KA-20-AB-4223"),
("D002", "KA-20-BC-5674"),
("D003", "KA-09-EP-6753"),
("D004", "KA-51-PL-2020"),
("D005", "KA-01-CM-2022");

INSERT INTO participated VALUES
("D001", "KA-20-AB-4223", 43627, 20000),
("D002", "KA-20-BC-5674", 56345, 10000),
("D003", "KA-09-EP-6753", 63744, 30000),
("D004", "KA-51-PL-2020", 54634, 35000),
("D005", "KA-01-CM-2022", 65738, 31233);

ALTER TABLE participated MODIFY damage_amt INTEGER;
ALTER TABLE accident MODIFY location varchar(30);
ALTER TABLE accident MODIFY acc_date DATE NOT NULL;

SELECT * FROM person;
SELECT * FROM car;
SELECT * FROM accident;
SELECT * FROM owns;
SELECT * FROM participated;

UPDATE participated SET damage_amt = 21500 WHERE d_id = "D004";

DELETE FROM person WHERE d_id = "D005";
DELETE FROM car WHERE reg_no = "KA-09-EP-6753";

SELECT * FROM person;
SELECT * FROM car;
SELECT * FROM accident;
SELECT * FROM owns;
SELECT * FROM participated;