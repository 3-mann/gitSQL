--This is the SQL Script to run the code_examples for Lesson 5

--Uncomment the code below to execute the code on slide 06_sa 
/*

CREATE OR REPLACE PACKAGE dept_pkg IS
  PROCEDURE add_department(p_deptno departments.department_id%TYPE,
                           p_name departments.department_name%TYPE :='unknown',
                           p_loc  departments.location_id%TYPE := 1700);

  PROCEDURE add_department(p_name departments.department_name%TYPE := 'unknown',
                           p_loc  departments.location_id%TYPE := 1700);
END dept_pkg;
/

*/

--Uncomment the code below to execute the code on slide 07_sa 
-- Run the code under slide 06_sa before running this code example. 

/*

CREATE OR REPLACE PACKAGE BODY dept_pkg
IS
PROCEDURE add_department 
  (
    p_deptno departments.department_id%TYPE,
    p_name departments.department_name%TYPE := 'unknown',
    p_loc departments.location_id%TYPE      := 1700)
IS
BEGIN
  INSERT
  INTO departments
    (
      department_id,
      department_name,
      location_id
    )
    VALUES
    (
      p_deptno,
      p_name,
      p_loc
    );
END add_department;
PROCEDURE add_department 
  (
    p_name departments.department_name%TYPE := 'unknown',
    p_loc departments.location_id%TYPE      := 1700
  )
IS
BEGIN
  INSERT
  INTO departments
    (
      department_id,
      department_name,
      location_id
    )
    VALUES
    (
      departments_seq.NEXTVAL,
      p_name,
      p_loc
    );
END add_department;
END dept_pkg;
/
*/

--Uncomment the code below to execute the code on slide 07_na 
-- Run the code under slide 07_sa before running this code example. 
/*

EXECUTE dept_pkg.add_department(980,'Education',2500)
SELECT * FROM departments
WHERE department_id = 980;

*/

--Uncomment the code below to execute the code on slide 07_nb 
--Run code under slide 07_sa  before running this code example. 

/*

EXECUTE dept_pkg.add_department ('Training', 2400)
SELECT * FROM departments
WHERE department_name = 'Training';

*/

--Uncomment the code below to execute the code on slide 14_sa 
/*

CREATE OR REPLACE PACKAGE taxes_pkg IS
  FUNCTION tax (p_value IN NUMBER) RETURN NUMBER;
END taxes_pkg;
/
CREATE OR REPLACE PACKAGE BODY taxes_pkg IS
  FUNCTION tax (p_value IN NUMBER) RETURN NUMBER IS
    v_rate NUMBER := 0.08;
  BEGIN
    RETURN (p_value * v_rate);
  END tax;
END taxes_pkg;
/

*/

--Uncomment the code below to execute the code on slide 14_sb 
-- Run the code under slide 14_sa before running this code. 
/*

SELECT taxes_pkg.tax(salary), salary, last_name
FROM   employees;

*/

--Uncomment the code below to execute the code on slide 19_sa 
-- This script is for the code located on pages 5-19 and 5-20.
/*

CREATE OR REPLACE PACKAGE curs_pkg IS
  PROCEDURE open;
  FUNCTION next(p_n NUMBER := 1) RETURN BOOLEAN;
  PROCEDURE close;
END curs_pkg;
/

CREATE OR REPLACE PACKAGE BODY curs_pkg IS
  CURSOR cur_c IS 
    SELECT employee_id FROM employees;
  PROCEDURE open IS  
  BEGIN  
    IF NOT cur_c%ISOPEN THEN   
      OPEN cur_c;  
    END IF;
  END open;
  
  FUNCTION next(p_n NUMBER := 1) RETURN BOOLEAN IS
    v_emp_id employees.employee_id%TYPE;
  BEGIN
    FOR count IN 1 .. p_n LOOP
      FETCH cur_c INTO v_emp_id; 
      EXIT WHEN cur_c%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Id: ' ||(v_emp_id));
    END LOOP;
    RETURN cur_c%FOUND;
  END next;
  
  PROCEDURE close IS 
    BEGIN
      IF cur_c%ISOPEN THEN  
        CLOSE cur_c;  
      END IF;
    END close;
END curs_pkg;
/

*/

--Uncomment the code below to execute the code on slide 21_sa 
/*
SET SERVEROUTPUT ON

EXECUTE curs_pkg.open
DECLARE
  v_more BOOLEAN := curs_pkg.next(3);
BEGIN
  IF NOT v_more THEN
    curs_pkg.close;
  END IF;
END;
/
*/

--Uncomment the code below to execute the code on slide 21_na 
-- Run the code under slide 19_sa before running this code example. 
/*

EXECUTE curs_pkg.close

*/

--Uncomment the code below to execute the code on slide 22_sa 
/*

CREATE OR REPLACE PACKAGE emp_pkg IS
  TYPE emp_table_type IS TABLE OF employees%ROWTYPE
     INDEX BY BINARY_INTEGER;
  PROCEDURE get_employees(p_emps OUT emp_table_type);
END emp_pkg;
/

*/

--Uncomment the code below to execute the code on slide 22_sb 
-- Run the code under slide 22_sa before running this code example. 

/*

CREATE OR REPLACE PACKAGE BODY emp_pkg IS
  PROCEDURE get_employees(p_emps OUT emp_table_type) IS
    v_i BINARY_INTEGER := 0;
  BEGIN
    FOR emp_record IN (SELECT * FROM employees) 
    LOOP
      p_emps(v_i) := emp_record;
      v_i:= v_i + 1;
    END LOOP;
  END get_employees;
END emp_pkg;
/

*/

--Uncomment the code below to execute the code on slide 22_na 
-- Run the code under slide 22_sa and code under slide 22_sb before running this code example. 
/*

SET SERVEROUTPUT ON
DECLARE
  v_employees  emp_pkg.emp_table_type;
BEGIN
  emp_pkg.get_employees(v_employees);
  DBMS_OUTPUT.PUT_LINE('Emp 5: '|| v_employees(4).last_name);
END;
/

*/



