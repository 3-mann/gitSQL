CREATE TABLE dept3 (department_id NUMBER (3),
                    department_name VARCHAR2(30) DEFAULT 'IT' ,
                    manager_id NUMBER DEFAULT 101 ,
                    location_id NUMBER ) ;
                    
desc dept3 

desc user_tab_columns 

SELECT TABLE_NAME,COLUMN_NAME,DATA_DEFAULT FROM user_tab_columns
WHERE table_name='DEPT3' 
;
SELECT * FROM dept3 ;

INSERT INTO dept3 VALUES (1,'IT',DEFAULT ,1700) ;

INSERT INTO dept3 SELECT* FROM departments ;

UPDATE dept3 SET manager_id=DEFAULT
WHERE department_id=10 ;

DROP TABLE MGR_HISTORY;
CREATE table MGR_HISTORY
(EMPLOYEE_ID	NUMBER(6),
MANAGER_ID	NUMBER(6),
SALARY	NUMBER(8,2));

DROP TABLE SAL_HISTORY;
CREATE table SAL_HISTORY
(EMPLOYEE_ID	NUMBER(6),
HIRE_DATE	DATE,
SALARY	NUMBER(8,2));

SELECT * FROM employees WHERE employee_id >200 ;

INSERT ALL
INTO sal_history VALUES(EMPID,HIREDATE,SAL) 
INTO mgr_history VALUES(EMPID,MGR,SAL)
SELECT employee_id EMPID, hire_date HIREDATE, salary SAL, manager_id MGR
FROM employees WHERE employee_id > 200;

DROP TABLE EMP_HISTORY;
CREATE table EMP_HISTORY
(EMPLOYEE_ID	NUMBER(6),
HIRE_DATE	DATE,
SALARY	NUMBER(8,2));

DROP TABLE EMP_SALES;
CREATE table EMP_SALES
(EMPLOYEE_ID	NUMBER(6),
COMMISSION_PCT	NUMBER(2,2),
SALARY	NUMBER(8,2));

SELECT COUNT(employee_id) FROM employees
WHERE hire_date < '05-JAN-05' ;

SELECT COUNT(employee_id) FROM employees 
WHERE commission_pct IS NOT NULL ;

SELECT employee_id EMPID, hire_date HIREDATE,
salary SAL, commission_pct COMM
FROM employees
WHERE hire_date < '05-JAN-05'
UNION ALL
SELECT employee_id EMPID, hire_date HIREDATE,
salary SAL, commission_pct COMM
FROM employees
WHERE commission_pct IS NOT NULL ;

INSERT ALL
WHEN HIREDATE < '01-JAN-05' THEN
INTO emp_history VALUES(EMPID,HIREDATE,SAL)
WHEN COMM IS NOT NULL THEN
INTO emp_sales VALUES(EMPID,COMM,SAL)
SELECT employee_id EMPID, hire_date HIREDATE,
salary SAL, commission_pct COMM
FROM employees;


DROP TABLE sal_high;
CREATE TABLE sal_high 
( employee_id number(6,0),
  last_name varchar2(25),
  salary number(8,2)
);

DROP TABLE sal_mid;
CREATE TABLE sal_mid 
( employee_id number(6,0),
  last_name varchar2(25),
  salary number(8,2)
);

DROP TABLE sal_low;
CREATE TABLE sal_low 
( employee_id number(6,0),
  last_name varchar2(25),
  salary number(8,2)
);

INSERT FIRST
WHEN salary < 5000 THEN
INTO sal_low VALUES (employee_id, last_name, salary)
WHEN salary < 10000 THEN
INTO sal_mid VALUES (employee_id, last_name, salary)
ELSE
INTO sal_high VALUES (employee_id, last_name, salary)
SELECT employee_id, last_name, salary
FROM employees;

SELECT * FROM sal_mid ;

DROP TABLE SALES_SOURCE_DATA;
CREATE TABLE SALES_SOURCE_DATA
(employee_id 	NUMBER(6),
WEEK_ID	NUMBER(2),
SALES_MON	NUMBER(8,2),
SALES_TUE	NUMBER(8,2),
SALES_WED	NUMBER(8,2),
SALES_THUR	NUMBER(8,2),
SALES_FRI	NUMBER(8,2));

DROP TABLE SALES_INFO;
CREATE TABLE SALES_INFO
(employee_id 	NUMBER(6),
WEEK	NUMBER(2),
SALES	NUMBER(8,2));

INSERT INTO sales_source_Data VALUES (174,6,2000,3000,4000,5000,6000);


SELECT * FROM sales_source_data ;
SELECT (2000+3000+4000+5000+6000) FROM dual ;

SELECT sales_MON+ sales_TUE+ sales_WED+ sales_THUR+sales_FRI
FROM sales_source_data
WHERE week_id=6 ;


INSERT ALL INTO sales_info 
VALUES (employee_id,week_id,sales_MON) INTO sales_info 
VALUES (employee_id,week_id,sales_TUE) INTO sales_info 
VALUES (employee_id,week_id,sales_WED) INTO sales_info 
VALUES (employee_id,week_id,sales_THUR) INTO sales_info 
VALUES (employee_id,week_id, sales_FRI) 
SELECT EMPLOYEE_ID, week_id, sales_MON, sales_TUE, sales_WED, sales_THUR,sales_FRI 
FROM sales_source_data;

SELECT * FROM sales_info ;

SELECT SUM(sales) , week FROM sales_info 
GROUP BY week ;


