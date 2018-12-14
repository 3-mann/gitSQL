--Create a table using dynamic SQL
CREATE OR REPLACE PROCEDURE create_table(
p_table_name VARCHAR2, p_col_specs VARCHAR2) IS
BEGIN
EXECUTE IMMEDIATE 'CREATE TABLE ' || p_table_name ||
' (' || p_col_specs || ')';
END;
/
-- Call the procedure
BEGIN
create_table('EMPLOYEE_NAMES',
'id NUMBER(4) PRIMARY KEY, name VARCHAR2(40)');
END;
/

--#################################################################################

-- Delete rows from any table:
CREATE FUNCTION del_rows(p_table_name VARCHAR2)
RETURN NUMBER IS
BEGIN
EXECUTE IMMEDIATE 'DELETE FROM '|| p_table_name;
RETURN SQL%ROWCOUNT;
END;
/
BEGIN DBMS_OUTPUT.PUT_LINE(
del_rows('EMPLOYEE_NAMES')|| ' rows deleted.');
END;
/

--#################################################################################

-- Insert a row into a table with two columns:
CREATE PROCEDURE add_row(p_table_name VARCHAR2,
p_id NUMBER, p_name VARCHAR2) IS
BEGIN
EXECUTE IMMEDIATE 'INSERT INTO '|| p_table_name ||
' VALUES (:1, :2)' USING p_id, p_name;
END;
/
BEGIN
add_row('EMPLOYEE_NAMES',
20, 'Michaela Reimann');
END;
/
SELECT * FROM employee_names;
/
--#################################################################################

CREATE FUNCTION get_emp( p_emp_id NUMBER )
RETURN employees%ROWTYPE IS
v_stmt VARCHAR2(200);
v_emprec employees%ROWTYPE;
BEGIN
v_stmt := 'SELECT * FROM employees ' ||
'WHERE employee_id = :p_emp_id';
EXECUTE IMMEDIATE v_stmt INTO v_emprec USING p_emp_id ;
RETURN v_emprec;
END;
/
DECLARE
v_emprec employees%ROWTYPE := get_emp(100);
BEGIN
DBMS_OUTPUT.PUT_LINE('Emp: '|| v_emprec.first_name||' '|| v_emprec.last_name);
END;
/

--#################################################################################
-- TODO: das würde ich gern nochmal genau erklärt bekommen 
CREATE FUNCTION annual_sal( p_emp_id NUMBER)
RETURN NUMBER IS
v_plsql varchar2(200) :=
'DECLARE '||
' rec_emp employees%ROWTYPE; '||
'BEGIN '||
' rec_emp := get_emp(:empid); ' ||
' :res := rec_emp.salary * 12; ' ||
'END;';
v_result NUMBER;
BEGIN
EXECUTE IMMEDIATE v_plsql
USING IN p_emp_id, OUT v_result;
RETURN v_result;
END;
/
EXECUTE DBMS_OUTPUT.PUT_LINE(annual_sal(200));
/

--#################################################################################
-- definieren eine Proc "P", die ein U-Pro ausführt, wenn ihr Parm = TRUE ist
CREATE OR REPLACE PROCEDURE p (x BOOLEAN) AUTHID
DEFINER AS
BEGIN
    IF x THEN
        DBMS_OUTPUT.PUT_LINE('x is true');
    END IF;
END;
/
-- Anonymer Block, der P aufruft und dann erfährt, ob er TRUE oder FALSE mitgegeben hat
DECLARE
dyn_stmt VARCHAR2(200);
b BOOLEAN := TRUE;
BEGIN
dyn_stmt := 'BEGIN p(:x); END;';
EXECUTE IMMEDIATE dyn_stmt USING b;
END;
/

--#################################################################################

CREATE PROCEDURE compile_plsql(p_name VARCHAR2,
p_plsql_type VARCHAR2, p_options VARCHAR2 := NULL) IS
v_stmt varchar2(200) := 'ALTER '|| p_plsql_type ||
' '|| p_name || ' COMPILE';
BEGIN
IF p_options IS NOT NULL THEN
v_stmt := v_stmt || ' ' || p_options;
END IF;
EXECUTE IMMEDIATE v_stmt;
END;
/

--Beispiele für den Prozeduraufruf in den vier auf der Folie genannten Fällen:
EXEC compile_plsql ('employee_names', 'procedure');
/
EXEC compile_plsql ('get_emp', 'function');
/
EXEC compile_plsql ('mypack', 'package', 'specification');
/
EXEC compile_plsql ('mypack', 'package', 'body');
/
Beispiel zur Kompilierung, wobei debug für die Funktion get_emp aktiviert ist:
EXEC compile_plsql ('get_emp', 'function', 'debug');
/

--#################################################################################

CREATE OR REPLACE FUNCTION delete_all_rows
(p_table_name VARCHAR2) RETURN NUMBER IS
v_cur_id INTEGER;
v_rows_del NUMBER;
BEGIN
v_cur_id := DBMS_SQL.OPEN_CURSOR;
DBMS_SQL.PARSE(v_cur_id,
'DELETE FROM '|| p_table_name, DBMS_SQL.NATIVE);
v_rows_del := DBMS_SQL.EXECUTE (v_cur_id);
DBMS_SQL.CLOSE_CURSOR(v_cur_id);
RETURN v_rows_del;
END;
/

CREATE TABLE temp_emp AS SELECT * FROM employees;
BEGIN
DBMS_OUTPUT.PUT_LINE('Rows Deleted: ' ||
delete_all_rows('temp_emp'));
END;
/

--#################################################################################



--#################################################################################



--#################################################################################



--#################################################################################



--#################################################################################



--#################################################################################



--#################################################################################



--#################################################################################



--#################################################################################



--#################################################################################



