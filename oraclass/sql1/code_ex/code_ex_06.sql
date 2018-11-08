--The SQL Script to run the code_examples for Lesson 6

   

--Uncomment code below to run the code for slide 07_sa for lesson 6

/*
                    SELECT AVG(salary), MAX(salary),
                    MIN(salary), SUM(salary)
                    FROM   employees
                    WHERE  job_id LIKE '%REP%';

*/

--Uncomment code below to run the code for slide 08_sa for lesson 6

/*

	             SELECT MIN(hire_date), MAX(hire_date)
                     FROM	  employees;
*/


--Uncomment code below to run the code for slide 08_na for lesson 6

/*
   
	             SELECT MIN(last_name), MAX(last_name)
                     FROM   employees;
*/


--Uncomment code below to run the code for slide 09_sa for lesson 6

/*
                     SELECT COUNT(*)
                     FROM   employees
                     WHERE  department_id = 50;

*/

--Uncomment code below to run the code for slide 09_sb for lesson 6

/*
	             SELECT COUNT(commission_pct)
                     FROM   employees
                     WHERE  department_id = 50;

*/



--Uncomment code below to run the code for slide 10_sa for lesson 6

/*

                      SELECT COUNT(DISTINCT department_id)
                      FROM   employees;
*/

--Uncomment code below to run the code for slide 11_sa for lesson 6


/*
                      SELECT AVG(commission_pct)
                      FROM   employees;

*/

--Uncomment code below to run the code for slide 11_sb for lesson 6

/*                    SELECT AVG(NVL(commission_pct, 0))
                      FROM   employees;

*/

--Uncomment code below to run the code for slide 15_sa for lesson 6

/*                     
                        SELECT   department_id, AVG(salary)
                        FROM     employees
                        GROUP BY department_id ;

*/

--Uncomment code below to run the code for slide 16_sa for lesson 6

/*                     
                        SELECT   AVG(salary)
                        FROM     employees
                        GROUP BY department_id ;

*/

--Uncomment code below to run the code for slide 16_na for lesson 6

/*                     SELECT   department_id, AVG(salary)
                       FROM     employees
                       GROUP BY department_id
                       ORDER BY AVG(salary);
*/


--Uncomment code below to run the code for slide 17_na for lesson 6

/*
                        SELECT   department_id, job_id, sum(salary)
                        FROM     employees
                        GROUP BY department_id, job_id
                        ORDER BY job_id;
*/


--Uncomment code below to run the code for slide 18_sa for lesson 6

/*
                         SELECT   department_id, job_id, SUM(salary)
                         FROM     employees
                         WHERE  department_id > 40
                         GROUP BY department_id, job_id 
                         ORDER BY department_id;
*/

--Uncomment code below to run the code for slide 19_sa for lesson 6

/*
                         SELECT department_id, COUNT(last_name)
                         FROM   employees;


*/

--Uncomment code below to run the code for slide 19_sb for lesson 6

/*

                        SELECT department_id, job_id, COUNT(last_name)
                        FROM   employees
                        GROUP BY department_id;
*/

--Uncomment code below to run the code for slide 19_na for lesson 6

/*

                     SELECT   department_id, count(last_name)
                     FROM     employees
                     GROUP BY department_id;
*/

--Uncomment code below to run the code for slide 19_nb for lesson 6


/*
                   SELECT department_id, job_id, COUNT(last_name)
                   FROM   employees
                   GROUP BY department_id, job_id;
*/


--Uncomment code below to run the code for slide 20_sa for lesson 6

/*
                  SELECT   department_id, AVG(salary)
                  FROM     employees
                  WHERE    AVG(salary) > 8000
                  GROUP BY department_id;
*/


--Uncomment code below to run the code for slide 20_na for lesson 6


/*                SELECT   department_id, AVG(salary)
                  FROM     employees
                  GROUP BY department_id
                  HAVING   AVG(salary) > 8000;
*/

--Uncomment code below to run the code for slide 23_sa for lesson 6

/*
                 SELECT   department_id, MAX(salary)
                 FROM     employees
                 GROUP BY department_id
                 HAVING   MAX(salary)>10000 ;
*/

--Uncomment code below to run the code for slide 23_na for lesson 6
/*
                 SELECT   department_id, AVG(salary)
                 FROM     employees
                 GROUP BY department_id
                 HAVING   max(salary)>10000;
*/

 --Uncomment code below to run the code for slide 24_sa for lesson 6        
 
/*
                 SELECT   job_id, SUM(salary) PAYROLL
                 FROM     employees
                 WHERE    job_id NOT LIKE '%REP%'
                 GROUP BY job_id
                 HAVING   SUM(salary) > 13000
                 ORDER BY SUM(salary); 
*/

--Uncomment code below to run the code for slide 26_sa for lesson 6       

/*
                 SELECT   MAX(AVG(salary))
                 FROM     employees
                 GROUP BY department_id;

*/

