SET VERIFY OFF

@C:\app\gitSQL\PL_SQL\login;

DECLARE
    v_employee_number number:= 100;
    v_emp_rec   retired_emps%ROWTYPE;
    v_min_empno employee.employee_id%ROWTYPE;
    v_max_empno employee.employee_id%ROWTYPE;
BEGIN
    FOR i in 100..206
    SELECT * INTO v_emp_rec FROM retired_emps;
        v_emp_rec.leavedate:=CURRENT_DATE;
    UPDATE  retired_emps SET ROW = v_emp_rec 
    WHERE   empno=i;
    end loop;
END;
rollback;
SELECT * FROM retired_emps;

--#######################################################################
DECLARE
    v_ret_rec   retired_emps%ROWTYPE;
    v_emp_rec   emlpoyees%ROWTYPE;
    v_min_empno employee.employee_id%ROWTYPE := 100;
    v_max_empno employee.employee_id%ROWTYPE := 206;
BEGIN
    for i in v_min_empno..v_max_empno
        MERGE INTO v_emp_rec FROM retired_emps;
        v_emp_rec.leavedate:=CURRENT_DATE;
        ON (empno=i)
            WHEN MATCHED THEN UPDATE SET 
            ... 
           -- DELETE WHERE department_id=20 ;
        WHEN NOT MATCHED THEN INSERT  ...
        WHERE ... ; 
    end loop;
END ;

--#######################################################################

DECLARE 
  v_employee_number number:= 124; 
  v_emp_rec retired_emps%ROWTYPE; 
  v_min_empno employees.employee_id%TYPE;
  v_max_empno employees.employee_id%TYPE;
BEGIN 
SELECT MIN(employee_id)+10, MAX(employee_id) INTO v_min_empno, v_max_empno FROM employees ;
FOR i IN v_min_empno..v_max_empno LOOP
 SELECT * INTO v_emp_rec FROM retired_emps WHERE empno=i ; 
 v_emp_rec.leavedate:=CURRENT_DATE; 
 UPDATE retired_emps SET ROW = v_emp_rec 
 WHERE  empno=i ; 
  END LOOP ;
END; 


--#######################################################################

SET SERVEROUTPUT ON

DECLARE 
    TYPE emp_table_type IS TABLE OF 
        employees%ROWTYPE INDEX BY PLS_INTEGER; 
    my_emp_table  emp_table_type; 
    v_min_empno employees.employee_id%TYPE;
    v_max_empno employees.employee_id%TYPE;
    v_temp_rec employees%ROWTYPE ;
BEGIN 
SELECT * INTO v_temp_rec   FROM employees ; 
    if v_temp_rec 
        v_temp_rec.first_name :='Klaus' ;
        my_emp_table(i) :=v_temp_rec ;
    FOR i IN my_emp_table.FIRST..my_emp_table.LAST  LOOP 
    IF my_emp_table.EXISTS(i) THEN
    DBMS_OUTPUT.PUT_LINE(my_emp_table(i).last_name||' '||my_emp_table(i).first_name); 
    IF i BETWEEN 100 AND 104 THEN
    UPDATE employees  SET ROW=my_emp_table(i) WHERE employee_id=i ;
    ELSE 
    UPDATE employees  SET ROW=my_emp_table(i) WHERE employee_id=201 ;
    END IF  ;
    END IF ;
    END LOOP; 
END;  

--#######################################################################


