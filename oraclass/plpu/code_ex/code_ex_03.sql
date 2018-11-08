--This is the SQL Script to run the code_examples for Lesson 3

--Please perform the following code as SYSDBA before executing other code examples.
--This is a work around, if you encounter an “access control list (ACL) error”.

/*
BEGIN
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
host => '127.0.0.1',
ace => xs$ace_type(privilege_list => xs$name_list('jdwp'),
principal_name => 'ora61',
principal_type => xs_acl.ptype_db));
END;
/

*/

--Uncomment the code below to execute the code on slide 08_sa 
/*

CREATE OR REPLACE FUNCTION get_sal
 (p_id  employees.employee_id%TYPE) RETURN NUMBER IS

v_sal employees.salary%TYPE := 0;

BEGIN
  SELECT salary
  INTO   v_sal
  FROM   employees         
  WHERE  employee_id = p_id;
  RETURN v_sal;
END get_sal;
/

*/

--Uncomment the code below to execute the code on slide 08_sb 
-- You must run the code under slide 08_sa before running this code example. 
/*

SET SERVEROUTPUT ON

EXECUTE DBMS_OUTPUT.PUT_LINE(get_sal(100))

*/

--Uncomment the code below to execute the code on slide 09_sa 
-- You must run the code under slide 08_sa before running this code example. 
/*

VARIABLE b_salary NUMBER
EXECUTE :b_salary := get_sal(100)
PRINT b_salary

*/

--Uncomment the code below to execute the code on slide 09_sb 
-- You must run the code under slide 08_sa before running this code example. 
/*

SET SERVEROUTPUT ON

DECLARE
  sal employees.salary%type;
BEGIN
  sal := get_sal(100);
  DBMS_OUTPUT.PUT_LINE('The salary is: '|| sal);
END;
/

*/

--Uncomment the code below to execute the code on slide 10_sa 
-- You must run the code under slide 08_sa before running this code example. 
/*
SET SERVEROUTPUT ON

EXECUTE DBMS_OUTPUT.PUT_LINE(get_sal(100))

*/

--Uncomment the code below to execute the code on slide 10_sb 
-- You must run the code under slide 08_sa before running this code example.
/*

SELECT job_id, get_sal(employee_id)
FROM employees;

*/

--Uncomment the code below to execute the code on slide 14_sa 
/*
CREATE OR REPLACE FUNCTION tax(p_value IN NUMBER)
 RETURN NUMBER IS
BEGIN
   RETURN (p_value * 0.08);
END tax;
/
SELECT employee_id, last_name, salary, tax(salary)
FROM   employees
WHERE  department_id = 100;
*/

--Uncomment the code below to execute the code on slide 15_na 
-- You must run the code under slide 14_sa before running this code example.
/*

SELECT employee_id, tax(salary)
FROM   employees
WHERE  tax(salary) > (SELECT MAX(tax(salary))
                      FROM employees
                      WHERE department_id = 30)
ORDER BY tax(salary) DESC;

*/

--Uncomment the code below to execute the code on slide 18_sa 
/*

CREATE OR REPLACE FUNCTION dml_call_sql(p_sal NUMBER)
   RETURN NUMBER IS
BEGIN
  INSERT INTO employees(employee_id, last_name, email,
                        hire_date, job_id, salary)
  VALUES(1, 'Frost', 'jfrost@company.com',
         SYSDATE, 'SA_MAN', p_sal);
  RETURN (p_sal + 100);
END;
/

*/

--Uncomment the code below to execute the code on slide 18_sb 
-- You must run the code under slide 18_sa before attempting to run this code example.
-- This code example generates an expected error message. 
/*

UPDATE employees
 SET salary = dml_call_sql(2000)
WHERE employee_id = 170;

*/

--Uncomment the code below to execute the code on slide 18_na 
/*
CREATE OR REPLACE FUNCTION query_call_sql(p_a NUMBER) RETURN NUMBER IS
   v_s NUMBER;
BEGIN
   SELECT salary INTO v_s FROM employees
   WHERE employee_id = 170;
   RETURN (v_s + p_a);
END;
/

*/

--Uncomment the code below to execute the code on slide 18_nb 
-- You must run the code under slide 18_na before attempting to run this code example.
-- This code example generates an expected error message. 
/*
UPDATE employees SET salary = query_call_sql(100)
WHERE employee_id = 170;

*/

--Uncomment the code below to execute the code on slide 20_sa 
/*

CREATE OR REPLACE FUNCTION f(
  p_parameter_1 IN NUMBER DEFAULT 1,
  p_parameter_5 IN NUMBER DEFAULT 5) 
RETURN NUMBER
IS
 v_var number;
BEGIN
  v_var := p_parameter_1 + (p_parameter_5 * 2);
  RETURN v_var;
END f;
/

*/

--Uncomment the code below to execute the code on slide 20_sb 
-- You must run  the code under slide 20_sa before running this code example. 
/*
SELECT f(p_parameter_5 => 10) FROM DUAL;

*/


--Uncomment the code below to execute the code on slide 21_sa 
/*
DESCRIBE user_source

*/

--Uncomment the code below to execute the code on slide 21_sb 
/*
SELECT text
FROM   user_source
WHERE  type = 'FUNCTION'
ORDER BY line; 

*/

--Uncomment the code below to execute the code on slide 23_sa 
/*
DROP FUNCTION f;

*/


--Uncomment the code below to execute the code on slide 34_sa 
-- The emp_list procedure this code example creates, invokes the get_location function 
-- that is created using the code under slide 35_sa. This is why a warning message is displayed. Simply 
-- re-compile emp_list after creating get_location. 

/*
CREATE OR REPLACE PROCEDURE emp_list 
(p_maxrows IN NUMBER) 
IS
CURSOR cur_emp IS
  SELECT d.department_name, e.employee_id, e.last_name,
         e.salary, e.commission_pct
  FROM  departments d, employees e
  WHERE d.department_id = e.department_id;
  rec_emp cur_emp%ROWTYPE;
  TYPE emp_tab_type IS TABLE OF cur_emp%ROWTYPE INDEX BY BINARY_INTEGER;
  emp_tab emp_tab_type;
i NUMBER := 1;
v_city VARCHAR2(30); 
BEGIN
  OPEN cur_emp;
  FETCH cur_emp INTO rec_emp;
  emp_tab(i) := rec_emp;
  WHILE (cur_emp%FOUND) AND (i <= p_maxrows) LOOP
     i := i + 1;
     FETCH cur_emp INTO rec_emp;
     emp_tab(i) := rec_emp;
     v_city := get_location (rec_emp.department_name);
     dbms_output.put_line('Employee ' || rec_emp.last_name ||
       ' works in ' || v_city );
  END LOOP;
  CLOSE cur_emp;
  FOR j IN REVERSE 1..i LOOP
     DBMS_OUTPUT.PUT_LINE(emp_tab(j).last_name);
  END LOOP;
END emp_list; 
/

*/

--Uncomment the code below to execute the code on slide 35_sa 
/*

CREATE OR REPLACE FUNCTION get_location
( p_deptname IN VARCHAR2) RETURN VARCHAR2 
AS
  v_loc_id NUMBER;
  v_city   VARCHAR2(30);
BEGIN
  SELECT d.location_id, l.city INTO v_loc_id, v_city
  FROM departments d, locations l
  WHERE upper(department_name) = upper(p_deptname)
  and d.location_id = l.location_id;
  RETURN v_city;
END GET_LOCATION;
/

*/
