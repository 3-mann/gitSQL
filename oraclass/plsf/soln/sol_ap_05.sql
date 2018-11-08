--The SQL Script to run the solution for Additional Practice 5

--Uncomment code below to run the solution for Additional Practice 5-1

/*
DECLARE
	V_MESSAGE VARCHAR2(35);
	V_DATE_WRITTEN DATE;
       BEGIN
	V_MESSAGE := 'This is my first PLSQL Program';
	V_DATE_WRITTEN := SYSDATE;
	INSERT INTO temp(CHAR_STORE,DATE_STORE)
	VALUES (V_MESSAGE,V_DATE_WRITTEN);
END;
/
SELECT * FROM TEMP;
*/


--Uncomment code below to run the solution for Additional Practice 5-2

/*
SET SERVEROUTPUT ON

DECLARE
	V_HOWMANY NUMBER(3);
	V_DEPTNO DEPARTMENTS.department_id%TYPE  := &P_DEPTNO;
BEGIN
	SELECT COUNT(*) INTO V_HOWMANY FROM employees
	WHERE department_id = V_DEPTNO;
	DBMS_OUTPUT.PUT_LINE (V_HOWMANY  || ' employee(s) work for department number ' ||V_DEPTNO);
END;
/
*/
