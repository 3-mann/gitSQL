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