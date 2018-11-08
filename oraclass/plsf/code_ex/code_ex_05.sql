--This is the SQL Script to run the code_examples for Lesson 5

--Uncomment the code below to execute the code on slide 7_sa

/*
SET SERVEROUTPUT ON

DECLARE
  v_fname VARCHAR2(25);
BEGIN
  SELECT first_name INTO v_fname 
  FROM employees WHERE employee_id=200;
  DBMS_OUTPUT.PUT_LINE(' First Name is : '||v_fname);
END;
/
*/

--Uncomment the code below to execute the code on slide 9_sa

/*
SET SERVEROUTPUT ON

DECLARE
 v_emp_hiredate   employees.hire_date%TYPE;
 v_emp_salary     employees.salary%TYPE;  
BEGIN
  SELECT   hire_date, salary
  INTO     v_emp_hiredate, v_emp_salary
  FROM     employees
  WHERE    employee_id = 100;  
  DBMS_OUTPUT.PUT_LINE(' Hire date is : '||v_emp_hiredate);
  DBMS_OUTPUT.PUT_LINE(' Salary  is : '||v_emp_salary);
END;
/
*/

--Uncomment the code below to execute the code on slide 10_sa

/*
SET SERVEROUTPUT ON

DECLARE    
   v_sum_sal   NUMBER(10,2); 
   v_deptno      NUMBER NOT NULL := 60;           
BEGIN
   SELECT	SUM(salary)  -- group function
   INTO v_sum_sal  FROM	employees
   WHERE     department_id = v_deptno;
   DBMS_OUTPUT.PUT_LINE ('The sum of salary is ' || v_sum_sal);
END;
/
*/

--Uncomment the code below to execute the code on slide 11_sa

/*
DECLARE
  hire_date      employees.hire_date%TYPE;
  sysdate        hire_date%TYPE;
  employee_id    employees.employee_id%TYPE := 176;        
BEGIN
  SELECT 	hire_date, sysdate
  INTO   	hire_date, sysdate
  FROM   	employees
  WHERE  	employee_id = employee_id ;        
END;
/
*/

--Uncomment the code below to execute the code on slide 15_sa

/*
select count(*) from employees;
BEGIN
INSERT INTO employees
(employee_id, first_name, last_name, email,
hire_date, job_id, salary)
VALUES(employees_seq.NEXTVAL, 'Ruth', 'Cores',
'RCORES',CURRENT_DATE, 'AD_ASST', 4000);
END;
/
select count(*) from employees;

rollback;
/
*/

--Uncomment the code below to execute the code on slide 16_sa

/*
SELECT first_name, salary FROM employees WHERE job_id = 'ST_CLERK';
DECLARE
  sal_increase employees.salary%TYPE := 800;
BEGIN
   UPDATE employees SET salary = salary + sal_increase WHERE job_id = 'ST_CLERK';
END;
/
SELECT first_name, salary FROM employees WHERE job_id = 'ST_CLERK';
rollback;
/
*/

--Uncomment the code below to execute the code on slide 17_sa

/*
-- Because of the DEPT_MGR_FK constraint, you cannot delete the rows shown in the code example.
-- Create a copy of the employees table, employees2, to successfully delete the rows
-- Please ignore any warning message displayed in the output.
CREATE table employees2 as (select * from employees);

DECLARE
deptno employees2.department_id%TYPE := 10;
BEGIN
DELETE FROM employees2
WHERE department_id = deptno;
END;
/
*/

--Uncomment the code below to execute the code on slide 19_na

/*
DROP TABLE copy_emp;
CREATE TABLE copy_emp 
   (empno NUMBER(6,0), 
	FIRST_NAME VARCHAR2(20 BYTE), 
	LAST_NAME VARCHAR2(25 BYTE) , 
	EMAIL VARCHAR2(25 BYTE) , 
	PHONE_NUMBER VARCHAR2(20 BYTE), 
	HIRE_DATE DATE , 
	JOB_ID VARCHAR2(10 BYTE), 
	SALARY NUMBER(8,2), 
	COMMISSION_PCT NUMBER(2,2), 
	MANAGER_ID NUMBER(6,0), 
	DEPARTMENT_ID NUMBER(4,0));
  
BEGIN
MERGE INTO copy_emp c
USING employees e
ON (e.employee_id = c.empno)
WHEN MATCHED THEN
UPDATE SET
c.first_name = e.first_name,
c.last_name = e.last_name,
c.email = e.email,
c.phone_number = e.phone_number,
c.hire_date = e.hire_date,
c.job_id = e.job_id,
c.salary = e.salary,
c.commission_pct = e.commission_pct,
c.manager_id = e.manager_id,
c.department_id = e.department_id
WHEN NOT MATCHED THEN
INSERT VALUES(e.employee_id, e.first_name, e.last_name,
e.email, e.phone_number, e.hire_date, e.job_id,
e.salary, e.commission_pct, e.manager_id,
e.department_id);
END;
/
*/

--Uncomment the code below to execute the code on slide 24_sa

/*
-- Because of the JHIST_EMP_FK constraint, you cannot delete the rows shown in the code example.
-- Therefore, we are using copy of the employees table, employees2, to successfully delete the rows
-- (employees2 table is created using the code under slide 17_sa.sql of code_ex_04.sql)

SET SERVEROUTPUT ON

DECLARE
v_rows_deleted VARCHAR2(30);
v_empno employees2.employee_id%TYPE := 176;
BEGIN
DELETE FROM employees2
WHERE employee_id = v_empno;
v_rows_deleted := (SQL%ROWCOUNT ||
' row deleted.');
DBMS_OUTPUT.PUT_LINE (v_rows_deleted);
END;
/

--Execute the following code to drop the tables created earlier in this script.
DROP table employees2;
DROP table copy_emp;
*/





































