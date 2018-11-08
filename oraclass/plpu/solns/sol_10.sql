--The SQL Script to run the solution for Practice 10
--Run cleanup_10.sql script from /home/oracle/labs/plpu/code_ex/cleanup_scripts directory before executing the solutions.
--Uncomment code below to run the solution for Task 1_a of Practice 10

/*

-- Package SPECIFICATION

CREATE OR REPLACE PACKAGE emp_pkg IS


  TYPE emp_tab_type IS TABLE OF employees%ROWTYPE;

  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_email employees.email%TYPE, 
    p_job employees.job_id%TYPE DEFAULT 'SA_REP', 
    p_mgr employees.manager_id%TYPE DEFAULT 145, 
    p_sal employees.salary%TYPE DEFAULT 1000, 
    p_comm employees.commission_pct%TYPE DEFAULT 0, 
    p_deptid employees.department_id%TYPE DEFAULT 30);

  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_deptid employees.department_id%TYPE);

  PROCEDURE get_employee(
    p_empid IN employees.employee_id%TYPE, 
    p_sal OUT employees.salary%TYPE, 
    p_job OUT employees.job_id%TYPE);

  FUNCTION get_employee(p_emp_id employees.employee_id%type)
    return employees%rowtype;
  
  FUNCTION get_employee(p_family_name employees.last_name%type)
    return employees%rowtype;

  PROCEDURE get_employees(p_dept_id employees.department_id%type);

  PROCEDURE init_departments;

  PROCEDURE print_employee(p_rec_emp employees%rowtype);

  PROCEDURE show_employees;

--New set_salary procedure

  PROCEDURE set_salary(p_jobid VARCHAR2, p_min_salary NUMBER);

END emp_pkg;
/
SHOW ERRORS

-- Package BODY

CREATE OR REPLACE PACKAGE BODY emp_pkg IS
  TYPE boolean_tab_type IS TABLE OF BOOLEAN
     INDEX BY BINARY_INTEGER;
  
  valid_departments boolean_tab_type;
  emp_table         emp_tab_type;

  FUNCTION valid_deptid(p_deptid IN departments.department_id%TYPE)
    RETURN BOOLEAN; 

  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_email employees.email%TYPE, 
    p_job employees.job_id%TYPE DEFAULT 'SA_REP', 
    p_mgr employees.manager_id%TYPE DEFAULT 145, 
    p_sal employees.salary%TYPE DEFAULT 1000, 
    p_comm employees.commission_pct%TYPE DEFAULT 0, 
    p_deptid employees.department_id%TYPE DEFAULT 30) IS 
 
    PROCEDURE audit_newemp IS
      PRAGMA AUTONOMOUS_TRANSACTION;
      user_id VARCHAR2(30) := USER;
    BEGIN
      INSERT INTO log_newemp (entry_id, user_id, log_time, name)
      VALUES (log_newemp_seq.NEXTVAL, user_id, sysdate,p_first_name||' '||p_last_name);
      COMMIT;
    END audit_newemp;  

  BEGIN -- add_employee
    IF valid_deptid(p_deptid) THEN 
      audit_newemp;
      INSERT INTO employees(employee_id, first_name, last_name, email, 
        job_id, manager_id, hire_date, salary, commission_pct, department_id) 
      VALUES (employees_seq.NEXTVAL, p_first_name, p_last_name, p_email, 
        p_job, p_mgr, TRUNC(SYSDATE), p_sal, p_comm, p_deptid); 
    ELSE 
      RAISE_APPLICATION_ERROR (-20204, 'Invalid department ID. Try again.'); 
    END IF; 
  END add_employee; 
  
  PROCEDURE add_employee( 
    p_first_name employees.first_name%TYPE, 
    p_last_name employees.last_name%TYPE, 
    p_deptid employees.department_id%TYPE) IS
    p_email employees.email%type;
  BEGIN
    p_email := UPPER(SUBSTR(p_first_name, 1, 1)||SUBSTR(p_last_name, 1, 7));
    add_employee(p_first_name, p_last_name, p_email, p_deptid => p_deptid);
  END;

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

  FUNCTION get_employee(p_emp_id employees.employee_id%type)
    return employees%rowtype IS
    rec_emp employees%rowtype;
  BEGIN
    SELECT * INTO rec_emp
    FROM employees
    WHERE employee_id = p_emp_id;
    RETURN rec_emp;
  END;

  FUNCTION get_employee(p_family_name employees.last_name%type)
    return employees%rowtype IS
    rec_emp employees%rowtype;
  BEGIN
    SELECT * INTO rec_emp
    FROM employees
    WHERE last_name = p_family_name;
    RETURN rec_emp;
  END;

  PROCEDURE get_employees(p_dept_id employees.department_id%type) IS
  BEGIN
    SELECT * BULK COLLECT INTO emp_table
    FROM EMPLOYEES
    WHERE department_id = p_dept_id;
  END;

  PROCEDURE init_departments IS
  BEGIN
    FOR rec IN (SELECT department_id FROM departments)
    LOOP
      valid_departments(rec.department_id) := TRUE;
    END LOOP;
  END;

  PROCEDURE print_employee(p_rec_emp employees%rowtype) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(p_rec_emp.department_id ||' '|| 
                         p_rec_emp.employee_id||' '||
                         p_rec_emp.first_name||' '||
                         p_rec_emp.last_name||' '||
                         p_rec_emp.job_id||' '||
                         p_rec_emp.salary);
  END;

  PROCEDURE show_employees IS
  BEGIN
    IF emp_table IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('Employees in Package table');
      FOR i IN 1 .. emp_table.COUNT
      LOOP
        print_employee(emp_table(i));
      END LOOP;
    END IF;
  END show_employees;

  FUNCTION valid_deptid(p_deptid IN departments.department_id%TYPE) 
   RETURN BOOLEAN IS 
    v_dummy PLS_INTEGER; 
  BEGIN 
    RETURN valid_departments.exists(p_deptid);  
  EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
    RETURN FALSE; 
END valid_deptid; 

--New set_salary procedure 

PROCEDURE set_salary(p_jobid VARCHAR2, p_min_salary NUMBER) IS
    CURSOR cur_emp IS
      SELECT employee_id
      FROM employees
      WHERE job_id = p_jobid AND salary < p_min_salary;
  BEGIN
    FOR rec_emp IN cur_emp
    LOOP
      UPDATE employees
        SET salary = p_min_salary
      WHERE employee_id = rec_emp.employee_id;
    END LOOP;
  END set_salary;

BEGIN
  init_departments;
END emp_pkg;


/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 1_b of Practice 10

/*

CREATE OR REPLACE TRIGGER upd_minsalary_trg
AFTER UPDATE OF min_salary ON JOBS
FOR EACH ROW
BEGIN
  emp_pkg.set_salary(:new.job_id, :new.min_salary);
END;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 1_c of Practice 10

/*

SELECT employee_id, last_name, salary
FROM employees
WHERE job_id = 'IT_PROG';

UPDATE jobs
  SET min_salary = min_salary + 1000
WHERE job_id = 'IT_PROG';

*/

--Uncomment code below to run the solution for Task 2_a of Practice 10
 
/*

CREATE OR REPLACE PACKAGE jobs_pkg IS
  PROCEDURE initialize;
  FUNCTION get_minsalary(p_jobid VARCHAR2) RETURN NUMBER;
  FUNCTION get_maxsalary(p_jobid VARCHAR2) RETURN NUMBER;
  PROCEDURE set_minsalary(p_jobid VARCHAR2, p_min_salary NUMBER);
  PROCEDURE set_maxsalary(p_jobid VARCHAR2, p_max_salary NUMBER);
END jobs_pkg;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2_b of Practice 10

/*

CREATE OR REPLACE PACKAGE BODY jobs_pkg IS
  TYPE jobs_tab_type IS TABLE OF jobs%rowtype
    INDEX BY jobs.job_id%type;
  jobstab jobs_tab_type;

  PROCEDURE initialize IS
  BEGIN
    FOR rec_job IN (SELECT * FROM jobs)
    LOOP
      jobstab(rec_job.job_id) := rec_job;
    END LOOP;
  END initialize;

  FUNCTION get_minsalary(p_jobid VARCHAR2) RETURN NUMBER IS
  BEGIN
    RETURN jobstab(p_jobid).min_salary;
  END get_minsalary;

  FUNCTION get_maxsalary(p_jobid VARCHAR2) RETURN NUMBER IS
  BEGIN
    RETURN jobstab(p_jobid).max_salary;
  END get_maxsalary;

  PROCEDURE set_minsalary(p_jobid VARCHAR2, p_min_salary NUMBER) IS
  BEGIN
    jobstab(p_jobid).max_salary := p_min_salary;
  END set_minsalary;

  PROCEDURE set_maxsalary(p_jobid VARCHAR2, p_max_salary NUMBER) IS
  BEGIN
    jobstab(p_jobid).max_salary := p_max_salary;
  END set_maxsalary;

END jobs_pkg;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2_c of Practice 10
/*

CREATE OR REPLACE PROCEDURE check_salary (p_the_job VARCHAR2, p_the_salary NUMBER) IS
  v_minsal jobs.min_salary%type;
  v_maxsal jobs.max_salary%type;
BEGIN
 
-- Commented out to avoid mutating trigger exception on the JOBS table

 
 --SELECT min_salary, max_salary INTO v_minsal, v_maxsal
 -- FROM jobs
  --WHERE job_id = UPPER(p_the_job);
  

  v_minsal := jobs_pkg.get_minsalary(UPPER(p_the_job));
  v_maxsal := jobs_pkg.get_maxsalary(UPPER(p_the_job));
  IF p_the_salary NOT BETWEEN v_minsal AND v_maxsal THEN
    RAISE_APPLICATION_ERROR(-20100, 
      'Invalid salary $'||p_the_salary||'. '||
      'Salaries for job '|| p_the_job || 
      ' must be between $'|| v_minsal ||' and $' || v_maxsal);
  END IF;
END;
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2_d of Practice 10

/*

CREATE OR REPLACE TRIGGER init_jobpkg_trg
BEFORE INSERT OR UPDATE ON jobs
CALL jobs_pkg.initialize
/
SHOW ERRORS

*/

--Uncomment code below to run the solution for Task 2_e of Practice 10

/*

SELECT employee_id, last_name, salary
FROM employees
WHERE job_id = 'IT_PROG';

UPDATE jobs
  SET min_salary = min_salary + 1000
WHERE job_id = 'IT_PROG';

SELECT employee_id, last_name, salary
FROM employees
WHERE job_id = 'IT_PROG';

*/

--Uncomment code below to run the solution for Task 3_a of Practice 10

/* 

EXECUTE emp_pkg.add_employee('Steve', 'Morse', 'SMORSE', p_sal => 6500)

*/

--Uncomment code below to run the solution for Task 3_b of Practice 10

/*

CREATE TRIGGER employee_initjobs_trg
BEFORE INSERT OR UPDATE OF job_id, salary ON employees
CALL jobs_pkg.initialize
/

*/

--Uncomment code below to run the solution for Task 3_c of Practice 10

/*

EXECUTE emp_pkg.add_employee('Steve', 'Morse', 'SMORSE', p_sal => 6500)
/
SELECT employee_id, first_name, last_name, salary, job_id, department_id
FROM employees
WHERE last_name = 'Morse';

*/
