--This is the SQL Script to run the code_examples for Lesson 10

--Uncomment the code below to execute the code on slide 08_sa

/*
--Please ignore the warning message in the output
SET SERVEROUTPUT ON

SET VERIFY OFF
DROP TABLE dept;
DROP PROCEDURE add_dept;
CREATE TABLE dept AS SELECT * FROM departments;
CREATE PROCEDURE add_dept IS
 v_dept_id dept.department_id%TYPE;
 v_dept_name dept.department_name%TYPE;
BEGIN
 v_dept_id:=280;
 v_dept_name:='ST-Curriculum';
 INSERT INTO dept(department_id,department_name)
 VALUES(v_dept_id,v_dept_name);
 DBMS_OUTPUT.PUT_LINE(' Inserted '|| SQL%ROWCOUNT ||' row ');
END; 
/
*/

--Uncomment the code below to execute the code on slide 10_sa

/*
SET SERVEROUTPUT ON
BEGIN
 add_dept;
END;
/
SELECT department_id, department_name FROM dept WHERE department_id=280;
/
*/

--Uncomment the code below to execute the code on slide 13_sa

/*
CREATE FUNCTION check_sal RETURN Boolean IS
 v_dept_id employees.department_id%TYPE;
 v_empno   employees.employee_id%TYPE;
 v_sal     employees.salary%TYPE;
 v_avg_sal employees.salary%TYPE;
BEGIN
 v_empno:=205;
 SELECT salary,department_id INTO v_sal,v_dept_id FROM employees
 WHERE employee_id= v_empno;
 SELECT avg(salary) INTO v_avg_sal FROM employees WHERE department_id=v_dept_id;
 IF v_sal > v_avg_sal THEN
  RETURN TRUE;
 ELSE
  RETURN FALSE;  
 END IF;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
   RETURN NULL;
END;
/
*/

--Uncomment the code below to execute the code on slide 14_sa

/*
SET SERVEROUTPUT ON

BEGIN
 IF (check_sal IS NULL) THEN
   DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
 ELSIF (check_sal) THEN  
   DBMS_OUTPUT.PUT_LINE('Salary > average');
 ELSE
   DBMS_OUTPUT.PUT_LINE('Salary < average');
 END IF;
END;
/
*/

--Uncomment the code below to execute the code on slide 15_sa

/*
SET VERIFY OFF
DROP FUNCTION check_sal;
CREATE FUNCTION check_sal (p_empno  employees.employee_id%TYPE) RETURN Boolean IS
 v_dept_id employees.department_id%TYPE;
 v_sal     employees.salary%TYPE;
 v_avg_sal employees.salary%TYPE;
BEGIN
 SELECT salary,department_id INTO v_sal,v_dept_id FROM employees
 WHERE employee_id=p_empno;
 SELECT avg(salary) INTO v_avg_sal FROM employees WHERE department_id=v_dept_id;
 IF v_sal > v_avg_sal THEN
  RETURN TRUE;
 ELSE
  RETURN FALSE;  
 END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
   RETURN NULL;
END;
/
*/

--Uncomment the code below to execute the code on slide 16_sa

/*
SET SERVEROUTPUT ON

BEGIN
  DBMS_OUTPUT.PUT_LINE('Checking for employee with id 205');
  IF (check_sal(205) IS NULL) THEN
    DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
  ELSIF (check_sal(205)) THEN  
    DBMS_OUTPUT.PUT_LINE('Salary > average');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary < average');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Checking for employee with id 70');
  IF (check_sal(70) IS NULL) THEN
    DBMS_OUTPUT.PUT_LINE('The function returned NULL due to exception');
  ELSIF (check_sal(70)) THEN  
    DBMS_OUTPUT.PUT_LINE('Salary > average');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary < average');
  END IF;
END;
/

--Execute the following code to drop the procedures, tables and functions created earlier in this script.
DROP procedure add_dept;
DROP table dept;
DROP function check_sal;
*/
