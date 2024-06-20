sqlplus sys as sysdba

SQL*Plus: Release 11.2.0.2.0 Production on Tue Apr 16 14:20:59 2024

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: Oracle

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production


create user sruthy identified by sruthy1;

User created.


SQL> grant connect, resource to sruthy;

Grant succeeded.

SQL> exit;

ec@user:~$ sqlplus sruthy as sysdba

SQL*Plus: Release 11.2.0.2.0 Production on Tue Apr 16 14:25:07 2024

Copyright (c) 1982, 2011, Oracle.  All rights reserved.

Enter password: 
ERROR:
ORA-01031: insufficient privileges


Enter user-name: sruthy
Enter password: 

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> create table customer(c_id int primary key,e_name varchar(15),salary int);

Table created.

SQL> desc customer;
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 C_ID					   NOT NULL NUMBER(38)
 E_NAME 					    VARCHAR2(15)
 SALARY 					    NUMBER(38)

 @triggerr.sql type code in texteditor as trigger.sql or whatever name you want

create or replace trigger t1 before insert or delete or update on customer for each row 
when(new.c_id>0)
declare
	sal_diff number;
	begin
		sal_diff:=:new.salary-:old.salary;
		dbms_output.put_line('old salary '||:old.salary);
		dbms_output.put_line('new salary '||:new.salary);
		dbms_output.put_line('salary difference '||sal_diff);
	end;
/


After that run the code @trigger.sql 
AND
SQL> @trigger.sql

Trigger created.
insert into customer values('101','abhishek','200000');

1 row created.SQL> insert into customer values(102,'nayan','300000');

1 row created.

SQL> insert into customer values(103,'sam','40000');

1 row created.

SQL> insert into customer values(104,'shwetha','20000');

1 row created.

SQL> insert into customer values(105,'sruthy','30000');

1 row created.

SQL> select * from customer;

      C_ID E_NAME	       SALARY
---------- --------------- ----------
       101 abhishek	       200000
       102 nayan	       300000
       103 sam			40000
       104 shwetha		20000
       105 sruthy		30000


SQL> update customer set salary=3000 where c_id=101;

1 row updated.

SQL> select * from customer;

      C_ID E_NAME	       SALARY
---------- --------------- ----------
       101 abhishek		 3000
       102 nayan	       300000
       103 sam			40000
       104 shwetha		20000
       105 sruthy		30000

SQL> set serveroutput on     
SQL> @triggerr.sql

Trigger created.

SQL> update customer set salary=3000 where c_id=101;
old salary 3000
new salary 3000
salary difference 0

1 row updated.

SQL> update customer set salary=3000 where c_id=102;
old salary 300000
new salary 3000
salary difference -297000

1 row updated.

SQL> 


SQL> delete from customer where c_id=104;

1 row deleted.

SQL> select * from customer;

      C_ID E_NAME	       SALARY
---------- --------------- ----------
       101 abhishek		 3000
       102 nayan		 3000
       103 sam			40000
       105 sruthy		30000



