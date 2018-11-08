--The SQL Script to run the code_examples for Lesson 5

--Uncomment code below to run the code for slide 5_sa for lesson 5
--If you get any warning message, please ignore it

/* 
drop table emp2 cascade constraints;

create table emp2 as select * from employees;

ALTER TABLE emp2
MODIFY employee_id PRIMARY KEY;

                  
*/

--Uncomment code below to run the code for slide 5_sb for lesson 5
/*
ALTER TABLE     emp2
ADD CONSTRAINT  emp_mgr_fk 
  FOREIGN KEY(manager_id) 
  REFERENCES emp2(employee_id);

*/

--Uncomment code below to run the code for slide 6_sa for lesson 5


/*

ALTER TABLE emp2
DROP CONSTRAINT emp_mgr_fk;

*/

--Uncomment code below to run the code for slide 6_sb for lesson 5

/*

ALTER TABLE emp2
DROP PRIMARY KEY CASCADE;

desc emp2;


*/

--Uncomment code below to run the code for slide 7_na for lesson 5
--Execute each statement one by one
/*
DROP TABLE myemp2;
CREATE TABLE myemp2
(emp_id NUMBER(6) CONSTRAINT emp_name_pk PRIMARY KEY , 
emp_name VARCHAR2(20));


SELECT constraint_name, constraint_type, status
FROM   user_constraints
WHERE  table_name = 'MYEMP2'; 


ALTER TABLE myemp2 DROP CONSTRAINT emp_name_pk ONLINE;

SELECT constraint_name, constraint_type, status
FROM   user_constraints
WHERE  table_name = 'MYEMP2'; 


*/

--Uncomment code below to run the code for slide 8_sa for lesson 5
/*	            

drop table dept2 cascade constraints;

create table dept2 as select * from departments;

ALTER TABLE dept2 ADD CONSTRAINT dept_lc_fk 
FOREIGN KEY (location_id) 
REFERENCES locations(location_id) ON DELETE CASCADE;
*/


--Uncomment code below to run the code for slide 8_sb for lesson 5


/*	
ALTER TABLE emp2
DROP CONSTRAINT emp_dt_fk;

ALTER TABLE emp2 ADD CONSTRAINT emp_dt_fk 
FOREIGN KEY (Department_id) 
REFERENCES Departments(department_id) ON DELETE SET NULL;

*/

--Uncomment code below to run the code for slide 9_na for lesson 5
/*
DROP TABLE test1;
CREATE TABLE test1 (
  col1_pk NUMBER PRIMARY KEY,
  col2_fk NUMBER,
  col1 NUMBER,
  col2 NUMBER,
	CONSTRAINT fk_constraint FOREIGN KEY (col2_fk) REFERENCES test1,
  CONSTRAINT ck1 CHECK (col1_pk > 0 and col1 > 0),
  CONSTRAINT ck2 CHECK (col2_fk > 0));

*/


--Uncomment code below to run the code for slide 9_nb for lesson 5

/* ALTER TABLE test1 DROP (col1_pk);  




--Uncomment code below to run the code for slide 9_nc for lesson 5

/*  ALTER TABLE test1 DROP (col1); 

--Uncomment code below to run the code for slide 10_sa for lesson 5
/*
ALTER TABLE emp2 
DROP column employee_id CASCADE CONSTRAINTS;
*/

--Uncomment code below to run the code for slide 10_sb for lesson 5
/*
ALTER TABLE test1
DROP (col1_pk, col2_fk, col1) CASCADE CONSTRAINTS;

*/

--Uncomment code below to run the code for slide 10_na for lesson 5
--Drop and create the test1 table first and then run the ALTER TABLE statement
/*

DROP TABLE test1;
CREATE TABLE test1 (
  col1_pk NUMBER PRIMARY KEY,
  col2_fk NUMBER,
  col1 NUMBER,
  col2 NUMBER,
	CONSTRAINT fk_constraint FOREIGN KEY (col2_fk) REFERENCES test1,
  CONSTRAINT ck1 CHECK (col1_pk > 0 and col1 > 0),
  CONSTRAINT ck2 CHECK (col2_fk > 0));


ALTER TABLE test1
DROP (col1_pk, col2_fk, col1) ;

*/


--Uncomment code below to run the code for slide 11_sa for lesson 5
--Execute the code 11_na before executing the below code

/* ALTER TABLE marketing RENAME to new_marketing;

--Uncomment code below to run the code for slide 11_sb for lesson 5

/* 

ALTER TABLE new_marketing RENAME COLUMN team_id
TO id; 

*/

--Uncomment code below to run the code for slide 11_sc for lesson 5


/* ALTER TABLE new_marketing RENAME CONSTRAINT mktg_pk TO new_mktg_pk;

--Uncomment code below to run the code for slide 11_na for lesson 5
--First create a table marketing

/*
DROP TABLE marketing cascade constraints;
CREATE TABLE marketing (
team_id  NUMBER(10), 
target  VARCHAR2(50), 
CONSTRAINT mktg_pk PRIMARY KEY(team_id));
*/

--Uncomment code below to run the code for slide 12_sa for lesson 5

/* ALTER TABLE emp2 DISABLE CONSTRAINT emp_dt_fk;

--Uncomment code below to run the code for slide 12_sb for lesson 5

/* 

drop table dept2 cascade constraints;

create table dept2 as select * from departments;

ALTER TABLE dept2
MODIFY department_id PRIMARY KEY;

ALTER TABLE	dept2 DISABLE primary key CASCADE;


--Uncomment code below to run the code for slide 13_sa for lesson 5
/*
ALTER TABLE emp2 ENABLE CONSTRAINT emp_dt_fk;

*/

--Uncomment code below to run the code for slide 14_sa for lesson 5
/*

ALTER TABLE dept2 
ENABLE NOVALIDATE PRIMARY KEY; 

*/

--Uncomment code below to run the code for slide 15_sa for lesson 5
--If you get any warning message, please ignore it

/*	             

drop table dept2 cascade constraints;

create table dept2 as select * from departments;

ALTER TABLE dept2
ADD CONSTRAINT dept2_id_pk 
PRIMARY KEY (department_id)
DEFERRABLE INITIALLY DEFERRED;

*/

--Uncomment code below to run the code for slide 15_sb for lesson 5


/*	

SET CONSTRAINTS dept2_id_pk IMMEDIATE;

*/

--Uncomment code below to run the code for slide 15_sc for lesson 5


/*	

ALTER SESSION SET CONSTRAINTS= IMMEDIATE;

*/   

--Uncomment code below to run the code for slide 16_sa for lesson 5


/*	            

drop table emp_new_sal cascade constraints;
create table emp_new_sal
( salary number constraint 
         sal_ck check ( salary > 100 ) 
         deferrable 
         initially immediate,
   bonus number constraint 
         bonus_ck check (bonus > 0 ) 
         deferrable 
         initially deferred
);
      
*/

--Uncomment code below to run the code for slide 16_na for lesson 5

/*	
                     
INSERT INTO emp_new_sal VALUES(90,5);
               
*/

--Uncomment code below to run the code for slide 17_na for lesson 5
-- Turn the autocommit option off, and execute the insert statement
-- If  you get an error in this step, try  to run the code from slide 16_sa to slide 17_nd2 in SQL*PLUS




/*

SET AUTOCOMMIT OFF
INSERT INTO emp_new_sal VALUES(110,-1);

*/

--Uncomment code below to run the code for slide 17_na1 for lesson 5
/*

COMMIT;
            
*/


--Uncomment code below to run the code for slide 17_nb1 for lesson 5
/*
SET CONSTRAINTS ALL DEFERRED;

*/
--Uncomment code below to run the code for slide 17_nb2 for lesson 5

/* INSERT INTO emp_new_sal VALUES(90,5);

--Uncomment code below to run the code for slide 17_nb3 for lesson 5
/*
COMMIT;
*/ 


--Uncomment code below to run the code for slide 17_nc1 for lesson 5

/* SET CONSTRAINTS ALL IMMEDIATE;


--Uncomment code below to run the code for slide 17_nc2 for lesson 5
/*
INSERT INTO emp_new_sal VALUES(110,-1);

*/

--Uncomment code below to run the code for slide 17_nd1 for lesson 5
/*

drop table newemp_details cascade constraints;

create table newemp_details(emp_id number, emp_name varchar2(20),
constraint newemp_det_pk primary key(emp_id));
*/

--Uncomment code below to run the code for slide 17_nd2 for lesson 5
/*
SET CONSTRAINT newemp_det_pk DEFERRED;

*/

--Uncomment code below to run the code for slide 18_sa for lesson 5
-- DROP all the tables
/* 
DROP TABLE emp_new_sal PURGE; 
DROP TABLE emp2 PURGE;
DROP TABLE dept2 PURGE;
DROP TABLE newemp_details PURGE;
DROP TABLE marketing PURGE;
DROP TABLE test1 PURGE;
*/

--Uncomment code below to run the code for slide 21_sa for lesson 5
/*

DROP TABLE CART;
CREATE GLOBAL TEMPORARY TABLE cart(n NUMBER, d DATE) 
ON COMMIT DELETE ROWS;
*/

--Uncomment code below to run the code for slide 21_sb for lesson 5
--If you get any warning message, please ignore it
/*

DROP TABLE emp_details;

CREATE GLOBAL TEMPORARY TABLE emp_details
ON COMMIT PRESERVE ROWS AS 
	SELECT * FROM employees
		WHERE hire_date = SYSDATE;
    
*/

--Uncomment code below to run the code for slide 24_sa for lesson 5
--Execute this code using teach_b account.
/* 

CREATE OR REPLACE DIRECTORY emp_dir 
AS '/home/oracle/labs/sql2/emp_dir'; 
GRANT READ ON DIRECTORY emp_dir TO ora21;
*/

--Uncomment code below to run the code for slide 28_sa for lesson 5
/*

drop table oldemp;

CREATE TABLE oldemp (fname char(25), lname CHAR(25))
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
 DEFAULT DIRECTORY emp_dir
 ACCESS PARAMETERS
 (RECORDS DELIMITED BY NEWLINE
  FIELDS(fname POSITION ( 1:20) CHAR,
  lname POSITION (22:41) CHAR))
 LOCATION ('emp.dat'));

SELECT  * 
FROM oldemp;

*/

--Uncomment code below to run the code for slide 31_sa for lesson 5

/* 
drop table emp_ext;

CREATE TABLE emp_ext
  (employee_id, first_name, last_name)
   ORGANIZATION EXTERNAL
    (
     TYPE ORACLE_DATAPUMP
     DEFAULT DIRECTORY emp_dir
     LOCATION
      ('emp1.exp','emp2.exp')
    )
   PARALLEL
AS
SELECT employee_id,
       first_name,
       last_name
FROM   employees;

*/

--Uncomment code below to run the code for slide 31_na for lesson 5

/* select * from emp_ext;


