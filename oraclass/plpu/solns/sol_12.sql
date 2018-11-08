--The SQL Script to run the solution for Practice 12
--Run cleanup_12.sql script from /home/oracle/labs/plpu/code_ex/cleanup_scripts directory before executing the solutions.

-- Prerequisite: Execute the following code before executing the solution for Task 1_b.

/*

CREATE OR REPLACE PROCEDURE add_employee(
   p_first_name employees.first_name%TYPE,
   p_last_name  employees.last_name%TYPE,
   p_email      employees.email%TYPE,
   p_job        employees.job_id%TYPE         DEFAULT 'SA_REP',
   p_mgr        employees.manager_id%TYPE     DEFAULT 145,
   p_sal        employees.salary%TYPE         DEFAULT 1000,
   p_comm       employees.commission_pct%TYPE DEFAULT 0,
   p_deptid     employees.department_id%TYPE  DEFAULT 30) IS
BEGIN
 IF valid_deptid(p_deptid) THEN
   INSERT INTO employees(employee_id, first_name, last_name, email,
     job_id, manager_id, hire_date, salary, commission_pct, department_id)
   VALUES (employees_seq.NEXTVAL, p_first_name, p_last_name, p_email, 
     p_job, p_mgr, TRUNC(SYSDATE), p_sal, p_comm, p_deptid);
 ELSE
   RAISE_APPLICATION_ERROR (-20204, 'Invalid department ID. Try again.');
 END IF;
END add_employee;
/
CREATE OR REPLACE FUNCTION valid_deptid(
  p_deptid IN departments.department_id%TYPE)
  RETURN BOOLEAN IS
  v_dummy  PLS_INTEGER;

BEGIN
  SELECT  1
  INTO    v_dummy
  FROM    departments
  WHERE   department_id = p_deptid;
  RETURN  TRUE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN FALSE;
END valid_deptid;
/

*/

--Uncomment code below to run the solution for Task 1_b of Practice 12


/* 

EXECUTE deptree_fill('PROCEDURE', USER, 'add_employee')

*/

--Uncomment code below to run the solution for Task 1_c of Practice 12

/* 

SELECT * FROM IDEPTREE;

*/

--Uncomment code below to run the solution for Task 1_d of Practice 12

/* 

EXECUTE deptree_fill('FUNCTION', USER, 'valid_deptid')

*/

--Uncomment code below to run the solution for Task 1_e of Practice 12

/* 

SELECT * FROM IDEPTREE;

*/

--Uncomment code below to run the solution for Task 2_a of Practice 12

/*

CREATE TABLE emps AS
  SELECT * FROM employees;

*/

--Uncomment code below to run the solution for Task 2_b of Practice 12
/*

ALTER TABLE employees
  ADD (totsal NUMBER(9,2)); 

*/

--Uncomment code below to run the solution for Task 2_c of Practice 12

/*

SELECT object_name, object_type, status
FROM USER_OBJECTS
WHERE status = 'INVALID';

*/

--Uncomment code below to run the solution for Task 2_d of Practice 12

/*

CREATE OR REPLACE PACKAGE compile_pkg IS
  PROCEDURE make(name VARCHAR2);
  PROCEDURE recompile;
END compile_pkg;
/
SHOW ERRORS

CREATE OR REPLACE PACKAGE BODY compile_pkg IS

  PROCEDURE execute(stmt VARCHAR2) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(stmt);
    EXECUTE IMMEDIATE stmt;
  END;

  FUNCTION get_type(name VARCHAR2) RETURN VARCHAR2 IS
    proc_type VARCHAR2(30) := NULL;
  BEGIN
     -- The ROWNUM = 1 is added to the condition
     -- to ensure only one row is returned if the
     -- name represents a PACKAGE, which may also
     -- have a PACKAGE BODY. In this case, we can
     -- only compile the complete package, but not
     -- the specification or body as separate
     -- components.
  SELECT object_type INTO proc_type
  FROM user_objects
  WHERE object_name = UPPER(name)
   AND ROWNUM = 1;
    RETURN proc_type;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END;
  
  PROCEDURE make(name VARCHAR2) IS
    stmt       VARCHAR2(100);
    proc_type  VARCHAR2(30) := get_type(name);
  BEGIN
    IF proc_type IS NOT NULL THEN
      stmt := 'ALTER '|| proc_type ||' '|| name ||' COMPILE';
      
  execute(stmt);
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 
         'Subprogram '''|| name ||''' does not exist');
    END IF;
  END make;

  PROCEDURE recompile IS
    stmt VARCHAR2(200);
    obj_name user_objects.object_name%type;
    obj_type user_objects.object_type%type;
  BEGIN
    FOR objrec IN (SELECT object_name, object_type 
                   FROM user_objects
                   WHERE status = 'INVALID'
                   AND object_type <> 'PACKAGE BODY')
    LOOP
      stmt := 'ALTER '|| objrec.object_type ||' '||
                   objrec.object_name ||' COMPILE';
      execute(stmt);
    END LOOP;
  END recompile;

END compile_pkg;
/

SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2_e of Practice 12

/* 

EXECUTE compile_pkg.recompile
 
*/

--Uncomment code below to run the solution for Task 2_f of Practice 12

/*

SELECT object_name, object_type, status
FROM USER_OBJECTS
WHERE status = 'INVALID';

*/
