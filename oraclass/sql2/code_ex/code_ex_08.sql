--The SQL Script to run the code_examples for Lesson 8

--Uncomment code below to run the code for slide 7_sa for lesson 8
--This can be executed by only teach_b account

/* 
            
CREATE USER demo
IDENTIFIED BY demo;        
*/

--Uncomment code below to run the code for slide 10_sa for lesson 8
--This can be executed only by teach_b account

/*	

GRANT create session, create table, create sequence, create view
TO demo;                   
*/


--Uncomment code below to run the code for slide 13_sa for lesson 8
--This can be executed only by teach_b account

/*	            
 CREATE ROLE manager;
             
*/


--Uncomment code below to run the code for slide 13_sb for lesson 8
--This can be executed only by teach_b account

/*	

GRANT create table, create view 		  
TO manager; 

*/


--Uncomment code below to run the code for slide 13_sc for lesson 8
--This can be executed only by teach_b account

/*	             

Create user alice identified by alice;
GRANT create session TO alice;
Grant manager to alice;	  
         
*/

--Uncomment code below to run the code for slide 14_sa for lesson 8
--This can be executed only by teach_b or demo account

/*	

ALTER USER demo          			  
IDENTIFIED BY employ;  
                   
*/

--Uncomment code below to run the code for slide 18_sa for lesson 8
--This can be executed only by teach_b account.

/*	


GRANT SELECT ON employees TO demo;                    
*/   

--Uncomment code below to run the code for slide 18_sb for lesson 8
--grant the query privileges
--This can be executed only by teach_b account.

/*	            

GRANT update(department_name,location_id) ON departments TO demo, manager;                   ;
*/

--Uncomment code below to run the code for slide 19_sa for lesson 8
--This can be executed only by teach_b account.
--grant the privileges

/*	
                     

GRANT select,insert ON departments TO demo WITH GRANT OPTION;                   

*/

--Uncomment code below to run the code for slide 19_sb for lesson 8
/*
GRANT  select
ON	  departments
TO	  PUBLIC;
*/

--Uncomment code below to run the code for slide 23_sa for lesson 8
--revoke the privileges
--This can be executed only by teach_b account.

/*

REVOKE select,insert ON departments FROM demo;	
            
*/


