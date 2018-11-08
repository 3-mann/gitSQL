
--The SQL Script to run the solution for Additional Practice 1-2

--Uncomment code below to run the solution for Task 1 

/*

CREATE OR REPLACE PROCEDURE new_job(
  p_jobid  IN jobs.job_id%TYPE,
  p_title  IN jobs.job_title%TYPE,
  v_minsal IN jobs.min_salary%TYPE) IS
  v_maxsal  jobs.max_salary%TYPE := 2 * v_minsal;
BEGIN
  INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
  VALUES (p_jobid, p_title, v_minsal, v_maxsal);
  DBMS_OUTPUT.PUT_LINE ('New row added to JOBS table:');
  DBMS_OUTPUT.PUT_LINE (p_jobid || '  ' || p_title ||' '||
                        v_minsal || '  ' || v_maxsal);
END new_job;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2 
/*

SET SERVEROUTPUT ON

EXECUTE new_job ('SY_ANAL', 'System Analyst', 6000)

*/

--Uncomment code below to run the solution for Task 3 

/*

SELECT *
FROM   jobs
WHERE  job_id = 'SY_ANAL';
COMMIT;

*/

--The SQL Script to run the solution for Additional Practice 1-3

--Uncomment code below to run the solution for Task 1 

/*

CREATE OR REPLACE PROCEDURE add_job_hist(
  p_emp_id    IN employees.employee_id%TYPE,
  p_new_jobid IN jobs.job_id%TYPE) IS
BEGIN
  INSERT INTO job_history    
    SELECT employee_id, hire_date, SYSDATE, job_id, department_id
    FROM   employees
    WHERE  employee_id = p_emp_id;
  UPDATE employees
    SET  hire_date = SYSDATE,
         job_id = p_new_jobid,
         salary = (SELECT min_salary + 500
                    FROM   jobs
                    WHERE  job_id = p_new_jobid)
   WHERE employee_id = p_emp_id;
  DBMS_OUTPUT.PUT_LINE ('Added employee ' || p_emp_id ||
                        ' details to the JOB_HISTORY table');
  DBMS_OUTPUT.PUT_LINE ('Updated current job of employee ' ||
                        p_emp_id|| ' to '|| p_new_jobid);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR (-20001, 'Employee does not exist!');
END add_job_hist;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2

/*

ALTER TABLE employees DISABLE ALL TRIGGERS;
ALTER TABLE jobs DISABLE ALL TRIGGERS;
ALTER TABLE job_history DISABLE ALL TRIGGERS;

*/

--Uncomment code below to run the solution for Task 3

/*

SET SERVEROUTPUT ON

EXECUTE add_job_hist(106, 'SY_ANAL')

*/

--Uncomment code below to run the solution for Task 4

/*

SELECT *  FROM  job_history
WHERE  employee_id = 106;

SELECT job_id, salary FROM employees
WHERE  employee_id = 106;

COMMIT;

*/

--Uncomment code below to run the solution for Task 5

/*

ALTER TABLE employees ENABLE ALL TRIGGERS;
ALTER TABLE jobs ENABLE ALL TRIGGERS;
ALTER TABLE job_history ENABLE ALL TRIGGERS;

*/

--The SQL Script to run the solution for Additional Practice 1-4

--Uncomment code below to run the solution for Task 1 

/*

CREATE OR REPLACE PROCEDURE upd_jobsal(
  p_jobid       IN jobs.job_id%type,
  p_new_minsal  IN jobs.min_salary%type,
  p_new_maxsal  IN jobs.max_salary%type) IS
  v_dummy            PLS_INTEGER;
  e_resource_busy  EXCEPTION;
  e_sal_error        EXCEPTION;
  PRAGMA           EXCEPTION_INIT (e_resource_busy , -54);
BEGIN
  IF (p_new_maxsal < p_new_minsal) THEN
    RAISE e_sal_error;
  END IF;
  SELECT 1 INTO v_dummy
    FROM jobs
    WHERE job_id = p_jobid
    FOR UPDATE OF min_salary NOWAIT;
  UPDATE jobs
    SET min_salary =  p_new_minsal,
        max_salary =  p_new_maxsal
    WHERE job_id  = p_jobid;
EXCEPTION
  WHEN e_resource_busy THEN
    RAISE_APPLICATION_ERROR (-20001,
      'Job information is currently locked, try later.');
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'This job ID does not exist');
  WHEN e_sal_error THEN
    RAISE_APPLICATION_ERROR(-20001,
     'Data error: Max salary should be more than min salary');
END upd_jobsal;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2 

/*

SET SERVEROUTPUT ON

EXECUTE upd_jobsal('SY_ANAL', 7000, 140)

*/

--Uncomment code below to run the solution for Task 3

/*

ALTER TABLE employees DISABLE ALL TRIGGERS;
ALTER TABLE jobs DISABLE ALL TRIGGERS;

*/

--Uncomment code below to run the solution for Task 4

/* 

EXECUTE upd_jobsal('SY_ANAL', 7000, 14000)

*/

--Uncomment code below to run the solution for Task 5 
/*

SELECT *
FROM  jobs
WHERE job_id = 'SY_ANAL';

*/

--Uncomment code below to run the solution for Task 6 

/*

ALTER TABLE employees ENABLE ALL TRIGGERS;
ALTER TABLE jobs ENABLE ALL TRIGGERS;

*/

--The SQL Script to run the solution for Additional Practice 1-5

--Uncomment code below to run the solution for Task 1 

/* 

ALTER TRIGGER secure_employees DISABLE;

*/

--Uncomment code below to run the solution for Task 2 

/*

ALTER TABLE employees ADD (exceed_avgsal VARCHAR2(3) DEFAULT 'NO'
    CONSTRAINT employees_exceed_avgsal_ck
    CHECK (exceed_avgsal IN ('YES', 'NO')));

*/

--Uncomment code below to run the solution for Task 3 

/*

CREATE OR REPLACE PROCEDURE check_avgsal IS
  emp_exceed_avgsal_type employees.exceed_avgsal%type;
  CURSOR  c_emp_csr IS
    SELECT  employee_id, job_id, salary
    FROM employees
    FOR UPDATE;
  e_resource_busy  EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_resource_busy, -54);
  FUNCTION get_job_avgsal (jobid VARCHAR2) RETURN NUMBER IS
    avg_sal employees.salary%type;
  BEGIN
    SELECT (max_salary + min_salary)/2 INTO avg_sal
    FROM jobs
    WHERE job_id = jobid;
    RETURN avg_sal;
  END;

BEGIN  
  FOR emprec IN c_emp_csr
  LOOP
    emp_exceed_avgsal_type := 'NO';
    IF emprec.salary >= get_job_avgsal(emprec.job_id) THEN
      emp_exceed_avgsal_type := 'YES';
    END IF;
    UPDATE employees
      SET exceed_avgsal = emp_exceed_avgsal_type
      WHERE CURRENT OF c_emp_csr; 
  END LOOP; 
EXCEPTION
  WHEN e_resource_busy THEN
    ROLLBACK;
    RAISE_APPLICATION_ERROR (-20001, 'Record is busy, try later.'); 
END check_avgsal;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 4 

/*

EXECUTE check_avgsal

SELECT e.employee_id, e.job_id, (j.max_salary-j.min_salary/2) job_avgsal,
       e.salary, e.exceed_avgsal avg_exceeded
FROM   employees e, jobs j
WHERE  e.job_id = j.job_id
and e.exceed_avgsal = 'YES';

COMMIT;

*/

--The SQL Script to run the solution for Additional Practice 1-6

--Uncomment code below to run the solution for Task 1 

/*

CREATE OR REPLACE FUNCTION get_years_service(
  p_emp_empid_type IN employees.employee_id%TYPE) RETURN NUMBER IS
  CURSOR c_jobh_csr IS 
    SELECT MONTHS_BETWEEN(end_date, start_date)/12 v_years_in_job
    FROM   job_history
    WHERE  employee_id = p_emp_empid_type;
  v_years_service NUMBER(2) := 0;
  v_years_in_job  NUMBER(2) := 0;
BEGIN
  FOR jobh_rec IN c_jobh_csr
  LOOP
    EXIT WHEN c_jobh_csr%NOTFOUND;
    v_years_service := v_years_service + jobh_rec.v_years_in_job;
  END LOOP;
  SELECT MONTHS_BETWEEN(SYSDATE, hire_date)/12 INTO v_years_in_job
  FROM   employees
  WHERE  employee_id = p_emp_empid_type;
  v_years_service := v_years_service + v_years_in_job;
  RETURN ROUND(v_years_service);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20348, 
      'Employee with ID '|| p_emp_empid_type ||' does not exist.');
    RETURN NULL;
END get_years_service;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2 

/*

SET SERVEROUTPUT ON
EXECUTE DBMS_OUTPUT.PUT_LINE(get_years_service (999))

*/

--Uncomment code below to run the solution for Task 3 

/*

SET SERVEROUTPUT ON

BEGIN
  DBMS_OUTPUT.PUT_LINE (
    'Employee 106 has worked ' || get_years_service(106) || ' years');
END;
/

*/

--Uncomment code below to run the solution for Task 4 

/*

SELECT employee_id, job_id,
       MONTHS_BETWEEN(end_date, start_date)/12 duration
FROM   job_history;

SELECT job_id, MONTHS_BETWEEN(SYSDATE, hire_date)/12 duration
FROM   employees 
WHERE  employee_id = 106;

*/


--The SQL Script to run the solution for Additional Practice 1-7

--Uncomment code below to run the solution for Task 1 

/*

CREATE OR REPLACE FUNCTION get_job_count(
  p_emp_empid_type IN employees.employee_id%TYPE) RETURN NUMBER IS
  TYPE jobs_table_type IS TABLE OF jobs.job_id%type;
  v_jobtab jobs_table_type;
  CURSOR c_empjob_csr IS
    SELECT job_id
    FROM job_history
    WHERE employee_id = p_emp_empid_type
      UNION
    SELECT job_id
    FROM employees
    WHERE employee_id = p_emp_empid_type;
BEGIN
  OPEN c_empjob_csr;
  FETCH c_empjob_csr BULK COLLECT INTO v_jobtab;
  CLOSE c_empjob_csr;
IF (v_jobtab.count = 0) THEN
  RAISE NO_DATA_FOUND;
ELSE
  RETURN v_jobtab.count;
END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20348,
      'Employee with ID '|| p_emp_empid_type ||' does not exist!');
    RETURN NULL;
END get_job_count;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2 

/*

SET SERVEROUTPUT ON

BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee 176 worked on ' ||
     get_job_count(176) || ' different jobs.');
  DBMS_OUTPUT.PUT_LINE('Employee 16 worked on ' ||
     get_job_count(16) || ' different jobs.');
END;
/


*/

--The SQL Script to run the solution for Additional Practice 1-8

--Uncomment code below to run the solution for Task 1 

/*

CREATE OR REPLACE PACKAGE empjob_pkg IS 
  TYPE jobs_table_type IS TABLE OF jobs.job_id%type;

  PROCEDURE add_job_hist( 
     p_emp_id IN employees.employee_id%TYPE, 
     p_new_jobid IN jobs.job_id%TYPE);
  
  FUNCTION get_job_count( 
     p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER;
  
  FUNCTION get_years_service(  
     p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER;
  
  PROCEDURE new_job( 
    p_jobid IN jobs.job_id%TYPE, 
    p_title IN jobs.job_title%TYPE, 
    p_minsal IN jobs.min_salary%TYPE);
  
  PROCEDURE upd_jobsal( 
    p_jobid IN jobs.job_id%type, 
    p_new_minsal IN jobs.min_salary%type, 
    p_new_maxsal IN jobs.max_salary%type);
END empjob_pkg; 
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2 

/*

 CREATE OR REPLACE PACKAGE BODY empjob_pkg IS 
  PROCEDURE add_job_hist( 
    p_emp_id IN employees.employee_id%TYPE, 
    p_new_jobid IN jobs.job_id%TYPE) IS 
  BEGIN 
    INSERT INTO job_history 
      SELECT employee_id, hire_date, SYSDATE, job_id, department_id 
      FROM employees 
      WHERE employee_id = p_emp_id;
    UPDATE employees 
      SET hire_date = SYSDATE, 
          job_id = p_new_jobid, 
          salary = (SELECT min_salary + 500 
                    FROM jobs 
          WHERE job_id = p_new_jobid) 
      WHERE employee_id = p_emp_id; 
    DBMS_OUTPUT.PUT_LINE ('Added employee ' || p_emp_id || 
       ' details to the JOB_HISTORY table'); 
    DBMS_OUTPUT.PUT_LINE ('Updated current job of employee ' || 
       p_emp_id|| ' to '|| p_new_jobid); 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR (-20001, 'Employee does not exist!'); 
  END add_job_hist; 
 
  FUNCTION get_job_count( 
    p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER IS 
    v_jobtab jobs_table_type; 
    CURSOR c_empjob_csr IS 
      SELECT job_id 
      FROM job_history 
      WHERE employee_id = p_emp_id 
      UNION 
      SELECT job_id
      FROM employees 
      WHERE employee_id = p_emp_id; 
  BEGIN 
    OPEN c_empjob_csr; 
    FETCH c_empjob_csr BULK COLLECT INTO v_jobtab; 
    CLOSE c_empjob_csr; 
    RETURN v_jobtab.count; 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR(-20348, 
        'Employee with ID '|| p_emp_id ||' does not exist!');
      RETURN 0;
  END get_job_count; 
 
  FUNCTION get_years_service( 
    p_emp_id IN employees.employee_id%TYPE) RETURN NUMBER IS 
    CURSOR c_jobh_csr IS 
      SELECT MONTHS_BETWEEN(end_date, start_date)/12 v_years_in_job 
      FROM job_history 
      WHERE employee_id = p_emp_id; 
    v_years_service NUMBER(2) := 0; 
    v_years_in_job NUMBER(2) := 0; 
  BEGIN 
    FOR jobh_rec IN c_jobh_csr 
    LOOP 
      EXIT WHEN c_jobh_csr%NOTFOUND; 
      v_years_service := v_years_service + jobh_rec.v_years_in_job; 
    END LOOP; 
    SELECT MONTHS_BETWEEN(SYSDATE, hire_date)/12 INTO v_years_in_job 
    FROM employees 
    WHERE employee_id = p_emp_id; 
    v_years_service := v_years_service + v_years_in_job; 
    RETURN ROUND(v_years_service); 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR(-20348, 
        'Employee with ID '|| p_emp_id ||' does not exist.'); 
      RETURN 0;
  END get_years_service; 
 
  PROCEDURE new_job( 
    p_jobid IN jobs.job_id%TYPE, 
    p_title IN jobs.job_title%TYPE, 
    p_minsal IN jobs.min_salary%TYPE) IS 
    v_maxsal jobs.max_salary%TYPE := 2 * p_minsal; 
  BEGIN 
    INSERT INTO jobs(job_id, job_title, min_salary, max_salary) 
    VALUES (p_jobid, p_title, p_minsal, v_maxsal); 
    DBMS_OUTPUT.PUT_LINE ('New row added to JOBS table:'); 
    DBMS_OUTPUT.PUT_LINE (p_jobid || ' ' || p_title ||' '||
                          p_minsal || ' ' || v_maxsal); 
  END new_job; 

  PROCEDURE upd_jobsal( 
    p_jobid IN jobs.job_id%type, 
    p_new_minsal IN jobs.min_salary%type, 
    p_new_maxsal IN jobs.max_salary%type) IS 
    v_dummy PLS_INTEGER; 
    e_resource_busy EXCEPTION; 
    e_sal_error EXCEPTION; 
    PRAGMA EXCEPTION_INIT (e_resource_busy , -54); 
  BEGIN 
    IF (p_new_maxsal < p_new_minsal) THEN 
      RAISE e_sal_error; 
    END IF; 
    SELECT 1 INTO v_dummy 
    FROM jobs 
    WHERE job_id = p_jobid 
    FOR UPDATE OF min_salary NOWAIT; 
    UPDATE jobs 
      SET min_salary = p_new_minsal, 
          max_salary = p_new_maxsal 
    WHERE job_id = p_jobid; 
  EXCEPTION 
    WHEN e_resource_busy THEN 
      RAISE_APPLICATION_ERROR (-20001, 
        'Job information is currently locked, try later.'); 
    WHEN NO_DATA_FOUND THEN 
      RAISE_APPLICATION_ERROR(-20001, 'This job ID does not exist'); 
    WHEN e_sal_error THEN 
      RAISE_APPLICATION_ERROR(-20001, 
        'Data error: Max salary should be more than min salary'); 
  END upd_jobsal;  
END empjob_pkg; 
/ 
SHOW ERRORS 

*/
 
--Uncomment code below to run the solution for Task 3

/*

SET SERVEROUTPUT ON

EXECUTE empjob_pkg.new_job('PR_MAN', 'Public Relations Manager', 6250)

*/

--Uncomment code below to run the solution for Task 4 

/*

SET SERVEROUTPUT ON
ALTER TRIGGER update_job_history DISABLE;
EXECUTE empjob_pkg.add_job_hist(110, 'PR_MAN')
ALTER TRIGGER update_job_history ENABLE;

*/

--Uncomment code below to run the solution for Task 5 
/*

SELECT * FROM jobs WHERE job_id = 'PR_MAN';
SELECT * FROM job_history WHERE employee_id = 110;
SELECT job_id, salary FROM employees WHERE employee_id = 110;

*/

--The SQL Script to run the solution for Additional Practice (1-9)

--Uncomment code below to run the solution for Task 1 

/*

CREATE OR REPLACE TRIGGER check_sal_range
BEFORE UPDATE OF min_salary, max_salary ON jobs
FOR EACH ROW
DECLARE
  v_minsal employees.salary%TYPE;
  v_maxsal employees.salary%TYPE;
  e_invalid_salrange EXCEPTION;
BEGIN
  SELECT MIN(salary), MAX(salary) INTO v_minsal, v_maxsal
  FROM employees
  WHERE job_id = :NEW.job_id;
  IF (v_minsal < :NEW.min_salary) OR (v_maxsal > :NEW.max_salary) THEN
    RAISE e_invalid_salrange;
  END IF;
EXCEPTION
  WHEN e_invalid_salrange THEN
    RAISE_APPLICATION_ERROR(-20550,
     'Employees exist whose salary is out of the specified range. '||
     'Therefore the specified salary range cannot be updated.');
END check_sal_range;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2 

/*

SELECT * FROM jobs
WHERE job_id = 'SY_ANAL';

SELECT employee_id, last_name, salary
FROM  employees
WHERE job_id = 'SY_ANAL';

UPDATE jobs 
  SET min_salary = 5000, max_salary = 7000 
  WHERE job_id = 'SY_ANAL';

SELECT * FROM jobs
WHERE job_id = 'SY_ANAL';

*/

--Uncomment code below to run the solution for Task 3

/* 

UPDATE jobs 
  SET min_salary = 7000, max_salary = 18000 
  WHERE job_id = 'SY_ANAL';

*/



