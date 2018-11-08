--The SQL Script to run the solution for Practice 3



--Uncomment code below to run the solution for Task 1 for Practice 3
/*

DROP TABLE dept;

CREATE TABLE dept
 (id   NUMBER(7)CONSTRAINT department_id_pk PRIMARY KEY,
  name VARCHAR2(25));
     
DESCRIBE dept;

*/

--Uncomment code below to run the solution for Task 2 for Practice 3

/*
CREATE SEQUENCE dept_id_seq
  START WITH 200
  INCREMENT BY 10
  MAXVALUE 1000;
    
*/

--Uncomment code below to run the solution for Task 3 for Practice 3

/*

INSERT INTO dept
VALUES (dept_id_seq.nextval, 'Education');
INSERT INTO dept
VALUES (dept_id_seq.nextval, 'Administration');

*/

--Uncomment code below to run the solution for Task 4 for Practice 3

/*
SELECT   sequence_name, max_value, increment_by, last_number
FROM user_sequences;
*/

--Uncomment code below to run the solution for Task 5 for Practice 3
/*
CREATE SYNONYM emp1 FOR EMPLOYEES;
SELECT * 
FROM   user_synonyms;
*/

--Uncomment code below to run the solution for Task 6 for Practice 3

/* DROP SYNONYM emp1;

--Uncomment code below to run the solution for Task 7 for Practice 3
/*  

CREATE INDEX dept_name_idx ON dept (name);   
     
*/

--Uncomment code below to run the solution for Task 8 for Practice 3
/*

CREATE TABLE SALES_DEPT 
       (team_id NUMBER(3)
       PRIMARY KEY USING INDEX
       (CREATE INDEX sales_pk_idx ON
        SALES_DEPT(team_id)),
        location VARCHAR2(30));
        
SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS
FROM USER_INDEXES
WHERE TABLE_NAME = 'SALES_DEPT';
*/

--Uncomment code below to run the solution for Task 9 for Practice 
/*
DROP TABLE DEPT;
DROP TABLE SALES_DEPT;
DROP SEQUENCE dept_id_seq;

*/




