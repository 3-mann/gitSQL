--The SQL Script to run the code_examples for Lesson 3


--Uncomment code below to run the code for slide 9_sa for lesson 3
/*
DROP SEQUENCE dept_deptid_seq;
CREATE SEQUENCE dept_deptid_seq
                INCREMENT BY 10
                START WITH 280
                MAXVALUE 9999
                NOCACHE
                NOCYCLE;
*/ 

--Uncomment code below to run the code for slide 12_sa for lesson 3
/*
DELETE FROM departments
WHERE department_name='Support';

INSERT INTO departments(department_id, 
            department_name, location_id)
VALUES      (dept_deptid_seq.NEXTVAL, 
            'Support', 2500);
*/

--Uncomment code below to run the code for slide 12_sb for lesson 3
/*
SELECT	dept_deptid_seq.CURRVAL
FROM	dual;
*/

--Uncomment code below to run the code for slide 13_sa for lesson 3
/*
DROP SEQUENCE s1;
DROP TABLE emp;
CREATE SEQUENCE s1 START WITH 1;
CREATE TABLE emp (a1 NUMBER DEFAULT s1.NEXTVAL NOT NULL, a2 VARCHAR2(10));
INSERT INTO emp (a2) VALUES ('john');
INSERT INTO emp (a2) VALUES ('mark');
SELECT * FROM emp;
*/

--Uncomment code below to run the code for slide 15_sa for lesson 3
/*
ALTER SEQUENCE dept_deptid_seq
               INCREMENT BY 20
               MAXVALUE 999999
               NOCACHE
               NOCYCLE;
*/

--Uncomment code below to run the code for slide 16_sa for lesson 3
--Execute code for slide 16_na before executing this code

/* 
DROP SEQUENCE dept_deptid_seq;
 DROP SEQUENCE s1;
*/

--Uncomment code below to run the code for slide 16_na for lesson 3
/*
ALTER SEQUENCE dept_deptid_seq
      INCREMENT BY 20
      MAXVALUE 90
      NOCACHE
      NOCYCLE;
*/

--Uncomment code below to run the code for slide 17_sa for lesson 3

/* DESCRIBE user_sequences

--Uncomment code below to run the code for slide 17_sb for lesson 3

/*
SELECT	sequence_name, min_value, max_value, 
	increment_by, last_number
FROM	user_sequences;
*/


--Uncomment code below to run the code for slide 21_sa for lesson 3

/*
CREATE SYNONYM  d_sum
FOR  dept_sum_vu;
*/


--Uncomment code below to run the code for slide 21sb for lesson 3
--Execute code for slide 21_na, slide 22_sa and 22_sb before executing this code

/* DROP SYNONYM d_sum;

--Uncomment code below to run the code for slide 21_na for lesson 3
/*
CREATE PUBLIC SYNONYM  dept
FOR alice.departments;
*/

--Uncomment code below to run the code for slide 21_nb for lesson 3
--Execute code for slide 22_sa and 22_sb before executing this code

/* DROP PUBLIC SYNONYM  dept;

--Uncomment code below to run the code for slide 22_sa for lesson 3

/* DESCRIBE user_synonyms

--Uncomment code below to run the code for slide 22_sb for lesson 3

/*

SELECT * 
FROM   user_synonyms;

*/

--Uncomment code below to run the code for slide 26_sa for lesson 3

/*
CREATE INDEX 	emp_last_name_idx
ON employees(last_name);
*/

--Uncomment code below to run the code for slide 27_sa for lesson 3
/*
DROP TABLE NEW_EMP cascade constraints;
CREATE TABLE NEW_EMP
(employee_id NUMBER(6) PRIMARY KEY USING INDEX         
 (CREATE INDEX emp_id_idx ON  NEW_EMP(employee_id)),
  first_name  VARCHAR2(20),last_name   VARCHAR2(25));
*/

--Uncomment code below to run the code for slide 27_sb for lesson 3
/*
SELECT INDEX_NAME, TABLE_NAME 
FROM   USER_INDEXES
WHERE  TABLE_NAME = 'NEW_EMP';
*/


--Uncomment code below to run the code for slide 27_na for lesson 3
/*

DROP TABLE EMP_UNNAMED_INDEX;
CREATE TABLE EMP_UNNAMED_INDEX (employee_id NUMBER(6) PRIMARY KEY, first_name VARCHAR2(20), last_name VARCHAR2(25));

*/
--Uncomment code below to run the code for slide 27_nb for lesson 3

/* 
SELECT INDEX_NAME, TABLE_NAME 
FROM  USER_INDEXES 
WHERE  TABLE_NAME = 'EMP_UNNAMED_INDEX';
*/

--Uncomment code below to run the code for slide 28_na for lesson 3
/*
DROP TABLE NEW_EMP2;
CREATE TABLE NEW_EMP2
(employee_id NUMBER(6),
first_name VARCHAR2(20),
last_name VARCHAR2(25));
*/

--Uncomment code below to run the code for slide 28_nb for lesson 3

/* CREATE INDEX emp_id_idx2 ON new_emp2(employee_id);


--Uncomment code below to run the code for slide 28_nc for lesson 3

/* ALTER TABLE new_emp2 ADD PRIMARY KEY (employee_id) USING INDEX emp_id_idx2;

--Uncomment code below to run the code for slide 29_sa for lesson 3
--Please ignore the warning message

/*
DROP TABLE dept2 CASCADE CONSTRAINTS;
CREATE TABLE dept2 AS 
SELECT * FROM departments;

SELECT * FROM dept2;

CREATE INDEX upper_dept_name_idx
ON dept2(UPPER(department_name));
*/

--Uncomment code below to run the code for slide 29_sb for lesson 3
/*
SELECT *
FROM   dept2
WHERE  UPPER(department_name) = 'SALES';
*/
 
--Uncomment code below to run the code for slide 29_na for lesson 3 
--Please ignore the warning message
/*
DROP TABLE emp2;
CREATE TABLE emp2 AS 
SELECT * FROM employees;

set autotrace on

CREATE INDEX upper_last_name_idx ON emp2 (UPPER(last_name));

SELECT * FROM emp2 WHERE UPPER(last_name) = 'KING';


--Uncomment code below to run the code for slide 29_nb for lesson 3 

SELECT * FROM employees 
WHERE UPPER(last_name) IS NOT NULL
ORDER BY UPPER(last_name);

set autotrace off;

*/



--Uncomment code below to run the code for slide 31_sa for lesson 3
/*

DROP INDEX emp_id_name_ix1;
CREATE INDEX emp_id_name_ix1 ON employees(employee_id, first_name);
*/

--Uncomment code below to run the code for slide 31_sb for lesson 3

/* ALTER INDEX emp_id_name_ix1 INVISIBLE;

--Uncomment code below to run the code for slide 31_sc for lesson 3

/*
DROP INDEX emp_id_name_ix2;
CREATE BITMAP INDEX emp_id_name_ix2 ON employees(employee_id, first_name);
*/

--Uncomment code below to run the code for slide 33_sa for lesson 3

/* DESCRIBE user_indexes

--Uncomment code below to run the code for slide 34_sa for lesson 3
/*
SELECT index_name, table_name, uniqueness
FROM   user_indexes
WHERE  table_name = 'EMPLOYEES'; 
*/

--Uncomment code below to run the code for slide 34_sb for lesson 3
--Execute code for slide 34_na before executing this code
/*

SELECT index_name, table_name
FROM   user_indexes
WHERE  table_name = 'EMP_LIB'; 
*/

--Uncomment code below to run the code for slide 34_na for lesson 3
/*
DROP TABLE emp_lib;
CREATE TABLE emp_lib
   (book_id NUMBER(6) PRIMARY KEY, title VARCHAR2(25),
    category VARCHAR2(20));
*/

--Uncomment code below to run the code for slide 35_sa for lesson 3

/* DESCRIBE user_ind_columns

--Uncomment code below to run the code for slide 35_sb for lesson 3
--Execute code for slide 35_na before executing this code
/*

SELECT index_name, column_name,table_name
FROM   user_ind_columns
WHERE  index_name = 'LNAME_IDX';
*/

--Uncomment code below to run the code for slide 35_na for lesson 3
--Please ignore the warning message
/*
DROP TABLE emp_test;
CREATE TABLE emp_test AS SELECT * FROM employees;
CREATE INDEX lname_idx ON emp_test(last_name);
*/
--Uncomment code below to run the code for slide 36_sa for lesson 3

/* 
DROP INDEX emp_last_name_idx;
DROP INDEX upper_dept_name_idx;
DROP INDEX upper_last_name_idx;
DROP INDEX lname_idx;
DROP INDEX emp_id_name_ix2;
DROP INDEX emp_id_name_ix1;


--Uncomment code below to run the code for slide 36_na for lesson 3
--Execute each statement one by one

/*
DROP TABLE MYEMP1;
CREATE TABLE MYEMP1(f_name VARCHAR2(20), l_name VARCHAR2(20));

CREATE INDEX emp_indx ON MYEMP1(f_name);

SELECT index_name, column_name,table_name
FROM   user_ind_columns
WHERE  index_name = 'EMP_INDX';

DROP INDEX emp_indx ONLINE;

SELECT index_name, column_name,table_name
FROM   user_ind_columns
WHERE  index_name = 'EMP_INDX';

*/

