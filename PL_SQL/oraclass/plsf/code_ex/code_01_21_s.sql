set pagesize 80
set linesize 120
set sqlprompt "_user 'on' _connect_identifier> "
set serveroutput on 
DEF _EDITOR = "C:\Program Files\Notepad++\notepad++.exe"
define ooo="C:\app\gitSQL\PL_SQL"
define ddd="DBMS_OUTPUT.PUT_LINE"


DECLARE 
  v_fname VARCHAR(20);
BEGIN
  SELECT first_name
  INTO v_fname
  FROM employees
  WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE(' The First Name of the Employee is ' || v_fname);
END;
/