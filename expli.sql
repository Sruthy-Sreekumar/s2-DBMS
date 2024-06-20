* Create table customer(cust_id varchar(5), name varchar(10),salary int);
CUSTOMER TABLE CREATED!
  
* Insert into customer values('C01','Shwetha','23000');
  Insert into customer values('C02','Sourabh','28000');
  Insert into customer values('C03','Tejas','43000');
  Insert into customer values('C04','Abhirami','53000');
VALUES INSERTED!
  
select * from customer;
TABLE WILL BE SHOWN!

In Text Editor type:-
  
declare
   c_id customer.id%type;
   c_name customer.name%type;
   c_salary customer.salary%type;
   cursor ci is select id,name.salary from customer;
begin
   open ci;
   loop
   fetch ci into c_id,c_name,c_salary;
   exit when ci%notfound;
   dbms_output.put_line(c_id||' '||c_name||' '||c_salary);
   end loop;
   close ci;
   end;
   /
     
* @filename.sql
     
* Then check again whether any changes has been done within the customer table (select * from customer).
