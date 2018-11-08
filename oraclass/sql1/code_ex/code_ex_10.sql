--The SQL Script to run the code_examples for Lesson 10

 

-- Uncomment code below to run the code for slide 07_sa for lesson 10


/*

                    INSERT INTO departments(department_id, 
                            department_name, manager_id, location_id)
                    VALUES (70, 'Public Relations', 100, 1700);
/*



                 

-- Uncomment code below to run the code for slide 07_na for lesson 10

/*
                    DESCRIBE  departments

*/

-- Uncomment code below to run the code for slide 08_sa for lesson 10

/*
   
	             INSERT INTO  departments (department_id, department_name )
                     VALUES (30, 'Purchasing');

*/

-- Uncomment code below to run the code for slide 08_sb for lesson 10


/*

                    INSERT INTO departments
                    VALUES (100, 'Finance', NULL, NULL);

*/


-- Uncomment code below to run the code for slide 09_sa for lesson 10

/*

                      INSERT INTO employees (employee_id, 
                      first_name, last_name, 
                      email, phone_number,
                       hire_date, job_id, salary, 
                      commission_pct, manager_id,
                      department_id)
                      VALUES (113, 'Louis', 'Popp', 'LPOPP', '515.124.4567', 
                              CURRENT_DATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);

*/


-- Uncomment code below to run the code for slide 09_na for lesson 10

/*
                 SELECT employee_id, last_name, job_id, hire_date, commission_pct
                     FROM   employees
                     WHERE  employee_id = 113;
*/

-- Uncomment code below to run the code for slide 10_sa for lesson 10

/*

                      INSERT INTO employees
                      VALUES      (114, 
                      'Den', 'Raphealy', 
                      'DRAPHEAL', '515.127.4561',
                      TO_DATE('FEB 3, 2003', 'MON DD, YYYY'),
                      'SA_REP', 11000, 0.2, 100, 60);
*/

-- Uncomment code below to run the code for slide 10_sb for lesson 10

/*

                     SELECT employee_id, first_name,last_name, email, phone_number, hire_date, job_id, 
                     commission_pct, salary, manager_id
                     FROM   employees
                     WHERE  employee_id = 114;

*/



-- Uncomment code below to run the code for slide 11_sa for lesson 10

/*

                      INSERT INTO departments (department_id, department_name, location_id)
                      VALUES     (&department_id, '&department_name',&location);
*/



--Uncomment code below to run the code for slide 12_sa for lesson 10
-- Execute the CREATE statement to create the sales_reps table before executing the INSERT statement.
--Please ignore the warning message, if you get any.

/*

                    DROP TABLE sales_reps;

                    CREATE TABLE sales_reps 
                    AS
                    SELECT employee_id id, last_name name, salary, commission_pct
                    FROM   employees where 1=2;
   

                     INSERT INTO sales_reps(id, name, salary, commission_pct)
                      SELECT employee_id, last_name, salary, commission_pct
                      FROM   employees
                     WHERE  job_id LIKE '%REP%';

*/

--Uncomment code below to run the code for slide 12_na for lesson 10
--Please ignore the warning message, if you get any.
--Execute the CREATE statement to create the copy_emp table before executing the INSERT statement.

/*                  

                    DROP TABLE copy_emp;
                    CREATE TABLE copy_emp
                    AS SELECT * FROM employees WHERE 1 = 2;
  
                    INSERT INTO copy_emp
                    SELECT * 
                    FROM   employees;

*/                    

-- Uncomment code below to run the code for slide 16_sa for lesson 10

/*
                     UPDATE employees
                     SET    department_id = 50
                     WHERE  employee_id = 113;
*/

-- Uncomment code below to run the code for slide 16_sb for lesson 10

/*

                     UPDATE   copy_emp
                     SET  department_id = 110;
*/

-- Uncomment code below to run the code for slide 16_na for lesson 10

/*

                     SELECT last_name, department_id
                     FROM   copy_emp;
*/

-- Uncomment code below to run the code for slide 16_nb for lesson 10

/*

                     UPDATE employees
	             SET job_id = 'IT_PROG', commission_pct = NULL	
	             WHERE employee_id = 114;

*/

-- Uncomment code below to run the code for slide 17_sa for lesson 10

/*
                      UPDATE   employees
                      SET      (job_id,salary)  = (SELECT  job_id,salary
                    	                             FROM    employees 
                                                   WHERE   employee_id = 205)
                      WHERE    employee_id    =  103;
*/


-- Uncomment code below to run the code for slide 18_sa for lesson 10

/*
                       UPDATE  copy_emp
                       SET  department_id  =  (SELECT department_id
                                               FROM employees
                                               WHERE employee_id = 100)
                       WHERE   job_id  =  (SELECT job_id
                                          FROM employees
                                          WHERE employee_id = 200);
*/

-- Uncomment code below to run the code for slide 22_sa for lesson 10


/*
                     DELETE FROM departments
                     WHERE  department_name = 'Finance';
*/

-- Uncomment code below to run the code for slide 22_sb for lesson 10


/*
                    DELETE FROM  copy_emp;

*/

-- Uncomment code below to run the code for slide 22_na for lesson 10

/*

                    SELECT  *
                    FROM    departments
                    WHERE   department_name = 'Finance';
*/


-- Uncomment code below to run the code for slide 22_nb for lesson 10

/*

                    DELETE FROM  employees WHERE employee_id = 114;
*/


-- Uncomment code below to run the code for slide 22_nc for lesson 10

/*

                    DELETE FROM  departments WHERE department_id IN (30, 40);

*/


-- Uncomment code below to run the code for slide 23_sa for lesson 10
--Execute the INSERT statement first
/*
                    INSERT INTO employees (employee_id, 
                                           first_name, last_name, 
                                          email, phone_number,
                                           hire_date, job_id, salary, 
                                           commission_pct, manager_id,
                                         department_id)
                   VALUES    (207, 
                                            'Eva', 'Jones', 
                                           'EJONES', '515.124.4666', 
                                           SYSDATE, 'AC_ACCOUNT', 3300, 
                                           NULL, 205, 70);

                    DELETE FROM employees
                    WHERE  department_id IN
                                                                (SELECT department_id
                                                                 FROM   departments
                                                                WHERE  department_name 
                                                               LIKE '%Public%');

*/


-- Uncomment code below to run the code for slide 35_sa for lesson 10

/*
                  DELETE FROM employees
                  WHERE  employee_id = 113;


                  INSERT INTO departments 
                  VALUES (290, 'Corporate Tax', NULL, 1700);
*/

-- Uncomment code below to run the code for slide 35_sb for lesson 10

/*
                  COMMIT;
*/

-- Uncomment code below to run the code for slide 35_na for lesson 10


/*
                 DELETE FROM departments
                 WHERE  department_id IN (290, 300);

*/

-- Uncomment code below to run the code for slide 35_nb for lesson 10

/*
                   UPDATE  employees
                   SET   department_id = 80
                  WHERE employee_id = 206;

*/

-- Uncomment code below to run the code for slide 35_nc for lesson 10
/*
                   COMMIT;
*/


--Uncomment code below to run the code for slide 36_sa for lesson 9
--Execute the INSERT statement first to insert rows into the copy_emp table and then execute the DELETE statement
/*

                  INSERT INTO copy_emp 
                  SELECT * FROM employees;

                  DELETE FROM copy_emp;

                  ROLLBACK ;

*/

--Uncomment code below to run the code for slide 37_sa for lesson 10

/* Before running this script, run the code_10_cretest.sql script (in the /home/oracle/labs/sql1/code_ex)*/
/* to create the test table */
/* and insert rows in the table */
/*
             DELETE FROM test;

             ROLLBACK;
             DELETE FROM test WHERE  id = 100;

             SELECT * FROM   test WHERE  id = 100;
 
             COMMIT;
*/

--Uncomment code below to run the code for slide 43_sa for lesson 10

/*

                SELECT employee_id, salary, commission_pct, job_id
                FROM employees  
                WHERE job_id = 'SA_REP'
                FOR UPDATE 
                ORDER BY employee_id;
*/

 -- Uncomment code below to run the code for slide 44_sa for lesson 10    
                 
/*
                SELECT e.employee_id, e.salary, e.commission_pct 
                FROM employees e JOIN departments d 
                USING (department_id) 
                WHERE job_id = 'ST_CLERK' AND location_id = 1500 
                FOR UPDATE 
                ORDER BY e.employee_id; 
*/

-- Uncomment code below to run the code for slide 44_na for lesson 10

/*
             SELECT e.employee_id, e.salary, e.commission_pct 
            FROM employees e JOIN departments d 
             USING (department_id) 
             WHERE job_id = 'ST_CLERK' AND location_id = 1500 
             FOR UPDATE OF e.salary 
            ORDER BY e.employee_id;
*/

-- Uncomment code below to run the code for slide 45_na for lesson 10

/*

          SELECT employee_id, salary, commission_pct, job_id
           FROM employees  
           WHERE job_id = 'SA_REP'
           FOR UPDATE WAIT 5
           ORDER BY employee_id;

*/


