declare
    n integer;
    s integer:= 0;
    re integer;
begin
    n := &n;
    while n > 0 loop
        re := mod(n, 10);
        s := s + re;
        n := trunc(n / 10);
    end loop;
    dbms_output.put_line('The sum of the digits of the number ' || n || ' is: ' || s);
end;
/
