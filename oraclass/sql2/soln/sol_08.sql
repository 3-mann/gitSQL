--The SQL Script to run the solution for Practice 8

--Uncomment code below to run the solution for Task 8_a for Practice 8
-- Replace <team2_oraxx> as ora22, <team1_oraxx> as ora21 and <team3_oraxx> as ora23.

/* 
GRANT select
ON regions
TO <team2_oraxx> WITH GRANT OPTION;

*/

--Uncomment code below to run the solution for Task 8_b for Practice 8 
     
/* 
SELECT * FROM <team1_oraxx>.regions;
*/

--Uncomment code below to run the solution for Task 8_c for Practice 8

/*
GRANT select
ON <team1_oraxx>.regions
TO <team3_oraxx>;

*/

--Uncomment code below to run the solution for Task 8_d for Practice 8


/* 
REVOKE select
ON regions
FROM <team2_oraxx>;

*/

--Uncomment code below to run the solution for Task 9 for Practice 8
/*

GRANT select, update, insert
ON COUNTRIES 
TO <team2_oraxx>;

*/
--Uncomment code below to run the solution for Task 10 for Practice 8

/*  REVOKE select, update, insert ON COUNTRIES FROM <team2_oraxx>; 
     



--Uncomment code below to run the solution for Task 11_a for Practice 8
/*

GRANT select
ON departments
TO <team1_oraxx>;
   

*/

--Uncomment code below to run the solution for Task 11_b for Practice 8

/*
GRANT select
ON departments
TO <team2_oraxx>;
  
*/

--Uncomment code below to run the solution for Task 12 for Practice 8

/*
   SELECT  *
   FROM    departments;
  
*/

--Uncomment code below to run the solution for Task 13_a for Practice 8
/*     
        INSERT INTO departments(department_id, department_name)
        VALUES (500, 'Education');
        COMMIT;

*/

--Uncomment code below to run the solution for Task 13_b for Practice 8
/*
     
INSERT INTO departments(department_id, department_name)
        VALUES (510, 'Human Resources');
        COMMIT;

*/

--Uncomment code below to run the solution for Task 14_a for Practice 8
/*

CREATE SYNONYM team2
 FOR <team2_oraxx>.DEPARTMENTS;
       

*/

--Uncomment code below to run the solution for Task 14_b for Practice 8
/*
  
CREATE SYNONYM team1
         FOR <team1_oraxx>. DEPARTMENTS;

*/

--Uncomment code below to run the solution for Task 15_a for Practice 8

/*
SELECT  *
   FROM    team2;
*/


--Uncomment code below to run the solution for Task 15_b for Practice 8
/*

SELECT  *
    FROM    team1;

*/

--Uncomment code below to run the solution for Task 16_a for Practice 8

/*  REVOKE select
     ON departments
     FROM  <team2_oraxx>;

*/


--Uncomment code below to run the solution for Task 16_b for Practice 8

/* 

REVOKE select
     ON departments 
     FROM <team1_oraxx>;
 
*/

--Uncomment code below to run the solution for Task 17_a for Practice 8

/*

        DELETE FROM departments
        WHERE department_id = 500;
        COMMIT;
 
*/


--Uncomment code below to run the solution for Task 17_b for Practice 8

/* 

        DELETE FROM departments
        WHERE department_id = 510; 
        COMMIT;
*/

--Uncomment code below to run the solution for Task 18 for Practice 8

/*

DROP SYNONYM team1;
DROP SYNONYM team2;

*/


