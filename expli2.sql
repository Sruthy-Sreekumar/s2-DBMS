declare
Cid CUST.Cust_id%type;
Cname CUST.C_name%type;
Csalary CUST.salary%type;
Caddress CUST.address%type;
cursor c1 is select Cust_id,C_name,salary,address from CUST;
begin
open c1;
loop
fetch c1 into Cid,Cname,Csalary,Caddress;
exit when c1%notfound;
dbms_output.put_line(Cid||' '||Cname||' '||Csalary||' '||Caddress);
if Cid='cs1' then
 Csalary:=Csalary+1000;
elsif Cid='cs2' then
 Csalary:=Csalary+2000;
elsif Cid='cs3' then
 Csalary:=Csalary+5000;
end if;
update CUST set salary=Csalary where Cust_id=Cid;
end loop;
close c1;
end;
/

