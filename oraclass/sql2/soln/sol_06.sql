--The SQL Script to run the solution for Practice 6

--Uncomment code below to run the solution for Task 1 for Practice 6

/*

SELECT last_name, department_id, salary
   	FROM   employees
   	WHERE  (salary, department_id) IN 
              (SELECT  salary, department_id
               FROM    employees
 	           WHERE   commission_pct IS NOT NULL);
*/



--Uncomment code below to run the solution for Task 2 for Practice 6
/*
     SELECT e.last_name, d.department_name, e.salary
     FROM   employees e JOIN departments d
     ON e.department_id = d.department_id
     AND   (salary, job_id) IN 
                 (SELECT salary, job_id
 	             FROM employees e JOIN departments  d
 	             ON	e.department_id = d.department_id
                     AND d.location_id = 1700);
*/

--Uncomment code below to run the solution for Task 3 for Practice 6
/*

SELECT last_name, hire_date, salary
FROM   employees
WHERE  (salary, manager_id) IN 
             (SELECT salary, manager_id
              FROM	  employees
              WHERE  last_name = 'Kochhar')
AND last_name != 'Kochhar';

*/

--Uncomment code below to run the solution for Task 4 for Practice 6

/*
SELECT last_name, job_id, salary
    FROM   employees
    WHERE  salary > ALL 
                 (SELECT salary
                  FROM   employees
    WHERE  job_id = 'SA_MAN')
    ORDER BY salary DESC;
*/

--Uncomment code below to run the solution for Task 5 for Practice 6
/*
     SELECT employee_id, last_name, department_id
     FROM   employees
     WHERE  department_id IN (SELECT department_id
                              FROM departments
                              WHERE location_id IN  
                                   (SELECT  location_id
                                    FROM locations
                                    WHERE city LIKE 'T%'));
*/

--Uncomment code below to run the solution for Task 6 for Practice 6

/*
SELECT e.last_name ename, e.salary salary, 
             e.department_id deptno, ROUND(AVG(a.salary),2) dept_avg
       FROM   employees e JOIN employees a
       ON  e.department_id = a.department_id
       AND    e.salary > (SELECT AVG(salary)
                    FROM   employees
                    WHERE  department_id = e.department_id )
       GROUP BY e.last_name, e.salary, e.department_id
       ORDER BY AVG(a.salary);
*/

--Uncomment code below to run the solution for Task 7_a for Practice 6

/*
SELECT outer.last_name
   FROM    employees outer
   WHERE  NOT EXISTS (SELECT 'X'
                      FROM employees inner
                       WHERE inner.manager_id = 
                             outer.employee_id);

*/


--Uncomment code below to run the solution for Task 7_b for Practice 6
/*
        SELECT outer.last_name
        FROM   employees outer
        WHERE  outer.employee_id 
        NOT IN (SELECT inner.manager_id
                FROM   employees inner);
*/

--Uncomment code below to run the solution for Task 7_b1 for Practice 6

/*
SELECT last_name
FROM employees 
WHERE employee_id NOT IN (SELECT manager_id
                          FROM employees WHERE manager_id IS NOT NULL);
*/

--Uncomment code below to run the solution for Task 8 for Practice 6
/*
         SELECT last_name
         FROM    employees outer
         WHERE outer.salary < (SELECT AVG(inner.salary)
                               FROM employees inner
                               WHERE inner.department_id 
                                     = outer.department_id);

*/

--Uncomment code below to run the solution for Task 9 for Practice 6
/*

SELECT  last_name
         FROM    employees outer
         WHERE EXISTS (SELECT 'X'
                       FROM employees inner
                       WHERE inner.department_id = 
                             outer.department_id 
                       AND inner.hire_date > outer.hire_date
                       AND inner.salary > outer.salary);	
*/

--Uncomment code below to run the solution for Task 10 for Practice 6
/*

SELECT employee_id, last_name, 
  	         (SELECT department_name
         		FROM departments d
  	          WHERE   e.department_id =  	
                  d.department_id ) department
  	  FROM employees e
  	  ORDER BY department;
*/

--Uncomment code below to run the solution for Task 11 for Practice 6
/*

WITH 
summary AS (
  SELECT d.department_name, SUM(e.salary) AS dept_total
  FROM employees e JOIN departments d
  ON e.department_id = d.department_id
  GROUP BY d.department_name)
SELECT department_name, dept_total
FROM summary
WHERE dept_total > ( SELECT SUM(dept_total) * 1/8
                    FROM summary  )
ORDER BY dept_total DESC;

*/
