declare
n integer;
f integer;
i integer;
begin
f:=1;
n:=&n;
for i in 1..n
loop
f:=f*i;
end loop;
dbms_output.put_line('factorial is:'||f);
end;
/
