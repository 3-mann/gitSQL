--The SQL Script to run the solution for Practice 2

--Uncomment code below to run the solution for Task 4_a  for Practice 2

/*

	         DESCRIBE departments

*/

--Uncomment code below to run the solution for Task 4_b  for Practice 2
/*	
                  SELECT * 
                  FROM   departments;
*/

--Uncomment code below to run the solution for Task 5_a  for Practice 2
/*	
                 DESCRIBE employees

*/

--Uncomment code below to run the solution for Task 5_b for Practice 2
/*
	
                  SELECT employee_id, last_name, job_id, hire_date StartDate
                   FROM   employees;
*/


--Uncomment code below to run the solution for Task 6 for Practice 2
/*	       
	            SELECT DISTINCT job_id
	            FROM   employees;
*/

--Uncomment code below to run the solution for Task 7 for Practice 2
/*
	
                    SELECT employee_id "Emp #", last_name "Employee",
                    job_id "Job", hire_date "Hire Date"
                     FROM   employees;
*/
--Uncomment code below to run the solution for Task 8 for Practice 2
/*	
                     SELECT last_name||', '||job_id "Employee and Title"
                     FROM   employees;
*/

--Uncomment code below to run the solution for Task 9 for Practice 2
/*	
                     SELECT employee_id || ',' || first_name || ',' || last_name 
                    || ',' || email || ',' || phone_number || ','|| job_id
                     || ',' || manager_id || ',' || hire_date || ',' 
                     || salary || ',' || commission_pct || ',' || department_id 
                    THE_OUTPUT 
                     FROM   employees;

*/






