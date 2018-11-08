--The SQL Script to run the solution for Practice 11
--Run cleanup_11.sql script from /home/oracle/labs/plpu/code_ex/cleanup_scripts directory before executing the solutions.
--Uncomment code below to run the solution for Task 1 of Practice 11

/*

SELECT name, type,plsql_code_type as code_type, 
plsql_optimize_level as opt_lvl
FROM   user_plsql_object_settings;

*/

--Uncomment code below to run the solution for Task 2_a of Practice 11

/* 

ALTER SESSION SET PLSQL_CODE_TYPE = 'NATIVE';

*/

--Uncomment code below to run the solution for Task 2_b of Practice 11

/* 

ALTER PROCEDURE add_department COMPILE;

*/

--Uncomment code below to run the solution for Task 2_c of Practice 11
/*

SELECT name, type, plsql_code_type as code_type, 
plsql_optimize_level as opt_lvl
FROM   user_plsql_object_settings;

*/

--Uncomment code below to run the solution for Task 2_d of Practice 11

/* 

ALTER SESSION SET PLSQL_CODE_TYPE = 'INTERPRETED';
*/

--Uncomment code below to run the solution for Task 4 of Practice 11
/*

CREATE OR REPLACE PROCEDURE unreachable_code AS
  c_x CONSTANT BOOLEAN := TRUE;
BEGIN
  IF c_x THEN
    DBMS_OUTPUT.PUT_LINE('TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('FALSE');
  END IF;
END unreachable_code;
/

*/

--Uncomment code below to run the solution for Task 8 of Practice 11

/*

DESCRIBE user_errors

SELECT *
FROM user_errors;

*/

--Uncomment code below to run the solution for Task 9 of Practice 11
/*

SET SERVEROUTPUT ON
EXECUTE DBMS_OUTPUT.PUT_LINE(DBMS_WARNING.GET_CATEGORY(&message));

*/
