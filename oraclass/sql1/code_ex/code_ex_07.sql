--The SQL Script to run the code_examples for Lesson 7

   

--Uncomment code below to run the code for slide 09_sa for lesson 7

/*
                    SELECT employee_id, first_name, job_id, job_title
                    FROM employees NATURAL JOIN jobs;

*/


--Uncomment code below to run the code for slide 09_na for lesson 7

/*

	             SELECT  department_id, department_name, location_id, city
                     FROM    departments
                     NATURAL JOIN locations
                     WHERE   department_id IN (20, 50);

*/

--Uncomment code below to run the code for slide 12_sa for lesson 7

/*

	             SELECT employee_id, last_name,  location_id, department_id
                     FROM   employees JOIN departments
                     USING (department_id) ;
*/

--Uncomment code below to run the code for slide 14_sa for lesson 7

/*
                     SELECT l.city, d.department_name 
                     FROM   locations l JOIN departments d
                     USING (location_id)
                     WHERE d.location_id = 1400;

*/

--Uncomment code below to run the code for slide 14_na for lesson 7

/*
	                   SELECT l.city, d.department_name
                     FROM   locations l JOIN departments d 
                     USING (location_id)
                     WHERE  location_id = 1400;



*/

--Uncomment code below to run the code for slide 14_nb for lesson 7

/*

                      SELECT first_name, d.department_name, d.manager_id
                      FROM   employees e JOIN departments d 
                      USING (department_id)
                      WHERE  department_id = 50;

*/

--Uncomment code below to run the code for slide 16_sa for lesson 7

/*

                      SELECT e.employee_id, e.last_name, e.department_id, 
                      d.department_id, d.location_id
                      FROM   employees e JOIN departments d
                      ON     (e.department_id = d.department_id);

*/

--Uncomment code below to run the code for slide 17_sa for lesson 7

/*
                      SELECT employee_id, city, department_name
                      FROM   employees e 
                      JOIN   departments d
                      ON     d.department_id = e.department_id 
                      JOIN   locations l
                      ON     d.location_id = l.location_id;
*/

--Uncomment code below to run the code for slide 17_na for lesson 7

/*
                        SELECT e.employee_id, l.city, d.department_name
                        FROM employees e
                        JOIN departments d
                        USING (department_id)
                        JOIN locations l
                        USING (location_id);
*/

--Uncomment code below to run the code for slide 18_sa for lesson 7

/*                        SELECT e.employee_id, e.last_name, e.department_id, 
                         d.department_id, d.location_id
                        FROM   employees e JOIN departments d
                        ON     (e.department_id = d.department_id)
                        AND    e.manager_id = 149 ;

*/

--Uncomment code below to run the code for slide 18_sb for lesson 7

/*
                        SELECT e.employee_id, e.last_name, e.department_id, 
                       d.department_id, d.location_id
                        FROM   employees e JOIN departments d
                        ON     (e.department_id = d.department_id)
                        WHERE   e.manager_id = 149 ;


*/

--Uncomment code below to run the code for slide 21_sa for lesson 7

/*

                      SELECT worker.last_name emp, manager.last_name mgr
                      FROM   employees worker JOIN employees manager
                      ON    (worker.manager_id = manager.employee_id);
*/

--Uncomment code below to run the code for slide 24_sa for lesson 7

/*

                     SELECT e.last_name, e.salary, j.grade_level
                     FROM   employees e JOIN job_grades j
                     ON     e.salary 
                     BETWEEN j.lowest_sal AND j.highest_sal;

*/

--Uncomment code below to run the code for slide 28_sa for lesson 7

/*
                  SELECT e.last_name, e.department_id, d.department_name
                  FROM   employees e LEFT OUTER JOIN departments d
                  ON   (e.department_id = d.department_id) ;


*/

--Uncomment code below to run the code for slide 29_sa for lesson 7

/*

                   SELECT e.last_name, d.department_id, d.department_name
                   FROM   employees e RIGHT OUTER JOIN departments d
                   ON    (e.department_id = d.department_id) ;

*/

--Uncomment code below to run the code for slide 30_sa for lesson 7

/*
                 SELECT e.last_name, d.department_id, d.department_name
                 FROM   employees e FULL OUTER JOIN departments d
                 ON   (e.department_id = d.department_id) ;

*/


--Uncomment code below to run the code for slide 34_sa for lesson 7
/*
                 SELECT last_name, department_name
                 FROM   employees
                 CROSS JOIN departments ;

*/
 
