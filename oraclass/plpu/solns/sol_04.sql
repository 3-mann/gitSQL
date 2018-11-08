--The SQL Script to run the solution for Practice 4
--Run cleanup_04.sql script from /home/oracle/labs/plpu/code_ex/cleanup_scripts directory before executing the solutions.
--Uncomment code below to run the solution for Task 1_a of Practice 4

/*

CREATE OR REPLACE PACKAGE job_pkg IS
  PROCEDURE add_job (p_jobid jobs.job_id%TYPE, p_jobtitle jobs.job_title%TYPE);
  PROCEDURE del_job (p_jobid jobs.job_id%TYPE);
  FUNCTION get_job (p_jobid IN jobs.job_id%type) RETURN jobs.job_title%type;
  PROCEDURE upd_job(p_jobid IN jobs.job_id%TYPE, p_jobtitle IN jobs.job_title%TYPE);
END job_pkg;
/
SHOW ERRORS

*/


--Uncomment code below to run the solution for Task 1_b of Practice 4

/*

CREATE OR REPLACE PACKAGE BODY job_pkg IS
  PROCEDURE add_job ( 
    p_jobid jobs.job_id%TYPE, 
    p_jobtitle jobs.job_title%TYPE) IS 
  BEGIN 
    INSERT INTO jobs (job_id, job_title) 
    VALUES (p_jobid, p_jobtitle); 
    COMMIT; 
  END add_job; 

  PROCEDURE del_job (p_jobid jobs.job_id%TYPE) IS 
    BEGIN 
      DELETE FROM jobs 
      WHERE job_id = p_jobid; 
      IF SQL%NOTFOUND THEN 
        RAISE_APPLICATION_ERROR(-20203, 'No jobs deleted.'); 
      END IF; 
    END DEL_JOB; 

  FUNCTION get_job (p_jobid IN jobs.job_id%type) 
    RETURN jobs.job_title%type IS 
    v_title jobs.job_title%type; 
    BEGIN 
      SELECT job_title 
      INTO v_title 
      FROM jobs 
      WHERE job_id = p_jobid; 
      RETURN v_title; 
    END get_job; 

  PROCEDURE upd_job( 
    p_jobid IN jobs.job_id%TYPE, 
    p_jobtitle IN jobs.job_title%TYPE) IS 
    BEGIN 
      UPDATE jobs 
      SET job_title = p_jobtitle 
      WHERE job_id = p_jobid; 
      IF SQL%NOTFOUND THEN 
        RAISE_APPLICATION_ERROR(-20202, 'No job updated.'); 
      END IF; 
    END upd_job; 

END job_pkg;
/

SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 1_d of Practice 4

/* 

EXECUTE job_pkg.add_job('IT_SYSAN', 'Systems Analyst')

*/


--Uncomment code below to run the solution for Task 1_e of Practice 4

/*

SELECT *
FROM jobs
WHERE job_id = 'IT_SYSAN';

*/


--Uncomment code below to run the solution for Task 2_a of Practice 4
/*

CREATE OR REPLACE PACKAGE emp_pkg IS
  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_email employees.email%TYPE, 
    p_job employees.job_id%TYPE DEFAULT 'SA_REP', 
    p_mgr employees.manager_id%TYPE DEFAULT 145, 
    p_sal employees.salary%TYPE DEFAULT 1000, 
    p_comm employees.commission_pct%TYPE DEFAULT 0, 
    p_deptid employees.department_id%TYPE DEFAULT 30);
PROCEDURE get_employee(
    p_empid IN employees.employee_id%TYPE, 
    p_sal OUT employees.salary%TYPE, 
    p_job OUT employees.job_id%TYPE);
END emp_pkg;
/
SHOW ERRORS

CREATE OR REPLACE PACKAGE BODY emp_pkg IS
  FUNCTION valid_deptid(p_deptid IN departments.department_id%TYPE) RETURN BOOLEAN IS 
    v_dummy PLS_INTEGER; 
  BEGIN 
    SELECT 1 
    INTO v_dummy 
    FROM departments 
    WHERE department_id = p_deptid; 
    RETURN TRUE; 
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
    RETURN FALSE; 

END valid_deptid; 

  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_email employees.email%TYPE, 
    p_job employees.job_id%TYPE DEFAULT 'SA_REP', 
    p_mgr employees.manager_id%TYPE DEFAULT 145, 
    p_sal employees.salary%TYPE DEFAULT 1000, 
    p_comm employees.commission_pct%TYPE DEFAULT 0, 
    p_deptid employees.department_id%TYPE DEFAULT 30) IS 
  BEGIN 
    IF valid_deptid(p_deptid) THEN 
      INSERT INTO employees(employee_id, first_name, last_name, email, 
        job_id, manager_id, hire_date, salary, commission_pct, department_id) 
      VALUES (employees_seq.NEXTVAL, p_first_name, p_last_name, p_email, 
        p_job, p_mgr, TRUNC(SYSDATE), p_sal, p_comm, p_deptid); 
    ELSE 
      RAISE_APPLICATION_ERROR (-20204, 'Invalid department ID. Try again.'); 
    END IF; 
  END add_employee; 

  PROCEDURE get_employee(
    p_empid IN employees.employee_id%TYPE, 
    p_sal OUT employees.salary%TYPE, 
    p_job OUT employees.job_id%TYPE) IS 
  BEGIN 
    SELECT salary, job_id 
    INTO p_sal, p_job 
    FROM employees 
    WHERE employee_id = p_empid; 
  END get_employee; 
END emp_pkg;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2_b of Practice 4

/* 

EXECUTE emp_pkg.add_employee('Jane', 'Harris','JAHARRIS', p_deptid => 15)

*/


--Uncomment code below to run the solution for Task 2_c of Practice 4

/* 

EXECUTE emp_pkg.add_employee('David', 'Smith','DASMITH', p_deptid => 80)

*/



--Uncomment code below to run the solution for Task 2_d of Practice 4

/*

SELECT *
FROM employees
WHERE last_name = 'Smith';

*/



