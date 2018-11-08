--The SQL Script to run the code_examples for Lesson 3

--Uncomment code below to run the code for slide 06_sa for lesson 3
/*

	             SELECT employee_id, last_name, job_id, department_id
                     FROM   employees
                     WHERE  department_id = 90 ;
*/

--Uncomment code below to run the code for slide 07_sa for lesson 3

/*
	             SELECT last_name, job_id, department_id
                     FROM   employees
                     WHERE  last_name = 'Whalen' ;
*/

--Uncomment code below to run the code for slide 07_sb for lesson 3

/*
	             SELECT last_name 
                     FROM   employees
                     WHERE  hire_date = '17-OCT-03' ;
*/

--Uncomment code below to run the code for slide 07_na for lesson 3

/*              
	             SELECT last_name, job_id, department_id
                     FROM   employees
                     WHERE  last_name = 'WHALEN';

*/

--Uncomment code below to run the code for slide 09_sa for lesson 3

/*
	             SELECT last_name, salary
                     FROM   employees
                     WHERE  salary <= 3000 ;

*/

--Uncomment code below to run the code for slide 10_sa for lesson 3

/*
	            SELECT last_name, salary
                    FROM   employees
                    WHERE  salary BETWEEN 2500 AND 3500 ;

*/

--Uncomment code below to run the code for slide 10_na for lesson 3

/*
	             SELECT last_name FROM   employees 
                     WHERE  last_name BETWEEN 'King' AND 'Whalen';
*/  


--Uncomment code below to run the code for slide 11_sa for lesson 3

/*
	            SELECT employee_id, last_name, salary, manager_id
                     FROM   employees
                    WHERE  manager_id IN (100, 101, 201) ;
*/

--Uncomment code below to run the code for slide 11_na for lesson 3


/*	             SELECT employee_id, manager_id, department_id
                     FROM   employees
                     WHERE  last_name IN ('Hartstein', 'Vargas');
*/


--Uncomment code below to run the code for slide 12_sa for lesson 3
/*

	             SELECT	 first_name
                     FROM employees
                     WHERE	first_name LIKE 'S%' ;

*/

--Uncomment code below to run the code for slide 12_na for lesson 3

/*
	             SELECT last_name, hire_date
                     FROM   employees
                     WHERE  hire_date LIKE '%05';
*/

--Uncomment code below to run the code for slide 13_sa for lesson 3

/*
                     SELECT last_name
                     FROM   employees
                     WHERE  last_name LIKE '_o%' ;
*/


--Uncomment code below to run the code for slide 14_sa for lesson 3

/*
	             SELECT last_name, manager_id
                     FROM   employees
                     WHERE  manager_id IS NULL ;
*/

--Uncomment code below to run the code for slide 14_na for lesson 3

/*
	             SELECT last_name, job_id, commission_pct
                     FROM   employees
                     WHERE  commission_pct IS NULL;
*/

--Uncomment code below to run the code for slide 16_sa for lesson 3

/*
	             SELECT employee_id, last_name, job_id, salary
                     FROM   employees
                     WHERE  salary >= 10000
                     AND    job_id LIKE '%MAN%' ;

*/

--Uncomment code below to run the code for slide 17_sa for lesson 3

/*
                    SELECT employee_id, last_name, job_id, salary
                    FROM   employees
                    WHERE  salary >= 10000
                    OR     job_id LIKE '%MAN%' ;
*/

--Uncomment code below to run the code for slide 18_sa for lesson 3

/*
                    SELECT last_name, job_id
                   FROM   employees
                    WHERE  job_id 
                    NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;
*/


--Uncomment code below to run the code for slide 21_sa for lesson 3

/*
                    SELECT last_name, department_id, salary
                    FROM   employees
                    WHERE  department_id = 60
                    OR     department_id = 80
                    AND    salary > 10000;

*/

--Uncomment code below to run the code for slide 21_sb for lesson 3

/*
                    SELECT last_name, department_id, salary
                    FROM   employees
                    WHERE  (department_id = 60
                    OR     department_id = 80)
                    AND    salary > 10000;

*/

--Uncomment code below to run the code for slide 23_sa for lesson 3	
/*

                   SELECT   last_name, job_id, department_id, hire_date
                   FROM     employees
                   ORDER BY hire_date ;
*/

--Uncomment code below to run the code for slide 24_sa for lesson 3

/*
                   SELECT   last_name, job_id, department_id, hire_date
                   FROM     employees
                   ORDER BY department_id DESC ;

*/

--Uncomment code below to run the code for slide 24_sb for lesson 3


/*               SELECT employee_id, last_name, salary*12 annsal
                  FROM   employees
                  ORDER BY annsal ;
*/


--Uncomment code below to run the code for slide 25_sa for lesson 3

/*
                  SELECT   last_name, job_id, department_id, hire_date
                  FROM     employees
                  ORDER BY 3;
*/

--Uncomment code below to run the code for slide 25_sb for lesson 3

/*
                  SELECT last_name, department_id, salary
                  FROM   employees
                  ORDER BY department_id, salary DESC;

*/

--Uncomment code below to run the code for slide 29_sa for lesson 3

/*
                    SELECT employee_id, first_name
                    FROM   employees
                    ORDER BY employee_id
                   FETCH FIRST 5 ROWS ONLY;
*/

--Uncomment code below to run the code for slide 29_sb for lesson 3


/*                  SELECT employee_id, first_name
                    FROM employees
                    ORDER BY employee_id
                    OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
*/


--Uncomment code below to run the code for slide 33_sa for lesson 3

/*
                  SELECT employee_id, last_name, salary, department_id
                  FROM   employees
                  WHERE  employee_id = &employee_num ;
*/


--Uncomment code below to run the code for slide 35_sa for lesson 3

/*
                  SELECT last_name, department_id, salary*12
                  FROM   employees
                  WHERE  job_id = '&job_title' ;
*/


--Uncomment code below to run the code for slide 36_sa for lesson 3

/*
                  SELECT employee_id, last_name, job_id,&column_name
                  FROM   employees
                  WHERE  &condition
                  ORDER BY &order_column ;
*/

--Uncomment code below to run the code for slide 37_sa for lesson 3
/*

                  SELECT   employee_id, last_name, job_id, &&column_name
                  FROM     employees
                  ORDER BY &column_name ;
*/

--Uncomment code below to run the code for slide 40_sa for lesson 3

/*
                  DEFINE employee_num = 200
                 SELECT employee_id, last_name, salary, department_id
               FROM   employees
                 WHERE  employee_id = &employee_num ;
                  UNDEFINE employee_num

*/

--Uncomment code below to run the code for slide 41_sa for lesson 3

/*
                  SET VERIFY ON
                  SELECT employee_id, last_name, salary
                  FROM   employees
                  WHERE  employee_id = &employee_num;
*/
