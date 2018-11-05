
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
