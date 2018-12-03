set pagesize 80
set linesize 120
set sqlprompt "_user 'on' _connect_identifier> "
set serveroutput on 
DEF _EDITOR = "C:\Program Files\Notepad++\notepad++.exe"
define ooo="C:\app\gitSQL\PL_SQL"
define ddd="DBMS_OUTPUT.PUT_LINE"
VARIABLE b_result NUMBER
BEGIN
  SELECT (SALARY*12) + NVL(COMMISSION_PCT,0) INTO :b_result
  FROM employees WHERE employee_id = 144;
END;
/
PRINT b_result
/
