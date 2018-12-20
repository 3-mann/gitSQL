CREATE OR REPLACE FUNCTION get_hire_date (emp_id NUMBER)
RETURN VARCHAR
RESULT_CACHE
AUTHID CURRENT_USER
IS
date_hired DATE;
BEGIN
SELECT hire_date INTO date_hired
from employees
WHERE employee_id = emp_id;
RETURN TO_CHAR(date_hired);
END;
/
SELECT get_hire_date(206) from DUAL;

create or replace TRIGGER go_pause_tr
  before insert or update or delete ON employees
BEGIN
    if TO_CHAR(sysdate, 'HH24:MI') >= '09:30'
        and TO_CHAR(sysdate, 'HH24:MI') <= '10:00' then
        DBMS_OUTPUT.PUT_LINE('1. Pause. Tschüss, bis gleich.');
    elsif TO_CHAR(sysdate, 'HH24:MI') >= '11:15'
        and TO_CHAR(sysdate, 'HH24:MI') <= '11:30' then  
        DBMS_OUTPUT.PUT_LINE('2. Pause. Tschüss, bis gleich.');
    elsif TO_CHAR(sysdate, 'HH24:MI') >= '13:00' then  
        DBMS_OUTPUT.PUT_LINE('---ab nach Hause');
    else
        DBMS_OUTPUT.PUT_LINE('...weitermachen.');
    end if;
END;
/

update employees set commission_pct = commission_pct * 1.1 where employee_id = 103;
/

select * from employees;


select TO_CHAR(sysdate, 'HH24:MI') from dual;