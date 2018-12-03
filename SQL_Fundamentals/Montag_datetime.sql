SELECT to_cHAR(current_date,'hh24:mi'),localtimestamp, sysdate  FROM dual ;

SELECT * FROM V$TIMEZONE_NAMES;

SELECT hire_date,
hire_date + TO_YMINTERVAL('01-02') AS
HIRE_DATE_YMININTERVAL
FROM employees
WHERE department_id = 20;

SELECT last_name,
TO_CHAR(hire_date, 'mm-dd-yy:hh:mi:ss') hire_date,
TO_CHAR(hire_date +
TO_DSINTERVAL('100 10:00:00'),
'mm-dd-yy:hh:mi:ss') hiredate2
FROM employees;

CREATE PUBLIC SYNONYM employees FOR employees ;

GRANT SELECT ON employees TO hr, scott ;

CREATE VIEW employees 
AS 
SELECT * FROM employees ;

desc employees 

desc user_tab_columns 

SELECT table_name, column_name, data_default FROM user_tab_columns
WHERE data_default IS NOT NULL ;

SELECT * FROM dept2 ;
desc dept2 ;

INSERT INTO dept2 SELECT TRUNC(department_id/10), SUBSTR(department_name,1,10), location_id, sysdate FROM departments ;

UPDATE dept2 SET CREATE_DATE=NULL WHERE deptno=12 ;

