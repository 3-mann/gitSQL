--The SQL Script to run the code_examples for Lesson 9



--Uncomment code below to run the code for slide 5_sa for lesson 9
--If you get any warning message, please ignore it
/* 

DROP TABLE deptm3;

CREATE TABLE deptm3 as SELECT * FROM departments;

INSERT INTO deptm3
  (department_id, department_name, manager_id) 
VALUES (300, 'Engineering', DEFAULT);


/*

--Uncomment code below to run the code for slide 5_sb for lesson 9
/*
UPDATE deptm3
SET manager_id = DEFAULT WHERE department_id = 10;

*/

--Uncomment code below to run the code for slide 12_sa for lesson 9
--Execute code_cre_sal_history.sql and code_cre_mgr_history.sql from /home/oracle/labs/sql2/code_ex before executing this code
/*

INSERT  ALL INTO sal_history VALUES(EMPID,HIREDATE,SAL)   
            INTO mgr_history VALUES(EMPID,MGR,SAL)
            SELECT employee_id EMPID, hire_date HIREDATE,  salary SAL, manager_id MGR 
            FROM  employees WHERE employee_id > 200;

*/

--Uncomment code below to run the code for slide 12_na for lesson 9
/*

SELECT COUNT(*) total_in_sal FROM sal_history;
SELECT COUNT(*) total_in_mgr FROM mgr_history;


*/

--Uncomment code below to run the code for slide 14_sa for lesson 9
--Execute code_cre_emp_history.sql and  code_cre_emp_sales.sql from /home/oracle/labs/sql2/code_ex before executing this
/*

INSERT  ALL
 WHEN HIREDATE < '01-JAN-05' THEN
   INTO emp_history VALUES(EMPID,HIREDATE,SAL)
 WHEN COMM IS NOT NULL THEN
   INTO emp_sales VALUES(EMPID,COMM,SAL)
   SELECT employee_id EMPID, hire_date HIREDATE, 
          salary SAL, commission_pct COMM
   FROM  employees;

*/

--Uncomment code below to run the code for slide 14_na for lesson 9

/*

SELECT count(*) FROM emp_history;
SELECT count(*) FROM emp_sales;

*/

--Uncomment code below to run the code for slide 15_na for lesson 9
/*

DROP TABLE managers2;
CREATE TABLE managers2 as select last_name, job_id, salary from employees where 1=2;
DROP TABLE richpeople;
DROP TABLE poorpeople;
CREATE TABLE richpeople(last_name VARCHAR2(30),job_id VARCHAR2(30),SALARY NUMBER);
create table poorpeople (last_name VARCHAR2(30),job_id VARCHAR2(30),SALARY NUMBER);

INSERT ALL
WHEN job_id IN 
(select job_id FROM jobs WHERE job_title LIKE '%Manager%') THEN
INTO managers2(last_name,job_id,SALARY)
VALUES (last_name,job_id,SALARY)
WHEN SALARY>10000 THEN 
INTO richpeople(last_name,job_id,SALARY)
VALUES (last_name,job_id,SALARY)
ELSE 
INTO poorpeople VALUES (last_name,job_id,SALARY)
SELECT * FROM employees;
*/

--Uncomment code below to run the code for slide 17_sa for lesson 9
--Execute code_cre_sal_low.sql, code_cre_sal_mid.sql
-- and code_cre_sal_high.sql from /home/oracle/labs/sql2/code_ex before executing this code
/*

INSERT FIRST
WHEN salary < 5000 THEN
  INTO sal_low VALUES (employee_id, last_name, salary)
WHEN salary between 5000 and 10000 THEN
  INTO sal_mid VALUES (employee_id, last_name, salary)
ELSE
  INTO sal_high VALUES (employee_id, last_name, salary)
SELECT employee_id, last_name, salary
FROM employees

*/

--Uncomment code below to run the code for slide 18_na for lesson 9

/* 

SELECT count(*) low FROM sal_low;
SELECT count(*) mid FROM sal_mid;        
SELECT count(*) high FROM sal_high;

*/

--Uncomment code below to run the code for slide 20_sa for lesson 9
--Execute the code_cre_sales_source_data.sql, code_cre_sales_info.sql,
-- code_ins_sales_source_data.sql from /home/oracle/labs/sql2/code_ex before executing this code
/*

INSERT ALL INTO sales_info VALUES (employee_id,week_id,sales_MON) 
INTO sales_info VALUES (employee_id,week_id,sales_TUE) 
INTO sales_info VALUES (employee_id,week_id,sales_WED) 
INTO sales_info VALUES (employee_id,week_id,sales_THUR) 
INTO sales_info VALUES (employee_id,week_id, sales_FRI) 
SELECT EMPLOYEE_ID, week_id, sales_MON, sales_TUE, sales_WED, sales_THUR,sales_FRI 
FROM sales_source_data;
*/

--Uncomment code below to run the code for slide 20_na for lesson 9

/* DESC SALES_SOURCE_DATA

--Uncomment code below to run the code for slide 21_na for lesson 9

/* SELECT * FROM sales_source_data;


--Uncomment code below to run the code for slide 21_nb for lesson 9

/* desc sales_info


--Uncomment code below to run the code for slide 21_nc for lesson 9

/* SELECT * FROM sales_info;


--Uncomment code below to run the code for slide 25_na for lesson 9
--Execute code for slide 28_na.sql before executing this

/*

MERGE INTO copy_emp3 c
USING (SELECT * FROM EMPLOYEES ) e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
UPDATE SET
c.first_name = e.first_name,
c.last_name = e.last_name,
c.email = e.email,
c.phone_number = e.phone_number,
c.hire_date = e.hire_date,
c.job_id = e.job_id,
c.salary = e.salary*2,
c.commission_pct = e.commission_pct,
c.manager_id = e.manager_id,
c.department_id = e.department_id
DELETE WHERE (E.COMMISSION_PCT IS NOT NULL)
WHEN NOT MATCHED THEN
INSERT VALUES(e.employee_id, e.first_name, e.last_name,
e.email, e.phone_number, e.hire_date, e.job_id,
e.salary, e.commission_pct, e.manager_id,
e.department_id);
*/

--Uncomment code below to run the code for slide 26_na for lesson 9
--If you get any warning message, please ignore it

/*
DROP TABLE COPY_EMP3;
CREATE TABLE COPY_EMP3 AS SELECT * FROM EMPLOYEES
WHERE SALARY<10000;
*/

--Uncomment code below to run the code for slide 26_nb for lesson 9

/* SELECT employee_id, salary, commission_pct FROM COPY_EMP3;

--Uncomment code below to run the code for slide 27_sa for lesson 9
/*

TRUNCATE TABLE copy_emp3;
SELECT * FROM copy_emp3;
*/

--Uncomment code below to run the code for slide 27_sb for lesson 9
/*

MERGE INTO copy_emp3 c
USING (SELECT * FROM EMPLOYEES ) e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
UPDATE SET
c.first_name = e.first_name,
c.last_name = e.last_name,
c.email = e.email,
c.phone_number = e.phone_number,
c.hire_date = e.hire_date,
c.job_id = e.job_id,
c.salary = e.salary*2,
c.commission_pct = e.commission_pct,
c.manager_id = e.manager_id,
c.department_id = e.department_id
DELETE WHERE (E.COMMISSION_PCT IS NOT NULL)
WHEN NOT MATCHED THEN
INSERT VALUES(e.employee_id, e.first_name, e.last_name,
e.email, e.phone_number, e.hire_date, e.job_id,
e.salary, e.commission_pct, e.manager_id,
e.department_id);
*/

--Uncomment code below to run the code for slide 27_sc for lesson 9

/* SELECT * FROM copy_emp3;


--Uncomment code below to run the code for slide 27_na for lesson 9

/* SELECT employee_id, salary, commission_pct from copy_emp3;

--Uncomment code below to run the code for slide 31_sa for lesson 9
--If you get any warning message, please ignore it

/* 
CREATE TABLE emp3 AS SELECT * FROM employees;
DROP TABLE emp3;
*/

--Uncomment code below to run the code for slide 31_sb for lesson 9

/* SELECT original_name, operation, droptime FROM recyclebin;

--Uncomment code below to run the code for slide 31_sc for lesson 9

/* FLASHBACK TABLE emp3 TO BEFORE DROP;

--Uncomment code below to run the code for slide 31_na for lesson 9

/* SELECT * FROM RECYCLEBIN;

--Uncomment code below to run the code for slide 31_nb for lesson 9

/* PURGE RECYCLEBIN;

--Uncomment code below to run the code for slide 34_sa for lesson 9
--If you get any warning message, please ignore it

/*
DROP TABLE employees3;
CREATE TABLE employees3 as select * from employees;

SELECT salary FROM employees3 
WHERE last_name = 'Chung';
*/

--Uncomment code below to run the code for slide 34_sb for lesson 9
/*

UPDATE employees3 SET salary = 4000
WHERE last_name = 'Chung';

SELECT salary FROM employees3 
WHERE last_name = 'Chung';
*/

--Uncomment code below to run the code for slide 34_sc for lesson 9
/*

SELECT salary FROM employees3
AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '1' MINUTE) 
WHERE last_name = 'Chung';

*/

--Uncomment code below to run the code for slide 35_sa for lesson 9

/*

SELECT salary FROM employees3 
WHERE  employee_id = 107;
*/

--Uncomment code below to run the code for slide 35_sb for lesson 9
/*
UPDATE employees3 SET salary = salary * 1.30
WHERE  employee_id = 107;

commit;

*/

--Uncomment code below to run the code for slide 35_sc for lesson 9
/*

SELECT salary FROM employees3
  VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE  employee_id = 107;

*/

--Uncomment code below to run the code for slide 37_sa for lesson 9
/*
SELECT versions_starttime "START_DATE", 
         versions_endtime "END_DATE",
         salary 
  FROM   employees3 
         VERSIONS BETWEEN scn minvalue and maxvalue
  WHERE  last_name = 'Lorentz';

*/

