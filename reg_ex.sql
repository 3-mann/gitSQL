
--ich hätte da ein Statement zur Aufgabe mit den Vokalen aber mir wird selber schon langsam schwindelig.... ;)
select first_name, last_name, length(to_char(salary)) sal_stellen, replace(regexp_replace(lower(first_name ||

                    last_name), '[bcdfghjklmnpqrstvwxyz]', ''), ' ', '') vocale,

        length(replace(regexp_replace(lower(first_name ||

                    last_name), '[bcdfghjklmnpqrstvwxyz]', ''), ' ', '')) vocsnr

from employees e

where length(replace(regexp_replace(lower(first_name ||

                    last_name), '[bcdfghjklmnpqrstvwxyz]', ''), ' ', '')) > (select length(to_char(i.salary)) from employees i

                                                                              where i.employee_id = e.employee_id); 


SELECT last_name, replace(regexp_replace(lower(first_name || last_name), '[bcdfghjklmnpqrstvwxyz]', ''), ' ', '') vocale, 
regexp_replace(lower(first_name || last_name), '[bcdfghjklmnpqrstvwxyz]', '') schritt,
length(replace(regexp_replace(lower(first_name ||last_name), '[bcdfghjklmnpqrstvwxyz]', ''), ' ', '')) vocsnr,
LENGTH (regexp_replace(lower(first_name ||last_name), '[bcdfghjklmnpqrstvwxyz]', '')) schrittt2
FROM employees ;
