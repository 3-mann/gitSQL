--Execute this demo with the teach_a account

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY';
alter session set nls_territory='Switzerland';
select to_char(salary, 'L99G999D00')
from employees
where last_name = 'Ernst';

