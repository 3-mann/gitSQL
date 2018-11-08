--This is the SQL Script to run the code_examples for Lesson 9

--Uncomment the code below to execute the code on slide 15_sa 
/*

INSERT INTO departments 
   (department_id,department_name, location_id)
VALUES (400, 'CONSULTING', 2400);

*/

--Uncomment the code below to execute the code on slide 16_sa 
/*

UPDATE employees
  SET salary = salary * 1.1
  WHERE department_id = 30;


*/

--Uncomment the code below to execute the code on slide 17_sa 
/*

CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON employees
BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
     (TO_CHAR(SYSDATE,'HH24:MI') NOT BETWEEN '08:00' AND '18:00') THEN
  RAISE_APPLICATION_ERROR(-20500,
    'You may insert into EMPLOYEES table only during normal business hours.');
  END IF;
END;
/

*/

--Uncomment the code below to execute the code on slide 18_sa 
/*

-- Run the code under slide 17_sa before running this code example. 

INSERT INTO employees (employee_id, last_name, first_name, email, hire_date, job_id, salary, department_id)
VALUES (300, 'Smith', 'Rob', 'RSMITH', SYSDATE,'IT_PROG', 4500, 60);

*/

--Uncomment the code below to execute the code on slide 19_sa 
/*

CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN')) OR
    (TO_CHAR(SYSDATE,'HH24') NOT BETWEEN '08' AND '18') THEN
   IF DELETING THEN
     RAISE_APPLICATION_ERROR(-20502,
       'You may delete from EMPLOYEES table only during normal business hours.');
   ELSIF INSERTING THEN
     RAISE_APPLICATION_ERROR(-20500,
       'You may insert into EMPLOYEES table only during normal business hours.');
   ELSIF UPDATING('SALARY') THEN
     RAISE_APPLICATION_ERROR(-20503,
       'You may update SALARY only during normal business hours.');
   ELSE
     RAISE_APPLICATION_ERROR(-20504,
       'You may update EMPLOYEES table only during normal business hours.');
   END IF;
 END IF;
END;
/


*/


--Uncomment the code below to execute the code on slide 20_sa 
/*

REM Make sure that both secure_emp and secure_employees triggers are disabled as follows:

ALTER TRIGGER secure_emp DISABLE
/
ALTER TRIGGER secure_employees DISABLE
/
CREATE OR REPLACE TRIGGER restrict_salary
BEFORE INSERT OR UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
  IF NOT (:NEW.job_id IN ('AD_PRES', 'AD_VP'))
     AND :NEW.salary > 15000 THEN
    RAISE_APPLICATION_ERROR (-20202,
      'Employee cannot earn more than $15,000.');
  END IF;
END;
/

*/

--Uncomment the code below to execute the code on slide 20_sb 
/*

-- Run after codeunder slide 20_sa

UPDATE employees
SET salary = 15500
WHERE last_name = 'Russell';

*/

--Uncomment the code below to execute the code on slide 22_sa 
/*

DROP TABLE audit_emp
/
CREATE TABLE audit_emp (
  user_name     VARCHAR2(30),
  time_stamp    date,
  id            NUMBER(6),
  old_last_name VARCHAR2(25),
  new_last_name VARCHAR2(25),
  old_title     VARCHAR2(10),
  new_title     VARCHAR2(10),
  old_salary    NUMBER(8,2),
  new_salary    NUMBER(8,2)
)
/
CREATE OR REPLACE TRIGGER audit_emp_values
AFTER DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO audit_emp(user_name, time_stamp, id,
    old_last_name, new_last_name, old_title,
    new_title, old_salary, new_salary)
  VALUES (USER, SYSDATE, :OLD.employee_id,
    :OLD.last_name, :NEW.last_name, :OLD.job_id,
    :NEW.job_id, :OLD.salary, :NEW.salary);
END;


*/


--Uncomment the code below to execute the code on slide 23_sb 
/*

-- Run the code under slide 22_sa before running this code example. 

INSERT INTO employees (employee_id, last_name, job_id, salary, email, hire_date)
VALUES (999, 'Temp emp', 'SA_REP', 6000, 'TEMPEMP', TRUNC(SYSDATE))
/
UPDATE employees
 SET salary = 7000, last_name = 'Smith'
 WHERE employee_id = 999
/
SELECT  *
FROM  audit_emp;    

*/

--Uncomment the code below to execute the code on slide 24_sa 
/*

CREATE OR REPLACE TRIGGER derive_commission_pct
BEFORE INSERT OR UPDATE OF salary ON employees
FOR EACH ROW
WHEN (NEW.job_id = 'SA_REP')
BEGIN
 IF INSERTING THEN
   :NEW.commission_pct := 0;
 ELSIF :OLD.commission_pct IS NULL THEN
   :NEW.commission_pct := 0;
 ELSE 
   :NEW.commission_pct := :OLD.commission_pct+0.05;
 END IF;
END;
/

*/

--Uncomment the code below to execute the code on slide 26_sa 
/*

UPDATE employees SET department_id = 999 
 WHERE employee_id = 170;
 
 */
 
 
--Uncomment the code below to execute the code on slide 26_sb 
/*

CREATE OR REPLACE TRIGGER employee_dept_fk_trg
AFTER UPDATE OF department_id
ON employees FOR EACH ROW
BEGIN
 INSERT INTO departments VALUES(:new.department_id,
     'Dept '||:new.department_id, NULL, NULL);
EXCEPTION
   WHEN DUP_VAL_ON_INDEX THEN
    NULL; -- mask exception if department exists
END;
/
*/

--Uncomment the code below to execute the code on slide 26_sc 
/*

-- Run the code under slide 26_sb before this code example. 

UPDATE employees
  SET department_id = 999 
WHERE employee_id = 170;

*/

--Uncomment the code below to execute the code on slide 28_sa 
/*

REM
REM **** NOTE ****
REM PLEASE EXECUTE THIS SCRIPT ONLY AFTER CREATING THE emp_details VIEW.
REM The view is and its related tables is created when you
REM execute the following:
REM
REM 1) Code under slide 29_sa (FIRST) and then,
REM 2) Code under slide 30_na (next)
REM 
REM **** NOTE ****
REM

INSERT INTO emp_details
VALUES (9001,'ABBOTT',3000, 10, 'Administration');

REM
REM Uncomment the following SELECT statements to check the results
REM
--SELECT * FROM new_depts where department_id = 10;
--SELECT * FROM new_emps where department_id= 10;

*/



--Uncomment the code below to execute the code on slide 29_sa 
/*

-- Run this code example before you run code under slide 28_sa 

CREATE TABLE new_emps AS
 SELECT employee_id,last_name,salary,department_id FROM employees;

CREATE TABLE new_depts AS
 SELECT d.department_id,d.department_name,
        sum(e.salary) dept_sal FROM employees e, departments d
 WHERE e.department_id = d.department_id
 GROUP BY d.department_id,d.department_name;

CREATE VIEW emp_details AS
 SELECT e.employee_id, e.last_name, e.salary,
        e.department_id, d.department_name
 FROM employees e, departments d
 WHERE e.department_id = d.department_id;

*/
--Uncomment the code below to execute the code on slide 30_na 
/*

-- Run the code under slide 29_sa before running this code example. 

CREATE OR REPLACE TRIGGER new_emp_dept
INSTEAD OF INSERT OR UPDATE OR DELETE ON emp_details
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO new_emps 
    VALUES (:NEW.employee_id, :NEW.last_name, :NEW.salary, 	        :NEW.department_id);
    UPDATE new_depts
      SET dept_sal = dept_sal + :NEW.salary
      WHERE department_id = :NEW.department_id;
  ELSIF DELETING THEN 
    DELETE FROM new_emps 
      WHERE employee_id = :OLD.employee_id;
    UPDATE new_depts
      SET dept_sal = dept_sal - :OLD.salary
      WHERE department_id = :OLD.department_id;
  ELSIF UPDATING ('salary') THEN
    UPDATE new_emps
      SET salary = :NEW.salary
      WHERE employee_id = :OLD.employee_id;
    UPDATE new_depts
      SET dept_sal = dept_sal + (:NEW.salary - :OLD.salary)
      WHERE department_id = :OLD.department_id;
  ELSIF UPDATING ('department_id') THEN
    UPDATE new_emps
      SET department_id = :NEW.department_id
      WHERE employee_id = :OLD.employee_id;
    UPDATE new_depts
      SET dept_sal = dept_sal - :OLD.salary
      WHERE department_id = :OLD.department_id;
    UPDATE new_depts
      SET dept_sal = dept_sal + :NEW.salary
      WHERE department_id = :NEW.department_id;
  END IF;
END;
/


*/

--Uncomment the code below to execute the code on slide 37_sa 
/*

DESCRIBE user_triggers

*/

--Uncomment the code below to execute the code on slide 37_sb 
/*

-- Run the code under slide 20_sa before running this code example. 

SELECT trigger_type, trigger_body
FROM user_triggers
WHERE trigger_name = 'SECURE_EMP';

*/

