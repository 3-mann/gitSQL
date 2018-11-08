--This is the SQL Script to run the code_examples for Lesson 9

--Uncomment the code below to execute the code on slide 04_sa

/*

SET SERVEROUTPUT ON

DECLARE
  v_lname VARCHAR2(15);
BEGIN
  SELECT last_name INTO v_lname FROM employees WHERE     
  first_name='John'; 
  DBMS_OUTPUT.PUT_LINE ('John''s last name is : ' ||v_lname);
END;
/
*/


--Uncomment the code below to execute the code on slide 05_sa

/*
SET SERVEROUTPUT ON

DECLARE
  v_lname VARCHAR2(15);
BEGIN
  SELECT last_name INTO v_lname FROM employees WHERE     
  first_name='John'; 
  DBMS_OUTPUT.PUT_LINE ('John''s last name is : ' ||v_lname);
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
  DBMS_OUTPUT.PUT_LINE (' Your select statement retrieved multiple
  rows. Consider using a cursor.');
END;
/
*/

--Uncomment the code below to execute the code on slide 17_sa

/*
SET SERVEROUTPUT ON

DECLARE
 e_insert_excep EXCEPTION;
 PRAGMA EXCEPTION_INIT   (e_insert_excep, -01400);
BEGIN
 INSERT INTO departments (department_id, department_name) VALUES (280, 
 NULL);
EXCEPTION
 WHEN e_insert_excep THEN
   DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED');
   DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
*/

--Uncomment the code below to execute the code on slide 21_sa

/*
SET SERVEROUTPUT ON

SET verify off
DECLARE 
  v_deptno NUMBER := 500;
  v_name VARCHAR2(20) := 'Testing';
  e_invalid_department EXCEPTION;
BEGIN
  UPDATE departments
  SET department_name = v_name
  WHERE department_id = v_deptno;
  IF SQL % NOTFOUND THEN
    RAISE e_invalid_department;
  END IF;
  COMMIT;
EXCEPTION
WHEN e_invalid_department THEN
  DBMS_OUTPUT.PUT_LINE('No such department id.');
END;
/
*/

