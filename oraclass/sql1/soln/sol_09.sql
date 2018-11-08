--The SQL Script to run the solution for Practice 9


--Uncomment code below to run the solution for Task 1 for Practice 9

/*
                  SELECT department_id
                  FROM   departments
                  MINUS
                  SELECT department_id
                  FROM   employees
                  WHERE  job_id = 'ST_CLERK';
*/

--Uncomment code below to run the solution for Task 2 for Practice 9

/*
               SELECT country_id,country_name
               FROM countries
               MINUS
               SELECT l.country_id,c.country_name
               FROM locations l JOIN countries c
               ON (l.country_id = c.country_id)
               JOIN departments d
               ON d.location_id=l.location_id;
*/


--Uncomment code below to run the solution for Task 3 for Practice 9
/*

                SELECT employee_id, job_id, department_id
                FROM EMPLOYEES
                WHERE department_id=50
                UNION ALL
                SELECT employee_id, job_id, department_id
                FROM EMPLOYEES
                WHERE department_id=80;

*/

--Uncomment code below to run the solution for Task 4 for Practice 9
/*
                  SELECT EMPLOYEE_ID
                  FROM EMPLOYEES
                  WHERE JOB_ID='SA_REP'
                  INTERSECT
                  SELECT EMPLOYEE_ID
                  FROM EMPLOYEES
                  WHERE DEPARTMENT_ID=80;

*/

--Uncomment code below to run the solution for Task 5 for Practice 9
/*
                 SELECT last_name,department_id,TO_CHAR(null)dept_name
                 FROM   employees
                 UNION 
                 SELECT TO_CHAR(null),department_id,department_name
                 FROM  departments;
*/



