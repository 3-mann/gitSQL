--The SQL Script to run the code_examples for Lesson 8

   

-- Uncomment code below to run the code for slide 06_sa for lesson 8

/*
                    SELECT last_name, hire_date
                    FROM   employees 
                    WHERE  hire_date > (SELECT hire_date 
                                        FROM   employees
                                        WHERE  last_name = 'Davies');

*/


-- Uncomment code below to run the code for slide 10_na for lesson 8


/*
	             SELECT last_name, job_id
                     FROM   employees
                     WHERE  job_id =
                                     (SELECT job_id
                                      FROM   employees
                                      WHERE  employee_id = 141);
*/

-- Uncomment code below to run the code for slide 11_sa for lesson 8

/*

	            SELECT last_name, job_id, salary
                    FROM   employees
                    WHERE  job_id =
                                   (SELECT job_id
                                    FROM   employees
                                    WHERE  last_name = 'Taylor')
                     AND    salary >
                                   (SELECT salary
                                    FROM   employees
                                    WHERE  last_name = 'Taylor');
*/


-- Uncomment code below to run the code for slide 12_sa for lesson 8

/*
                     SELECT last_name, job_id, salary
                     FROM   employees
                     WHERE  salary = 
                                      (SELECT MIN(salary)
                                      FROM   employees);
*/

-- Uncomment code below to run the code for slide 13_sa for lesson 8

/*
	 SELECT   department_id, MIN(salary)
                     FROM     employees
                     GROUP BY department_id
                     HAVING   MIN(salary) >
                                            (SELECT MIN(salary)
                                             FROM   employees
                                             WHERE  department_id = 30);

*/

-- Uncomment code below to run the code for slide 13_na for lesson 8

/*

                      SELECT   job_id, AVG(salary)
                      FROM     employees
                      GROUP BY job_id
                      HAVING   AVG(salary) = (SELECT   MIN(AVG(salary))
                                              FROM     employees
                                              GROUP BY job_id);
*/

-- Uncomment code below to run the code for slide 14_sa for lesson 8

/*

                      SELECT employee_id, last_name
                      FROM   employees
                      WHERE  salary = (SELECT   MIN(salary)
                                       FROM     employees
                                       GROUP BY department_id);
*/


--Uncomment code below to run the code for slide 15_sa for lesson 8

/*
                      SELECT last_name, job_id
                      FROM   employees
                      WHERE  job_id = (SELECT job_id
                                       FROM   employees
                                       WHERE  last_name = 'Haas');
*/


--Uncomment code below to run the code for slide 17_na for lesson 8

/*
                      SELECT last_name, salary, department_id
                      FROM   employees
                      WHERE  salary IN (SELECT   MIN(salary)
                                                          FROM     employees
                                                          GROUP BY department_id);
*/

--Uncomment code below to run the code for slide 17_nb for lesson 8

/*

                     SELECT last_name, salary, department_id
                      FROM   employees
                      WHERE  salary IN (2500, 4200, 4400, 6000, 7000, 8300, 8600, 17000);
*/



--Uncomment code below to run the code for slide 18_sa for lesson 8

/*

                        SELECT employee_id, last_name, job_id, salary
                        FROM   employees
                        WHERE  salary < ANY
                                      (SELECT salary
                                       FROM   employees
                                       WHERE  job_id = 'IT_PROG')
                        AND    job_id <> 'IT_PROG';

*/

--Uncomment code below to run the code for slide 19_sa for lesson 8

/*
                        SELECT employee_id, last_name, job_id, salary
                        FROM   employees
                        WHERE  salary < ALL
                                         (SELECT salary
                                          FROM   employees
                                          WHERE  job_id = 'IT_PROG')
                       AND    job_id <> 'IT_PROG';

*/

--Uncomment code below to run the code for slide 21_sa for lesson 8

/*
                        SELECT first_name, department_id, salary
                        FROM employees
                        WHERE (salary, department_id) IN
                                                      (SELECT min(salary), department_id
                                                       FROM employees
                                                       GROUP BY department_id)
                        ORDER BY department_id;


*/





--Uncomment code below to run the code for slide 23_sa for lesson 8

/*

                     SELECT emp.last_name
                     FROM   employees emp
                     WHERE  emp.employee_id NOT IN
                                                (SELECT mgr.manager_id
                                                 FROM   employees mgr);
*/


--Uncomment code below to run the code for slide 23_na for lesson 8

/*
                  SELECT emp.last_name
                   FROM   employees emp
                  WHERE  emp.employee_id  IN
                                          (SELECT mgr.manager_id
                                           FROM   employees mgr);
*/

--Uncomment code below to run the code for slide 24_na for lesson 8


/*
                   SELECT last_name FROM employees
                   WHERE  employee_id NOT IN
                                          (SELECT manager_id 
                                           FROM   employees 
                                           WHERE  manager_id IS NOT NULL);

*/

