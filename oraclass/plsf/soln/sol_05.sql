--The SQL Script to run the solution for Practice 5

-- Execute the following code before starting this practice.
/*
DROP table employees2;
DROP table copy_emp;
*/

--Uncomment code below to run the solution for Task 1 of Practice 5

/*
SET SERVEROUTPUT ON

DECLARE
   v_max_deptno	NUMBER;
BEGIN
   SELECT MAX(department_id)  INTO v_max_deptno  FROM	departments;
   DBMS_OUTPUT.PUT_LINE('The maximum department_id is : ' || v_max_deptno);
END;
*/

--Uncomment code below to run the solution for Task 2 of Practice 5

/*
SET SERVEROUTPUT ON

DECLARE
   v_dept_name departments.department_name%TYPE:= 'Education';
   v_dept_id NUMBER;
   v_max_deptno	NUMBER;
BEGIN
   SELECT MAX(department_id)  INTO v_max_deptno  FROM departments;
   DBMS_OUTPUT.PUT_LINE('The maximum department_id is : ' ||       
   v_max_deptno);
   v_dept_id := 10 + v_max_deptno;
   INSERT INTO departments (department_id, department_name, location_id) 
   VALUES (v_dept_id,v_dept_name, NULL);
   DBMS_OUTPUT.PUT_LINE (' SQL%ROWCOUNT gives ' || SQL%ROWCOUNT);
 END;
/
SELECT * FROM  departments  WHERE  department_id=280;

*/

--Uncomment code below to run the solution for Task 3 of Practice 5

/*
BEGIN
   UPDATE departments SET location_id=3000 WHERE 
   department_id=280;
END;
/
SELECT * FROM departments WHERE department_id=280;
DELETE FROM departments WHERE department_id=280;
*/
