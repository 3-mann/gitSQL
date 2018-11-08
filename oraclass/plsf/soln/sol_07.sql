--The SQL Script to run the solution for Practice 7

-- Execute the following code before starting this practice.
/*
DROP table retired_emps;
DROP table empl;
*/

--Uncomment code below to run the solution for Task 1 of Practice 7

/*
SET SERVEROUTPUT ON

SET VERIFY OFF
DECLARE
  v_countryid varchar2(20):= 'CA';
  v_country_record countries%ROWTYPE;
BEGIN
 SELECT	* 
 INTO	v_country_record
 FROM	countries
 WHERE	country_id = UPPER(v_countryid);

 DBMS_OUTPUT.PUT_LINE ('Country Id: ' || v_country_record.country_id || 
  ' Country Name: ' || v_country_record.country_name   
  || ' Region: ' || v_country_record.region_id);

END;
*/

--Uncomment code below to run the solution for Task 2 of Practice 7

/*
SET SERVEROUTPUT ON

DECLARE
   TYPE dept_table_type is table of departments.department_name%TYPE 
   INDEX BY PLS_INTEGER;
   my_dept_table   dept_table_type;
   f_loop_count	   NUMBER (2):=10;
   v_deptno          NUMBER (4):=0;
BEGIN

  FOR i IN 1..f_loop_count
  LOOP	
        v_deptno:=v_deptno+10;
	SELECT department_name
	INTO my_dept_table(i)
	FROM departments
	WHERE department_id = v_deptno;
  END LOOP;
 FOR i IN 1..f_loop_count
  LOOP
    DBMS_OUTPUT.PUT_LINE (my_dept_table(i));
  END LOOP;
END;
*/

--Uncomment code below to run the solution for Task 3 of Practice 7

/*
SET SERVEROUTPUT ON

DECLARE
   TYPE dept_table_type is table of departments%ROWTYPE 
   INDEX BY PLS_INTEGER;
   my_dept_table	dept_table_type;
   f_loop_count	   NUMBER (2):=10;
   v_deptno          NUMBER (4):=0;
BEGIN
  FOR i IN 1..f_loop_count
  LOOP	
	v_deptno := v_deptno + 10;           
	SELECT *
	INTO my_dept_table(i)
	FROM departments
	WHERE department_id = v_deptno;
  END LOOP;
 FOR i IN 1..f_loop_count
  LOOP
    DBMS_OUTPUT.PUT_LINE ('Department Number: ' || my_dept_table(i).department_id
     || ' Department Name: ' || my_dept_table(i).department_name 
     || ' Manager Id: '||  my_dept_table(i).manager_id
     || ' Location Id: ' || my_dept_table(i).location_id);
  END LOOP;
END;
*/
