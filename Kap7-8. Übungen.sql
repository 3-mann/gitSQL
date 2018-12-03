
( SELECT
    "A3"."LAST_NAME"   "LAST_NAME"
    , "A3"."EMAIL"       "EMAIL"
  FROM
    "ORA1"."EMPLOYEES" "A3"
 --WHERE
 --   "A3"."DEPARTMENT_ID"   = 80
)
--union
--union all
--MINUS
intersect
( SELECT
    "A2"."LAST_NAME"   "LAST_NAME"
    , "A2"."EMAIL"       "EMAIL"
  FROM
    "ORA1"."RETIRED_EMPLOYEES" "A2"
 --WHERE
   -- "A2"."DEPARTMENT_ID"   = 90
);

SELECT 1 "Order", employee_id, first_name, last_name, department_id FROM employees where department_id in (10)
union
SELECT 2 "Order", employee_id, first_name, last_name, department_id FROM employees where department_id in (50)
union
SELECT 3 "Order", employee_id, first_name, last_name, department_id FROM employees where department_id in (20)
Order By "Order"
;

 
select 2 dummy, to_char(hire_date, 'Dy'), last_name, hire_date from employees where to_char(hire_date, 'Dy') = 'Mo'
union
select 1 dummy, to_char(hire_date, 'Dy'), last_name, hire_date from employees where to_char(hire_date, 'Dy') = 'Di'
union
select 3 dummy, to_char(hire_date, 'Dy'), last_name, hire_date from employees where to_char(hire_date, 'Dy') = 'Fr'
order by dummy;   


SELECT  first_name||' '||last_name "Name", to_char(hire_date,'Day D DD' )
        ,to_char(hire_date,'D' ) HireDay  
FROM employees WHERE to_char(hire_date,'Day') LIKE 'Montag%' 
union
SELECT  first_name||' '||last_name "Name", to_char(hire_date,'Day D DD' )
        ,to_char(hire_date,'D' ) HireDay  
FROM employees WHERE to_char(hire_date,'Day') LIKE 'Donnerstag%' 
union
SELECT  first_name||' '||last_name "Name", to_char(hire_date,'Day D DD' )
        ,to_char(hire_date,'D' ) HireDay  
FROM employees WHERE to_char(hire_date,'Day') LIKE 'Freitag%' 
order by HireDay
;
