grant alter any procedure to hr;
grant select any dictionary to hr;
grant select any table to hr;
grant delete any table to hr;
grant dba to hr;
/

--#############################################################################
CREATE TABLE proc_tab AS 
SELECT owner, object_name FROM dba_procedures WHERE owner IN ('ORA1','SCOTT','HR') ;

--#############################################################################
create table my_tables as select * from dba_tables;

--#############################################################################
CREATE OR REPLACE PROCEDURE compile_procedure (p_owner VARCHAR2) 
IS 
CURSOR c1 IS SELECT owner, object_name FROM proc_tab WHERE owner =p_owner ;
BEGIN 
    FOR procrec IN c1 LOOP 
        DBMS_OUTPUT.PUT_LINE(procrec.owner||' hat procdure '||procrec.object_name) ;
        EXECUTE IMMEDIATE 'ALTER PROCEDURE '||procrec.owner||'.'||procrec.object_name||' COMPILE' ;
    END LOOP ;
END ;

/
exec compile_procedure('HR');
/

--#############################################################################
CREATE OR REPLACE PROCEDURE del_row_proc 
    (p_table_name_delete VARCHAR2
    ,p_table_name_beware VARCHAR2
    ,p_owner VARCHAR2
    )
IS CURSOR c1 
    IS SELECT table_name FROM my_tables 
        WHERE table_name LIKE UPPER('%'||p_table_name_delete||'%')
        AND table_name<> UPPER(p_table_name_beware ) 
        AND owner =p_owner ;
BEGIN 
    FOR loesch_rec IN c1 LOOP 
        --del_rows(loesch_rec.table_name) ;
        DBMS_OUTPUT.PUT_LINE(del_rows(loesch_rec.table_name)|| ' rows deleted from '||loesch_rec.table_name) ;
    end loop;
end;
/

CREATE OR REPLACE PROCEDURE compile_procedure (p_owner VARCHAR2) 
IS 
CURSOR c1 IS SELECT owner, object_name FROM proc_tab WHERE owner =p_owner ;
BEGIN 
    FOR procrec IN c1 LOOP 
        DBMS_OUTPUT.PUT_LINE(procrec.owner||' hat procdure '||procrec.object_name) ;
        EXECUTE IMMEDIATE 'ALTER PROCEDURE '||procrec.owner||'.'||procrec.object_name||' COMPILE' ;
    END LOOP 
    ;
END 
;
/
execute del_row_proc('copy','EMPLOYEES','HR');
/

CREATE OR REPLACE FUNCTION del_rows
(p_table_name VARCHAR2
,p_owner VARCHAR2 :=user)
RETURN NUMBER IS
BEGIN
EXECUTE IMMEDIATE 'DELETE FROM '|| p_owner||'.'||p_table_name;
RETURN SQL%ROWCOUNT;
END;
/ 

--########################################################################
create or replace PROCEDURE proc_get_emp(
    p_dept_id employees.department_id%type 
    ) 
    is cursor c_emp 
        is select * from employees where department_id = p_dept_id;
    v_emprec employees%rowtype;
    BEGIN 
        FOR emp_rec IN c_emp LOOP 
            v_emprec :=get_emp(emp_rec.employee_id) ;
            DBMS_OUTPUT.PUT_LINE('Emp: '|| v_emprec.last_name);
        END LOOP ;
    end;
/
--########################################################################
set SERVEROUTPUT ON;
EXECUTE proc_get_emp(20);

select to_char(sysdate, 'HH24:MM') from dual;
