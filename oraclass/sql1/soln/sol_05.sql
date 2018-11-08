---The SQL Script to run the solution for Practice 5

--Uncomment code below to run the solution for Task 1 for Practice 5
/*
	SELECT  last_name || ' earns '
                    || TO_CHAR(salary, 'fm$99,999.00')
                    || ' monthly but wants '
                    || TO_CHAR(salary * 3, 'fm$99,999.00')
                    || '.' "Dream Salaries"
                   FROM    employees;

 */

--Uncomment code below to run the solution for Task 2 for Practice 5
/*	
                    SELECT last_name, hire_date,
                    TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'),
                   'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW
                    FROM    employees; 

*/


--Uncomment code below to run the solution for Task 3 for Practice 5
/*	
                     SELECT last_name,
                     NVL(TO_CHAR(commission_pct), 'No Commission') COMM
                     FROM   employees;       
*/


--Uncomment code below to run the solution for Task 4  for Practice 5
/*
                   SELECT job_id, CASE job_id
                       WHEN 'ST_CLERK' THEN 'E'
                       WHEN 'SA_REP'   THEN 'D'
                       WHEN 'IT_PROG'  THEN 'C'
                       WHEN 'ST_MAN'   THEN 'B'
                       WHEN 'AD_PRES'  THEN 'A'
                       ELSE '0'  END  GRADE
                  FROM employees; 

*/

--Uncomment code below to run the solution for Task 5 for Practice 5
/*
                      SELECT job_id, CASE              
                         WHEN job_id = 'ST_CLERK' THEN 'E'
                         WHEN job_id = 'SA_REP'   THEN 'D'
                         WHEN job_id = 'IT_PROG'  THEN 'C'
                         WHEN job_id = 'ST_MAN'   THEN 'B'
                         WHEN job_id = 'AD_PRES'  THEN 'A'
                         ELSE '0'  END  GRADE
                      FROM employees; 


*/


/*
--Uncomment code below to run the solution for Task 6 for Practice 5

                    SELECT job_id, decode (job_id,
                       'ST_CLERK',  'E',
                       'SA_REP',    'D',
                       'IT_PROG',   'C',
                       'ST_MAN',    'B',
                       'AD_PRES',   'A',
                       '0')GRADE
                    FROM employees;

*/


