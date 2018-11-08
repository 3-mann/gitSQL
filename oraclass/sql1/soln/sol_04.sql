--The SQL Script to run the solution for Practice 4

--Uncomment code below to run the solution for Task 1 for Practice 4

/*
	          SELECT  sysdate "Date"
                  FROM    dual;
 
*/

--Uncomment code below to run the solution for Task 2 for Practice 4
/*
	
                  SELECT  employee_id, last_name, salary,
                   ROUND(salary * 1.155, 0) "New Salary"
                  FROM    employees;
*/

--Uncomment code below to run the solution for Task 3 for Practice 4
/*
	          SELECT  employee_id, last_name, salary,
                   ROUND(salary * 1.155, 0) "New Salary"
                  FROM    employees;
*/

--Uncomment code below to run the solution for Task 4 for Practice 4
/*	
                    SELECT  employee_id, last_name, salary, 
                    ROUND(salary * 1.155, 0) "New Salary",
                   ROUND(salary * 1.155, 0) - salary "Increase" 
                   FROM    employees;
*/

--Uncomment code below to run the solution for Task 5_a  for Practice 4
/*
	            SELECT  INITCAP(last_name) "Name",
                    LENGTH(last_name) "Length"
                     FROM    employees
                    WHERE   last_name LIKE 'J%'
                    OR      last_name LIKE 'M%'
                    OR      last_name LIKE 'A%'
                    ORDER BY last_name ;

*/
--Uncomment code below to run the solution for Task 5_b  for Practice 4
/*
                   SELECT  INITCAP(last_name) "Name",
                   LENGTH(last_name) "Length"
                   FROM    employees
                   WHERE   last_name LIKE '&start_letter%' 
                   ORDER BY last_name;
*/

--Uncomment code below to run the solution for Task 5_c  for Practice 4
/* 
                  SELECT  INITCAP(last_name) "Name",
                  LENGTH(last_name) "Length"
                  FROM    employees
                  WHERE   last_name LIKE UPPER('&start_letter%' )
                  ORDER BY last_name;
*/

--Uncomment code below to run the solution for Task 6 for Practice 4
/*                
                  SELECT last_name, ROUND(MONTHS_BETWEEN (
                  SYSDATE, hire_date)) MONTHS_WORKED
                  FROM   employees 
                  ORDER BY MONTHS_WORKED;
*/

--Uncomment code below to run the solution for Task 7 for Practice 4
/*	
                 SELECT last_name,
                 LPAD(salary, 15, '$') SALARY
                 FROM   employees;
*/

--Uncomment code below to run the solution for Task 8 for Practice 4
/*
                  SELECT last_name,  
                 rpad(' ', salary/1000+1, '*')
                  EMPLOYEES_AND_THEIR_SALARIES
                 FROM  employees
                 ORDER BY salary DESC;
*/

--Uncomment code below to run the solution for Task 9 for Practice 4
/*	
                  SELECT last_name, trunc((SYSDATE-hire_date)/7) AS TENURE
                  FROM   employees
                  WHERE  department_id = 90
                  ORDER BY TENURE DESC;

*/

