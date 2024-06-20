declare
    n integer;
    b integer;
    num integer:= 0;
    re integer;
begin
    n := &n;
    b := n;

    while n > 0 loop
        re := mod(n, 10);
        num := num * 10 + re;
        n := trunc(n / 10); 
    end loop;

    if num = b then
       dbms_output.put_line('It is a palindrome: ' || b);
    else
       dbms_output.put_line('It is not a palindrome: ' || b);
    end if;
end;
/
