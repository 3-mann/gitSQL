--The SQL Script to run the solution for Practice 10

--Uncomment code below to run the solution for Task 1 for Practice 10
/*
                  DROP TABLE my_employee;
                  
                  CREATE TABLE my_employee
                    (id  NUMBER(4) CONSTRAINT my_employee_id_pk PRIMARY Key,
                     last_name VARCHAR2(25),
                     first_name VARCHAR2(25),
                     userid  VARCHAR2(8),
                     salary  NUMBER(9,2));
                     
*/                     

--Uncomment code below to run the solution for Task 2 for Practice 10


/*                 DESCRIBE my_employee


--Uncomment code below to run the solution for Task 3 for Practice 10
/*

               INSERT INTO my_employee
               VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

*/

--Uncomment code below to run the solution for Task 4 for Practice 10
/*
                INSERT INTO my_employee (id, last_name, first_name, userid, salary)
                VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);
*/

--Uncomment code below to run the solution for Task 5 for Practice 10
/*
                SELECT   *
                FROM     my_employee;

*/

--Uncomment code below to run the solution for Task 6 for Practice 10
/*
                 INSERT INTO my_employee
                 VALUES (&p_id, '&p_last_name', '&p_first_name',
                                   '&p_userid', &p_salary);

*/

--Uncomment code below to run the solution for Task 7 for Practice 10
/*
                  INSERT INTO my_employee
                  VALUES (&p_id, '&p_last_name', '&p_first_name',
                                    '&p_userid', &p_salary);
*/

--Uncomment code below to run the solution for Task 8 for Practice 10
/*
                  SELECT   *
                  FROM my_employee;
*/
--Uncomment code below to run the solution for Task 9 for Practice 10

/*                  COMMIT;

--Uncomment code below to run the solution for Task 10 for Practice 10
/*
                 UPDATE  my_employee
                 SET     last_name = 'Drexler'
                 WHERE   id = 3;
*/

--Uncomment code below to run the solution for Task 11 for Practice 10
/*
                  UPDATE  my_employee
                  SET     salary = 1000 
                  WHERE   salary < 900;
*/

--Uncomment code below to run the solution for Task 12 for Practice 10
/*
                 SELECT  * 
                 FROM    my_employee;
*/

--Uncomment code below to run the solution for Task 13 for Practice 10
/*
                  DELETE
                  FROM  my_employee 
                  WHERE last_name = 'Dancs';
*/

--Uncomment code below to run the solution for Task 14 for Practice 10
/*
                  SELECT  *
                  FROM    my_employee;
*/

--Uncomment code below to run the solution for Task 15 for Practice 10

/*                 COMMIT;

--Uncomment code below to run the solution for Task 16 for Practice 10

/*                INSERT INTO my_employee
                  VALUES (&p_id, '&p_last_name', '&p_first_name',
                          '&p_userid', &p_salary);
*/

--Uncomment code below to run the solution for Task 17 for Practice 10

/*                SELECT  * 
                  FROM    my_employee;     
*/

--Uncomment code below to run the solution for Task 18 for Practice 10

/*                 SAVEPOINT step_17;

--Uncomment code below to run the solution for Task 19 for Practice 10
/*

                 DELETE 
                 FROM  my_employee;

*/

--Uncomment code below to run the solution for Task 20 for Practice 10
/*
                  SELECT * 
                  FROM   my_employee;

*/

--Uncomment code below to run the solution for Task 21 for Practice 10

/*                ROLLBACK TO step_17;

--Uncomment code below to run the solution for Task 22 for Practice 10
/* 
                 SELECT * 
                 FROM   my_employee;
*/

--Uncomment code below to run the solution for Task 23 for Practice 10

/*               COMMIT; 


--Uncomment code below to run the solution for Task 24 for Practice 10
/*
                 SET ECHO OFF
                 SET VERIFY OFF
                 INSERT INTO my_employee
                 VALUES (&p_id, '&&p_last_name', '&&p_first_name',
                                  lower(substr('&p_first_name', 1, 1) || 
                                  substr('&p_last_name', 1, 7)), &p_salary);
                 SET VERIFY ON
                 SET ECHO ON
                 UNDEFINE p_first_name
                 UNDEFINE p_last_name
*/

--Uncomment code below to run the solution for Task 25 for Practice 10
/*
                SET ECHO OFF
                SET VERIFY OFF
                INSERT INTO my_employee
                VALUES (&p_id, '&&p_last_name', '&&p_first_name',
                                  lower(substr('&p_first_name', 1, 1) || 
                                   substr('&p_last_name', 1, 7)), &p_salary);
               SET VERIFY ON
               SET ECHO ON
               UNDEFINE p_first_name
               UNDEFINE p_last_name
*/

--Uncomment code below to run the solution for Task 26 for Practice 10
/*
                SELECT * 
                FROM my_employee 
                WHERE ID='6';

*/

              

