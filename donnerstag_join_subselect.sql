SELECT last_name FROM employees 
WHERE department_id IN (SELECT department_id FROM departments 
                        WHERE location_id IN (SELECT location_id FROM locations 
                                                WHERE country_id IN (SELECT country_id FROM countries 
                                                                    WHERE region_id IN (SELECT region_id FROM regions
                                                                                        WHERE region_name='Europe') )));
                                                                                        
SELECT * FROM employees ;

SELECT last_name, job_id, salary FROM employees 
WHERE salary IN (SELECT salary FROM employees WHERE job_id='IT_PROG') 
AND   LENGTH (job_id) < LENGTH('IT_PROG') ;

SELECT last_name, job_id, salary FROM employees 
WHERE salary IN (SELECT salary FROM employees WHERE job_id='IT_PROG') 
AND   LENGTH (job_id) < ( SELECT LENGTH(job_id) FROM employees WHERE job_id ='IT_PROG') ;

SELECT last_name, job_id, salary, commission_pct FROM employees 
WHERE salary IN (SELECT salary fROM employees WHERE commission_pct IS NOT NULL ) 
AND commission_pct IS NULL ;

SELECT last_name, hire_date FROM employees
WHERE hire_Date > (SELECT hire_Date FROM employees WHERE last_name='Higgins') ;

--selbe Abfrage als Join oder als SELF_ Join 

SELECT hire_Date FROM employees WHERE last_name='Higgins' ;

SELECT e.last_name, e.hire_date FROM employees e ,employees h 
WHERE e.hire_Date > h.hire_Date 
AND h.last_name='Higgins'
/



--Join mit Unterabfrage h als zweite Tabelle 
SELECT e.last_name, e.hire_date , h.hire_Date FROM employees e ,
                                    (SELECT * FROM employees WHERE h.last_name='Higgins') h
WHERE e.hire_Date > h.hire_Date 

;

SELECT first_name, last_name FROM employees
WHERE SUBSTR(first_name,1,1) IN (SELECT SUBSTR(first_name,1,1) FROM employees
                                 WHERE last_name='Zlotkey')
AND last_name <>'Zlotkey' 
/
SELECT * FROM departments ;

SELECT last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees
                    WHERE department_id IN (SELECT department_id FROM departments
                                             WHERE department_name='Sales')) 
/

SELECT * FROM locations ;
SELECT * FROM departments ;
SELECT * FROM employees ;

--Abt.name der Abteilung mit den meisten Angestellten 
SELECT department_name FROM departments 
    WHERE department_id IN (
        SELECT  department_id
            FROM employees 
                GROUP By department_id 
                HAVING COUNT(employee_id) = (
                    SELECT MAX(COUNT(employee_id)) 
                        FROM employees 
                         GROUP By department_id ) ) ;
--#########################################################################################################
-- wieviele Angestellt hat jede Abteilung in der mehr arbeiten als Zlotkeys Abt. 
SELECT 
    (  SELECT COUNT(employee_id) ||' '|| department_id FROM employees GROUP BY department_id HAVING COUNT(employee_id) > (
        SELECT COUNT(employee_id) FROM employees    WHERE department_id = (
            SELECT department_id FROM employees WHERE last_name='Zlotkey'   )   )   ) count_abt 
    , ( SELECT department_name FROM departments WHERE department_id IN (  
            SELECT  department_id FROM employees    GROUP BY department_id  HAVING COUNT(employee_id) > (
                SELECT COUNT(employee_id) FROM employees    WHERE department_id = (
                    SELECT department_id FROM employees WHERE last_name='Zlotkey')  )   )   )   abtname
    FROM dual ;
                                                            
------------------------------------------------------------------------------------------------------------

select count(employee_id)
    , (select department_name 
      from departments 
      where department_id in (
        select count(employee_id), (
            select department_name 
            from departments 
            where department_id in (
                select department_id
                from employees 
                group by department_id 
                having count(employee_id) > (
                    select count(employee_id) from employees 
                        where department_id = (
                        select department_id from employees 
                        where last_name like '%Zlot%' ) ) ) )
        from employees 
        group by department_id 
        having count(employee_id) > (
            select count(employee_id) from employees where department_id = ( 
                select department_id from employees where last_name like '%Zlot%'   )   )   )   )
  FROM employees 
  GROUP BY department_id 
  ;
  
  
select  count(employee_id)
    , ( select department_name from departments where department_id in  (
            select b.employee_id    from employees b    where count(b.employee_id) > (
                select count(c.employee_id) from employees c    where c.department_id = (
                    select d.department_id from employees d where d.last_name like '%Zlot%' )   )   )   )
    from employees group by department_id  having  count(employee_id) > (
        select count(employee_id)   from employees  where department_id = (
            select department_id from employees where last_name like '%Zlot%'   )   )
;


select 
  	count(employee_id), 
 	(
    		select department_name from departments where department_id in 
    		(
      			select b.department_id 
			from employees b 
      			group by b.department_id 
      			having count(b.employee_id) > (
        			select count(c.employee_id) 
				from employees c 
				where c.department_id = (
          				select d.department_id 
					from employees d 
					where d.last_name like '%Zlot%'
        			)
      			)
    		)
    
    
    
  	)
from employees 
group by department_id  
having count(employee_id) > (select count(employee_id) 
                            from employees 
                            where department_id = (select department_id 
                                                    from employees 
                                                    where last_name like '%Zlot%'
                                                    )
                                )
;