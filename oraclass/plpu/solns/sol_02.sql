--The SQL Script to run the solution for Practice 2

--Run cleanup_02.sql script from /home/oracle/labs/plpu/code_ex/cleanup_scripts directory before executing the solutions.
--Uncomment code below to run the solution for Task 1_a of Practice 2
/*
CREATE OR REPLACE PROCEDURE add_job (
  p_jobid jobs.job_id%TYPE,
  p_jobtitle jobs.job_title%TYPE) IS
BEGIN
  INSERT INTO jobs (job_id, job_title)
  VALUES (p_jobid, p_jobtitle);
  COMMIT;
END add_job;
/

*/

--Uncomment code below to run the solution for Task 1_b  for Practice 2
/*

EXECUTE add_job ('IT_DBA', 'Database Administrator')
SELECT * FROM jobs WHERE job_id = 'IT_DBA';

*/

--Uncomment code below to run the solution for Task 1_c  for Practice 2
/*
EXECUTE add_job ('ST_MAN', 'Stock Manager')
*/

--Uncomment code below to run the solution for Task 2_a  for Practice 2
/*

CREATE OR REPLACE PROCEDURE upd_job (
  p_jobid IN jobs.job_id%TYPE,
  p_jobtitle IN jobs.job_title%TYPE) IS
BEGIN
  UPDATE jobs
  SET    job_title = p_jobtitle
  WHERE  job_id = p_jobid;
  IF SQL%NOTFOUND THEN
    RAISE_APPLICATION_ERROR(-20202, 'No job updated.');
  END IF;
END upd_job;
/

*/

--Uncomment code below to run the solution for Task 2_b for Practice 2
/*

EXECUTE upd_job ('IT_DBA', 'Data Administrator')
SELECT * FROM jobs WHERE job_id = 'IT_DBA';

*/

--Uncomment code below to run the solution for Task 2_c for Practice 2

/*

EXECUTE upd_job ('IT_WEB', 'Web Master')
SELECT * FROM jobs WHERE job_id = 'IT_WEB';

*/

--Uncomment code below to run the solution for Task 3_a for Practice 2

/*

CREATE OR REPLACE PROCEDURE del_job (p_jobid jobs.job_id%TYPE) IS
BEGIN
  DELETE FROM jobs
  WHERE  job_id = p_jobid;
  IF SQL%NOTFOUND THEN 
    RAISE_APPLICATION_ERROR(-20203, 'No jobs deleted.');
  END IF;
END DEL_JOB;
/

*/
--Uncomment code below to run the solution for Task 3_b for Practice 2

/*

EXECUTE del_job ('IT_DBA')
SELECT * FROM jobs WHERE job_id = 'IT_DBA';

*/

--Uncomment code below to run the solution for Task 3_c for Practice 2

/* 

EXECUTE del_job ('IT_WEB')

*/

--Uncomment code below to run the solution for Task 4_a  for Practice 2

/*

CREATE OR REPLACE PROCEDURE get_employee
    (p_empid IN  employees.employee_id%TYPE,
     p_sal   OUT employees.salary%TYPE,
     p_job   OUT employees.job_id%TYPE) IS
BEGIN
  SELECT  salary, job_id
  INTO    p_sal, p_job
  FROM    employees
  WHERE   employee_id = p_empid;
END get_employee;
/

*/

--Uncomment code below to run the solution for Task 4_b  for Practice 2

/*

VARIABLE v_salary NUMBER
VARIABLE v_job    VARCHAR2(15)
EXECUTE get_employee(120, :v_salary, :v_job)
PRINT v_salary v_job
*/

--Uncomment code below to run the solution for Task 4_c  for Practice 2

/*

VARIABLE v_salary NUMBER
VARIABLE v_job    VARCHAR2(15)
EXECUTE get_employee(300, :v_salary, :v_job)

*/
