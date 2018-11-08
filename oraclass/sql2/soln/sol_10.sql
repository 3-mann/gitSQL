
--The SQL Script to run the solution for Practice 10

--Uncomment code below to run the solution for Task 1 for Practice 10

/*
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
*/

--Uncomment code below to run the solution for Task 2_a for Practice 10
/*
 --US/Pacific-New
	    
 SELECT TZ_OFFSET ('US/Pacific-New') from dual; 

--Singapore

 SELECT TZ_OFFSET ('Singapore') from dual;

--Egypt

 SELECT TZ_OFFSET ('Egypt') from dual;

*/

--Uncomment code below to run the solution for Task 2_b for Practice 10

/* 	ALTER SESSION SET TIME_ZONE = '-7:00';

--Uncomment code below to run the solution for Task 2_c for Practice 10   
   
/*  SELECT CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM DUAL; 

--Uncomment code below to run the solution for Task 2_d for Practice 10

/* ALTER SESSION SET TIME_ZONE = '+8:00';

--Uncomment code below to run the solution for Task 2_e for Practice 10

/* SELECT CURRENT_DATE, CURRENT_TIMESTAMP, LOCALTIMESTAMP FROM DUAL;

--Uncomment code below to run the solution for Task 3 for Practice 10

/* SELECT DBTIMEZONE,SESSIONTIMEZONE
   FROM DUAL; 
*/

--Uncomment code below to run the solution for Task 4 for Practice 10
/*

SELECT last_name, EXTRACT (YEAR FROM HIRE_DATE)
     FROM employees
     WHERE department_id = 80;
*/

--Uncomment code below to run the solution for Task 5 for Practice 10

/* ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';

--Uncomment code below to run the solution for Task 6_a for Practice 10

/* SELECT * FROM sample_dates;


--Uncomment code below to run the solution for Task 6_b for Practice 10
/*
ALTER TABLE sample_dates MODIFY date_col TIMESTAMP;
SELECT * FROM sample_dates;
*/

--Uncomment code below to run the solution for Task 6_c for Practice 10
/*
ALTER TABLE sample_dates MODIFY date_col 
TIMESTAMP WITH TIME ZONE;
*/

--Uncomment code below to run the solution for Task 7 for Practice 10
/*
SELECT e.last_name
   ,     (CASE extract(year from e.hire_date)
           WHEN 2008 THEN 'Needs Review'
           ELSE 'not this year!'
     END )           AS "Review "
FROM   employees e
ORDER BY e.hire_date;
*/
--Uncomment code below to run the solution for Task 8 for Practice 10

/*
SELECT e.last_name, hire_date, sysdate,
       (CASE
	   WHEN  (sysdate -TO_YMINTERVAL('15-0'))>= 
            hire_date THEN	'15 years of service'
        WHEN (sysdate -TO_YMINTERVAL('10-0'))>= hire_date  
          THEN	'10 years of service'
        WHEN (sysdate - TO_YMINTERVAL('5-0'))>= hire_date 
           THEN '5 years of service'
		   ELSE 'maybe next year!'
          END) AS "Awards"
     FROM   employees e;
*/
