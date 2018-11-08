
select 
  	count(employee_id), (
        select department_name from departments where department_id in  (     --department_id ! was employee_id 
            select b.department_id    from employees b    group by b.department_id    having count(b.employee_id) > (
                select count(c.employee_id)     from employees c    where c.department_id = (
                    select d.department_id  from employees d    where d.last_name like '%Zlot%' )   )   )   )
    
from employees  group by department_id  having count(employee_id) > (
    select count(employee_id)   from employees  where department_id = (
        select department_id from employees where last_name like '%Zlot%' ) )
;