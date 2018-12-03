set pagesize 80
set linesize 120
set sqlprompt "_user 'on' _connect_identifier> "
set serveroutput on 
DEF _EDITOR = "C:\Program Files\Notepad++\notepad++.exe"
define ooo="C:\app\gitSQL\PL_SQL"
define ddd="DBMS_OUTPUT.PUT_LINE"

DECLARE
v_employee_id NUMBER(5) ;
v_salary NUMBER(10) ;
c_grenze Constant Number(10) := 5000

BEGIN
SELECT      employee_id,    salary 
    INTO    v_employee_id,  v_salary
FROM employees 
WHERE department_id=10 ;
DBMS_OUTPUT.PUT_LINE('in Abteilung 10 wird '||v_salary||' von '||v_employee_id||
' verdient' );
v_diff :=-v_grenze
END ;