

select  first_name
        , last_name
        , length    (   to_char(salary) ) "FiguresSalary"
        , regexp_replace(lower(first_name || last_name), '[bcdfghjklmnpqrstvwxyz]', '') "VocalsOnly"
        , length    (   regexp_replace(lower(first_name || last_name), '[bcdfghjklmnpqrstvwxyz]', '')) "VocalsCount"
from    employees e
where   length(regexp_replace(lower(first_name || last_name), '[bcdfghjklmnpqrstvwxyz]', '')) 
        >   (   select length(  to_char(i.salary)   ) 
                from employees i
                where i.employee_id = e.employee_id     ); 
                                                                              

SELECT  first_name||' '||last_name "Name"
        , salary    "Gehalt"
        , length    (   to_char(salary) ) "LängeGehalt"
        , regexp_replace(lower(first_name || last_name), '[bcdfghjklmnpqrstvwxyz]', '') "Vokale"
        , LENGTH (regexp_replace(lower(first_name ||last_name), '[bcdfghjklmnpqrstvwxyz]', '')) "Anzahl"
FROM employees
where length(  to_char(salary) ) < LENGTH (regexp_replace(lower(first_name ||last_name), '[bcdfghjklmnpqrstvwxyz]', ''));
