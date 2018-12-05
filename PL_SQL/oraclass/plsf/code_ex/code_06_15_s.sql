SET VERIFY OFF

DROP TABLE retired_emps;
BEGIN
CREATE TABLE retired_emps
   (EMPNO       employees.employee_id%type
    ,NAME       employees.last_name%type
    ,JOB        employees.job_id%type
    ,MGR        employees.manager_id%type
    ,HIREDATE   DATE,
    ,LEAVEDATE  DATE,
    ,SAL        employees.salary%type
    ,COMM       employees.commission_pct%type
    ,DEPTNO     employees.department_id%type
    )
END;



DECLARE
    v_employee_number number:= 100;
    v_emp_rec   retired_emps%ROWTYPE;
    V_min_empno employees.employee_id%TYPE;
    v_max_empno employees.employee_id%TYPE;
BEGIN
    SELECT MIN(employee_id), MAX(employee_id) 
        INTO v_min_empno, v_max_empno FROM employees ;
    FOR i IN v_min_empno..v_max_empno LOOP
        SELECT 
            SUBSTR(employee_id,1,4) 
            ,SUBSTR(last_name,1,10) 
            ,SUBSTR(job_id,1,9) 
            ,SUBSTR(manager_id,1,4)
            ,hire_date, hire_date
            ,salary/10 
            ,commission_pct 
            ,department_id/10
        INTO v_emp_rec FROM employees
            WHERE  employee_id = i;
        INSERT INTO retired_emps  VALUES v_emp_rec;
    END LOOP ;
END;

--########################################################################

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

--########################################################################
DECLARE 
   TYPE emp_table_type IS TABLE OF 
      employees%ROWTYPE INDEX BY PLS_INTEGER; 
   my_emp_table  emp_table_type; 
   max_count         NUMBER(3):= 104;  
BEGIN 
  FOR i IN (select distinct(employee_id) from employees) LOOP
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




