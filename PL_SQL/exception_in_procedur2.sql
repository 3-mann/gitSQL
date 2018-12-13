CREATE OR REPLACE PROCEDURE add_department( 
    p_name VARCHAR2, p_mgr NUMBER, p_loc NUMBER) IS 
BEGIN 
  INSERT INTO DEPARTMENTS (department_id, 
    department_name, manager_id, location_id) 
  VALUES (DEPARTMENTS_SEQ.NEXTVAL, p_name, p_mgr, p_loc); 
  DBMS_OUTPUT.PUT_LINE('Added Dept: '|| p_name); 
--EXCEPTION 
 --WHEN OTHERS THEN 
 -- DBMS_OUTPUT.PUT_LINE('Err: adding dept: '|| p_name); 
END; 
/
CREATE OR REPLACE PROCEDURE create_departments IS 
BEGIN 
  add_department('Media', 100, 1800); 
  add_department('Editing', 99, 1800); 
  add_department('Advertising', 101, 1800); 
 EXCEPTION 
 WHEN OTHERS THEN 
  DBMS_OUTPUT.PUT_LINE('Err: adding dept: ');  
END; 
/
exec create_departments 
rollback ;

SELECT * FROM departments ;


CREATE OR REPLACE PROCEDURE p2_ins_dept
(p_locid NUMBER) 
IS
 v_did NUMBER(4);
BEGIN
 DBMS_OUTPUT.PUT_LINE('Procedure p2_ins_dept started');
 INSERT INTO departments VALUES (7, 'Dept 7', 101, p_locid);
 SELECT department_id INTO v_did FROM employees
  WHERE employee_id = 99;
DBMS_OUTPUT.PUT_LINE('Procedure p2_ins_dept durchgelaufen');
END;
/


CREATE OR REPLACE PROCEDURE p1_ins_loc
( p_lid NUMBER
, p_city VARCHAR2)
IS
 v_city VARCHAR2(30); 
 v_dname VARCHAR2(30);
BEGIN
 DBMS_OUTPUT.PUT_LINE('Procedure p1_ins_loc laeuft');
 INSERT INTO locations (location_id, city) VALUES (p_lid, p_city);
 SELECT city INTO v_city FROM locations WHERE location_id = p_lid;
 DBMS_OUTPUT.PUT_LINE('Insert ist gelaufen: city '||v_city);
 DBMS_OUTPUT.PUT_LINE('AUFRUFEN DER procedure p2_ins_dept ...');
 p2_ins_dept(p_lid);
--EXCEPTION
 -- WHEN NO_DATA_FOUND THEN
 --  DBMS_OUTPUT.PUT_LINE('No such dept/loc for any employee');
END;
/
execute p1_ins_loc(12,'BERLIN')

SELECT * FROM locations ;
SELECT * FROM departments ;
rollback ;