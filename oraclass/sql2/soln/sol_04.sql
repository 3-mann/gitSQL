--The SQL Script to run the solution for Practice 4

--Uncomment code below to run the solution for Task 1 for Practice 4

/* 
CREATE OR REPLACE VIEW employees_vu AS
    SELECT employee_id, last_name employee, department_id
    FROM employees;

*/

--Uncomment code below to run the solution for Task 2 for Practice 4 
     
/* 
SELECT   *
FROM     employees_vu;

*/

--Uncomment code below to run the solution for Task 3 for Practice 4

/*

SELECT   employee, department_id 
FROM     employees_vu;

*/

--Uncomment code below to run the solution for Task 4 for Practice 4


/* 

CREATE VIEW dept80 AS   
   SELECT   employee_id empno, last_name employee,
            department_id deptno
   FROM     employees
   WHERE    department_id = 80
   WITH CHECK OPTION CONSTRAINT emp_dept_80;


*/

--Uncomment code below to run the solution for Task 5 for Practice 4
/*

DESCRIBE dept80

SELECT   *
FROM     dept80;


*/
--Uncomment code below to run the solution for Task 6 for Practice 4

/*

UPDATE   dept80
SET      deptno = 50
WHERE    employee = 'Abel';
  
*/

--Uncomment code below to run the solution for Task 7 for Practice 4
/*
SELECT   view_name, text
FROM     user_views;
*/

--Uncomment code below to run the solution for Task 8 for Practice 4
/*
DROP VIEW employees_vu;
DROP VIEW dept80;
DROP VIEW dept50;
*/

