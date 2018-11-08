--The SQL Script to run the solution for Additional Practice

--Uncomment code below to run the solution for Task 1 
/*

INSERT ALL
WHEN SAL < 5000 THEN
INTO  special_sal VALUES (EMPID, SAL)
ELSE
INTO sal_history VALUES(EMPID,HIREDATE,SAL)
INTO mgr_history VALUES(EMPID,MGR,SAL)   
SELECT employee_id EMPID, hire_date HIREDATE,
         salary SAL, manager_id MGR
FROM employees
WHERE employee_id >=200;	

*/

--Uncomment code below to run the solution for Task 2 
/*
      SELECT * FROM special_sal;
      SELECT * FROM sal_history;
      SELECT * FROM mgr_history;
*/

--Uncomment code below to run the solution for Task 3
/*
 
CREATE TABLE LOCATIONS_NAMED_INDEX
(location_id NUMBER(4) PRIMARY KEY USING INDEX
(CREATE INDEX locations_pk_idx ON
LOCATIONS_NAMED_INDEX(location_id)),
location_name VARCHAR2(20));

*/

--Uncomment code below to run the solution for Task 4 
/*

SELECT INDEX_NAME, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'LOCATIONS_NAMED_INDEX';

*/

--Uncomment code below to run the solution for Task 5
/* 
        ALTER SESSION
        SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
*/

--Uncomment code below to run the solution for Task 6_a
/* 
SELECT TZ_OFFSET ('Australia/Sydney') from  dual; 

SELECT TZ_OFFSET ('Chile/EasterIsland') from dual;

*/

--Uncomment code below to run the solution for Task 6_b 

/* ALTER SESSION SET TIME_ZONE = '+10:00';

--Uncomment code below to run the solution for Task 6_c 

/* SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM DUAL;

--Uncomment code below to run the solution for Task 6_d 

/* ALTER SESSION SET TIME_ZONE = '-06:00';

--Uncomment code below to run the solution for Task 6_e 

/* SELECT SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM DUAL;

--Uncomment code below to run the solution for Task 6_f
 
/* ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

--Uncomment code below to run the solution for Task 7

/* SELECT last_name, EXTRACT (MONTH FROM HIRE_DATE), HIRE_DATE FROM employees
WHERE EXTRACT (MONTH FROM HIRE_DATE) = 1; 

*/

--Uncomment code below to run the solution for Task 8 
/*
SELECT last_name, salary
       	FROM   employees e
       	WHERE 3  > (SELECT COUNT (*)
                FROM   employees
                WHERE e.salary < salary);

*/

--Uncomment code below to run the solution for Task 9 
/*       
SELECT employee_id, last_name
      	FROM employees e
      	WHERE ((SELECT location_id
                   FROM departments d
                   WHERE e.department_id = d.department_id )
               IN  (SELECT location_id
                        FROM locations l
                        WHERE state_province = 'California')); 
*/

--Uncomment code below to run the solution for Task 10 
/*

DELETE FROM job_history JH
	WHERE employee_id = 
               (SELECT employee_id 
                  FROM employees E
                  WHERE JH.employee_id = E.employee_id
                  AND START_DATE = (SELECT MIN(start_date)
          		           FROM job_history JH
			                 WHERE JH.employee_id = 
E.employee_id)
	                            AND 3 > (SELECT COUNT(*)  
                                FROM job_history JH
WHERE JH.employee_id = 
 E.employee_id
	                       GROUP BY EMPLOYEE_ID
	                       HAVING COUNT(*) >= 2));
*/

--Uncomment code below to run the solution for Task 11 

/* ROLLBACK;

--Uncomment code below to run the solution for Task 12 
/*

WITH 
	MAX_SAL_CALC AS (SELECT job_title, MAX(salary) AS 	job_total
	FROM employees, jobs
	WHERE employees.job_id = jobs.job_id
	GROUP BY job_title)
	SELECT job_title, job_total
	FROM MAX_SAL_CALC
	WHERE job_total > (SELECT MAX(job_total) * 1/2
	FROM MAX_SAL_CALC)
	ORDER BY job_total DESC;
*/


--Uncomment the below codes to run the solutions for Additional Practice Case study.

--Uncomment code below to run the solution for Task 1

/*

SELECT table_name,column_name,data_type,nullable
FROM user_tab_columns
WHERE table_name IN('CUSTOMER','CREDIT_CARD_DETAILS','SHOPPING_CART','ORDER_DETAILS','BOOKS','AUTHOR','PUBLISHER','SHIPPING_TYPE','PURCHASE_HISTORY')
;

*/

--Uncomment code below to run the solution for Task 2

/* SELECT sequence_name FROM user_sequences;

--Uncomment code below to run the solution for Task 3
/*
CREATE USER oraxx_carmen IDENTIFIED BY oracle ;
GRANT select ON purchase_history TO oraxx_carmen;
*/

--Uncomment code below to run the solution for Task 4

/* ALTER TABLE books ADD(edition VARCHAR2(6));

--Uncomment code below to run the solution for Task 5

/*
CREATE TABLE CREDIT_CARD_TYPE 
   (	CREDIT_CARD_TYPE VARCHAR2(10) NOT NULL ENABLE, 
	CREDIT_CARD_DESCRIPTION VARCHAR2(4000 BYTE), 
	 CONSTRAINT CREDIT_CARD_TYPE_PK PRIMARY KEY (CREDIT_CARD_TYPE))
;

*/

--Uncomment code below to run the solution for Task 6

/* SELECT table_name FROM user_tables order by table_name;

--Uncomment code below to run the solution for Task 7

/* CREATE TABLE shopping_history as select * from purchase_history where '1' = '1';

--Uncomment code below to run the solution for Task 8

/*
SELECT o.CUSTOMER_ID, o.ORDER_ID, o.DATE_OF_PURCHASE, c.CUSTOMER_NAME
FROM ORDER_DETAILS o JOIN PURCHASE_HISTORY p
ON o.CUSTOMER_ID = p.CUSTOMER_ID JOIN CUSTOMER c 
ON o.CUSTOMER_ID= c.CUSTOMER_ID 
AND rownum < 10
ORDER BY CUSTOMER_ID;

*/
--Uncomment code below to run the solution for Task 9

/*

SELECT customer_id, customer_name FROM customer c
WHERE 1 <= (select count(*) from purchase_history where customer_id = c.customer_id);

*/

