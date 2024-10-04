create database chiraiya_080;
use chiraiya_080;
create table person_080(
driver_id varchar(10),
name  varchar(20),
address varchar(20),
primary key(driver_id));

desc person_080;

create table car_080(
reg_num varchar(20),
model varchar(10),
year int,
primary key(reg_num));

desc car_080;

create table accidentt_080 (
report_num int,
accident_date date,
location varchar(20),
primary key(report_num));

desc accidentt_080;

create table owns_080(
driver_id varchar(10),
reg_num varchar(10),
primary key(driver_id, reg_num),
foreign key(driver_id) references person_080(driver_id),
foreign key(reg_num) references car_080(reg_num));

desc owns_080;

create table participatedd_080(
driver_id varchar (10),
reg_num varchar(20),
report_num int, 
damage_amount int,
primary key(driver_id, reg_num, report_num),
foreign key(driver_id) references person_080(driver_id),
foreign key(reg_num) references car_080(reg_num),
foreign key(report_num) references accidentt_080(report_num));

desc participated_080;

insert into person_080 values('A01','RICHARD','SRINIVAS NAGAR');
insert into person_080 values('A02','PRADEEP','RAJAJI  NAGAR');
insert into person_080 values('A03','SMITH','ASHOK NAGAR');
insert into person_080 values('A04','VENU','N R COLONY');
insert into person_080 values('A05','JHON','HANUMANTH NAGAR');

insert into car_080 values('KA052250','INDICA',1990);
insert into car_080 values('KA031181','LANCER',1957);
insert into car_080 values('KA095477','TOYOTA',1998);
insert into car_080 values('KA053408','HONDA',2008);
insert into car_080 values('KA041702','AUDI',2005);

insert into accidentt_080 values(11,'01-01-03','MYSORE ROAD');
insert into accidentt_080 values(12,'02-02-04','SOUTH END CIRCLE');
insert into accidentt_080 values(13,'21-01-03','BULL TEMPLE ROAD');
insert into accidentt_080 values(14,'17-02-08','MYSORE ROAD');
insert into accidentt_080 values(15,'04-03-05','MYSORE ROAD');

insert into owns_080 values('A01','KA052250');
insert into owns_080 values('A02','KA053408');
insert into owns_080 values('A03','KA031181');
insert into owns_080 values('A04','KA095477');
insert into owns_080 values('A05','KA041702');

insert into participatedd_080 values('A01','KA052250',11,10000);
insert into participatedd_080 values('A02','KA053408',12,50000);
insert into participatedd_080 values('A03','KA031181',13,25000);
insert into participatedd_080 values('A04','KA095477',14,3000);
insert into participatedd_080 values('A05','KA041702',15,5000);

select accident_date,location
from accidentt_080;

update participatedd_080
set damage_amount=25000
where reg_num='KA053408' and report_num=12;

insert into accidentt_080 values(16,'06-08-04','MG ROAD');

select *
from accidentt_080;

select accident_date,location
from accidentt_080;

select driver_id
from participatedd_080
where damage_amount >= 25000;

select *
from participatedd_080
order by damage_amount desc;

select avg(damage_amount)
from participatedd_080;

delete from participatedd_080 
where damage_amount<(select avg(damage_amount) from participatedd_080);

select name 
from person_080 A, participatedd_080 B
where A.driver_id=B.driver_id and damage_amount<(select avg(damage_amount) from participatedd_080);

select max(damage_amount)
from participatedd_080;