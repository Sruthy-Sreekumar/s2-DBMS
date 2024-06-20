* Create table customer(cust_id varchar(5), name varchar(10),salary int);
  CUSTOMER TABLE CREATED!
  
* Insert into customer values('C01','Shwetha','23000');
  Insert into customer values('C02','Sourabh','28000');
  Insert into customer values('C03','Tejas','43000');
  Insert into customer values('C04','Abhirami','53000');
  VALUES INSERTED!
  
* select * from customer;
  TABLE WILL BE SHOWN!

* In Text Editor type:-

  declare
   total_rows number (3);
   begin
   update customer set salary = salary + 2000;
   if sql%notfound then
     dbms_output.put_line('no customer selected');
   elsif sql%found then
     total_rows:=sql%rowcount;
     dbms_output.put_line(total_rows||'customer selected');
     end if;
     end;
     /

       
* @filename.sql

* Then check again whether any changes has been done within the customer table (select * from customer).


