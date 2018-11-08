--The SQL Script to run the solution for Practice 8


--Uncomment code below to run the solution for Task 1 for Practice 8
--Execute the UNDEFINE command to remove a variable
/*
                    UNDEFINE Enter_name
*/
-- Execute the below SELECT statements to retrieve the values from employees table
/*
                    SELECT last_name, hire_date
                    FROM   employees
                    WHERE  department_id = (SELECT department_id
                                           FROM   employees
                                           WHERE  last_name = '&&Enter_name')
                   AND    last_name <> '&Enter_name';
*/

--Uncomment code below to run the solution for Task 2 for Practice 8

/*
                  SELECT employee_id, last_name, salary
                  FROM   employees
                  WHERE  salary > (SELECT AVG(salary)
                                   FROM   employees)
                  ORDER BY salary;
*/

--Uncomment code below to run the solution for Task 3 for Practice 8
/*
                   SELECT employee_id, last_name
                   FROM   employees
                   WHERE  department_id IN (SELECT department_id
                                                FROM   employees
                                                WHERE  last_name like '%u%');
*/

--Uncomment code below to run the solution for Task 4_a for Practice 8
/*
                   SELECT last_name, department_id, job_id
                   FROM   employees
                   WHERE  department_id IN (SELECT department_id
                                            FROM   departments
                                            WHERE  location_id = 1700);
*/

--Uncomment code below to run the solution for Task 4_b for Practice 8
/*

                   SELECT last_name, department_id, job_id
                   FROM   employees
                   WHERE  department_id IN (SELECT department_id
                                              FROM   departments
                                              WHERE  location_id = &Enter_location);

*/

--Uncomment code below to run the solution for Task 5 for Practice 8
/*
                   SELECT last_name, salary
                   FROM   employees
                   WHERE  manager_id = (SELECT employee_id
                                           FROM   employees
                                           WHERE  last_name = 'King');
*/

--Uncomment code below to run the solution for Task 6 for Practice 8

/*
                   SELECT department_id, last_name, job_id
                   FROM   employees
                   WHERE  department_id IN (SELECT department_id
                                            FROM   departments
                                            WHERE  department_name = 'Executive');
*/

--Uncomment code below to run the solution for Task 7 for Practice 8
/*

                   SELECT last_name FROM employees
                   WHERE salary > ANY (SELECT salary
		                       FROM employees
		                       WHERE department_id=60);

*/

--Uncomment code below to run the solution for Task 8 for Practice 8

/*
                   SELECT employee_id, last_name, salary
                   FROM   employees
                    WHERE  department_id IN (SELECT department_id
                                             FROM   employees
                                             WHERE  last_name like '%u%')
                   AND    salary > (SELECT AVG(salary)	
                   FROM   employees);
*/
