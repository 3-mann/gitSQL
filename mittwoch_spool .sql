SELECT COUNT(employee_id) FROM employees ;
-- da ist er der ora1 ;-)

SELECT e.last_name, e.hire_date , d.last_name, d.hire_date FROM employees e, employees d
WHERE d.last_name='Davies' 
AND e.hire_date > d.hire_date ;

--jeztt als Unterabfrage

SELECT e.last_name, e.hire_date FROM employees e
WHERE e.hire_date > (SELECT d.hire_date FROM employees d 
                    WHERE d.last_name='Davies') ;
                    
                    
SELECT last_name, salary FROM employees 
WHERE salary > (SELECT salary FROM employees WHERE last_name='Abel') ;

SELECT last_name, salary FROM employees 
WHERE (SELECT salary FROM employees WHERE last_name='Abel')  < salary ;

-- Single- Row mit PK
SELECT last_name, salary FROM employees 
WHERE salary > (SELECT salary  FROM employees WHERE employee_id=101
                  ) ;

--Single Row mit eindeutigen Werten 
SELECT last_name, salary FROM employees 
WHERE salary < (SELECT salary  FROM employees WHERE last_name='King' AND first_name!='Steven') ;

--Single ROW mit UNIQUE- KEY- Spalte
SELECT last_name, salary FROM employees 
WHERE salary < (SELECT salary  FROM employees WHERE email='SKING') ;

--Single_row mit Gruppenfunktion

SELECT last_name, salary FROM employees 
WHERE salary > (SELECT AVG(salary)  FROM employees WHERE department_id=20 );

--mehrere Bedingungen 

SELECT last_name, salary , department_id ,job_id FROM employees 
WHERE job_id = (SELECT job_id FROM employees WHERE last_name='Abel')
AND   salary >= (SELECT salary FROM employees WHERE last_name='Abel' ) 
AND  last_name <>'Abel' ;

SELECT last_name, salary , department_id ,job_id FROM employees 
WHERE job_id = (SELECT job_id FROM employees WHERE last_name='Abel')
AND   salary < (SELECT salary FROM employees WHERE last_name='Ozer') ;

-- wo sind Unterabfragen erlaubt, bisher in der WHERE- Klausel 

SELECT (SELECT MIN(salary) FROM employees 
        WHERE department_id=20) minsal, 
        (SELECT MAX(salary) FROM employees 
        WHERE department_id=10) maxsal ,
        (SELECT department_name FROM departments 
        WHERE department_id=20) deptname
FROM dual ;

--SELECT MIN(salary), MAX(salary) FROM employees ;

SELECT e.last_name, e.salary FROM (SELECT last_name, salary FROM employees WHERE department_id=80 ORDER BY salary DESC ) e
 WHERE rownum < 6;



SELECT rownum , last_name , rowid FROM employees ;

--IN- Operator


SELECT last_name, salary , department_id, hire_date FROM employees 
WHERE department_id = (SELECT MIN(department_id) FROM employees ) ;


SELECT last_name, salary , department_id, hire_date FROM employees 
WHERE department_id = (SELECT MIN(department_id) FROM departments ) ;

SELECT last_name, salary , department_id, hire_date FROM employees 
WHERE department_id IN (SELECT department_id  FROM departments  WHERE department_name LIKE '%A%' ) ;


--verdient ein maximales Gehalt :
SELECT last_name, salary,  department_id FROM employees 
WHERE salary IN (SELECT MAX(salary) FROM employees 
                  GROUP BY department_id ) ;


--verdient das maximale Gehalt seiner Abteileung 
--paarweise Unterabfrage 
SELECT last_name, salary,  e.department_id FROM employees e
WHERE (salary,e.department_id) IN (SELECT MAX(salary), i.department_id  FROM employees i
                  GROUP BY i.department_id ) 
;

SELECT MAX(salary), i.department_id  FROM employees i
                  GROUP BY i.department_id ;

SELECT * FROM employees ;

--tripelweise (n-weise ) Unterabfrage 
SELECT last_name, salary,  e.department_id, job_id FROM employees e
WHERE (salary,e.department_id, job_id ) IN (SELECT MAX(salary), i.department_id ,job_id FROM employees i
                                   GROUP BY i.department_id , job_id ) 
ORDER BY department_id, job_id, salary ;

SELECT last_name, salary,  department_id, job_id FROM employees 
WHERE salary IN ( SELECT salary FROM employees WHERE job_id='IT_PROG') 
AND job_id <>'IT_PROG'  ;

-- ANY , ALL

SELECT last_name, salary ,department_id, job_id FROM employees 
WHERE salary >ANY   (SELECT MIN(salary) FROM employees 
                 GROUP BY department_id  ) ;
 -- entspricht :                
SELECT last_name, salary ,department_id, job_id FROM employees 
WHERE salary >   (SELECT MIN(MIN(salary)) FROM employees 
                 GROUP BY department_id  ) ;                 
  -- >ALL               
SELECT last_name, salary ,department_id, job_id FROM employees 
WHERE salary >ALL   (SELECT MIN(salary) FROM employees 
                 GROUP BY department_id  ) ; 
 
 SELECT last_name, salary ,department_id, job_id FROM employees 
WHERE salary >  (SELECT MAX(MIN(salary)) FROM employees 
                 GROUP BY department_id  ) ;                 
                 
 SELECT MIN(salary), department_id  FROM employees 
                 GROUP BY department_id                 ;
                 
                 
 SELECT DISTINCT (manager_id) FROM employees ;   
 
 SELECT last_name FROM employees WHERE employee_id IN (SELECT DISTINCT (manager_id) FROM employees) ;
 
 SELECT last_name FROM employees WHERE employee_id IN (SELECT manager_id FROM employees ) ;
 
 SELECT last_name FROM employees WHERE employee_id NOT  IN (SELECT DISTINCT (manager_id) FROM employees) ;
 
 SELECT last_name FROM employees WHERE employee_id NOT IN (SELECT manager_id FROM employees ) ;
  -- 100 OR NULL OR 205 OR 149
  --deshalb 
 SELECT last_name FROM employees WHERE employee_id NOT IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL) ;

desc employees 
SELECT last_name FROM employees WHERE employee_id NOT IN (SELECT NVL(manager_id,0) FROM employees ) ;

--100 OR 0 OR 205 

-- nochmal JOIN vs UNTERABFRAGE 

SELECT last_name, salary,  e.department_id FROM employees e
WHERE (e.salary,e.department_id) IN (SELECT MAX(i.salary), i.department_id  FROM employees i
                  GROUP BY i.department_id )
ORDER BY 3 
;

SELECT MAX(salary), i.department_id  FROM employees i
                  GROUP BY i.department_id  ;
                  
SELECT e.last_name, e.salary,  e.department_id, ii.avgsal FROM employees e,  
                                                (SELECT MAX(salary) maxsal, 
                                                AVG(salary) avgsal, department_id  FROM employees 
                                                GROUP BY department_id )  ii  
WHERE  e.salary =  ii.maxsal  
AND    e.department_id = ii.department_id 
ORDER BY e.department_id ;

--korrelierte Unterabfrage 
SELECT e.last_name, e.salary,  e.department_id FROM employees e
WHERE e.salary = (SELECT MAX(i.salary) maxsal FROM employees i  WHERE i.department_id=e.department_id ) ;

SELECT e.last_name, e.salary,  e.department_id  FROM employees e
WHERE e.salary < (SELECT AVG(i.salary) avgsal FROM employees i  WHERE i.department_id=e.department_id ) ;

SELECT e.last_name, e.salary,  e.department_id, ii.avgsal FROM employees e,  
                                                (SELECT MAX(salary) maxsal, 
                                                AVG(salary) avgsal, department_id  FROM employees 
                                                GROUP BY department_id )  ii  
WHERE  e.salary <  ii.avgsal  
AND    e.department_id = ii.department_id 
ORDER BY e.department_id ;

SELECT * FROM departments ;

SELECT MIN(hire_date) 
FROM employees 
WHERE department_id IN (SELECT department_id 
                        FROM departments 
                        WHERE department_name='Sales') ;
                        
SELECT MIN_date  FROM (SELECT  MIN(hire_date) min_date FROM employees e, departments d
                        WHERE e.department_id=d.department_id
                        AND   d.department_name ='Sales') ;


SELECT * FROM employees ;

--arbeiten mehr Mitarbeiter in Abt50 oder Abt60 ?

SELECT 
--(SELECT COUNT(employee_id) FROM employees WHERE Department_id=50) count50,
--(SELECT COUNT(employee_id) FROM employees WHERE Department_id=60) count60 ,
CASE 
(SELECT COUNT(employee_id) FROM employees WHERE Department_id=50)- (SELECT COUNT(employee_id) FROM employees WHERE Department_id=60) diff
<0 THEN '50_gross' END ;
FROM dual 
/

SELECT 
MAX(
(SELECT COUNT(employee_id) FROM employees WHERE Department_id=50) ,
(SELECT COUNT(employee_id) FROM employees WHERE Department_id=60) 
)  
FROM dual ;

Select (select count(employee_id) from employees where department_id = 50)||','||(select count(employee_id) D20 from employees where department_id = 20)  Tab1 from dual 

;
SELECT 
( select sum(decode(department_id, 50, 1, 0)) FROM employees ) "Department 50",
(SELECT  sum(decode(department_id, 60, 1, 0)) from departments ) "Department 60"
FROM dual ; 

SELECT 3+4 FROM dual ;

SELECT count(employee_id) , department_id FROM employees 
GROUP BY department_id 
HAVING COUNT(employee_id) =
    (SELECT MAX (COUNT(employee_id)) FROM employees 
    WHERE department_id IN (50,60) 
    GROUP BY department_id);
    
-- wieviele Angestellte , deren first_name und last_name gleich lang sind 

select count(*) from employees where last_name IN (select last_name from employees) and first_name IN (select first_name from employees);

select first_name || ' ' || last_name AS full_name ,rownum
from (select first_name, last_name from employees where length(first_name) = length(last_name)) ;

SELECT COUNT(*) FROM (SELECT 'x' --LENGTH(first_name) lfirst, LENGTH(last_name) llast, employee_id  
                        FROM employees 
                        WHERE LENGTH (first_name)=LENGTH(last_name) ) 
/
select count(*) from employees 
where employee_id IN (select employee_id from employees where length(last_name) = length(first_name)); 

select count(employee_id) from employees 
WHERE 'x' IN (select 'x' from employees where length(last_name) = length(first_name)) ;

 SELECT department_id FROM employees
 GROUP BY department_id 
 HAVING COUNT(employees) =
(Select max(Anzahl) MaxAnz   from

        (select  count(employee_id)  Anzahl , department_id 
        from employees where department_id in (50,20) 
        group by department_id) i , departments d 
        WHERE d.department_id =i.department_id ) ;
 
select 
--CASE (
SUM( CASE department_id WHEN  50  THEN 1 ELSE 0 END ) dept50 ,
SUM( CASE department_id WHEN  60  THEN 1 ELSE 0 END ) dept60 
            -- ) WHEN dept 50 > dept 60 THEN dept50 ELSE dept60 END  
FROM employees ;

   

--wessen name (first_name||last_name) enhält mehr Vokale, als sein Gehalt Stellen hat 
SELECT last_name, first_name, salary ,LENGTH(salary) FROM employees ;


select first_name||last_name, salary ,LENGTH(to_char(salary)) from employees

where length(to_char(salary))> any

(select regexp_count(first_name||last_name, '[aeiou]', 1, 'i') as vowels from employees); 

  
  
  SELECT LOWER(first_name||last_name), salary , LENGTH(salary), a.employee_id
--,CASE WHEN INSTR (LOWER(first_name||last_name),'a')>0 THEN 1 ELSE 0 END 
--,INSTR (LOWER(first_name||last_name),'a') 
FROM employees a
WHERE 
LENGTH(salary) -2 
 > =
(SELECT  SUM( CASE WHEN INSTR (LOWER(first_name||last_name),'a')>0 THEN 1 ELSE 0 END )
        +SUM( CASE WHEN INSTR (LOWER(first_name||last_name),'e')>0 THEN 1 ELSE 0 END )
	+SUM( CASE WHEN INSTR (LOWER(first_name||last_name),'i')>0 THEN 1 ELSE 0 END )
	+SUM( CASE WHEN INSTR (LOWER(first_name||last_name),'o')>0 THEN 1 ELSE 0 END )
	+SUM( CASE WHEN INSTR (LOWER(first_name||last_name),'u')>0 THEN 1 ELSE 0 END ) 
  FROM employees i
WHERE a.employee_id=i.employee_id)
/
SELECT last_name, first_name FROM employees ;


