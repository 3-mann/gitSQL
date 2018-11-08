--The SQL Script to run the solution for Practice 9
--Run cleanup_09.sql script from /home/oracle/labs/plpu/code_ex/cleanup_scripts directory before executing the solutions.
--Uncomment code below to run the solution for Task 1_a of Practice 9
/*

CREATE OR REPLACE PROCEDURE check_salary (p_the_job VARCHAR2, p_the_salary NUMBER) IS
  v_minsal jobs.min_salary%type;
  v_maxsal jobs.max_salary%type;
BEGIN
  SELECT min_salary, max_salary INTO v_minsal, v_maxsal
  FROM jobs
  WHERE job_id = UPPER(p_the_job);
  IF p_the_salary NOT BETWEEN v_minsal AND v_maxsal THEN
    RAISE_APPLICATION_ERROR(-20100, 
      'Invalid salary $' ||p_the_salary ||'. '||
      'Salaries for job '|| p_the_job || 
      ' must be between $'|| v_minsal ||' and $' || v_maxsal);
  END IF;
END;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 1_b of Practice 9
/*

CREATE OR REPLACE TRIGGER check_salary_trg 
BEFORE INSERT OR UPDATE OF job_id, salary 
ON employees
FOR EACH ROW
BEGIN
  check_salary(:new.job_id, :new.salary);
END;
/
SHOW ERRORS
*/

--Uncomment code below to run the solution for Task 2_a of Practice 9

/*

EXECUTE emp_pkg.add_employee('Eleanor', 'Beh', 30)

*/

--Uncomment code below to run the solution for Task 2_b of Practice 9
/*

UPDATE employees
  SET salary = 2000
WHERE employee_id = 115;

UPDATE employees
  SET job_id = 'HR_REP'
WHERE employee_id = 115;

*/

--Uncomment code below to run the solution for Task 2_c of Practice 9
/*

UPDATE employees
  SET salary = 2800
WHERE employee_id = 115;
*/

--Uncomment code below to run the solution for Task 3_a of Practice 9
/*

CREATE OR REPLACE TRIGGER check_salary_trg 
BEFORE INSERT OR UPDATE OF job_id, salary 
ON employees FOR EACH ROW
WHEN (new.job_id <> NVL(old.job_id,'?') OR
      new.salary <> NVL(old.salary,0))
BEGIN
  check_salary(:new.job_id, :new.salary);
END;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 3_b of Practice 9
/*

BEGIN
  emp_pkg.add_employee('Eleanor', 'Beh', 'EBEH', p_job => 'IT_PROG', p_sal => 5000);
END;
/

*/

--Uncomment code below to run the solution for Task 3_c of Practice 9
/*

UPDATE employees
  SET salary = salary + 2000
WHERE job_id = 'IT_PROG';
*/

--Uncomment code below to run the solution for Task 3_d of Practice 9

/*

UPDATE employees
  SET salary = 9000
WHERE employee_id = (SELECT employee_id
                     FROM employees
                     WHERE last_name = 'Beh');
*/

--Uncomment code below to run the solution for Task 3_e of Practice 9

/*

UPDATE employees
  set job_id = 'ST_MAN'
WHERE employee_id = (SELECT employee_id 
                     FROM employees 
                     WHERE last_name = 'Beh');
*/

--Uncomment code below to run the solution for Task 4_a of Practice 9

/*

CREATE OR REPLACE TRIGGER delete_emp_trg
BEFORE DELETE ON employees
DECLARE
  the_day VARCHAR2(3) := TO_CHAR(SYSDATE, 'DY');
  the_hour PLS_INTEGER := TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'));
BEGIN
   IF (the_hour BETWEEN 9 AND 18) AND (the_day NOT IN ('SAT','SUN')) THEN
     RAISE_APPLICATION_ERROR(-20150, 
      'Employee records cannot be deleted during the business 
       hours of 9AM and 6PM');
   END IF;
END;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 4_b of Practice 9

/*

DELETE FROM employees
WHERE job_id = 'SA_REP'
  AND   department_id IS NULL;

*/
