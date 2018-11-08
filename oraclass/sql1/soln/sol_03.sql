--The SQL Script to run the solution for Practice 3

--Uncomment code below to run the solution for Task 1 for Practice 3
/*
	SELECT  last_name, salary
	FROM    employees 
	WHERE   salary > 12000; 
*/

--Uncomment code below to run the solution for Task 2 for Practice 3
/*
	SELECT  last_name, department_id
	FROM    employees 
	WHERE   employee_id = 176;
*/

--Uncomment code below to run the solution for Task 3 for Practice 3
/*
	SELECT  last_name, salary
	 FROM    employees 
	WHERE   salary NOT BETWEEN 5000 AND 12000;
*/

--Uncomment code below to run the solution for Task 4 for Practice 3
/*
	SELECT   last_name, job_id, hire_date
	FROM     employees
	WHERE    last_name IN ('Matos', 'Taylor')
	 ORDER BY hire_date;
*/

--Uncomment code below to run the solution for Task 5 for Practice 3
/*
	SELECT   last_name, department_id
	FROM     employees
	WHERE    department_id IN (20, 50)
	ORDER BY last_name ASC;
*/


--Uncomment code below to run the solution for Task 6 for Practice 3
/*
	 SELECT   last_name "Employee", salary "Monthly Salary"
	 FROM     employees
	 WHERE    salary  BETWEEN 5000 AND 12000 
	 AND      department_id IN (20, 50);
*/

--Uncomment code below to run the solution for Task 7 for Practice 3
/*	
        SELECT   last_name, hire_date
        FROM     employees
        WHERE    hire_date >= '01-JAN-06' AND hire_date < '01-JAN-07';  
*/   


--Uncomment code below to run the solution for Task 8 for Practice 3
/*
	SELECT   last_name, job_id
	FROM     employees 
	 WHERE    manager_id IS NULL;
*/

--Uncomment code below to run the solution for Task 9 for Practice 3

/*	SELECT   last_name, salary, commission_pct
	FROM     employees
	WHERE    commission_pct IS NOT NULL
        ORDER BY 2 DESC, 3 DESC;
*/

--Uncomment code below to run the solution for Task 10 for Practice 3
/*
	SELECT  last_name, salary
	FROM    employees 
	WHERE   salary > &sal_amt;
*/

--Uncomment code below to run the solution for Task 11 for Practice 3
/*
	SELECT employee_id, last_name, salary, department_id
	FROM employees
	WHERE manager_id = &mgr_num
	ORDER BY &order_col;
*/

--Uncomment code below to run the solution for Task 12 for Practice 3
/*
	 SELECT   last_name
	 FROM     employees 
	 WHERE    last_name LIKE '__a%';
*/

--Uncomment code below to run the solution for Task 13 for Practice 3
/*	
         SELECT   last_name
	 FROM     employees
	 WHERE    last_name LIKE '%a%'
	 AND      last_name LIKE '%e%';
*/

--Uncomment code below to run the solution for Task 14 for Practice 3

/*
	SELECT   last_name, job_id, salary
	FROM     employees
	WHERE    job_id IN ('SA_REP', 'ST_CLERK') 
	AND      salary NOT IN (2500, 3500, 7000);
*/

--Uncomment code below to run the solution for Task 15 for Practice 3

/*
	 SELECT   last_name "Employee", salary "Monthly Salary", 
	 commission_pct
	 FROM     employees
	 WHERE    commission_pct = .20;
*/
