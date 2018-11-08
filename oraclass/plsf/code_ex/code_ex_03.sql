--This is the SQL Script to run the code_examples for Lesson 3

--Uncomment the code below to execute the code on slide 8_sa

/*
SET SERVEROUTPUT ON

DECLARE
  v_myName  VARCHAR(20);
BEGIN
  DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName );
  v_myName  := 'John';
  DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName );
END;
/
*/
--Uncomment the code below to execute the code on slide 8_sb

/*
SET SERVEROUTPUT ON

DECLARE
  v_myName VARCHAR(20):= 'John';
BEGIN
  v_myName:= 'Steven';
  DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName);
END; 
/
*/

--Uncomment the code below to execute the code on slide 9_sa

/*
SET SERVEROUTPUT ON

DECLARE
   v_event VARCHAR2(15);
BEGIN
  v_event := q'!Father's day!';
  DBMS_OUTPUT.PUT_LINE('3rd Sunday in June is : '||v_event);
  v_event := q'[Mother's day]';
  DBMS_OUTPUT.PUT_LINE('2nd Sunday in May is : '||v_event);
END;
/*/

--Uncomment the code below to execute the code on slide 30_na

/*
VARIABLE b_result NUMBER
BEGIN
  SELECT (SALARY*12) + NVL(COMMISSION_PCT,0) INTO :b_result
  FROM employees WHERE employee_id = 144;
END;
/
PRINT b_result
/*/

--Uncomment the code below to execute the code on slide 31_sa

/*
VARIABLE b_emp_salary NUMBER
BEGIN
   SELECT salary  INTO :b_emp_salary 
   FROM  employees WHERE employee_id = 178;  
END;
/
Print b_emp_salary
SELECT first_name, last_name
FROM  employees
WHERE salary = :b_emp_salary;
*/

--Uncomment the code below to execute the code on slide 32_sa

/*
VARIABLE b_emp_salary NUMBER
SET AUTOPRINT ON
DECLARE
  v_empno NUMBER(6):=&empno;
BEGIN
   SELECT salary  INTO :b_emp_salary 
   FROM  employees WHERE employee_id = v_empno;  
END;
/*/



