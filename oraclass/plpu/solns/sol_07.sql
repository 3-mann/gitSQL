--The SQL Script to run the solution for Practice 7
--Run cleanup_07.sql script from /home/oracle/labs/plpu/code_ex/cleanup_scripts directory before executing the solutions.
--Uncomment code below to run the solution for Task 1_a of Practice 7

/*

CREATE OR REPLACE PACKAGE table_pkg IS
  PROCEDURE make(p_table_name VARCHAR2, p_col_specs 
      VARCHAR2);
  PROCEDURE add_row(p_table_name VARCHAR2, p_col_values 
      VARCHAR2, p_cols VARCHAR2 := NULL);
  PROCEDURE upd_row(p_table_name VARCHAR2, p_set_values 
      VARCHAR2, p_conditions VARCHAR2 := NULL);
  PROCEDURE del_row(p_table_name VARCHAR2, p_conditions 
      VARCHAR2 := NULL);
  PROCEDURE remove(p_table_name VARCHAR2);
END table_pkg;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 1_b of Practice 7

/*

CREATE OR REPLACE PACKAGE BODY table_pkg IS
  PROCEDURE execute(p_stmt VARCHAR2) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(p_stmt);
    EXECUTE IMMEDIATE p_stmt;
  END;

  PROCEDURE make(p_table_name VARCHAR2, p_col_specs VARCHAR2)   
  IS
    v_stmt VARCHAR2(200) := 'CREATE TABLE '|| p_table_name ||
                          ' (' || p_col_specs || ')';
  BEGIN
    execute(v_stmt);
  END;

  PROCEDURE add_row(p_table_name VARCHAR2, p_col_values 
                    VARCHAR2, p_cols VARCHAR2 := NULL) IS
    v_stmt VARCHAR2(200) := 'INSERT INTO '|| p_table_name;
  BEGIN
    IF p_cols IS NOT NULL THEN
       v_stmt := v_stmt || ' (' || p_cols || ')';
    END IF;
    v_stmt := v_stmt || ' VALUES (' || p_col_values || ')';
    execute(v_stmt);
  END;
 
  PROCEDURE upd_row(p_table_name VARCHAR2, p_set_values  
                   VARCHAR2, p_conditions VARCHAR2 := NULL) IS

   
   v_stmt VARCHAR2(200) := 'UPDATE '|| p_table_name || ' SET ' || p_set_values;
  BEGIN
    IF p_conditions IS NOT NULL THEN
       v_stmt := v_stmt || ' WHERE ' || p_conditions;
    END IF;
    execute(v_stmt);
  END;


  PROCEDURE del_row(p_table_name VARCHAR2, p_conditions
 
                    VARCHAR2 := NULL) IS
    v_stmt VARCHAR2(200) := 'DELETE FROM '|| p_table_name;
  BEGIN
    IF p_conditions IS NOT NULL THEN
       v_stmt := v_stmt || ' WHERE ' || p_conditions;
    END IF;    
    execute(v_stmt);
  END;

  PROCEDURE remove(p_table_name VARCHAR2) IS
    cur_id INTEGER;
    v_stmt VARCHAR2(100) := 'DROP TABLE '||p_table_name;
  BEGIN
    cur_id := DBMS_SQL.OPEN_CURSOR;
    DBMS_OUTPUT.PUT_LINE(v_stmt);
    DBMS_SQL.PARSE(cur_id, v_stmt, DBMS_SQL.NATIVE);
    -- Parse executes DDL statements,no EXECUTE is required.
    DBMS_SQL.CLOSE_CURSOR(cur_id);
  END;

END table_pkg;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 1_c of Practice 7

/*

EXECUTE table_pkg.make('my_contacts', 'id number(4), name varchar2(40)')

*/ 

--Uncomment code below to run the solution for Task 1_d of Practice 7

/*

DESCRIBE my_contacts

*/

--Uncomment code below to run the solution for Task 1_e of Practice 7

/*

SET SERVEROUTPUT ON

BEGIN
  table_pkg.add_row('my_contacts','1,''Lauran Serhal''','id, name');
  table_pkg.add_row('my_contacts','2,''Nancy''','id, name');
  table_pkg.add_row('my_contacts','3,''Sunitha Patel''','id,name');
  table_pkg.add_row('my_contacts','4,''Valli Pataballa''','id,name');
END;
/

*/

--Uncomment code below to run the solution for Task 1_f of Practice 7

/*

SELECT *
FROM my_contacts;

*/

--Uncomment code below to run the solution for Task 1_g of Practice 7

/*

SET SERVEROUTPUT ON
EXECUTE table_pkg.del_row('my_contacts', 'id=3')

*/

--Uncomment code below to run the solution for Task 1_h of Practice 7

/*

SET SERVEROUTPUT ON
EXEC table_pkg.upd_row('my_contacts','name=''Nancy Greenberg''','id=2');

*/

--Uncomment code below to run the solution for Task 1_i of Practice 7
/*

SELECT *
FROM my_contacts;

*/

--Uncomment code below to run the solution for Task 1_j of Practice 7

/*

EXECUTE table_pkg.remove('my_contacts')
DESCRIBE my_contacts
*/

--Uncomment code below to run the solution for Task 2_a of Practice 7
/*

CREATE OR REPLACE PACKAGE compile_pkg IS
  PROCEDURE make(p_name VARCHAR2);
END compile_pkg;
/
SHOW ERRORS
*/

--Uncomment code below to run the solution for Task 2_b of Practice 7
/*

CREATE OR REPLACE PACKAGE BODY compile_pkg IS

  PROCEDURE execute(p_stmt VARCHAR2) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(p_stmt);
    EXECUTE IMMEDIATE p_stmt;
  END;

  FUNCTION get_type(p_name VARCHAR2) RETURN VARCHAR2 IS
    v_proc_type VARCHAR2(30) := NULL;
  BEGIN
    
     -- The ROWNUM = 1 is added to the condition
     -- to ensure only one row is returned if the
     -- name represents a PACKAGE, which may also
     -- have a PACKAGE BODY. In this case, we can
     -- only compile the complete package, but not
     -- the specification or body as separate
     -- components.
     
    SELECT object_type INTO v_proc_type
    FROM user_objects
    WHERE object_name = UPPER(p_name)
    AND ROWNUM = 1;
    RETURN v_proc_type;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END;
  
  PROCEDURE make(p_name VARCHAR2) IS
    v_stmt       VARCHAR2(100);
    v_proc_type  VARCHAR2(30) := get_type(p_name);
  BEGIN
    IF v_proc_type IS NOT NULL THEN
      v_stmt := 'ALTER '|| v_proc_type ||' '|| p_name ||' COMPILE';
      execute(v_stmt);
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 
         'Subprogram '''|| p_name ||''' does not exist');
    END IF;
  END make;
END compile_pkg;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2_c of Practice 7
/*

SET SERVEROUTPUT ON
EXECUTE compile_pkg.make('employee_report')
EXECUTE compile_pkg.make('emp_pkg')
EXECUTE compile_pkg.make('emp_data')

*/
