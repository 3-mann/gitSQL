CREATE OR REPLACE PACKAGE emp_pkg 
IS
  TYPE emp_table_type IS TABLE OF employees%ROWTYPE
     INDEX BY BINARY_INTEGER; --AssoArray 
  PROCEDURE get_employees(p_emps OUT emp_table_type); --Datentyp des Parameters ist AssoArray
END emp_pkg;
/
CREATE OR REPLACE PACKAGE BODY emp_pkg IS
  PROCEDURE get_employees(p_emps OUT emp_table_type) 
  IS
    v_i BINARY_INTEGER := 0;
  BEGIN
    FOR emp_record IN (SELECT * FROM employees)  LOOP
      p_emps(v_i) := emp_record;
      v_i:= v_i + 1;
    END LOOP;
  END get_employees;
END emp_pkg;
/

SET SERVEROUTPUT ON
DECLARE
  v_employees  emp_pkg.emp_table_type; --hierfür ist Package notwendig, Ansprechen des Datentype 
BEGIN
  emp_pkg.get_employees(v_employees);
  DBMS_OUTPUT.PUT_LINE('Emp 5: '|| v_employees(4).last_name||'2.Nachfolger  verdient '||v_employees(6).salary);
END;
/
SELECT * FROM employees ;