create database Employee_1BM23CS080;

use Employee_1BM23CS080;
create table dept(no varchar(20) primary key,
 dname varchar(20),
 dloc varchar(20));

create table employee(empno int,
ename varchar(20),
mgr_no int,
hiredate varchar(20),
 sal float,
no varchar(20),
primary key(empno,no), 
foreign key(no) references dept(no));
create table incentives(empno int,
 date VARCHAR(20)
 , amt float
 ,primary key(empno,date),
 foreign key(empno) references employee(empno));
create table project(pno int primary key, 
ploc VARCHAR(20),
pname varchar(20));
create table Assingnedto(empno int,
 pno int,
 job_role text, 
 primary key(empno,pno),
 foreign key(empno) references employee(empno),
 foreign key(pno) references project(pno));

insert into dept values(1,"cse","pj");
insert into dept values(2,"ise","pj");
insert into dept values(3,"csds","pg");
insert into dept values(4,"ece","pg");
insert into dept values(5,"aiml","pj");
insert into employee values(101,"mdr",100,"12/01/1999",100000,1);
insert into employee values(201,"sak",200,"17/01/2020",50000,2);
insert into employee values(301,"grp",100,"01/09/2004",30000,3);
insert into employee values(401,"sws",101,"03/08/2000",10000,4);
insert into employee values(501,"sks",101,"29/2/2008",90000,5);
insert into incentives values(101,"12/03/2004",50000);
insert into incentives values(201,"17/03/2024",25000);
insert into incentives values(301,"01/12/2019",15000);
insert into incentives values(401,"03/11/2019",5000);
insert into incentives values(501,"29/4/2019",45000);


insert into project values(10,"bng","chatbot");
insert into project values(40,"delhi","ml model");
insert into project values(50,"bombay","blockchain");
insert into project values(30,"chennai","stocks");
insert into project values(80,"mysore","android app");
insert into Assingnedto values(101,10,"devops");
insert into Assingnedto values(201,40,"sde");
insert into Assingnedto values(301,50,"manager");
insert into Assingnedto values(401,30,"jpa");
insert into Assingnedto values(501,80,"pa");
insert into project values(90, 'hyderabad', 'web app');
delete from incentives where empno = 401;
update dept set dloc = 'bng' where no = 1;
select * from dept;
select * from EMPLOYEE;
select * from INCENTIVES;
select * from PROJECT;
select * from Assingnedto;

SELECT EMPNO
FROM ASSINGNEDTO AT,PROJECT P
WHERE AT.PNO=P.PNO AND PLOC IN('BNG','HYDERABAD','MYSORE');
select e.empno
from employee e
where e.empno != all(select i.empno from incentives i);

SELECT ENAME,E.EMPNO,DNAME,JOB_ROLE,DLOC,PLOC
FROM DEPT D,EMPLOYEE E,PROJECT P,ASSINGNEDTO AT
WHERE D.NO=E.NO AND E.EMPNO=AT.EMPNO AND P.PNO=AT.PNO AND D.DLOC=P.PLOC;

SELECT E.EMPNO, E.ENAME, AT.PNO, P.PNAME, AT.JOB_ROLE
FROM EMPLOYEE E
LEFT JOIN ASSINGNEDTO AT ON E.EMPNO = AT.EMPNO
LEFT JOIN PROJECT P ON AT.PNO = P.PNO;

SELECT E.EMPNO, E.ENAME, SUM(I.AMT) AS TOTAL_INCENTIVE
FROM EMPLOYEE E
JOIN INCENTIVES I ON E.EMPNO = I.EMPNO
GROUP BY E.EMPNO, E.ENAME;

SELECT P.PNAME, P.PLOC
FROM PROJECT P
JOIN ASSINGNEDTO AT ON P.PNO = AT.PNO
WHERE AT.JOB_ROLE = 'manager';

SELECT D.DNAME, COUNT(E.EMPNO) AS NUM_EMPLOYEES
FROM DEPT D
LEFT JOIN EMPLOYEE E ON D.NO = E.NO
GROUP BY D.DNAME;

SELECT E.EMPNO, E.ENAME
FROM EMPLOYEE E
LEFT JOIN ASSINGNEDTO AT ON E.EMPNO = AT.EMPNO
WHERE AT.PNO IS NULL;

SELECT E.EMPNO, E.ENAME, D.DNAME, D.DLOC
FROM EMPLOYEE E
JOIN DEPT D ON E.NO = D.NO;

SELECT E.EMPNO, E.ENAME, E.MGR_NO, E.HIREDATE, E.SAL, D.DNAME
FROM EMPLOYEE E
JOIN DEPT D ON E.NO = D.NO
WHERE E.MGR_NO = 101;

SELECT P.PNAME, P.PLOC, COUNT(AT.EMPNO) AS NUM_EMPLOYEES
FROM PROJECT P
JOIN ASSINGNEDTO AT ON P.PNO = AT.PNO
GROUP BY P.PNAME, P.PLOC;

SELECT E1.EMPNO, E1.ENAME, E2.EMPNO AS MGR_EMPNO, D.DNAME, D.DLOC
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.MGR_NO = E2.EMPNO
JOIN DEPT D ON E1.NO = D.NO;

SELECT E.EMPNO, E.ENAME, COUNT(I.DATE) AS NUM_INCENTIVES, SUM(I.AMT) AS TOTAL_INCENTIVES
FROM EMPLOYEE E
JOIN INCENTIVES I ON E.EMPNO = I.EMPNO
GROUP BY E.EMPNO, E.ENAME;

SELECT E.EMPNO, E.ENAME, P.PNAME, AT.JOB_ROLE
FROM EMPLOYEE E
JOIN ASSINGNEDTO AT ON E.EMPNO = AT.EMPNO
JOIN PROJECT P ON AT.PNO = P.PNO
WHERE AT.JOB_ROLE = 'devops';

SELECT D.DNAME, AVG(E.SAL) AS AVG_SALARY
FROM EMPLOYEE E
JOIN DEPT D ON E.NO = D.NO
GROUP BY D.DNAME;