--The SQL Script to run the solution for Additional Practice 9
-- Run the code in lab_ap_09.sql script before executing the below code. 
--Uncomment code below to run the solution for Task 3 in Additional Practice 9

/*

SET SERVEROUTPUT ON
DECLARE
  E_DUE_FOR_RAISE EXCEPTION;
  V_HIREDATE EMPLOYEES.HIRE_DATE%TYPE;
  V_ENAME EMPLOYEES.LAST_NAME%TYPE := INITCAP( '& B_ENAME');
  V_SAL EMPLOYEES.SALARY%TYPE;
  V_YEARS NUMBER(2);
BEGIN
  SELECT LAST_NAME, SALARY, HIRE_DATE
  INTO V_ENAME, V_SAL, V_HIREDATE
  FROM employees
  WHERE last_name = V_ENAME;

  V_YEARS := MONTHS_BETWEEN(SYSDATE,V_HIREDATE)/12;
  IF V_SAL < 3500 AND V_YEARS > 5 THEN
    RAISE E_DUE_FOR_RAISE;
  ELSE
    DBMS_OUTPUT.PUT_LINE (V_ENAME || ' not due for a raise');
  END IF;

EXCEPTION
WHEN E_DUE_FOR_RAISE THEN
  BEGIN
    DBMS_OUTPUT.PUT_LINE (V_ENAME || ' due for a raise');
    INSERT INTO ANALYSIS (ENAME,YEARS,SAL)
      VALUES(V_ENAME,V_YEARS,V_SAL);
  END;
END;
/

*/


