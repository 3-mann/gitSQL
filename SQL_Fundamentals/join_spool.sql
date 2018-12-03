SELECT department_id, LISTAGG(last_name,',' ON OVERFLOW TRUNCATE '~~~') WITHIN GROUP (ORDER BY last_name) emplist
FROM employees 
WHERE department_id IN (10,20,90) 
GROUP BY department_id ;
/
--entspricht im Querformat
SELECT department_id, last_name FROM employees
WHERE department_id IN (10,20,90)
ORDER BY 1,2 ;

SELECT SUM(salary) FROM employees 
GROUP BY department_id ;

SELECT SUM(salary) FROM employees ;

--Join über employees und departments 

SELECT e.last_name, d.department_name 
FROM employees  e, departments d 
WHERE e.department_id=d.department_id ;

SELECT e.first_name, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id=d.department_id ; 

SELECT e.last_name, d.department_name 
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND SUBSTR(e.last_name,2,1) =SUBSTR(d.department_name,2,1) ; 

SELECT e.last_name, d.department_name

FROM employees e, departments d

WHERE e.department_id=d.department_id

AND SUBSTR(e.last_name,2, 1)  =SUBSTR(d.department_name, 2, 1); 

SELECT * FROM employees ;

SELECT * FROM departments ;

SELECT e.job_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND  d.department_name='Marketing'
ORDER BY e.last_name ;

SELECT MAX(hire_date) 
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND department_name='Administration' ;

SELECT COUNT(employee_id) 
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND department_name='Marketing' ;

SELECT * FROM locations ;

SELECT * FROM countries ;

SELECT * FROM regions ;

--Equi-Join
SELECT e.last_name, l.city, c.country_name
FROM employees e, departments d , locations l, countries c, regions r 
WHERE e.department_id=d.department_id
AND   d.location_id =l.location_id
AND   l.country_id  =c.country_id
AND   c.region_id   =r.region_id 
AND   r.region_name='Europe' ; 


--NONEqui-Join mit BETWEEN

SELECT e.last_name, e.job_id, e.salary jetz_sal, e.salary*2 sal_plus_100 FROM employees e, jobs j
WHERE department_id=20 
AND   e.job_id=j.job_id
AND   e.salary*2  BETWEEN j.min_salary AND j.max_salary ;


--King arbeitet als  Presdident 

SELECT e.last_name||' arbeitet als '|| j.job_title
FROM employees e,  jobs j
WHERE e.job_id=j.job_id ;

select e.last_name || ' arbeitet als ' || j.job_title Beschäftigt

from employees e, jobs j

where e.job_id = j.job_id

and e.last_name = 'King'; 



select      e.first_name||' '||e.last_name||' arbeitet als: '

        ,   j.job_title

    from    employees e  ,   jobs j

    where   e.job_id        = j.job_id   ;

--ANSI- SYNTAX :

SELECT e.last_name||' arbeitet als '|| j.job_title
FROM employees e JOIN jobs j
ON e.job_id=j.job_id ;

--Natural Join 

SELECT d.department_name, l.city 
FROM departments d NATURAL JOIN locations l ;

--aber Gefahr
SELECT e.last_name, d.department_name 
FROM employees e, departments d 
WHERE e.department_id=d.department_id ;

SELECT e.last_name, d.department_name 
FROM employees e, departments d 
WHERE e.manager_id =d.manager_id ;

SELECT e.last_name, d.department_name 
FROM employees e, departments d 
WHERE e.department_id=d.department_id
AND  e.manager_id =d.manager_id ;

SELECT e.last_name, d.department_name 
FROM employees e NATURAL JOIN departments d ;

-- JOIN mit USING
SELECT e.last_name, d.department_name 
FROM employees e JOIN departments d 
USING (department_id) ;

-- JOIN mit ON 
SELECT e.last_name, e.job_id, e.salary jetz_sal, e.salary+100 sal_plus_100 FROM employees e, jobs j
WHERE department_id=20 
AND   e.job_id=j.job_id
AND   e.salary+100  BETWEEN j.min_salary AND j.max_salary ;

SELECT e.last_name, e.job_id, e.salary jetz_sal, e.salary+100 sal_plus_100 
FROM employees e JOIN jobs j
ON (e.salary+100  BETWEEN j.min_salary AND j.max_salary ) 
WHERE e.job_id=j.job_id
AND  department_id=20 ;

SELECT e.last_name, e.job_id, e.salary jetz_sal, e.salary+100 sal_plus_100 
FROM employees e JOIN jobs j
ON (e.salary+100  BETWEEN j.min_salary AND j.max_salary ) 
AND e.job_id=j.job_id
AND  department_id=20 ;

SELECT e.last_name, e.job_id, e.salary jetz_sal, e.salary+100 sal_plus_100 
FROM employees e JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary+100  BETWEEN j.min_salary AND j.max_salary
AND department_id=20 ;

--3-Way- Join
SELECT e.last_name, l.city, c.country_name
FROM employees e, departments d , locations l, countries c, regions r 
WHERE e.department_id=d.department_id
AND   d.location_id =l.location_id
AND   l.country_id  =c.country_id
AND   c.region_id   =r.region_id ;

SELECT e.last_name, l.city, c.country_name
FROM employees e 
JOIN departments d 
ON e.department_id=d.department_id
JOIN locations l 
ON d.location_id =l.location_id
JOIN countries c
ON l.country_id  =c.country_id
JOIN regions r
ON c.region_id   =r.region_id 
AND region_name='Europe' ;


--SELF- Join

SELECT e.last_name angestellte, v.last_name chefe 
FROM employees e, employees v
WHERE e.manager_id=v.employee_id ;

SELECT e.last_name angestellte, v.last_name chefe 
FROM employees e  JOIN employees v
ON e.manager_id=v.employee_id ;

SELECT e.last_name angestellte, v.last_name chefe ,e.hire_date ang_dat, v.hire_date chefe_dat, e.salary ang_sal, v.salary chefe_sal
FROM employees e, employees v
WHERE e.manager_id=v.employee_id
AND e.salary > v.salary ;


[?06.?11.?2018 12:08] Dieter Reimann: 
select      e.last_name , e.salary

       -- ,   l.city

       -- ,   c.country_name

        ,   m.last_name Manager, m.salary

    from    employees   m

    join    employees   e

    on      e.manager_id = m.employee_id

    /*join    departments  d

    on      e.department_id = e.department_id

    join    locations   l

    on      l.location_id = d.location_id

    join    countries     c 

    on      l.country_id = c.country_id */

    where   e.salary  > m.salary 

; 

SELECT e.last_name angestellter, k.last_name kollege 
FROM employees e , employees k
WHERE e.department_id=k.department_id 
--AND  e.department_id=20 
AND e.last_name <> k.last_name 
ORDER BY 1,2;

select     -- distinct 
e.last_name , k.last_name

        ,   e.department_id AS Dept_id
           from    employees   e

    join    employees   k

    on      e.department_id = k.department_id

    where   e.last_name < k.last_name 

    and     e.department_id = 20
    ;
    
 SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e, departments  d 
 WHERE e.department_id=d.department_id ;
 
 SELECT * FROM departments ;
 SELECT DISTINCT (department_id) FROM employees ;


SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e, departments  d 
 WHERE e.department_id(+)=d.department_id  ;
 
 SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e LEFT JOIN departments d 
 ON e.department_id=d.department_id ;
 
 SELECT e.last_name, d.department_name, d.department_id 
 FROM   departments d LEFT JOIN employees e
 ON e.department_id=d.department_id ;
  
  
 SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e, departments  d 
 WHERE e.department_id(+)=d.department_id 
 
 SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e, departments  d 
 WHERE e.department_id(+)=d.department_id 
 UNION 
 SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e, departments  d 
 WHERE e.department_id=d.department_id (+) ;
 
 --CROSS Join, kartesisches Produkt 
 SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e, departments  d 
 ;
 SELECT e.last_name, d.department_name, d.department_id 
 FROM employees e CROSS  JOIN departments  d ;
 
 
 SELECT e.last_name, l.city 
 FROM employees e, departments d , locations l, countries c, regions r 
WHERE e.department_id=d.department_id
AND   d.location_id =l.location_id
--AND   l.country_id  =c.country_id
AND   c.region_id   =r.region_id ;
 
 