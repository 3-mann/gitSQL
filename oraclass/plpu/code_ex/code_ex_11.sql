--This is the SQL Script to run the code_examples for Lesson 11

--Uncomment the code below to execute the code on slide 08_sa 

/*

DESCRIBE USER_PLSQL_OBJECT_SETTINGS;

*/

--Uncomment the code below to execute the code on slide 09_sa 

/*

SELECT name, type, plsql_code_type AS CODE_TYPE, plsql_optimize_level AS OPT_LVL
FROM   user_plsql_object_settings;

*/

--Uncomment the code below to execute the code on slide 10_sa 

/*

ALTER SESSION SET PLSQL_OPTIMIZE_LEVEL = 1;
ALTER SESSION SET PLSQL_CODE_TYPE = 'NATIVE';

*/


--Uncomment the code below to execute the code on slide 10_sc 

/*

--Execute the code under slide 10_na before executing this code
@code_11_09_sa.sql

*/


--Uncomment the code below to execute the code on slide 10_na 

/*

CREATE OR REPLACE PROCEDURE add_job_history
 (  p_emp_id  job_history.employee_id%type, 
    p_start_date  job_history.start_date%type, 
    p_end_date job_history.end_date%type, 
    p_job_id  job_history.job_id%type, 
    p_department_id   job_history.department_id%type ) IS
   
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
  VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history; 
/

*/

--Uncomment the code below to execute the code on slide 18_sa 

/*

ALTER SESSION 
SET plsql_warnings =	'enable:severe', 'enable:performance', 'disable:informational';

*/

--Uncomment the code below to execute the code on slide 18_sb 

/*

ALTER SESSION 
SET plsql_warnings = 'enable:severe';

*/

--Uncomment the code below to execute the code on slide 18_sc 

/*

ALTER SESSION SET PLSQL_WARNINGS = 'ENABLE:SEVERE','DISABLE:PERFORMANCE' , 'ERROR:05003';

*/

--Uncomment the code below to execute the code on slide 20_na 

/*
ALTER SESSION SET plsql_warnings = 'enable:severe', 'enable:performance', 'enable:informational';
SELECT value FROM v$parameter WHERE name='plsql_warnings';

*/

--Uncomment the code below to execute the code on slide 21_na 

/*

SET SERVEROUTPUT ON

DECLARE s VARCHAR2(1000);
BEGIN
   s := dbms_warning.get_warning_setting_string();
   dbms_output.put_line (s);
END;
/

*/

--Uncomment the code below to execute the code on slide 30_sa 

/*

-- Establish the following warning setting string in the
-- current session:
-- ENABLE:INFORMATIONAL,
-- DISABLE:PERFORMANCE,
-- ENABLE:SEVERE


EXECUTE DBMS_WARNING.SET_WARNING_SETTING_STRING('ENABLE:ALL', 'SESSION');

EXECUTE DBMS_WARNING.ADD_WARNING_SETTING_CAT('PERFORMANCE','DISABLE', 'SESSION');

*/

--Uncomment the code below to execute the code on slide 32_sa 

/*

SET SERVEROUTPUT ON
EXECUTE DBMS_OUTPUT.PUT_LINE(DBMS_WARNING.GET_WARNING_SETTING_STRING);

*/

--Uncomment the code below to execute the code on slide 32_sb 

/*

SET SERVEROUTPUT ON
EXECUTE DBMS_OUTPUT.PUT_LINE(DBMS_WARNING.GET_CATEGORY(7203));

*/

--Uncomment the code below to execute the code on slide 33_sa 

/*

NOTE: the code for slide 33_sa is available in /home/oracle/labs/plpu/code_ex/code_11_33_s.sql script

*/

--Uncomment the code below to execute the code on slide 34_sa 

/*

-- Test the compile_code procedure from code_11_33_s.sql

EXECUTE DBMS_WARNING.SET_WARNING_SETTING_STRING('ENABLE:ALL', 'SESSION');


*/

--Uncomment the code below to execute the code on slide 34_sb 

/*

@/home/oracle/labs/plpu/code_ex/code_ex_scripts/code_11_33_s.sql

*/

--Uncomment the code below to execute the code on slide 34_sc 

/*

SET SERVEROUTPUT ON

EXECUTE compile_code('EMP_PKG'); 

*/

--Uncomment the code below to execute the code on slide 36_sa 

/*

-- Run the code under slide 36_na before running this code example. 

CREATE OR REPLACE PROCEDURE p(i IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO t(col_a) VALUES (i);
  EXCEPTION
    WHEN OTHERS THEN null;
  END p;
/
ALTER PROCEDURE P COMPILE
  PLSQL_warnings = 'enable:all' REUSE SETTINGS;

*/

--Uncomment the code below to execute the code on slide 36_sb 

/*

SELECT * 
FROM user_errors
WHERE name = 'P';

*/

--Uncomment the code below to execute the code on slide 36_na 

/*
-- Run this code example before the code under slide 36_sa

CREATE TABLE t (col_a NUMBER);

*/

