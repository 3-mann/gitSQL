--The SQL Script to run the code_examples for Lesson 4

--Uncomment code below to run the code for slide 9_sa for lesson 4


/* 
DROP VIEW empvu80;
CREATE VIEW 	empvu80
 AS SELECT  employee_id, last_name, salary
    FROM    employees
    WHERE   department_id = 80;
                  
*/

--Uncomment code below to run the code for slide 9_sb for lesson 4


/*	

DESCRIBE empvu80;
                   
*/


--Uncomment code below to run the code for slide 10_sa for lesson 4


/*
DROP VIEW salvu50;	            
CREATE VIEW 	salvu50
 AS SELECT  employee_id ID_NUMBER, last_name NAME,
            salary*12 ANN_SALARY
    FROM    employees
    WHERE   department_id = 50;

SELECT * FROM salvu50;
             
*/


--Uncomment code below to run the code for slide 10_na for lesson 4


/*
		
CREATE OR REPLACE VIEW salvu50 (ID_NUMBER, NAME, ANN_SALARY)
  AS SELECT  employee_id, last_name, salary*12
     FROM    employees
     WHERE   department_id = 50;
*/


--Uncomment code below to run the code for slide 11_sa for lesson 4


/*	             

SELECT *
FROM   salvu50;

*/

--Uncomment code below to run the code for slide 12_sa for lesson 4


/*	

CREATE OR REPLACE VIEW empvu80
  (id_number, name, sal, department_id)
AS SELECT  employee_id, first_name || ' ' 
           || last_name, salary, department_id
   FROM    employees
   WHERE   department_id = 80;
                   
*/

--Uncomment code below to run the code for slide 13_sa for lesson 4


/*	
DROP VIEW dept_sum_vu;	
CREATE OR REPLACE VIEW dept_sum_vu
  (name, minsal, maxsal, avgsal)
AS SELECT   d.department_name, MIN(e.salary), 
            MAX(e.salary),AVG(e.salary)
   FROM     employees e JOIN departments d
   USING    (department_id)
   GROUP BY d.department_name;
                 
*/   

--Uncomment code below to run the code for slide 13_na for lesson 4


/*	            

SELECT  * 
FROM    dept_sum_vu;
      
*/

--Uncomment code below to run the code for slide 14_sa for lesson 4

/* DESCRIBE user_views


--Uncomment code below to run the code for slide 14_sb for lesson 4

/* SELECT view_name FROM user_views;


--Uncomment code below to run the code for slide 14_sc for lesson 4
/*
SELECT text FROM user_views 
WHERE view_name = 'EMP_DETAILS_VIEW';
*/

--Uncomment code below to run the code for slide 18_sa for lesson 4

/*	
DROP VIEW empvu20;	                     
CREATE OR REPLACE VIEW empvu20
AS SELECT	*
   FROM     employees
   WHERE    department_id = 20
   WITH CHECK OPTION CONSTRAINT empvu20_ck ;

               

*/

--Uncomment code below to run the code for slide 18_na for lesson 4

/*
UPDATE empvu20
SET    department_id = 10
WHERE  employee_id = 201;
*/

--Uncomment code below to run the code for slide 20_sa for lesson 4
/*
DROP VIEW empvu10;	
CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT	employee_id, last_name, job_id
   FROM     employees
   WHERE    department_id = 10
   WITH READ ONLY ;
            
*/


--Uncomment code below to run the code for slide 20_na for lesson 4
/*
DELETE FROM empvu10
WHERE  employee_number = 200;

*/
--Uncomment code below to run the code for slide 21_sa for lesson 4

/*
DROP VIEW empvu80;
DROP VIEW salvu50;
DROP VIEW dept_sum_vu;
DROP VIEW empvu20;
DROP VIEW empvu10;
*/


