SET SERVEROUTPUT ON

DECLARE
    TYPE depaertments_idz_type IS TABLE OF NUMBER;
        a_departments_idz depaertments_idz_type;
    TYPE departents_rows_type IS TABLE OF departments%ROWTYPE INDEX BY PLS_INTEGER; 
        a_departments_rows departents_rows_type;
    TYPE result_type IS TABLE OF VARCHAR2(800);
        a_result result_type;
    v_did departments.department_id%TYPE;
    v_dname departments.department_name%TYPE;
BEGIN
    SELECT DISTINCT department_id BULK COLLECT 
        INTO a_departments_idz FROM departments;
    FOR i IN 1..a_departments_idz.COUNT() LOOP 
        SELECT * INTO a_departments_rows(a_departments_idz(i)) FROM departments WHERE department_id = a_departments_idz(i);
        v_did := a_departments_idz(i);
        v_dname := a_departments_rows(v_did).department_name;
        DBMS_OUTPUT.PUT_LINE(v_did||' '||v_dname);
        --SELECT LISTAGG(employee_id, ', ') WITHIN GROUP(ORDER BY employee_id) INTO a_result(v_dname) FROM employees WHERE department_id = v_did;
        --a_result(a_departments_rows(a_departments_idz(i)).department_name) := 5;
        --a_result(a_departments_rows(a_departments_idz(i)).department_name).a_employees(2) := 'sasha';
    END LOOP;
END;

--####################################################################################

DECLARE
    TYPE employee_content_type IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
    TYPE employee_type IS TABLE OF employee_content_type INDEX BY PLS_INTEGER;
    TYPE department_type IS RECORD (title VARCHAR2(50), a_employees employee_type);
    TYPE departments_type IS TABLE OF department_type INDEX BY PLS_INTEGER;
    a_departments departments_type;
BEGIN
a_departments(1).title := 'IT';
a_departments(1).a_employees(1)(2) := 'Sasha';
a_departments(1).a_employees(1)(1) := '456';
a_departments(1).a_employees(1)(3) := 'Mutin';
a_departments(1).a_employees(2)(2) := 'Lena';
a_departments(1).a_employees(2)(1) := '112';
a_departments(1).a_employees(2)(3) := 'Zuzina';
a_departments(2).title := 'Administration';
a_departments(2).a_employees(1)(2) := 'Masha';
a_departments(2).a_employees(1)(3) := 'Putina';
a_departments(2).a_employees(1)(1) := '123';
a_departments(2).a_employees(2)(2) := 'Petja';
a_departments(2).a_employees(2)(3) := 'Kozin';
a_departments(2).a_employees(2)(1) := '777';
a_departments(3).title := 'Buchhaltung';
a_departments(3).a_employees(1)(2) := 'Masha';
a_departments(3).a_employees(1)(3) := 'Putina';
a_departments(3).a_employees(1)(1) := '789';
a_departments(3).a_employees(2)(2) := 'Pasha';
a_departments(3).a_employees(2)(3) := 'Lutina';
a_departments(3).a_employees(2)(1) := '246';
a_departments(3).a_employees(3)(2) := 'Lesha';
a_departments(3).a_employees(3)(3) := 'Tulev';
a_departments(3).a_employees(3)(1) := '468';
FOR departments_i IN a_departments.first..a_departments.last LOOP
    dbms_output.put_line('DEPARTMENT '||departments_i||': '|| a_departments(departments_i).title) ;
    FOR employees_i IN a_departments(departments_i).First..a_departments(departments_i).Last LOOP
        --dbms_output.put_line('DEPARTMENT('|| departments_i ||') --- '|| employees_i ) ;
        FOR content_i IN a_departments(departments_i).a_employees(employees_i).First..
            a_departments(departments_i).a_employees(employees_i).Last LOOP
            dbms_output.put_line('DEPARTMENT('|| departments_i ||') --- '|| content_i ||' '|| 
            a_departments(departments_i).a_employees(employees_i)(content_i) ) ;
        END LOOP;
    END LOOP;
END LOOP;
END;

--######### Loop mit Record Type ######################################################

SET SERVEROUTPUT ON ;
DECLARE 
    TYPE emp_dept_type IS RECORD 
    ( v_lastname employees.last_name%TYPE
    , v_salary employees.salary%TYPE
    , v_department_name departments.department_name%TYPE
    )   ;
    v_rec    emp_dept_type ;
    v_a     NUMBER ;
BEGIN 
    FOR i IN 100..104 LOOP 
        SELECT employees.last_name, employees.salary, departments.department_name 
        INTO v_rec 
        FROM employees , departments 
        WHERE employees.department_id=departments.department_id 
        AND employees.employee_id=i; 
        dbms_output.put_line( v_rec.v_lastname );
    END LOOP ;
END;

--######### Loop mit Assoziative Array ###############################################
SET SERVEROUTPUT ON;
DECLARE
    TYPE emp_dept_type IS RECORD 
        ( v_lastname employees.last_name%TYPE
        , v_salary employees.salary%TYPE
        , v_department_name departments.department_name%TYPE
        )   ;
    v_rec    emp_dept_type ;
    TYPE emp_dept_aa IS TABLE OF emp_dept_type INDEX BY PLS_INTEGER;
    v_emp_dept          emp_dept_aa;
    v_zahl              NUMBER(10);
BEGIN 
--AssoArray- Schleife :
    FOR i IN 100..200 LOOP
        SELECT e.last_name , e.salary , d.department_name
          INTO v_emp_dept(i).v_lastname , v_emp_dept(i).v_salary , v_emp_dept(i).v_department_name
          FROM employees e  , departments d
         WHERE e.department_id   = d.department_id
               AND e.employee_id  = i;
    END LOOP;
    FOR k IN 100..200 LOOP
        dbms_output.put_line(v_emp_dept(k).v_lastname || ' `s Nachfolger verdient ' || v_emp_dept(k + 1).v_salary);
        IF v_emp_dept.EXISTS(k+1) then
            v_zahl   := v_emp_dept(k + 1).v_salary + v_emp_dept(k).v_salary;
        end if;
        DBMS_OUTPUT.PUT_LINE('Summe Selbst + Nachfolger = ' || v_zahl) ;
    END LOOP;
END;
--####################################################################################

DECLARE 
    TYPE dept_table_type IS TABLE OF departments%ROWTYPE 
    INDEX BY PLS_INTEGER ;
    v_dept_table   dept_table_type ;
    v_max_deptno   departments.department_id%TYPE ;
BEGIN 
    SELECT MAX(department_id)/10  INTO v_max_deptno 
    FROM departments ;
    FOR i IN 1..v_max_deptno LOOP
        SELECT * INTO v_dept_table(i) 
        FROM departments 
        WHERE department_id=i*10 ;
        DBMS_OUTPUT.PUT_LINE(v_dept_table(i).department_name
            ||' '||i*10||' '
            || v_dept_table(i).location_id );
    END LOOP ;
END ;

--####################################################################################
