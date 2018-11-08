--The SQL Script to run the solution for Practice 5

--Uncomment code below to run the solution for Task 1 for Practice 5

/* 

       CREATE TABLE dept2
       (id NUMBER(7),
        name VARCHAR2(25));

       DESCRIBE dept2

*/

--Uncomment code below to run the solution for Task 2 for Practice 5 
     
/* 
INSERT INTO dept2
   SELECT  department_id, department_name
   FROM    departments;

SELECT * FROM dept2;

*/

--Uncomment code below to run the solution for Task 3 for Practice 5

/*

     CREATE TABLE  emp2
      (id           NUMBER(7),
       last_name     VARCHAR2(25),
       first_name    VARCHAR2(25),
       dept_id       NUMBER(7));

      DESCRIBE emp2
*/


--Uncomment code below to run the solution for Task 4 for Practice 5
/*

      ALTER TABLE    emp2
      ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (id);

*/

--Uncomment code below to run the solution for Task 5 for Practice 5

/*
     ALTER TABLE    dept2
     ADD CONSTRAINT my_dept_id_pk PRIMARY KEY(id);
*/

--Uncomment code below to run the solution for Task 6 for Practice 5

/*
      ALTER TABLE emp2
      ADD CONSTRAINT my_emp_dept_id_fk
      FOREIGN KEY (dept_id) REFERENCES dept2(id);
*/

--Uncomment code below to run the solution for Task 7 for Practice 5
/*     
      ALTER TABLE emp2
      ADD commission NUMBER(2,2)
      CONSTRAINT my_emp_comm_ck CHECK (commission > 0);
*/
--Uncomment code below to run the solution for Task 8 for Practice 5
/*
     DROP TABLE emp2 PURGE;
     DROP TABLE dept2 PURGE;

*/



--Uncomment code below to run the solution for Task 9_a for Practice 5
--Execute this code using teach_b account.
/* 

CREATE OR REPLACE DIRECTORY emp_dir 
AS '/home/oracle/labs/sql2/emp_dir'; 
GRANT READ ON DIRECTORY emp_dir TO ora21;
*/

--Execute the following code after executing the above code

/*
 
drop table library_items_ext  
CREATE TABLE library_items_ext ( category_id   number(12)
                               , book_id number(6)
                               , book_price number(8,2)
                               , quantity   number(8)
                               )
ORGANIZATION EXTERNAL
 (TYPE ORACLE_LOADER 
  DEFAULT DIRECTORY emp_dir
  ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
                     FIELDS TERMINATED BY ',')
 LOCATION ('library_items.dat')
 )
REJECT LIMIT UNLIMITED;


*/

--Uncomment code below to run the solution for Task 9_b for Practice 5

/* SELECT * FROM library_items_ext;




--Uncomment code below to run the solution for Task 10_a for Practice 5
--Replace <oraxx_emp4.exp> and <oraxx_emp5.exp> with the appropriate file names. For example, if you are the ora21 user, your file names are ora21_emp4.exp and ora21_emp5.exp. 

/*

CREATE TABLE dept_add_ext (location_id,
                           street_address, city,
                           state_province,
                           country_name)
ORGANIZATION EXTERNAL(
TYPE ORACLE_DATAPUMP
DEFAULT DIRECTORY emp_dir
LOCATION ('oraxx_emp4.exp','oraxx_emp5.exp'))
PARALLEL
AS 
SELECT location_id, street_address, city, state_province, country_name
FROM locations 
NATURAL JOIN countries;

*/

--Uncomment code below to run the solution for Task 10_c for Practice 5

/*  SELECT * FROM dept_add_ext;



--Uncomment code below to run the solution for Task 11_c for Practice 5

/*  SET CONSTRAINT emp_books_pk DEFERRED;


--Uncomment code below to run the solution for Task 11_d for Practice 5

/* ALTER TABLE emp_books DROP CONSTRAINT emp_books_pk;

--Uncomment code below to run the solution for Task 11_e for Practice 5

/* ALTER TABLE emp_books ADD (CONSTRAINT emp_books_pk PRIMARY KEY (book_id) DEFERRABLE);

--Uncomment code below to run the solution for Task 11_f for Practice 5

/* SET CONSTRAINT emp_books_pk DEFERRED; 


--Uncomment code below to run the solution for Task 11_h for Practice 5

/* COMMIT;
