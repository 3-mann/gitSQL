--This is the SQL Script to run the code_examples for Lesson 10

--Uncomment the code below to execute the code on slide 11_sa 

/*

-- Mutating Table Example.

CREATE OR REPLACE TRIGGER check_salary
  BEFORE INSERT OR UPDATE OF salary, job_id 
  ON employees
  FOR EACH ROW
  WHEN (NEW.job_id <> 'AD_PRES')
DECLARE
  v_minsalary employees.salary%TYPE;
  v_maxsalary employees.salary%TYPE;
BEGIN
  SELECT MIN(salary), MAX(salary)
   INTO	v_minsalary, v_maxsalary
   FROM	employees
   WHERE job_id = :NEW.job_id;
  IF :NEW.salary < v_minsalary OR
     :NEW.salary > v_maxsalary THEN
     RAISE_APPLICATION_ERROR(-20505,'Out of range');
  END IF; 			
END;
/

*/

--Uncomment the code below to execute the code on slide 12_sa 
/*

-- Run the code under slide 11_sa before running this code example. 

UPDATE employees
SET salary = 3400
WHERE last_name = 'Stiles';

*/

--Uncomment the code below to execute the code on slide 13-14_sa 
/*

CREATE OR REPLACE TRIGGER check_salary
  FOR INSERT OR UPDATE OF salary, job_id
  ON employees
  WHEN (NEW.job_id <> 'AD_PRES')
  COMPOUND TRIGGER

  TYPE salaries_t            IS TABLE OF employees.salary%TYPE;
  min_salaries               salaries_t;
  max_salaries               salaries_t;

  TYPE department_ids_t       IS TABLE OF employees.department_id%TYPE;
  department_ids              department_ids_t;

  TYPE department_salaries_t  IS TABLE OF employees.salary%TYPE
                                INDEX BY VARCHAR2(80);
  department_min_salaries     department_salaries_t;
  department_max_salaries     department_salaries_t;

  BEFORE STATEMENT IS
  BEGIN
  SELECT MIN(salary), MAX(salary), NVL(department_id, -1)
      BULK COLLECT INTO  min_Salaries, max_salaries, department_ids
   FROM    employees
   GROUP BY department_id;

   FOR j IN 1..department_ids.COUNT() LOOP
    department_min_salaries(department_ids(j)) := min_salaries(j);
    department_max_salaries(department_ids(j)) := max_salaries(j);
   END LOOP;
  END BEFORE STATEMENT;

  AFTER EACH ROW IS
  BEGIN
  IF :NEW.salary < department_min_salaries(:NEW.department_id)
     OR :NEW.salary > department_max_salaries(:NEW.department_id) THEN
    RAISE_APPLICATION_ERROR(-20505,'New Salary is out of acceptable range');
  END IF;
  END AFTER EACH ROW;

END check_salary;
/

*/

--Uncomment the code below to execute the code on slide 14_na 
/*

UPDATE employees
SET salary = 3400
WHERE last_name = 'Stiles';

*/

--Uncomment the code below to execute the code on slide 14_nb 
/*

SELECT employee_id, first_name, last_name, job_id, department_id, salary
FROM employees
WHERE last_name = 'Stiles';

*/

--Uncomment the code below to execute the code on slide 18_sa 
/*

-- Run the code under slide 18_na before this code example. 

CREATE OR REPLACE TRIGGER logon_trig
AFTER LOGON  ON  SCHEMA
BEGIN
 INSERT INTO log_trig_table(user_id,log_date,action)
 VALUES (USER, SYSDATE, 'Logging on');
END;
/

*/
--Uncomment the code below to execute the code on slide 18_sb 
/*

-- Run the code under slide 18_na before this code example. 

CREATE OR REPLACE TRIGGER logoff_trig
BEFORE LOGOFF  ON  SCHEMA
BEGIN
 INSERT INTO log_trig_table(user_id,log_date,action)
 VALUES (USER, SYSDATE, 'Logging off');
END;
/

*/
--Uncomment the code below to execute the code on slide 18_na 
/*

-- Run this code example before executing the code under slide 18_sa and code under slide 18_sb

CREATE TABLE log_trig_table(
  user_id  VARCHAR2(30),
  log_date DATE,
   action  VARCHAR2(40))
/

*/


--Uncomment the code below to execute the code on slide 19_sa 
/*

CREATE OR REPLACE PROCEDURE log_execution IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('log_exection: Employee Inserted');
END;
/
CREATE OR REPLACE TRIGGER log_employee
BEFORE INSERT ON EMPLOYEES
CALL log_execution
/

*/

--Uncomment the code below to execute the code on slide 19_na 
/*

CREATE OR REPLACE TRIGGER salary_check
BEFORE UPDATE OF salary, job_id ON employees
FOR EACH ROW
WHEN (NEW.job_id <> 'AD_PRES')
CALL check_salary(:NEW.job_id, :NEW.salary)

*/
