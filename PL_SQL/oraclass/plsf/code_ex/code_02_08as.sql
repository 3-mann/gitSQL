set pagesize 80
set linesize 120
set sqlprompt "_user 'on' _connect_identifier> "
set serveroutput on 
DEF _EDITOR = "C:\Program Files\Notepad++\notepad++.exe"
define ooo="C:\app\gitSQL\PL_SQL"
define ddd="DBMS_OUTPUT.PUT_LINE"

DECLARE
  v_myName  VARCHAR(20);
BEGIN
    v_myname := 'Dieter';
    DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName );
    v_myName  := 'John';
    DBMS_OUTPUT.PUT_LINE('His name is: '||v_myName );
END;
/

