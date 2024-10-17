create database insurance_1BM23CS080;
use insurance_1BM23CS080;
CREATE TABLE PERSON
(
DRIVER_ID VARCHAR(10),
NAME VARCHAR(20),
ADDRESS VARCHAR(30),
PRIMARY KEY(DRIVER_ID));
DESC PERSON;
CREATE TABLE CAR(
REG_NUM VARCHAR(10),
MODEL VARCHAR(10),
YEAR INT,
PRIMARY KEY(REG_NUM));
DESC CAR;
CREATE TABLE OWNS(
DRIVER_ID VARCHAR(10),
REG_NUM VARCHAR(10),
PRIMARY KEY(DRIVER_ID,REG_NUM),
FOREIGN KEY(DRIVER_ID) REFERENCES PERSON(DRIVER_ID),
FOREIGN KEY(REG_NUM) REFERENCES CAR(REG_NUM));
DESC OWNS;
CREATE TABLE ACCIDENT(
REPORT_NUM INT,
ACCIDENT_DATE DATE,
LOCATION VARCHAR(20),
PRIMARY KEY(REPORT_NUM));
DESC ACCIDENT;
CREATE TABLE PARTICIPATED(
DRIVER_ID VARCHAR(10),
REG_NUM VARCHAR(10),
REPORT_NUM INT,
DAMAGE_AMOUNT INT,
PRIMARY KEY (DRIVER_ID,REG_NUM,REPORT_NUM),
FOREIGN KEY(DRIVER_ID)REFERENCES PERSON(DRIVER_ID),
FOREIGN KEY(REG_NUM)REFERENCES CAR(REG_NUM),
FOREIGN KEY(REPORT_NUM) REFERENCES ACCIDENT(REPORT_NUM)
);
insert into person values('A01','Richard','Srinivas nagar');
insert into person values('A02','Pradeep','Rajaji nagar');
insert into person values('A03','Smith','Ashok nagar');
insert into person values('A04','Venu','N R Colony');
insert into person values('A05','John','Hanumanth nagar');
insert into car values('KA052250','Indica',1990);
insert into car values('KA031181','Lancer',1957);
insert into car values('KA095477','Toyota',1998);
insert into car values('KA0523408','Honda',2008);
insert into car values('KA041702','Audi',2005);      
insert into accident values(11, '2003-01-01', 'Mysore Road');
insert into accident values (12,'2004-02-02','South end Circle');
insert into accident values (13,'2003-01-21','Bull temple Road');
insert into accident values (14,'2008-02-17','Mysore Road');
insert into accident values (15,'2004-03-05','Kanakpura Road');
insert into OWNs values('A01','KA052250');
insert into OWNs values('A02','KA031181');
insert into OWNs values('A03','KA095477');
insert into OWNs values('A04','KA0523408');
insert into OWNs values('A05','KA041702');
use insurance_1bm23cs080;
insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA031181',12,50000);
insert into participated values('A03','KA095477',13,25000);
insert into participated values('A04','KA0523408',14,3000);
insert into participated values('A05','KA041702',15,5000);
select * from person;
select * from car;
select * from owns;
select * from participated;
select * from accident;
update participated set damage_amount=25000
where reg_num='KA053408' AND report_num=12;
select count(distinct driver_id)CNT
FROM PARTICIPATED A,ACCIDENT b
WHERE A.REPORT_NUM=B.REPORT_NUM AND B.ACCIDENT_DATE LIKE '%08';
INSERT INTO ACCIDENT VALUES(16,'2008-03-08','Domlur');
select * from accident;
select accident_date,location from accident;
select driver_id from participated
where damage_amount>=25000;
select * from participated order by damage_amount desc;
select avg(damage_amount) from participated;
DELETE FROM participated
WHERE damage_amount < (
    SELECT avg_damage
    FROM (SELECT AVG(damage_amount) AS avg_damage FROM participated) AS avg_table
);
select * from participated;
show databases;
use insurance_1bm23cs080;
select * from participated;
SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID AND
DAMAGE_AMOUNT > (SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);
select max(damage_amount) from participated;