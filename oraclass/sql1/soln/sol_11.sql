
--Uncomment code below to run the solution for Task 1_a for Practice 11

/*
                  
                  CREATE TABLE dept
                 (id   NUMBER(7)CONSTRAINT department_id_pk PRIMARY KEY, name VARCHAR2(25));


--Uncomment code below to run the solution for Task 1_b for Practice 11


/*                        DESCRIBE dept;


--Uncomment code below to run the solution for Task 2_a for Practice 11
/*
                      
                      CREATE TABLE  emp
                       (id           NUMBER(7),
                       last_name     VARCHAR2(25),
                       first_name    VARCHAR2(25),
                       dept_id       NUMBER(7)
                       CONSTRAINT emp_dept_id_FK REFERENCES dept (id) );
*/

--Uncomment code below to run the solution for Task 2_b for Practice 11


/*                      DESCRIBE emp


--Uncomment code below to run the solution for Task 3 for Practice 11
/*
                       ALTER TABLE emp
                       ADD commission NUMBER(2,2);

                       DESCRIBE emp
*/

--Uncomment code below to run the solution for Task 4 for Practice 11
/*
                       ALTER TABLE emp
                       MODIFY (last_name VARCHAR2(50));
	
                       DESCRIBE emp
*/

--Uncomment code below to run the solution for Task 5 for Practice 11
/*
                       ALTER TABLE emp
                       DROP COLUMN first_name;
                       DESCRIBE emp
*/

--Uncomment code below to run the solution for Task 6 for Practice 11
/*
                        ALTER TABLE	emp
                        SET   UNUSED (dept_id);

                        DESCRIBE emp           
*/ 


--Uncomment code below to run the solution for Task 7 for Practice 11
/*
                      ALTER TABLE emp
                      DROP UNUSED COLUMNS;

                      
*/                        

--Uncomment code below to run the solution for Task 8 for Practice 11
--If you get any warning message then please ignore it.

/*                              
                     CREATE TABLE employees2 AS
                     SELECT  employee_id id, first_name, last_name, salary,   
                      department_id dept_id
                     FROM    employees;
                     
                     DESCRIBE employees2
*/

--Uncomment code below to run the solution for Task 9 for Practice 11


/*                     ALTER TABLE employees2 READ ONLY;

--Uncomment code below to run the solution for Task 10 for Practice 11
/*
                    ALTER TABLE EMPLOYEES2
                    ADD job_id VARCHAR2(9);
*/

--Uncomment code below to run the solution for Task 11 for Practice 11
/*
                   ALTER TABLE employees2 READ WRITE;

                   ALTER TABLE EMPLOYEES2
                   ADD job_id VARCHAR2(9);
                   
                   DESCRIBE employees2

*/

--Uncomment code below to run the solution for Task 12 for Practice 11
/*
                   DROP TABLE employees2;
                   DROP TABLE emp;
                   DROP TABLE dept;

*/


