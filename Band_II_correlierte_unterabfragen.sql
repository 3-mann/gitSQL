INSERT INTO (SELECT l.location_id, l.city, l.country_id
FROM locations  l
JOIN countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe'
WITH CHECK OPTION )
VALUES (3500, 'Alabama_City', 'US');

SELECT * FROM locations ;

INSERT INTO ( SELECT location_id, city, country_id
FROM locations l 
WHERE country_id IN
(SELECT country_id
FROM countries
NATURAL JOIN regions
WHERE region_name = 'Europe')
WITH CHECK OPTION )
VALUES (3600, 'Washington', 'US');

CREATE TABLE empl6 AS SELECT * FROM employees ;
SELECT * FROM tab ;
desc empl6 ;

SELECT * FROM empl6 ;
ALTER TABLE empl6 ADD department_name VARCHAR2(30) ;

UPDATE empl6 e  SET department_name =
   (SELECT department_name FROM departments d 
   WHERE e.department_id =d.department_id ) ;

COMMIT ;

SELECT * FROM job_history ;

DELETE FROM empl6 e 
WHERE employee_id IN (SELECT employee_id FROM job_history j WHERE j.employee_id=e.employee_id  ) ;

rollback ;

SELECT * FROM empl6 WHERE employee_id IN (
SELECT DISTINCT  employee_id FROM job_history j );

SELECT DISTINCT department_id  FROM empl6 WHERE department_id IN (SELECT department_id FROM job_history) ;

SELECT employee_id, job_id fROM employees e 
WHERE job_id IN (SELECT job_id FROM job_history j wHERE e.employee_id=j.employee_id ) ;



SELECT  * FROM job_history ;

DELETE FROM empl6 e 
  WHERE e.department_id  IN 
       (SELECT i.department_id  FROM employees i, employees s  wHERE 
        i.department_id =s.department_id 
        AND e.employee_id < i.employee_id)
  --AND  e.employee_id =100 
  ;

SELECT * FROM empl6 ;--WHERE department_id IN (40,70) ;
rollback ;


DELETE FROM empl6 WHERE employee_id IN (
SELECT --LPAD(last_name, LENGTH(last_name)+LEVEL*2-2,'_') , 
employee_id--, manager_id 
FROM employees 
CONNECT BY PRIOR employee_id=manager_id 
START WITH employee_id =100 
INTERSECT 
SELECT --LPAD(last_name, LENGTH(last_name)+LEVEL*2-2,'_') , 
employee_id--, manager_id 
FROM employees 
CONNECT BY PRIOR employee_id=manager_id 
AND employee_id <>108 
START WITH employee_id=100 )
;
