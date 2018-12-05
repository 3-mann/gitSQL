SET SERVEROUTPUT ON
DECLARE
v_sum NUMBER  ;
BEGIN 
SELECT SUM(salary) INTO v_sum 
FROM employees ;
DBMS_OUTPUT.PUT_LINE(v_sum) ;
END ;
/
SELECT department_id, SUM(salary) FROM employees 
GROUP BY department_id ;

DECLARE 
v_salary employees.salary%TYPE :=24000 ;
v_employee_id employees.employee_id%TYPE :=100 ;
BEGIN
UPDATE employees SET salary=v_salary WHERE employee_id=v_employee_id ;
END ;
/
commit ;
@c:\sql\login ;
/
SELECT * FROM emp2 ;
SELECT * FROM employees ;

BEGIN
MERGE INTO emp2 z USING (SELECT * FROM employees ) e
ON (z.employee_id=e.employee_id )

 WHEN MATCHED THEN UPDATE SET 
    z.salary=e.salary 
   -- DELETE WHERE department_id=20 ;
WHEN NOT MATCHED THEN INSERT (z.employee_id, z.last_name, z.first_name,z.email,z.phone_number, z.hire_date,
z.job_id, z.salary, z.manager_id, z.department_id) 
VALUES (e.employee_id, e.last_name, e.first_name, e.email, e.phone_number, e.hire_date,
e.job_id, e.salary, e.manager_id, e.department_id)  
WHERE e.department_id=20 ; 
END ;
/
rollback ;

DECLARE
v_rows_deleted VARCHAR2(30) ;
v_zahl NUMBER ;
v_emp  employees%ROWTYPE ;
BEGIN
DELETE FROM emp2 WHERE department_id=20 ;
--v_zahl :=SQL%ROWCOUNT ;
--v_rows_deleted :=v_zahl ||' Zeilen wurden geloescht' ;
--DBMS_OUTPUT.PUT_LINE (v_rows_deleted) ;
SELECT * INTO v_emp FROM employees where employee_id=176 ;
v_zahl :=SQL%ROWCOUNT ;
v_rows_deleted :=SQL%ROWCOUNT  ||' Zeilen wurden geloescht' ;
DBMS_OUTPUT.PUT_LINE (v_rows_deleted) ;
END ;
/


SELECT * FROM emp2 WHERE department_id=20 ;
commit ;

SELECT COUNT(*) FROM locations ;
