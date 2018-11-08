---The SQL Script to run the solution for Practice 6

--Uncomment code below to run the solution for Task 4 for Practice 6
/*

	           SELECT ROUND(MAX(salary),0) "Maximum",
                   ROUND(MIN(salary),0) "Minimum",
                   ROUND(SUM(salary),0) "Sum",
                    ROUND(AVG(salary),0) "Average"
                   FROM   employees;   

*/
 

--Uncomment code below to run the solution for Task 5 for Practice 6
/*	
                   SELECT job_id, ROUND(MAX(salary),0) "Maximum",
                   ROUND(MIN(salary),0) "Minimum",
                   ROUND(SUM(salary),0) "Sum",
                   ROUND(AVG(salary),0) "Average"
                   FROM   employees       
                   GROUP BY job_id;
*/


--Uncomment code below to run the solution for Task 6_a for Practice 6
/*
                  SELECT job_id, COUNT(*)
                  FROM   employees 
                  GROUP BY job_id;
*/

--Uncomment code below to run the solution for Task 6_b for Practice 6
/*	
                   SELECT job_id, COUNT(*)
                   FROM   employees
                   WHERE  job_id = '&job_title'
                   GROUP BY job_id;
*/


--Uncomment code below to run the solution for Task 7  for Practice 6
/*

	            SELECT COUNT(DISTINCT manager_id) "Number of Managers"
                    FROM   employees; 


*/

--Uncomment code below to run the solution for Task 8 for Practice 6
/*
                    SELECT   MAX(salary) - MIN(salary) DIFFERENCE
                     FROM     employees;
*/

--Uncomment code below to run the solution for Task 9 for Practice 6
/*
                    SELECT   manager_id, MIN(salary)
                    FROM     employees
                    WHERE    manager_id IS NOT NULL
                    GROUP BY manager_id
                    HAVING   MIN(salary) > 6000 
                    ORDER BY MIN(salary) DESC;
*/

--Uncomment code below to run the solution for Task 10 for Practice 6
/*
                   SELECT  COUNT(*) total,
                   SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2005,1,0))"2005",
                    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2006,1,0))"2006",
                    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2007,1,0))"2007",
                   SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2008,1,0))"2008"
                   FROM    employees;

*/

--Uncomment code below to run the solution for Task 11 for Practice 6
/*

                     SELECT   job_id "Job",
                     SUM(DECODE(department_id , 20, salary)) "Dept 20",
                     SUM(DECODE(department_id , 50, salary)) "Dept 50",
                     SUM(DECODE(department_id , 80, salary)) "Dept 80",
                     SUM(DECODE(department_id , 90, salary)) "Dept 90", 
                     SUM(salary) "Total"
                     FROM     employees
                     GROUP BY job_id;
*/


