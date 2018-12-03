
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
        , commission_pct "Prov.fakt."
        , (salary + salary*NVL2(commission_pct,commission_pct,0))"incl. Provi"
FROM employees;

SELECT    last_name
        , coalesce(commission_pct,manager_id, department_id)
FROM employees;

SELECT  last_name, job_id, salary
        ,case job_id    
            when 'ad_asst'  then salary+600
            when 'mk_rep'     then salary*1.1
            else salary
        End "neues Gehalt"    
from EMPLOYEES;

SELECT  last_name, job_id, salary
        ,decode( job_id    
            ,'ad_asst'  ,   salary+600
            ,'mk_rep'   ,   salary*1.1
            ,               salary) "neues Gehalt"    
from EMPLOYEES;

SELECT  last_name, salary, nvl(commission_pct,0) Provi
        ,case commission_pct    
            when commission_pct  then (commission_pct * salary + salary)*12
            else salary * 12
        End "Jahresehalt"    
from EMPLOYEES;

SELECT  last_name, job_id, salary
        ,case    
            when job_id    =    'ad_asst' then salary + 600
            when last_name LIKE 'K%'      then salary * 1.1
            else salary 
        End "neues Gehalt"    
from EMPLOYEES;

SELECT  department_name, manager_id
        ,case    
            when manager_id = 100 or manager_id = 200 then department_name
            else 'momentan unintertessant'
        End "Status"    
from departments;

SELECT  department_name, manager_id
        ,decode( manager_id    
            ,100  ,   department_name
            ,200  ,   department_name
            ,        'momentan uninteressant') "Status"    
from departments;

select to_number('10') from dual;

select to_number('10' + '10') from dual;

--#########################################################################

SELECT  to_char(count(*),'99')||' MA' Anzahl, job_id
        ,to_char(avg(salary),'999,00')||'€' Sum 
FROM employees
    group by job_id
    order by Sum;
    
SELECT  to_char (COUNT(*),'99')||' MA' Anzahl
        , NVL(to_char(department_id),'Stabsstelle') Abteilung
        , min(hire_date) "1. Einst."
        , max(hire_date) "letzte Einst."
FROM employees
    group by NVL(to_char(department_id),'Stabsstelle')
    order by "1. Einst.";

Select distinct(manager_id) from employees;

select      job_id
            , department_id
            , count(employee_id)
    from    employees
    where   department_id in (50, 80, 90)
group by    rollup(department_id,job_id) order by 1 , 2;

select          job_id
                , TO_CHAR(department_id) DeptID
                , job_id
                , manager_id
                , count(employee_id) "Anz. Empl."
    from        employees
    where       department_id in (50, 80, 90)
    group by    RollUp(department_id, job_id, manager_id, TO_CHAR(department_id)) 
    order by    1, 2, 3;

select          job_id
                , TO_CHAR(department_id) DeptID
                , job_id
                , manager_id
                , count(employee_id) "Anz. Empl."
    from        employees
    where       department_id in (50, 80, 90)
    group by    department_id, job_id, manager_id, TO_CHAR(department_id),
                grouping sets(job_id,manager_id)
    order by    1, 2, 3;



