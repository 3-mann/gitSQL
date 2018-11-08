--The SQL Script to run the code_examples for Lesson 2

--Uncomment code below to run the code for slide 5_sa for lesson 2


/* 
                    SELECT *
                    FROM   departments;
*/

--Uncomment code below to run the code for slide 5_na for lesson 2


/*	
                    SELECT  department_id, department_name, manager_id, location_id 
                    FROM    departments;

*/


--Uncomment code below to run the code for slide 6_sa for lesson 2


/*	             SELECT department_id, location_id
                 FROM   departments;
*/


--Uncomment code below to run the code for slide 6_na for lesson 2


/*	
                     SELECT location_id, department_id
                     FROM   departments;

*/


--Uncomment code below to run the code for slide 8_na for lesson 2


/*	                SELECT last_name, hire_date, salary
	                   FROM   employees;
*/

--Uncomment code below to run the code for slide 11_sa for lesson 2


/*	
                     SELECT last_name, salary, salary + 300
                     FROM   employees;
*/

--Uncomment code below to run the code for slide 12_sa for lesson 2


/*	
                     SELECT last_name, salary, 12*salary+100
                     FROM   employees;
*/   

--Uncomment code below to run the code for slide 12_sb for lesson 2


/*	                 SELECT last_name, salary, 12*(salary+100)
                     FROM   employees;
*/

--Uncomment code below to run the code for slide 13_sa for lesson 2


/*	
                     SELECT last_name, job_id, salary, commission_pct
                     FROM   employees;

*/
--Uncomment code below to run the code for slide 14_sa for lesson 2

/*
	                    SELECT last_name, 12*salary*commission_pct
                      FROM   employees;
*/

--Uncomment code below to run the code for slide 17_sa for lesson 2


/*	             
                     SELECT last_name AS name, commission_pct comm
                     FROM   employees;
*/

--Uncomment code below to run the code for slide 17_sb for lesson 2


/*	                 SELECT last_name "Name" , salary*12 "Annual Salary"
                     FROM   employees;
*/


--Uncomment code below to run the code for slide 19_sa for lesson 2


/*	 
                    SELECT last_name||job_id AS "Employees"
                    FROM 	employees;
*/

--Uncomment code below to run the code for slide 21_sa for lesson 2


/*	            
                    SELECT last_name ||' is a '||job_id 
                     AS "Employee Details"
                    FROM   employees;
*/

--Uncomment code below to run the code for slide 21_na for lesson 2


/*	
                    SELECT last_name ||': 1 Month salary = '||salary Monthly
                    FROM   employees;
*/

--Uncomment code below to run the code for slide 22_sa for lesson 2

/*
                    SELECT department_name || q'[ Department's Manager Id: ]' || manager_id 
                    AS "Department and Manager" 
                    FROM departments;
*/

--Uncomment code below to run the code for slide 23_sa for lesson 2

/*
                    SELECT department_id
                    FROM   employees;

/*

--Uncomment code below to run the code for slide 23_sb for lesson 2

/*
                    SELECT DISTINCT department_id
                    FROM   employees;
*/

--Uncomment code below to run the code for slide 23_na for lesson 2

/*
                    SELECT  DISTINCT department_id, job_id
                    FROM    employees;
*/


--Uncomment code below to run the code for slide 26_sa for lesson 2	

/*                 DESCRIBE employees

*/

