declare
    n integer;
    reversed_number integer := 0;
    re integer;
begin
    n := &n;
    while n > 0 loop
    re := mod(n, 10);
    reversed_number := reversed_number * 10 + re;
    n := trunc(n / 10);
    end loop;
  dbms_output.put_line('The reverse of the number ' || n || ' is: ' || reversed_number);
end;
/
