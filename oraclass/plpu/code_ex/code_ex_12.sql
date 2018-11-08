--This is the SQL Script to run the code_examples for Lesson 12

--Uncomment the code below to execute the code on slide 06_sa 
/*

desc user_dependencies

*/

--Uncomment the code below to execute the code on slide 06_sb 
/*

SELECT name, type, referenced_name, referenced_type
FROM   user_dependencies
WHERE  referenced_name IN ('EMPLOYEES','EMP_VW' ); 

*/

--Uncomment the code below to execute the code on slide 09_sa 
/*

CREATE OR REPLACE VIEW commissioned AS
SELECT first_name, last_name, commission_pct FROM employees
WHERE commission_pct > 0.00;

*/

--Uncomment the code below to execute the code on slide 09_sb 
/*

CREATE OR REPLACE VIEW six_figure_salary AS
SELECT * FROM employees
WHERE salary >= 100000;

*/

--Uncomment the code below to execute the code on slide 09_sc 
/*

SELECT object_name, status 
FROM user_objects 
WHERE object_type = 'VIEW';

*/

--Uncomment the code below to execute the code on slide 10_sa 
/*

ALTER TABLE employees MODIFY email VARCHAR2(50);
/
SELECT object_name, status 
FROM user_objects 
WHERE object_type = 'VIEW';

*/

--Uncomment the code below to execute the code on slide 11_sa 
/*
@/home/oracle/labs/plpu/labs/utldtree.sql  
*/

--Uncomment the code below to execute the code on slide 11_sb 
/*

EXECUTE deptree_fill('TABLE', 'ORA61', 'EMPLOYEES')

*/

--Uncomment the code below to execute the code on slide 12_sa 
/*

-- Run the code under slide 11_sb before this code example. 

SELECT   nested_level, type, name
FROM     deptree
ORDER BY seq#;

*/

--Uncomment the code below to execute the code on slide 12_na 
/*
-- Run the code under slide 11_sb before this code example. 

SELECT * 
FROM   ideptree;

*/

--Uncomment the code below to execute the code on slide 15_sa 
/*

CREATE TABLE t2 (col_a NUMBER, col_b NUMBER, col_c NUMBER);
CREATE VIEW v AS SELECT col_a, col_b FROM T2; 

*/

--Uncomment the code below to execute the code on slide 15_sb 
-- Run the code under slide 15_sa before running this code example. 
/*

SELECT ud.name, ud.type, ud.referenced_name, 
       ud.referenced_type, uo.status
FROM user_dependencies ud, user_objects uo
WHERE ud.name = uo.object_name AND ud.name = 'V';

*/

--Uncomment the code below to execute the code on slide 15_sc 
-- Run the code under slide 15_sa before running this code example
/*

ALTER TABLE t2 ADD (col_d VARCHAR2(20));

*/

--Uncomment the code below to execute the code on slide 15_sd 
/*

-- Run the code under slide 15_sb before running this code example. 

SELECT ud.name, ud.type, ud.referenced_name, 
       ud.referenced_type, uo.status
FROM user_dependencies ud, user_objects uo
WHERE ud.name = uo.object_name AND ud.name = 'V';

*/

--Uncomment the code below to execute the code on slide 16_sa 
-- Run the code under slide 15_sa and code under slide 15_sb before running this code example. 
/*

ALTER TABLE t2 MODIFY (col_a VARCHAR2(20))
/
SELECT ud.name, ud.referenced_name, ud.referenced_type, uo.status
FROM user_dependencies ud, user_objects uo
WHERE ud.name = uo.object_name AND ud.name = 'V'
/

*/

--Uncomment the code below to execute the code on slide 17_sa 
/*

CREATE or replace PACKAGE pkg 
IS
  PROCEDURE proc_1;
END pkg;
/
CREATE OR REPLACE PROCEDURE p 
IS 
BEGIN 
  pkg.proc_1(); 
END;
/
CREATE OR REPLACE PACKAGE pkg 
IS
  PROCEDURE proc_1;
  PROCEDURE unheard_of;
END pkg;
/

*/
--Uncomment the code below to execute the code on slide 17_na 
/*

SELECT status FROM user_objects
  WHERE object_name = 'P';

*/
