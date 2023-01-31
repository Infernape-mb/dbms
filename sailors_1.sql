CREATE database if not exists sailor; 
use sailor;
CREATE table if not exists sailors(
    s_id varchar(5) not null primary key,
    sname text not null,
    rating integer not null,
    age integer
);
CREATE table if not exists boats(
    bid varchar(5) not null primary key,
    bname text not null,
    color text not null
);
CREATE TABLE IF NOT EXISTS rservers (
    s_id varchar(5) not null,
    bid varchar(5) not null,
    s_date DATE,
    foreign key(s_id) references sailors(s_id) on delete cascade,
    foreign key(bid) references boats(bid) on delete cascade
);
INSERT INTO sailors VALUES
("S111","Sailor_1",4,23),
("S222","Sailor_2",2,20),
("S333","Sailor_3",5,26),
("S444","Sailor_4",4,30),
("S555","Sailor_5",5,25);

INSERT INTO boats VALUES
("B111", "Billy", "Black"),
("B222", "Lily", "Lilac"),
("B333", "Ranger", "Green"),
("B444", "Hilly", "White"),
("B555", "Brad", "Brown");

INSERT INTO rservers VALUES
("S111", "B444", "2020-04-05"),
("S222", "B222", "2019-12-16"),
("S333", "B111", "2020-05-05"),
("S444", "B333", "2019-11-09"),
("S555", "B555", "2021-10-19");

ALTER TABLE sailors MODIFY age INTEGER NOT NULL;
ALTER TABLE sailors MODIFY rating INTEGER;
ALTER TABLE rservers MODIFY s_date DATE NOT NULL;

SELECT * FROM sailors;
SELECT * FROM boats;
SELECT * FROM rservers;

INSERT INTO sailors VALUES 
("S666", "Sailor_6", 2, 19);

INSERT INTO boats VALUES
("B666", "Hilly", "Yellow");

INSERT INTO rservers VALUES
("S666", "B666", "2021-12-21");

UPDATE sailors SET rating = 4 WHERE s_id = "S666";

DELETE FROM sailors WHERE s_id = "S222";
DELETE FROM boats WHERE bid = "B222";
DELETE FROM rservers WHERE s_id = "S222";

SELECT * FROM sailors;
SELECT * FROM boats;
SELECT * FROM rservers;
