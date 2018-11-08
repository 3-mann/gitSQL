--The SQL Script to run the code_examples for Lesson 6

--Uncomment code below to run the code for slide 4_sa for lesson 6
-- Execute the DELETE statement first
/*

DELETE FROM departments
WHERE department_name='Support';

SELECT department_name, city
FROM   departments
NATURAL JOIN (SELECT l.location_id, l.city, l.country_id
              FROM   locations l
              JOIN   countries c
              ON(l.country_id = c.country_id)
              JOIN regions USING(region_id)
              WHERE region_name = 'Europe');
                 
*/

--Uncomment code below to run the code for slide 5_na for lesson 6
/*

CREATE OR REPLACE VIEW european_cities 
AS
SELECT l.location_id, l.city, l.country_id
FROM   locations l
JOIN   countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe';
            
*/

--Uncomment code below to run the code for slide 5_nb for lesson 6

/*
SELECT department_name, city
FROM   departments
NATURAL JOIN european_cities;

*/

--Uncomment code below to run the code for slide 8_na for lesson 6
--Execute lab_06_insert_empdata.sql before executing this.

/* 

SELECT first_name, last_name, manager_id, department_id
FROM empl_demo
WHERE manager_id IN (SELECT manager_id 
                     FROM empl_demo
                     WHERE first_name = 'Daniel')
AND department_id IN (SELECT department_id
                      FROM empl_demo
                      WHERE first_name = 'Daniel');
                  
*/

--Uncomment code below to run the code for slide 9_sa for lesson 6


/*	

SELECT employee_id, manager_id, department_id
FROM employees
WHERE (manager_id, department_id) IN
                            (SELECT manager_id, department_id
                             FROM employees
                             WHERE employee_id IN (174, 199))
AND employee_id NOT IN (174,199);

*/


--Uncomment code below to run the code for slide 10_sa for lesson 6


/*	            
SELECT employee_id, manager_id, department_id
FROM employees
WHERE manager_id IN
                 (SELECT manager_id
                  FROM employees
                  WHERE employee_id IN (174,141))
AND department_id IN
                 (SELECT department_id
                  FROM employees
                  WHERE employee_id IN (174,141))
AND employee_id NOT IN(174,141);

             
*/


--Uncomment code below to run the code for slide 13_sa for lesson 6


/*	
SELECT employee_id, last_name,
       (CASE
        WHEN department_id =
                 (SELECT department_id FROM departments
     WHERE location_id = 1800)
         THEN 'Canada' ELSE 'USA' END) location
FROM   employees;
*/


--Uncomment code below to run the code for slide 13_sb for lesson 6

/*	             

select department_id, department_name,
      (select count(*)
       from   employees e
       where  e.department_id = d.department_id) as emp_count
from   departments d;              


*/

--Uncomment code below to run the code for slide 17_sa for lesson 6

/*	

SELECT last_name, salary, department_id
FROM   employees outer_table
WHERE  salary > (SELECT AVG(salary)
          FROM   employees inner_table
          WHERE  inner_table.department_id =  
          outer_table.department_id);
                   
*/

--Uncomment code below to run the code for slide 18_sa for lesson 6


/*	

SELECT department_id, employee_id, salary
FROM EMPLOYEES e
WHERE 1 = 
         (SELECT  COUNT(DISTINCT salary)
          FROM EMPLOYEES 
          WHERE e.department_id = department_id
          AND e.salary <= salary);

*/   

--Uncomment code below to run the code for slide 21_sa for lesson 6

/*	            

SELECT employee_id, last_name, job_id, department_id
FROM   employees outer
WHERE  EXISTS ( SELECT NULL
                 FROM   employees
                 WHERE  manager_id = 
                        outer.employee_id);
*/

--Uncomment code below to run the code for slide 22_sa for lesson 6

/*	

SELECT department_id, department_name
FROM departments d
WHERE NOT EXISTS (SELECT NULL
                  FROM   employees
                  WHERE  department_id = d.department_id);
                              

*/

--Uncomment code below to run the code for slide 22_na for lesson 6
/*
SELECT department_id, department_name
   FROM   departments 
   WHERE  department_id NOT IN (SELECT department_id
                                FROM   employees);
*/



--Uncomment code below to run the code for slide 25_sa for lesson 6
/*
WITH CNT_DEPT AS
(
SELECT department_id,
 COUNT(1) NUM_EMP
FROM EMPLOYEES
GROUP BY department_id
)
SELECT employee_id,
 SALARY/NUM_EMP
FROM EMPLOYEES E
JOIN CNT_DEPT C
ON (e.department_id = c.department_id);

*/

--Uncomment code below to run the code for slide 27_sa for lesson 6
/*

Drop Table Flights;
CREATE TABLE flights
   (source varchar(20), destin varchar(20), flight_time number);
INSERT INTO flights VALUES ('San Jose', 'Los Angeles', 1.3);
INSERT INTO flights VALUES ('New York', 'Boston', 1.1);
INSERT INTO flights VALUES ('Los Angeles', 'New York', 5.8);
COMMIT;

SELECT Source, Destin, Flight_Time 
FROM flights;

WITH Reachable_From (Source, Destin, TotalFlightTime) AS
(
    SELECT Source, Destin, Flight_time
    FROM Flights
  UNION ALL
    SELECT incoming.Source, outgoing.Destin, 
	incoming.TotalFlightTime+outgoing.Flight_time
    FROM Reachable_From incoming, Flights outgoing
    WHERE incoming.Destin = outgoing.Source
)

SELECT Source, Destin, TotalFlightTime 
FROM Reachable_From;

*/


