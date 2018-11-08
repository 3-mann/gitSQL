--The SQL Script to run the solution for Practice 9

--Uncomment code below to run the solution for Task 2 for Practice 9

/* DESC sal_history


--Uncomment code below to run the solution for Task 4 for Practice 9 
     
/* DESC mgr_history

--Uncomment code below to run the solution for Task 6 for Practice 9

/*

DESC special_sal 
*/

--Uncomment code below to run the solution for Task 7_a for Practice 9


/* 

INSERT ALL
WHEN SAL > 20000 THEN
INTO  special_sal VALUES (EMPID, SAL)
ELSE
INTO sal_history VALUES(EMPID,HIREDATE,SAL)
INTO mgr_history VALUES(EMPID,MGR,SAL)
SELECT employee_id EMPID, hire_date HIREDATE,
salary SAL, manager_id MGR
FROM employees 
WHERE employee_id < 125;

*/


--Uncomment code below to run the solution for Task 7_b for Practice 9

/* SELECT * FROM  special_sal;

--Uncomment code below to run the solution for Task 7_c for Practice 9
/*

    SELECT * FROM  sal_history;


*/
--Uncomment code below to run the solution for Task 7_d for Practice 9

/*

SELECT * FROM mgr_history;

   

*/

--Uncomment code below to run the solution for Task 8_c for Practice 9
/*

DESC sales_week_data
*/

--Uncomment code below to run the solution for Task 8_d for Practice 9

/*
SELECT * FROM SALES_WEEK_DATA;
    
*/

--Uncomment code below to run the solution for Task 8_f for Practice 9

/*

DESC emp_sales_info

--Uncomment code below to run the solution for Task 8_g for Practice 9
/*  

INSERT ALL
      INTO emp_sales_info VALUES (id, week_id, QTY_MON)
      INTO emp_sales_info VALUES (id, week_id, QTY_TUE)
      INTO emp_sales_info VALUES (id, week_id, QTY_WED)
      INTO emp_sales_info VALUES (id, week_id, QTY_THUR)
      INTO emp_sales_info VALUES (id, week_id, QTY_FRI)
 SELECT ID, week_id, QTY_MON, QTY_TUE, QTY_WED, 
      QTY_THUR,QTY_FRI FROM sales_week_data;
      

*/

--Uncomment code below to run the solution for Task 8_h for Practice 9
/*

SELECT * FROM emp_sales_info; 

--Uncomment code below to run the solution for Task 10_a for Practice 9

/* ALTER TABLE emp_hist MODIFY email varchar(45);


--Uncomment code below to run the solution for Task 10_b for Practice 9
/*

MERGE INTO EMP_HIST f USING EMP_DATA h
 ON (f.first_name = h.first_name
 AND f.last_name = h.last_name)
WHEN MATCHED THEN
 UPDATE SET f.email = h.email
WHEN NOT MATCHED THEN
 INSERT (f.first_name
    , f.last_name
    , f.email)
 VALUES (h.first_name
    , h.last_name
    , h.email);
*/

--Uncomment code below to run the solution for Task 10_c for Practice 9

/* SELECT * FROM emp_hist;	

--Uncomment code below to run the solution for Task 11 for Practice 9

/*

     CREATE TABLE  emp2
      (id           NUMBER(7),
       last_name     VARCHAR2(25),
       first_name    VARCHAR2(25),
       dept_id       NUMBER(7));

      DESCRIBE emp2
*/

--Uncomment code below to run the solution for Task 12 for Practice 9


/* DROP TABLE emp2;

--Uncomment code below to run the solution for Task 13 for Practice 9
/*

SELECT original_name, operation, droptime 
FROM recyclebin;

*/
--Uncomment code below to run the solution for Task 14 for Practice 9

/*
      FLASHBACK TABLE emp2 TO BEFORE DROP;
      DESC emp2;

*/
--Uncomment code below to run the solution for Task 15 for Practice 9

/*
UPDATE emp3 SET department_id = 60 
    WHERE last_name = 'Kochhar';
    COMMIT;
    UPDATE emp3 SET department_id = 50 
    WHERE last_name = 'Kochhar';
    COMMIT;

SELECT VERSIONS_STARTTIME "START_DATE",     
   VERSIONS_ENDTIME "END_DATE",  DEPARTMENT_ID  
FROM EMP3  
   VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE 
WHERE LAST_NAME ='Kochhar';

*/

--Uncomment code below to run the solution for Task 16 for Practice 9
/*

     DROP TABLE emp2 PURGE;
     DROP TABLE emp3 PURGE;

     SELECT original_name, operation, droptime 
     FROM recyclebin;

*/
