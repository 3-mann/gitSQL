--The SQL Script to run the solution for Additional Practice 7-8

--Uncomment code below to run the solution for Additional Practice 7/8-1

/*
SET SERVEROUTPUT ON
DECLARE
  CURSOR C_EMP_CUR
  IS
    SELECT last_name,salary,hire_date FROM EMPLOYEES;

  V_ENAME VARCHAR2(25);
  V_SAL   NUMBER(7,2);
  V_HIREDATE DATE;
BEGIN
  OPEN C_EMP_CUR;
  FETCH C_EMP_CUR INTO V_ENAME,V_SAL,V_HIREDATE;
  
  WHILE C_EMP_CUR%FOUND
  LOOP
    IF V_SAL > 15000 AND V_HIREDATE >= TO_DATE('01-FEB-1988','DD-MON-YYYY') THEN
      DBMS_OUTPUT.PUT_LINE (V_ENAME || ' earns ' || TO_CHAR(V_SAL)|| ' and joined the organization on ' || TO_DATE(V_HIREDATE,'DD-Mon-YYYY'));
    END IF;
    FETCH C_EMP_CUR INTO V_ENAME,V_SAL,V_HIREDATE;
  END LOOP;
  CLOSE C_EMP_CUR;
END;
/
*/

--Uncomment code below to run the solution for Additional Practice 7/8-2

/*
SET SERVEROUTPUT ON
DECLARE
TYPE Table_Ename
IS
  TABLE OF employees.last_name%TYPE INDEX BY BINARY_INTEGER;
TYPE Table_dept
IS
  TABLE OF employees.department_id%TYPE INDEX BY BINARY_INTEGER;
  Tename Table_Ename;
  Tdept Table_dept;
  i BINARY_INTEGER :=0;
  CURSOR Namedept
  IS
    SELECT last_name,department_id FROM employees WHERE employee_id < 115;
BEGIN
  FOR emprec IN Namedept
  LOOP
    i         := i +1;
    Tename(i) := emprec.last_name;
    Tdept(i)  := emprec.department_id;
    DBMS_OUTPUT.PUT_LINE ('Employee: ' || Tename(i) || ' is in department number: ' || Tdept(i));
  END LOOP;
END;
/
*/
