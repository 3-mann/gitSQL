--The SQL Script to run the code_examples for Lesson 5

   

--Uncomment code below to run the code for slide 10_na for lesson 5

/*
                   SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') Month_Hired
                   FROM   employees
                   WHERE  last_name = 'Higgins';   
*/

--Uncomment code below to run the code for slide 15_sa for lesson 5

/*
	            SELECT last_name,
                    TO_CHAR(hire_date, 'fmDD Month YYYY')
                     AS HIREDATE
                     FROM   employees; 
*/

--Uncomment code below to run the code for slide 15_na for lesson 5

/*
	             SELECT  last_name,
                     TO_CHAR(hire_date, 
                     'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
                      HIREDATE
                     FROM    employees;
*/

--Uncomment code below to run the code for slide 18_sa for lesson 5
/*
                     SELECT TO_CHAR(salary, '$99,999.00') SALARY
                     FROM   employees
                     WHERE  last_name = 'Ernst';
*/

--Uncomment code below to run the code for slide 20_na for lesson 5

/*
	             SELECT last_name, hire_date
                     FROM   employees
                     WHERE  hire_date = TO_DATE('May    24,  2007', 'fxMonth DD, YYYY');
*/


--Uncomment code below to run the code for slide 20_nb for lesson 5

/*
                     SELECT last_name, hire_date
                     FROM   employees
                     WHERE  hire_date = TO_DATE('May 24, 2007', 'fxMonth DD, YYYY');
*/

--Uncomment code below to run the code for slide 21_sa for lesson 
--Execute the INSERT statement first to insert one row into the employees table and then execute the SELECT statement

/*
                     INSERT INTO employees (employee_id, 
                          first_name, last_name, 
                          email, phone_number,
                          hire_date, job_id, salary, 
                         commission_pct, manager_id,
                         department_id)
                     VALUES  (113,   'Louis', 'Popp',  'LPOPP', '515.124.4567', 
                             TO_DATE('FEB 3, 1989', 'MON DD, YYYY'), 'AC_ACCOUNT', 6900, 
                             NULL, 205, 110);



 
                      SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY')
                      FROM  employees
                      WHERE hire_date < TO_DATE('01-Jan-90','DD-Mon-RR');
*/

--Uncomment code below to run the code for slide 21_na for lesson 5
--Run the delete statement after you execute the below SELECT statement
/*
                      SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-yyyy')
                      FROM   employees
                      WHERE  TO_DATE(hire_date, 'DD-Mon-yy') < '01-Jan-1990';


                      
/*                    DELETE FROM employees
                      WHERE employee_id=113;

*/

--Uncomment code below to run the code for slide 25_sa for lesson 5

/*
                        SELECT last_name, salary, NVL(commission_pct, 0),
                        (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
                        FROM employees;
*/

--Uncomment code below to run the code for slide 25_na for lesson 5

/*                       SELECT last_name, salary, commission_pct,
                        (salary*12) + (salary*12*commission_pct) AN_SAL
                        FROM   employees;
*/


--Uncomment code below to run the code for slide 26_sa for lesson 5

/*
                         SELECT last_name,  salary, commission_pct,
                         NVL2(commission_pct,   'SAL+COMM', 'SAL') income
                         FROM   employees WHERE department_id IN (50, 80);
*/

--Uncomment code below to run the code for slide 27_sa for lesson 5

/*                        SELECT first_name, LENGTH(first_name) "expr1", 
                         last_name,  LENGTH(last_name)  "expr2",
                         NULLIF(LENGTH(first_name), LENGTH(last_name)) result
                         FROM   employees;
*/

--Uncomment code below to run the code for slide 29_sa for lesson 5

/*
                        SELECT last_name, salary, commission_pct,
                        COALESCE((salary+(commission_pct*salary)), salary+2000, salary) "New Salary"
                        FROM   employees;
*/

--Uncomment code below to run the code for slide 33_sa for lesson 5
/*
                       SELECT last_name, job_id, salary,
                              CASE job_id WHEN 'IT_PROG'  THEN  1.10*salary
                                   WHEN 'ST_CLERK' THEN  1.15*salary
                                   WHEN 'SA_REP'   THEN  1.20*salary
                              ELSE      salary END     "REVISED_SALARY"
                      FROM   employees;
*/

--Uncomment code below to run the code for slide 34_sa for lesson 5

/*                   
                      SELECT last_name,salary, 
                              (CASE WHEN salary<5000 THEN 'Low' 
                                    WHEN salary<10000 THEN 'Medium' 
                                    WHEN salary<20000 THEN 'Good' 
                                    ELSE 'Excellent' 
                               END) qualified_salary 
                      FROM employees;
*/

--Uncomment code below to run the code for slide 36_sa for lesson 5
/*
                     SELECT last_name, job_id, salary,
                     DECODE(job_id, 'IT_PROG',  1.10*salary,
                    'ST_CLERK', 1.15*salary,  'SA_REP',   1.20*salary, salary)
                     REVISED_SALARY
                     FROM   employees;
*/

--Uncomment code below to run the code for slide 37_sa for lesson 5

/*
                    SELECT last_name, salary,
                    DECODE (TRUNC(salary/2000, 0),
                         0, 0.00,
                         1, 0.09,
                          2, 0.20,
                          3, 0.30,
                         4, 0.40,
                           5, 0.42,
                          6, 0.44,
                          0.45) TAX_RATE
                  FROM   employees
                  WHERE  department_id = 80;

*/


