


create database bank_1BM23CS080;
 use bank_1BM23CS080;

create table branch (
branch_name varchar(25), branch_city varchar(15),
assets int,
primary key (branch_name)
);

create table bank_account ( accno int,
branch_name varchar(25), balance int,
primary key (accno),
foreign key (branch_name) references branch(branch_name)
);

create table bank_customer ( customer_name varchar(10),
customer_street varchar(25), customer_city varchar(15), primary key (customer_name)
);

create table depositer (
customer_name varchar(10), accno int,
primary key(customer_name, accno),
foreign key (customer_name) references bank_customer(customer_name), foreign key
(accno) references bank_account(accno)
);

create table loan (
loan_number int, branch_name varchar(25), amount int,
primary key (loan_number),
foreign key (branch_name) references branch(branch_name)
);

insert into branch values('SBI_Chamrajpet', 'Bangalore', 50000);
insert into branch values('SBI_ResidencyRoad', 'Bangalore', 10000);
insert into branch values('SBI_ShivajiRoad', 'Bombay', 20000);
insert into branch values('SBI_ParliamentRoad', 'Delhi', 10000);
insert into branch values('SBI_Jantarmantar', 'Delhi', 20000);


insert into bank_account values(1, 'SBI_Chamrajpet', 2000);
insert into bank_account values(2, 'SBI_ResidencyRoad', 5000);
insert into bank_account values(3, 'SBI_ShivajiRoad', 6000);
insert into bank_account values(4, 'SBI_ParliamentRoad', 9000);
insert into bank_account values(5, 'SBI_Jantarmantar', 8000);
insert into bank_account values(6, 'SBI_ShivajiRoad', 4000);
insert into bank_account values(8, 'SBI_ResidencyRoad', 4000);
insert into bank_account values(9, 'SBI_ParliamentRoad', 3000);
insert into bank_account values(10, 'SBI_ResidencyRoad', 5000);
insert into bank_account values(11, 'SBI_Jantarmantar', 2000);
insert into bank_customer values ('Avinash', 'Bull_Temple_Road', 'Bangalore');
insert into bank_customer values ('Dinesh', 'Bannergatta_Road', 'Bangalore');
insert into bank_customer values ('Mohan', 'National_College_Road', 'Bangalore');
insert into bank_customer values ('Nikhil', 'Akbar_Road', 'Delhi');
insert into bank_customer values ('Ravi', 'Prithviraj_Road', 'Delhi');

insert into depositer values('Avinash', 1); insert into depositer values('Dinesh', 2);
insert into depositer values('Nikhil', 4); insert into depositer values('Ravi', 5);
insert into depositer values('Avinash', 8); insert into depositer values('Nikhil', 9);
insert into depositer values('Dinesh', 10); insert into depositer values('Nikhil', 11);


insert into loan values(1, 'SBI_Chamrajpet', 1000);
insert into loan values(2, 'SBI_ResidencyRoad', 2000);
insert into loan values(3, 'SBI_ShivajiRoad', 3000);
insert into loan values(4, 'SBI_ParliamentRoad', 4000);
insert into loan values(5, 'SBI_Jantarmantar', 5000);
SELECT * FROM BRANCH;
SELECT * FROM bANK_ACCOUNT;
SELECT * FROM BANK_CUSTOMER;
SELECT * FROM DEPOSITER;
SELECT * FROM LOAN;
alter table branch
change assets assets_in_lakhs real ;
select * from branch;
select d.customer_name from depositer d,
Bank_account b where b.branch_name='SBI_RESIDENCYROAD'
and d.ACCNO=b.accno group by d.customer_name
having count(d.accno)>=2;
create view sum_of_loan
as select branch_name,sum(balance)
from bank_account
group by branch_name;
select * from sum_of_loan;

