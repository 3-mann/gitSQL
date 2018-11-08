
SELECT
    "A1"."LAST_NAME"   "LAST_NAME"
    , TO_CHAR("A1"."HIRE_DATE", 'Day,DD.Month.YYYY') "TO_CHAR(HIRE_DATE,'DAY,DD.MONT"
  FROM
    "ORA1"."EMPLOYEES" "A1";

Select * from v$nls_valid_values;
--alter session set nls_date_language ='English';


SELECT last_name, to_char(hire_date,'Day," der "DD.Month.YYYY') from employees;

SELECT last_name, to_char(hire_date, 'Day,DD.fmMonth.YYYY') from employees;

SELECT last_name, to_char(hire_date, 'fmDay,DD.Month.YYYY') from employees;

SELECT last_name, to_char(hire_date, 'fmDay,fm DD.Month.YYYY') from employees;

SELECT last_name, to_char(hire_date, 'fmDay,fm DD.fmMonth.YYYY') from employees;

alter session set nls_date_language ='English';
SELECT last_name, to_char(hire_date, 'fmDay," the" DdSpTh "of" Month YYYY') from employees;
alter session set nls_date_language ='German';
--#########################################################################################

SELECT last_name, salary*12, to_char(salary*12, '999,999.99$') from employees;

SELECT last_name, salary*12, to_char(salary*12, '999g999d99L') from employees;

SELECT last_name, salary*12, to_char(salary*12, '099g999d99L') from employees;

SELECT last_name, salary*12, to_char(salary*12, '099g999g999d99L') from employees;


SELECT to_date('November 2018','Month YYYY') + 1 FROM dual; 
SELECT to_date('November 2018','Month YYYY') FROM dual; 

--#########################################################################################

SELECT    last_name
        , to_char(salary,'0d99L')
        , to_char(commission_pct,'0d99')
        , to_char((salary + salary * NVL(commission_pct,0)),'0d99L')"incl. Provi"
FROM employees;

SELECT    last_name
        , salary
        , hire_date
        , commission_pct "Prov.fakt."
        , (salary + salary*NVL2(commission_pct,commission_pct,0))"incl. Provi"
FROM employees;

--##########################################################################################

select last_name,hire_date 
    from employees
    where hire_date > (
        select hire_date from employees where last_name='Higgins'
    );
    
select e.last_name, s.hire_date 
    from employees e join employees s 
    on s.last_name = 'Higgins'where e.hire_date > s.hire_date
    ;
     
     
select e.last_name, e.hire_date
    from employees e, (
        select hire_DATE from employees where last_name = 'Higgins'
    ) s
    where e.hire_date > s.hire_date
    ; 

select first_name, last_name from employees
    where substr(first_name, 1, 1) = (
        select substr(first_name, 1, 1) 
        from employees where last_name = 'Zlotkey'
    )
    and last_name != 'Zlotkey'
;
--############################################################################

Select first_name||' '||last_name, salary 
    from employees 
    where salary > (
        select avg(salary) from employees where department_id = (
        select department_id from departments where department_name = 'Sales'
        )
    )
;

/*
 CONNECT-BY-Klausel ::=
   START WITH <Spaltenname1 = Konstante>
   CONNECT BY [NOCYCLE] <Spaltenname1> = PRIOR <Spaltenname2> <Bedingung>
   ORDER SIBLINGS BY <Spaltenname1>
*/

--###################################################################################
select 
    count(employee_id) Anzahl,(
        select department_name from departments where department_id in (
            select 1 from employees group by department_id  having count(employee_id) > (
                select count(employee_id) from employees where department_id = (
                    select department_id from employees where last_name like '%Zlot%' )  )  )  ) cnt1 
    from employees group by department_id 
    having count(employee_id) > (
        select count(employee_id) from employees where department_id = (
            select department_id from employees where last_name like '%Zlot%'  )   ) 
; 
--###################################################################################
Select last_name , email 
from employees
-- union all 
minus
SELECT last_name , email
FROM  retired_employees;
