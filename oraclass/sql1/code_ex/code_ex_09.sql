--The SQL Script to run the code_examples for Lesson 9

   

-- Uncomment code below to run the code for slide 09_na for lesson 9

/*
                   DESCRIBE employees

*/

-- Uncomment code below to run the code for slide 10_na for lesson 9 

/*

	           SELECT employee_id, last_name, job_id, hire_date, department_id 
                    FROM employees;

*/

-- Uncomment code below to run the code for slide 10_nb for lesson 9
--Before running this script, run the code_09_retired_emp_tab.sql script (in the /home/oracle/labs/sql1/code_ex)*/
/* to create the test table */
/* and insert rows in the table */

/*

                    DESCRIBE retired_employees

*/

-- Uncomment code below to run the code for slide 11_na for lesson 9


/*

                    SELECT * FROM retired_employees;

*/

-- Uncomment code below to run the code for slide 14_sa for lesson 9

/*
	            SELECT job_id
              FROM   employees
              UNION 
              SELECT job_id
              FROM  retired_employees;

*/



*/

-- Uncomment code below to run the code for slide 16_sa for lesson 9

/*
                    SELECT job_id, department_id
                    FROM   employees
                    UNION ALL
                    SELECT job_id, department_id
                    FROM   retired_employees
                    ORDER BY  job_id;
*/


-- Uncomment code below to run the code for slide 16_na for lesson 9

/*

                    SELECT job_id,department_id
                     FROM     employees  
                     UNION
                     SELECT job_id,department_id
                     FROM    retired_employees
                     ORDER BY job_id; 
                     
*/

--Uncomment code below to run the code for slide 19_sa for lesson 9

/*
                      SELECT  manager_id,department_id
                      FROM   employees
                      INTERSECT
                      SELECT manager_id,department_id
                      FROM   retired_employees

*/




--Uncomment code below to run the code for slide 22_sa for lesson 9


/*

                      SELECT employee_id, job_id
                      FROM employees
                      WHERE department_id = 80
                      MINUS
                      SELECT employee_id, job_id
                      FROM retired_employees
                      WHERE department_id = 90;

*/



--Uncomment code below to run the code for slide 24_sa for lesson 9


/*
                        SELECT location_id, department_name "Department", 
                        TO_CHAR(NULL) "Warehouse location"  
                        FROM departments
                        UNION
                        SELECT location_id, TO_CHAR(NULL) "Department",  state_province
                        FROM locations;

*/


--Uncomment code below to run the code for slide 25_sa for lesson 9

/*
                        SELECT  FIRST_NAME, JOB_ID, TO_DATE(hire_date)"HIRE_DATE"
                        FROM employees
                        UNION
                        SELECT FIRST_NAME, JOB_ID, TO_DATE(NULL)"HIRE_DATE"
                        FROM retired_employees;

*/

--Uncomment code below to run the code for slide 28_na for lesson 9

/*
                        SELECT employee_id, job_id,salary
                        FROM   employees
                        UNION
                        SELECT employee_id, job_id,0
                        FROM   retired_employees
                        ORDER BY 2;
*/










