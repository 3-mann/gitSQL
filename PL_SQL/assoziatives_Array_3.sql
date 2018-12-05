SET SERVEROUTPUT ON
DECLARE 
  TYPE dept_table_type IS TABLE OF  
       departments%ROWTYPE INDEX BY PLS_INTEGER; 
  v_dept_table dept_table_type; 
  -- Each element of dept_table is a record  
Begin 
  SELECT * INTO v_dept_table(1) FROM departments 
    WHERE department_id = 10; 
  DBMS_OUTPUT.PUT_LINE(v_dept_table(1).department_id ||' '|| 
   v_dept_table(1).department_name ||' ' || 
   v_dept_table(1).manager_id); 
END; 
/ 

SELECT * FROM employees ;

DECLARE 
   TYPE emp_table_type IS TABLE OF 
      employees%ROWTYPE INDEX BY PLS_INTEGER; 
   my_emp_table  emp_table_type; 
   max_count         NUMBER(3):= 104;  
BEGIN 
  FOR i IN 100..max_count 
  LOOP 
   SELECT * INTO my_emp_table(i) FROM employees 
   WHERE employee_id = i; 
  END LOOP; 
  FOR i IN my_emp_table.FIRST..my_emp_table.LAST  
  LOOP 
     DBMS_OUTPUT.PUT_LINE(my_emp_table(i).last_name); 
  END LOOP; 
END;  
/ 

DECLARE
  TYPE pltab_typ is TABLE OF VARCHAR2(20) 
    INDEX BY PLS_INTEGER;
  dem_tab pltab_typ;
BEGIN
  dem_tab(9) := 'NINE';
  dem_tab(4) := 'FOUR';
  dem_tab(6) := 'SIX';
  dem_tab(14) := 'FOURTEEN';
  dem_tab(100) := 'HUNDRED';
  FOR i IN dem_tab.FIRST..dem_tab.LAST LOOP
    IF  dem_tab.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE('achte auf die reihenfolge: '||dem_tab(i));
    END IF;
  END LOOP;
END;
/


  



SET SERVEROUTPUT ON
DECLARE 
   TYPE emp_table_type IS TABLE OF 
      employees%ROWTYPE INDEX BY PLS_INTEGER; 
   my_emp_table  emp_table_type; 
   --max_count         NUMBER(3):= 104; 
   v_min_empno employees.employee_id%TYPE;
  v_max_empno employees.employee_id%TYPE;
  v_klaus employees%ROWTYPE ;
  v_zahl NUMBER ;
  v_first NUMBER ;
  v_last NUMBER ;
BEGIN 
SELECT MIN(employee_id), MAX(employee_id) INTO v_min_empno, v_max_empno FROM employees
WHERE employee_id <104 ;
  FOR i IN v_min_empno..v_max_empno LOOP 
  
   SELECT * INTO my_emp_table(i) FROM employees 
   WHERE employee_id = i; 
  END LOOP; 
  v_zahl :=my_emp_table.COUNT ;
  v_first:= my_emp_table.FIRST ;
  v_last :=my_emp_table.LAST ;
  DBMS_OUTPUT.PUT_LINE(v_zahl||' '||v_first||' '||v_last) ;
  SELECT * INTO v_klaus FROM employees WHERE employee_id=201 ; 
  v_klaus.first_name :='Klaus' ;
  my_emp_table(110) :=v_klaus ;
  v_zahl :=my_emp_table.COUNT ;
  v_first:= my_emp_table.FIRST ;
  v_last :=my_emp_table.LAST ;
  DBMS_OUTPUT.PUT_LINE(v_zahl||' '||v_first||' '||v_last) ;
  DBMS_OUTPUT.PUT_LINE(my_emp_table(v_last).last_name) ;
  --UPDATE employees  SET ROW=my_emp_table(110) WHERE employee_id=110 ;
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
/ 
rollback ;
SELECT * FROM employees --WHERE employee_id < 111 ;