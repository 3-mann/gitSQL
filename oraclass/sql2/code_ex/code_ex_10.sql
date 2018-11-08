
--The SQL Script to run the code_examples for Lesson 10

--After completing this code example: ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS', remember to issue ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY' before moving on to code example for slide 12_sa

--Uncomment code below to run the code for slide 5_sa for lesson 10


/* ALTER SESSION SET TIME_ZONE = '-05:00';

--Uncomment code below to run the code for slide 5_sb for lesson 10


/* ALTER SESSION SET TIME_ZONE = dbtimezone;

--Uncomment code below to run the code for slide 5_sc for lesson 10

/* ALTER SESSION SET TIME_ZONE = local;

--Uncomment code below to run the code for slide 5_sd for lesson 10

/* ALTER SESSION SET TIME_ZONE = 'America/New_York';

--Uncomment code below to run the code for slide 7_sa for lesson 10
/*
ALTER SESSION 
SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
*/

--Uncomment code below to run the code for slide 7_sb for lesson 10

/* ALTER SESSION SET TIME_ZONE = '-5:00';

--Uncomment code below to run the code for slide 7_sc for lesson 10

/* SELECT SESSIONTIMEZONE, CURRENT_DATE FROM DUAL;


--Uncomment code below to run the code for slide 7_sd for lesson 10

/* SELECT SESSIONTIMEZONE, CURRENT_TIMESTAMP FROM DUAL;

--Uncomment code below to run the code for slide 7_se for lesson 10

/* SELECT SESSIONTIMEZONE, LOCALTIMESTAMP FROM DUAL;

--Uncomment code below to run the code for slide 9_sa for lesson 10

/* SELECT DBTIMEZONE FROM DUAL;

--Uncomment code below to run the code for slide 9_sb for lesson 10


/* SELECT SESSIONTIMEZONE FROM DUAL;

--Uncomment code below to run the code for slide 12_sa for lesson 10
--If you get any warning message, please ignore it
--Execute the ALTER statement before creating the table

/*

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY';

DROP TABLE emp4;
CREATE TABLE emp4 AS SELECT * FROM employees;

SELECT hire_date 
FROM emp4;
*/ 

--Uncomment code below to run the code for slide 12_sb for lesson 10
/*
ALTER TABLE emp4
MODIFY hire_date TIMESTAMP(7);

SELECT hire_date 
FROM emp4;
*/


--Uncomment code below to run the code for slide 13_sa for lesson 10

/* 
DROP TABLE web_orders;

CREATE TABLE web_orders(order_date TIMESTAMP WITH TIME ZONE, delivery_time TIMESTAMP WITH LOCAL TIME ZONE);

*/

--Uncomment code below to run the code for slide 13_sb for lesson 10

/* INSERT INTO web_orders values (current_date, current_timestamp + 2);


--Uncomment code below to run the code for slide 13_sc for lesson 10

/* SELECT * FROM web_orders;

--Uncomment code below to run the code for slide 18_sa for lesson 10
/*

DROP TABLE warranty;
CREATE TABLE warranty 
(prod_id number,  warranty_time INTERVAL YEAR(3) TO MONTH);
*/

--Uncomment code below to run the code for slide 18_sb for lesson 10
/*
INSERT INTO warranty VALUES (123, INTERVAL '8' MONTH);

INSERT INTO warranty VALUES (155, INTERVAL '200' YEAR(3));

INSERT INTO warranty VALUES (678, '200-11');
*/

--Uncomment code below to run the code for slide 18_sc for lesson 10

/* SELECT * FROM warranty;

--Uncomment code below to run the code for slide 20_sa for lesson 10
/*
DROP TABLE lab;
CREATE TABLE lab 
( exp_id number, test_time INTERVAL DAY(2) TO SECOND);
*/

--Uncomment code below to run the code for slide 20_sb for lesson 10
/*
INSERT INTO lab VALUES (100012, '90 00:00:00');

INSERT INTO lab VALUES (56098,
  INTERVAL '6 03:30:16' DAY 	TO SECOND);
*/

--Uncomment code below to run the code for slide 20_sc for lesson 10

/* SELECT * FROM lab;

--Uncomment code below to run the code for slide 22_sa for lesson 10

/* 

SELECT last_name, employee_id, hire_date
  FROM employees
  WHERE EXTRACT(YEAR FROM TO_DATE(hire_date, 'DD-MON-RR')) > 2007
  ORDER BY hire_date;

*/

--Uncomment code below to run the code for slide 22_sb for lesson 10
/*
SELECT last_name, hire_date, 
       EXTRACT (MONTH FROM HIRE_DATE)
FROM employees
WHERE manager_id = 100;
*/

--Uncomment code below to run the code for slide 23_sa for lesson 10
/*
SELECT TZ_OFFSET('US/Eastern'),
	  TZ_OFFSET('Canada/Yukon'),
	  TZ_OFFSET('Europe/London')
 FROM DUAL;
*/

--Uncomment code below to run the code for slide 24_na for lesson 10

/* SELECT * FROM V$TIMEZONE_NAMES;

--Uncomment code below to run the code for slide 25_sa for lesson 10
/*
SELECT FROM_TZ(TIMESTAMP 
       '2000-07-12 08:00:00', 'Australia/North')
FROM DUAL;
*/

--Uncomment code below to run the code for slide 26_sa for lesson 10
/*
 SELECT TO_TIMESTAMP ('2007-03-06 11:00:00',
                     'YYYY-MM-DD HH:MI:SS')     FROM DUAL;
*/

--Uncomment code below to run the code for slide 27_sa for lesson 10	
/*
SELECT hire_date, 
       hire_date + TO_YMINTERVAL('01-02') AS HIRE_DATE_YMININTERVAL
FROM   employees
WHERE department_id = 20; 
*/

--Uncomment code below to run the code for slide 28_sa for lesson 10
/*
SELECT last_name, 
 TO_CHAR(hire_date, 'mm-dd-yy:hh:mi:ss') hire_date, 
  TO_CHAR(hire_date + 
   TO_DSINTERVAL('100 10:00:00'),
     'mm-dd-yy:hh:mi:ss') hiredate2
FROM employees;
*/

