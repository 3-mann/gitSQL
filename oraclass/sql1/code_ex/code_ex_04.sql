--The SQL Script to run the code_examples for Lesson 4

   

--Uncomment code below to run the code for slide 11_na for lesson 4


/*
	             SELECT 'The job id for '||UPPER(last_name)||' is '
	             ||LOWER(job_id) AS "EMPLOYEE DETAILS"
                     FROM   employees;
*/


--Uncomment code below to run the code for slide 12_sa for lesson 4


/*
	             SELECT employee_id, last_name, department_id
                     FROM   employees
                     WHERE  last_name = 'higgins';

*/


--Uncomment code below to run the code for slide 12_sb for lesson 4

/*
	             SELECT employee_id, last_name, department_id
                     FROM   employees
                     WHERE  LOWER(last_name) = 'higgins';

*/

--Uncomment code below to run the code for slide 12_na for lesson 4

/*                   SELECT employee_id, UPPER(last_name), department_id
                     FROM   employees
                     WHERE  INITCAP(last_name) = 'Higgins';

*/

--Uncomment code below to run the code for slide 14_sa for lesson 4

/*
	            SELECT CONCAT(CONCAT(last_name, '''s job category is '), job_id) "Job" 
              FROM   employees
              WHERE  SUBSTR(job_id, 4) = 'REP';
 

*/

--Uncomment code below to run the code for slide 14_sb for lesson 4

/*
	                  SELECT employee_id, CONCAT(first_name, last_name) NAME,
                     LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
                     FROM   employees
                     WHERE  SUBSTR(last_name, -1, 1) = 'n';
*/

--Uncomment code below to run the code for slide 17_sa for lesson 4

/*                   SELECT last_name,
                     UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US'))
                     FROM   employees
                     WHERE  department_id = 60;

*/

--Uncomment code below to run the code for slide 20_sa for lesson 4

/*
                   SELECT ROUND(45.923,2), ROUND(45.923,0),
                   ROUND(45.923,-1)
                   FROM   DUAL;
*/

--Uncomment code below to run the code for slide 21_sa for lesson 4

/*
                    SELECT TRUNC(45.923,2), TRUNC(45.923),
                    TRUNC(45.923,-1)
                    FROM   DUAL;
*/


--Uncomment code below to run the code for slide 22_sa for lesson 4

/*
                    SELECT employee_id as "Even Numbers", last_name
                    FROM employees WHERE MOD(employee_id,2) = 0;


*/

--Uncomment code below to run the code for slide 24_sa for lesson 4

/*
                    SELECT last_name, hire_date
                    FROM   employees
                    WHERE  hire_date < '01-FEB-2008';
*/

--Uncomment code below to run the code for slide 27_sa for lesson 4

/*
                    SELECT sysdate
                    FROM   dual;

*/

--Uncomment code below to run the code for slide 28_sa for lesson 4


/*                  SELECT sessiontimezone, current_date 
                    FROM dual;
   
*/

--Uncomment code below to run the code for slide 28_sb for lesson 4

/*                  SELECT sessiontimezone, current_timestamp
                    FROM dual; 
*/

--Uncomment code below to run the code for slide 30_sa for lesson 4
/*

                  SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
                  FROM   employees
                  WHERE  department_id = 90;
*/

--Uncomment code below to run the code for slide 33_na for lesson 4

/*
                  SELECT employee_id, hire_date,
                  MONTHS_BETWEEN (SYSDATE, hire_date) TENURE,
                  ADD_MONTHS (hire_date, 6) REVIEW,
                  NEXT_DAY (hire_date, 'FRIDAY'), LAST_DAY(hire_date)
                  FROM   employees
                  WHERE  MONTHS_BETWEEN (SYSDATE, hire_date) < 150;
*/


--Uncomment code below to run the code for slide 34_na for lesson 4

/*
                  SELECT employee_id, hire_date,
                  ROUND(hire_date, 'MONTH'), TRUNC(hire_date, 'MONTH')
                  FROM   employees
                  WHERE  hire_date LIKE '%04';   

*/

