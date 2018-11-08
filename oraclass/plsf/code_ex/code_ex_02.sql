--This is the SQL Script to run the code_examples for Lesson 2

--Uncomment the code below to execute the code on slide 17-18_sa 

/*
DECLARE
  v_fname VARCHAR2(20);
BEGIN
  SELECT first_name INTO v_fname FROM employees
  WHERE employee_id=100;
END;
/
*/

--Uncomment the code below to execute the code on slide 21_sa 

/*
SET SERVEROUTPUT ON

DECLARE 
  v_fname VARCHAR(20);
BEGIN
  SELECT first_name
  INTO v_fname
  FROM employees
  WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE(' The First Name of the Employee is ' || v_fname);
END;
/
*/
